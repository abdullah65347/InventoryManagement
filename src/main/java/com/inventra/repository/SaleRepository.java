package com.inventra.repository;

import com.inventra.entity.Sale;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SaleRepository extends JpaRepository<Sale, Long> {
    List<Sale> findByUserIdOrderBySaleDateDesc(Long userId);
}