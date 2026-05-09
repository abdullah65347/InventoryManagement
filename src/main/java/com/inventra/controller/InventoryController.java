package com.inventra.controller;

import com.inventra.dto.request.InventoryRequestDTO;
import com.inventra.dto.response.InventoryResponseDTO;
import com.inventra.service.InventoryService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(
        name = "Inventory Management",
        description = "Inventory stock, reorder level and inventory lookup APIs"
)
@RestController
@RequestMapping("/api/inventory")
@RequiredArgsConstructor
public class InventoryController {

    private final InventoryService inventoryService;

    // GET ALL
    @GetMapping
    public ResponseEntity<List<InventoryResponseDTO>> getAll() {
        return ResponseEntity.ok(inventoryService.getAll());
    }

    // GET BY PRODUCT
    @GetMapping("/product/{productId}")
    public ResponseEntity<InventoryResponseDTO> getByProduct(
            @PathVariable Long productId
    ) {
        return ResponseEntity.ok(inventoryService.getByProduct(productId));
    }

    // UPDATE REORDER LEVEL ONLY
    @PutMapping("/product/{productId}/reorder")
    public ResponseEntity<InventoryResponseDTO> updateReorder(
            @PathVariable Long productId,
            @RequestParam Integer level
    ) {
        return ResponseEntity.ok(
                inventoryService.updateReorderLevel(productId, level)
        );
    }
}