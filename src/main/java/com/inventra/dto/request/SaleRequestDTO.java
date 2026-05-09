package com.inventra.dto.request;

import lombok.Data;

import java.util.List;

@Data
public class SaleRequestDTO {
     private Long userId;
     private List<SaleItemRequestDTO> items;
}
