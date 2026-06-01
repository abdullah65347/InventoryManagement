package com.inventra.repository;

import com.inventra.entity.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface InventoryRepository extends JpaRepository<Inventory, Long> {

     Optional<Inventory> findByProductId(Long productId);

     @Query("""
                 SELECT p.category.id,
                        p.category.name,
                        COUNT(i.id)
                 FROM Inventory i
                 JOIN i.product p
                 GROUP BY p.category.id, p.category.name
             """)
     List<Object[]> getProductCountByCategory();

     boolean existsByProduct_Id(Long productId);
}
