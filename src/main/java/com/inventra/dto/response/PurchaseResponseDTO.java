package com.inventra.dto.response;

import lombok.Data;
import java.math.BigDecimal;
import java.util.List;

@Data
public class PurchaseResponseDTO {
     private Long id;
     private Long supplierId;
     private String status;
     private BigDecimal totalAmount;
     private List<PurchaseItemResponseDTO> items;
}