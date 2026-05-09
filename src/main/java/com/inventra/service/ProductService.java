package com.inventra.service;

import com.inventra.dto.request.ProductRequestDTO;
import com.inventra.dto.response.AdminProductResponseDTO;
import com.inventra.dto.response.SupplierProductResponseDTO;
import com.inventra.dto.response.UserProductResponseDTO;
import com.inventra.entity.*;
import com.inventra.exception.ResourceNotFoundException;
import com.inventra.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.math.BigDecimal;
import java.util.List;


@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepo;
    private final SupplierRepository supplierRepo;

    private final InventoryRepository inventoryRepo;

    // ================= CREATE PRODUCT =================
    @Transactional
    public SupplierProductResponseDTO createProduct(ProductRequestDTO dto) {

        if (productRepo.existsBySku(dto.getSku())) {
            throw new IllegalArgumentException("SKU already exists");
        }

        if (dto.getQuantity() == null || dto.getQuantity() < 0) {
            throw new IllegalArgumentException("Quantity must be >= 0");
        }

        Supplier supplier = supplierRepo.findById(dto.getSupplierId())
                .orElseThrow(() -> new ResourceNotFoundException("Supplier not found"));

        Product p = new Product();
        p.setName(dto.getName());
        p.setDescription(dto.getDescription());
        p.setSku(dto.getSku());
        p.setSupplier(supplier);
        p.setCategory(supplier.getCategory());
        p.setSupplierToAdminPrice(dto.getSupplierToAdminPrice());
        p.setQuantity(dto.getQuantity());

        p = productRepo.save(p);

        // create inventory (admin stock = 0)
        Inventory inv = new Inventory();
        inv.setProduct(p);
        inv.setAvailableStock(0);
        inv.setReorderLevel(0);
        inventoryRepo.save(inv);

        return toSupplierDTO(p);
    }

    // ================= ADMIN PRICE =================
    @Transactional
    public AdminProductResponseDTO setAdminPrice(Long productId, BigDecimal price) {

        if (price == null || price.compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Price must be greater than 0");
        }

        Product p = productRepo.findById(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found"));

        p.setAdminToUserPrice(price);
        productRepo.save(p);

        Inventory inv = inventoryRepo.findByProductId(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory not found"));

        return toAdminDTO(p, inv);
    }

    // ================= SUPPLIER PRICE =================
    @Transactional
    public SupplierProductResponseDTO updateSupplierPrice(Long productId, BigDecimal price) {

        if (price == null || price.compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Price must be greater than 0");
        }

        Product p = productRepo.findById(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found"));

        p.setSupplierToAdminPrice(price);

        return toSupplierDTO(productRepo.save(p));
    }

    // ================= ADD STOCK =================
    @Transactional
    public SupplierProductResponseDTO addStock(Long productId, Integer qty) {

        if (qty == null || qty <= 0) {
            throw new IllegalArgumentException("Quantity must be > 0");
        }

        Product p = productRepo.findById(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found"));

        p.setQuantity(p.getQuantity() + qty);

        return toSupplierDTO(productRepo.save(p));
    }

    // ================= USER VIEW =================
    public List<UserProductResponseDTO> getProductsForUser() {
        return productRepo.findByIsActiveTrue()
                .stream()
                .map(this::toUserDTO)
                .toList();
    }

    // ================= ADMIN VIEW =================
    public List<AdminProductResponseDTO> getProductsForAdmin() {
        return productRepo.findByIsActiveTrue()
                .stream()
                .map(p -> {
                    Inventory inv = inventoryRepo.findByProductId(p.getId()).orElse(null);
                    return toAdminDTO(p, inv);
                })
                .toList();
    }

    // ================= SUPPLIER VIEW =================
    public List<SupplierProductResponseDTO> getProductsForSupplier(Long supplierId) {

        if (supplierId == null) {
            throw new IllegalArgumentException("SupplierId is required");
        }

        return productRepo.findBySupplierId(supplierId)
                .stream()
                .map(this::toSupplierDTO)
                .toList();
    }

    // ================= DTO MAPPERS =================

    private UserProductResponseDTO toUserDTO(Product p) {
        UserProductResponseDTO dto = new UserProductResponseDTO();
        dto.setName(p.getName());
        dto.setDescription(p.getDescription());
        dto.setAdminToUserPrice(p.getAdminToUserPrice());
        return dto;
    }

    private SupplierProductResponseDTO toSupplierDTO(Product p) {
        SupplierProductResponseDTO dto = new SupplierProductResponseDTO();
        dto.setId(p.getId());
        dto.setName(p.getName());
        dto.setDescription(p.getDescription());
        dto.setSupplierToAdminPrice(p.getSupplierToAdminPrice());
        dto.setAvailableStock(p.getQuantity());
        dto.setSku(p.getSku());
        dto.setActive(p.isActive());
        dto.setCreatedAt(p.getCreatedAt());
        return dto;
    }

    private AdminProductResponseDTO toAdminDTO(Product p, Inventory inv) {
        AdminProductResponseDTO dto = new AdminProductResponseDTO();

        dto.setId(p.getId());
        dto.setName(p.getName());
        dto.setDescription(p.getDescription());
        dto.setSupplierToAdminPrice(p.getSupplierToAdminPrice());
        dto.setAdminToUserPrice(p.getAdminToUserPrice());
        dto.setAvailableStock(inv != null ? inv.getAvailableStock() : 0);

        dto.setCategoryName(
                p.getCategory() != null ? p.getCategory().getName() : null
        );

        dto.setSupplierName(
                p.getSupplier() != null ? p.getSupplier().getCompanyName() : null
        );

        dto.setSku(p.getSku());
        dto.setActive(p.isActive());
        dto.setCreatedAt(p.getCreatedAt());

        return dto;
    }
}