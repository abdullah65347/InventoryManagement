package com.inventra.service;

import com.inventra.dto.response.InventoryTransactionResponseDTO;
import com.inventra.entity.Inventory;
import com.inventra.entity.InventoryTransaction;
import com.inventra.entity.Product;
import com.inventra.entity.enums.TransactionType;
import com.inventra.exception.ResourceNotFoundException;
import com.inventra.repository.InventoryRepository;
import com.inventra.repository.InventoryTransactionRepository;
import com.inventra.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InventoryTransactionService {

    private final InventoryRepository inventoryRepo;
    private final InventoryTransactionRepository txRepo;
    private final ProductRepository productRepo;

    @Transactional
    public void process(Long productId, TransactionType type, int qty) {

        if (qty <= 0) throw new IllegalArgumentException("Invalid quantity");

        Product product = productRepo.findById(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found"));

        Inventory inv = inventoryRepo.findByProductId(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory not found"));

        if (type == TransactionType.ADMIN_PURCHASE) {
            inv.setAvailableStock(inv.getAvailableStock() + qty);

        } else if (type == TransactionType.ADMIN_SALE) {

            int newStock = inv.getAvailableStock() - qty;
            if (newStock < 0) {
                throw new IllegalStateException("Insufficient stock");
            }

            inv.setAvailableStock(newStock);
        }

        inventoryRepo.save(inv);

        InventoryTransaction tx = new InventoryTransaction();
        tx.setProduct(product);
        tx.setTransactionType(type);
        tx.setQuantity(qty);

        txRepo.save(tx);
    }
    public List<InventoryTransactionResponseDTO> getAllTransactions() {
        return txRepo.findAll()
                .stream()
                .map(this::toDTO)
                .toList();
    }

    public List<InventoryTransactionResponseDTO> getTransactionsByProduct(Long productId) {

        if (productId == null) {
            throw new IllegalArgumentException("ProductId is required");
        }

        return txRepo.findByProduct_IdOrderByCreatedAtDesc(productId)
                .stream()
                .map(this::toDTO)
                .toList();
    }

    private InventoryTransactionResponseDTO toDTO(InventoryTransaction tx) {

        InventoryTransactionResponseDTO dto = new InventoryTransactionResponseDTO();

        dto.setId(tx.getId());

        if (tx.getProduct() != null) {
            dto.setProductId(tx.getProduct().getId());
            dto.setProductName(tx.getProduct().getName());
            dto.setSku(tx.getProduct().getSku());
        }

        dto.setTransactionType(tx.getTransactionType());
        dto.setQuantity(tx.getQuantity());
        dto.setCreatedAt(tx.getCreatedAt());

        return dto;
    }
}