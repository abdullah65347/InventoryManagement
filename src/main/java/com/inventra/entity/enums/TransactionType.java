package com.inventra.entity.enums;


public enum TransactionType {
    SUPPLIER_STOCK_IN,   // product.quantity +
    SUPPLIER_STOCK_OUT,  // product.quantity -
    ADMIN_PURCHASE,      // product.quantity - AND inventory.availableStock +
    ADMIN_SALE,          // inventory.availableStock -
    ADJUSTMENT

}
