package com.inventra.entity;

import com.inventra.entity.enums.SaleStatus;
import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "sales")
@Data
public class Sale {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // sales.user_id FK -> users.id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "total_amount", nullable = false, precision = 12, scale = 2)
    private BigDecimal totalAmount;

    @Enumerated(EnumType.STRING)
    private SaleStatus status; // e.g., PENDING, PAID, DELIVERED

    @Column(name = "sale_date")
    private LocalDateTime saleDate;

    @Column(name = "delivered_at")
    private LocalDateTime deliveredAt;

    @Column(name = "receipt_path")
    private String receiptPath;

    @OneToMany(mappedBy = "sale", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SaleItem> items = new ArrayList<>();
}