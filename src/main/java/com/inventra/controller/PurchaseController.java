package com.inventra.controller;

import com.inventra.dto.request.PurchaseRequestDTO;
import com.inventra.dto.response.PurchaseResponseDTO;
import com.inventra.entity.enums.PurchaseStatus;
import com.inventra.service.PurchaseService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Tag(
        name = "Purchase Management",
        description = "Admin purchases from suppliers, stock intake and delivery APIs"
)
@RestController
@RequestMapping("/api/purchases")
@RequiredArgsConstructor
public class PurchaseController {

     private final PurchaseService purchaseService;

     // ================= CREATE =================
     @PostMapping
     public ResponseEntity<PurchaseResponseDTO> create(
             @RequestBody PurchaseRequestDTO dto
     ) {
          return ResponseEntity.ok(purchaseService.createPurchase(dto));
     }

     // ================= DELIVER =================
     @PutMapping("/{id}/deliver")
     public ResponseEntity<PurchaseResponseDTO> deliver(@PathVariable Long id) {
          return ResponseEntity.ok(purchaseService.markAsDelivered(id));
     }

     // ================= CANCEL =================
     @PutMapping("/{id}/cancel")
     public ResponseEntity<PurchaseResponseDTO> cancel(@PathVariable Long id) {
          return ResponseEntity.ok(purchaseService.cancelPurchase(id));
     }

     // ================= GET ALL =================
     @GetMapping
     public ResponseEntity<List<PurchaseResponseDTO>> getAll() {
          return ResponseEntity.ok(purchaseService.getAllPurchases());
     }

     // ================= GET BY SUPPLIER =================
     @GetMapping("/supplier/{supplierId}")
     public ResponseEntity<List<PurchaseResponseDTO>> getBySupplier(@PathVariable Long supplierId) {
          return ResponseEntity.ok(purchaseService.getBySupplier(supplierId));
     }

     // ================= GET BY STATUS =================
     @GetMapping("/status/{status}")
     public ResponseEntity<List<PurchaseResponseDTO>> getByStatus(@PathVariable PurchaseStatus status) {
          return ResponseEntity.ok(purchaseService.getByStatus(status));
     }

     // ================= GET BY ID =================
     @GetMapping("/{id}")
     public ResponseEntity<PurchaseResponseDTO> getById(@PathVariable Long id) {
          return ResponseEntity.ok(purchaseService.getById(id));
     }
}