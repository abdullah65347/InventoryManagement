package com.inventra.service;

import com.inventra.dto.request.SaleItemRequestDTO;
import com.inventra.dto.request.SaleRequestDTO;
import com.inventra.dto.response.SaleItemResponseDTO;
import com.inventra.dto.response.SaleResponseDTO;
import com.inventra.entity.*;
import com.inventra.entity.enums.SaleStatus;
import com.inventra.entity.enums.TransactionType;
import com.inventra.exception.ResourceNotFoundException;
import com.inventra.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class SaleService {

     private final SaleRepository saleRepo;
     private final ProductRepository productRepo;
     private final UserRepository userRepo;
     private final InventoryTransactionService inventoryTxService;

     // ================= CREATE =================
     @Transactional
     public SaleResponseDTO createSale(SaleRequestDTO dto) {

          if (dto.getUserId() == null) {
               throw new IllegalArgumentException("UserId is required");
          }
          if (dto.getItems() == null || dto.getItems().isEmpty()) {
               throw new IllegalArgumentException("Items are required");
          }

          User user = userRepo.findById(dto.getUserId())
                  .orElseThrow(() -> new ResourceNotFoundException("User not found"));

          Sale sale = new Sale();
          sale.setUser(user);
          sale.setStatus(SaleStatus.PENDING);
          sale.setSaleDate(LocalDateTime.now());

          BigDecimal total = BigDecimal.ZERO;

          for (SaleItemRequestDTO itemDto : dto.getItems()) {

               if (itemDto.getProductId() == null || itemDto.getQuantity() == null || itemDto.getQuantity() <= 0) {
                    throw new IllegalArgumentException("Invalid sale item");
               }

               Product product = productRepo.findById(itemDto.getProductId())
                       .orElseThrow(() -> new ResourceNotFoundException("Product not found"));

               if (product.getAdminToUserPrice() == null) {
                    throw new IllegalStateException("Product price not set");
               }

               BigDecimal price = product.getAdminToUserPrice();

               SaleItem item = new SaleItem();
               item.setSale(sale);
               item.setProduct(product);
               item.setQuantity(itemDto.getQuantity());
               item.setPrice(price);

               BigDecimal subTotal = price.multiply(BigDecimal.valueOf(itemDto.getQuantity()));
               item.setSubtotal(subTotal);

               sale.getItems().add(item);
               total = total.add(subTotal);

               // stock decrease
               inventoryTxService.process(
                       product.getId(),
                       TransactionType.ADMIN_SALE,
                       itemDto.getQuantity()
               );
          }

          sale.setTotalAmount(total);

          return toDTO(saleRepo.save(sale));
     }

     // ================= PAID =================
     @Transactional
     public SaleResponseDTO markAsPaid(Long saleId) {

          Sale sale = saleRepo.findById(saleId)
                  .orElseThrow(() -> new ResourceNotFoundException("Sale not found"));

          if (sale.getStatus() != SaleStatus.PENDING) {
               throw new IllegalStateException("Only pending sales can be paid");
          }

          sale.setStatus(SaleStatus.PAID);

          return toDTO(saleRepo.save(sale));
     }

     // ================= DELIVER =================
     @Transactional
     public SaleResponseDTO markAsDelivered(Long saleId) {

          Sale sale = saleRepo.findById(saleId)
                  .orElseThrow(() -> new ResourceNotFoundException("Sale not found"));

          if (sale.getStatus() != SaleStatus.PAID) {
               throw new IllegalStateException("Only paid sales can be delivered");
          }

          sale.setStatus(SaleStatus.DELIVERED);
          sale.setDeliveredAt(LocalDateTime.now());

          return toDTO(saleRepo.save(sale));
     }

     // ================= GET ALL =================
     public List<SaleResponseDTO> getAllSales() {
          return saleRepo.findAll()
                  .stream()
                  .map(this::toDTO)
                  .toList();
     }

     // ================= GET BY USER =================
     public List<SaleResponseDTO> getByUser(Long userId) {
          return saleRepo.findByUserIdOrderBySaleDateDesc(userId)
                  .stream()
                  .map(this::toDTO)
                  .toList();
     }

     // ================= GET BY ID =================
     public SaleResponseDTO getById(Long id) {
          return saleRepo.findById(id)
                  .map(this::toDTO)
                  .orElseThrow(() -> new ResourceNotFoundException("Sale not found"));
     }

     // ================= MAPPER =================
     private SaleResponseDTO toDTO(Sale sale) {

          SaleResponseDTO dto = new SaleResponseDTO();

          dto.setId(sale.getId());
          dto.setUserId(sale.getUser().getId());
          dto.setTotalAmount(sale.getTotalAmount());
          dto.setStatus(sale.getStatus().name());
          dto.setSaleDate(sale.getSaleDate());

          dto.setItems(
                  sale.getItems().stream().map(item -> {
                       SaleItemResponseDTO i = new SaleItemResponseDTO();

                       i.setId(item.getId());
                       i.setProductId(item.getProduct().getId());
                       i.setProductName(item.getProduct().getName());
                       i.setQuantity(item.getQuantity());
                       i.setPrice(item.getPrice());
                       i.setSubtotal(item.getSubtotal());

                       return i;
                  }).toList()
          );

          return dto;
     }
}