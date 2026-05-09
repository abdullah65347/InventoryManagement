package com.inventra.dto.response;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
public class SaleResponseDTO {
     private Long id;
     private Long userId;
     private BigDecimal totalAmount;
     private String status;
     private LocalDateTime saleDate;
     private List<SaleItemResponseDTO> items;
}