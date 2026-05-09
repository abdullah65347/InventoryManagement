package com.inventra.controller;

import com.inventra.dto.request.SaleRequestDTO;
import com.inventra.dto.response.SaleResponseDTO;
import com.inventra.service.SaleService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(
        name = "Sales",
        description = "Sales creation, billing, status update and total calculation APIs"
)
@RestController
@RequestMapping("/api/sales")
@RequiredArgsConstructor
public class SaleController {

    private final SaleService saleService;

    // ================= CREATE =================
    @PostMapping
    public ResponseEntity<SaleResponseDTO> create(
            @RequestBody SaleRequestDTO dto
    ) {
        return ResponseEntity.ok(saleService.createSale(dto));
    }

    // ================= PAID =================
    @PutMapping("/{id}/pay")
    public ResponseEntity<SaleResponseDTO> pay(@PathVariable Long id) {
        return ResponseEntity.ok(saleService.markAsPaid(id));
    }

    // ================= DELIVER =================
    @PutMapping("/{id}/deliver")
    public ResponseEntity<SaleResponseDTO> deliver(@PathVariable Long id) {
        return ResponseEntity.ok(saleService.markAsDelivered(id));
    }

    // ================= GET ALL =================
    @GetMapping
    public ResponseEntity<List<SaleResponseDTO>> getAll() {
        return ResponseEntity.ok(saleService.getAllSales());
    }

    // ================= GET BY USER =================
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<SaleResponseDTO>> getByUser(@PathVariable Long userId) {
        return ResponseEntity.ok(saleService.getByUser(userId));
    }

    // ================= GET BY ID =================
    @GetMapping("/{id}")
    public ResponseEntity<SaleResponseDTO> getById(@PathVariable Long id) {
        return ResponseEntity.ok(saleService.getById(id));
    }
}