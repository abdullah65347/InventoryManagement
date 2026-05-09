package com.inventra.service;

import com.inventra.dto.request.PurchaseItemRequestDTO;
import com.inventra.dto.request.PurchaseRequestDTO;
import com.inventra.dto.response.PurchaseItemResponseDTO;
import com.inventra.dto.response.PurchaseResponseDTO;
import com.inventra.entity.*;
import com.inventra.entity.enums.PurchaseStatus;
import com.inventra.entity.enums.TransactionType;
import com.inventra.exception.ResourceNotFoundException;
import com.inventra.repository.*;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PurchaseService {

    private final PurchaseRepository purchaseRepo;
    private final ProductRepository productRepo;
    private final SupplierRepository supplierRepo;
    private final InventoryTransactionService inventoryTxService;

    // ================= CREATE =================
    @Transactional
    public PurchaseResponseDTO createPurchase(PurchaseRequestDTO dto) {

        if (dto.getSupplierId() == null) {
            throw new IllegalArgumentException("SupplierId is required");
        }
        if (dto.getItems() == null || dto.getItems().isEmpty()) {
            throw new IllegalArgumentException("Items are required");
        }

        Supplier supplier = supplierRepo.findById(dto.getSupplierId())
                .orElseThrow(() -> new EntityNotFoundException("Supplier not found"));

        Purchase purchase = new Purchase();
        purchase.setSupplier(supplier);
        purchase.setStatus(PurchaseStatus.PENDING);

        BigDecimal total = BigDecimal.ZERO;

        for (PurchaseItemRequestDTO itemDto : dto.getItems()) {

            if (itemDto.getProductId() == null || itemDto.getQuantity() == null || itemDto.getQuantity() <= 0) {
                throw new IllegalArgumentException("Invalid purchase item");
            }

            Product product = productRepo.findById(itemDto.getProductId())
                    .orElseThrow(() -> new EntityNotFoundException("Product not found"));

            if (!product.getSupplier().getId().equals(supplier.getId())) {
                throw new IllegalArgumentException("Product does not belong to supplier");
            }

            BigDecimal unitPrice = product.getSupplierToAdminPrice();

            PurchaseItem item = new PurchaseItem();
            item.setPurchase(purchase);
            item.setProduct(product);
            item.setQuantity(itemDto.getQuantity());
            item.setUnitPrice(unitPrice);

            BigDecimal subTotal = unitPrice.multiply(BigDecimal.valueOf(itemDto.getQuantity()));
            item.setSubTotal(subTotal);

            purchase.getItems().add(item);
            total = total.add(subTotal);
        }

        purchase.setTotalAmount(total);

        return toDTO(purchaseRepo.save(purchase));
    }

    // ================= DELIVER =================
    @Transactional
    public PurchaseResponseDTO markAsDelivered(Long purchaseId) {

        Purchase purchase = purchaseRepo.findById(purchaseId)
                .orElseThrow(() -> new EntityNotFoundException("Purchase not found"));

        if (purchase.getStatus() == PurchaseStatus.DELIVERED) {
            return toDTO(purchase);
        }

        if (purchase.getStatus() == PurchaseStatus.CANCELED) {
            throw new IllegalStateException("Canceled purchase cannot be delivered");
        }

        for (PurchaseItem item : purchase.getItems()) {

            Product product = item.getProduct();
            int qty = item.getQuantity();

            if (product.getQuantity() < qty) {
                throw new IllegalStateException("Insufficient supplier stock for product: " + product.getSku());
            }

            // supplier stock decrease
            product.setQuantity(product.getQuantity() - qty);
            productRepo.save(product);

            // admin stock increase
            inventoryTxService.process(
                    product.getId(),
                    TransactionType.ADMIN_PURCHASE,
                    qty
            );
        }

        purchase.setStatus(PurchaseStatus.DELIVERED);

        return toDTO(purchaseRepo.save(purchase));
    }

    // ================= CANCEL =================
    @Transactional
    public PurchaseResponseDTO cancelPurchase(Long purchaseId) {

        Purchase purchase = purchaseRepo.findById(purchaseId)
                .orElseThrow(() -> new EntityNotFoundException("Purchase not found"));

        if (purchase.getStatus() == PurchaseStatus.DELIVERED) {
            throw new IllegalStateException("Delivered purchase cannot be canceled");
        }

        purchase.setStatus(PurchaseStatus.CANCELED);

        return toDTO(purchaseRepo.save(purchase));
    }

    // ================= GET ALL =================
    public List<PurchaseResponseDTO> getAllPurchases() {
        return purchaseRepo.findAll()
                .stream()
                .map(this::toDTO)
                .toList();
    }

    // ================= GET BY SUPPLIER =================
    public List<PurchaseResponseDTO> getBySupplier(Long supplierId) {
        return purchaseRepo.findBySupplierId(supplierId)
                .stream()
                .map(this::toDTO)
                .toList();
    }

    // ================= GET BY STATUS =================
    public List<PurchaseResponseDTO> getByStatus(PurchaseStatus status) {
        return purchaseRepo.findByStatus(status)
                .stream()
                .map(this::toDTO)
                .toList();
    }

    // ================= GET BY ID =================
    public PurchaseResponseDTO getById(Long id) {
        Purchase purchase = purchaseRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Purchase not found"));
        return toDTO(purchase);
    }

    // ================= MAPPER =================
    private PurchaseResponseDTO toDTO(Purchase purchase) {

        PurchaseResponseDTO dto = new PurchaseResponseDTO();

        dto.setId(purchase.getId());
        dto.setSupplierId(purchase.getSupplier().getId());
        dto.setStatus(purchase.getStatus().name());
        dto.setTotalAmount(purchase.getTotalAmount());

        dto.setItems(
                purchase.getItems().stream().map(item -> {
                    PurchaseItemResponseDTO i = new PurchaseItemResponseDTO();
                    i.setProductId(item.getProduct().getId());
                    i.setProductName(item.getProduct().getName());
                    i.setQuantity(item.getQuantity());
                    i.setUnitPrice(item.getUnitPrice());
                    i.setSubTotal(item.getSubTotal());
                    return i;
                }).toList()
        );

        return dto;
    }
}