-- ============================================================
--  INVENTRA – DUMMY DATA (Fresh Script)
--  Password for ALL users: 123456
--  BCrypt hash: $2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6
--  Dates spread from 2026-01-01 → CURDATE()
--  Engine: MySQL 8+
--  Order:
--    users → categories → suppliers → managers → staff → customers
--    → products → inventory → purchases → purchase_items
--    → sales → sale_items → inventory_transactions
-- ============================================================

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE inventory_transactions;
TRUNCATE TABLE sale_items;
TRUNCATE TABLE sales;
TRUNCATE TABLE purchase_items;
TRUNCATE TABLE purchases;
TRUNCATE TABLE inventory;
TRUNCATE TABLE products;
TRUNCATE TABLE customers;
TRUNCATE TABLE staff;
TRUNCATE TABLE managers;
TRUNCATE TABLE Suppliers;
TRUNCATE TABLE categories;
TRUNCATE TABLE users;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- 1. USERS  (25 users)
-- ============================================================
INSERT INTO users (name, email, password, phone, address, is_active, role, created_at, updated_at) VALUES
-- Admin (id 1)
('Arjun Sharma',   'arjun.admin@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000001', 'Delhi',     TRUE, 'ROLE_ADMIN',    '2026-01-01 09:00:00', '2026-01-01 09:00:00'),
-- Suppliers (id 2..5)
('Ravi Verma',     'ravi.supplier@inventra.com',   '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000002', 'Mumbai',    TRUE, 'ROLE_SUPPLIER', '2026-01-02 09:00:00', '2026-01-02 09:00:00'),
('Sunita Patel',   'sunita.supplier@inventra.com', '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000003', 'Ahmedabad', TRUE, 'ROLE_SUPPLIER', '2026-01-03 09:00:00', '2026-01-03 09:00:00'),
('Imran Khan',     'imran.supplier@inventra.com',  '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000004', 'Jaipur',    TRUE, 'ROLE_SUPPLIER', '2026-01-04 09:00:00', '2026-01-04 09:00:00'),
('Geeta Rao',      'geeta.supplier@inventra.com',  '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000005', 'Chennai',   TRUE, 'ROLE_SUPPLIER', '2026-01-05 09:00:00', '2026-01-05 09:00:00'),
-- Managers (id 6..9)
('Karan Mehta',    'karan.manager@inventra.com',   '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000006', 'Pune',      TRUE, 'ROLE_MANAGER',  '2026-01-06 09:00:00', '2026-01-06 09:00:00'),
('Neha Gupta',     'neha.manager@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000007', 'Hyderabad', TRUE, 'ROLE_MANAGER',  '2026-01-07 09:00:00', '2026-01-07 09:00:00'),
('Vivek Anand',    'vivek.manager@inventra.com',   '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000008', 'Noida',     TRUE, 'ROLE_MANAGER',  '2026-01-08 09:00:00', '2026-01-08 09:00:00'),
('Shreya Bose',    'shreya.manager@inventra.com',  '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000009', 'Kolkata',   TRUE, 'ROLE_MANAGER',  '2026-01-09 09:00:00', '2026-01-09 09:00:00'),
-- Staff (id 10..25)
('Amit Kumar',     'amit.staff@inventra.com',      '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000010', 'Bangalore',  TRUE, 'ROLE_STAFF', '2026-01-10 09:00:00', '2026-01-10 09:00:00'),
('Priya Singh',    'priya.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000011', 'Chennai',    TRUE, 'ROLE_STAFF', '2026-01-11 09:00:00', '2026-01-11 09:00:00'),
('Rohit Joshi',    'rohit.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000012', 'Kolkata',    TRUE, 'ROLE_STAFF', '2026-01-12 09:00:00', '2026-01-12 09:00:00'),
('Snehal Pawar',   'snehal.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000013', 'Pune',       TRUE, 'ROLE_STAFF', '2026-01-13 09:00:00', '2026-01-13 09:00:00'),
('Rahul Yadav',    'rahul.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000014', 'Lucknow',    TRUE, 'ROLE_STAFF', '2026-01-14 09:00:00', '2026-01-14 09:00:00'),
('Divya Menon',    'divya.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000015', 'Kochi',      TRUE, 'ROLE_STAFF', '2026-01-15 09:00:00', '2026-01-15 09:00:00'),
('Tarun Saxena',   'tarun.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000016', 'Indore',     TRUE, 'ROLE_STAFF', '2026-01-16 09:00:00', '2026-01-16 09:00:00'),
('Komal Shah',     'komal.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000017', 'Surat',      TRUE, 'ROLE_STAFF', '2026-01-17 09:00:00', '2026-01-17 09:00:00'),
('Naveen Reddy',   'naveen.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000018', 'Hyderabad',  TRUE, 'ROLE_STAFF', '2026-01-18 09:00:00', '2026-01-18 09:00:00'),
('Ayesha Khan',    'ayesha.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000019', 'Bhopal',     TRUE, 'ROLE_STAFF', '2026-01-19 09:00:00', '2026-01-19 09:00:00'),
('Manish Goel',    'manish.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000020', 'Delhi',      TRUE, 'ROLE_STAFF', '2026-01-20 09:00:00', '2026-01-20 09:00:00'),
('Pooja Bhatt',    'pooja.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000021', 'Mumbai',     TRUE, 'ROLE_STAFF', '2026-01-21 09:00:00', '2026-01-21 09:00:00'),
('Sohail Mirza',   'sohail.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000022', 'Nagpur',     TRUE, 'ROLE_STAFF', '2026-01-22 09:00:00', '2026-01-22 09:00:00'),
('Renu Aggarwal',  'renu.staff@inventra.com',      '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000023', 'Chandigarh', TRUE, 'ROLE_STAFF', '2026-01-23 09:00:00', '2026-01-23 09:00:00'),
('Vikas Dube',     'vikas.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000024', 'Patna',      TRUE, 'ROLE_STAFF', '2026-01-24 09:00:00', '2026-01-24 09:00:00'),
('Anjali Roy',     'anjali.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000025', 'Ranchi',     TRUE, 'ROLE_STAFF', '2026-01-25 09:00:00', '2026-01-25 09:00:00');

-- ============================================================
-- 2. CATEGORIES (8)
-- ============================================================
INSERT INTO categories (name) VALUES
('Electronics'),         -- 1
('Furniture'),           -- 2
('Stationery'),          -- 3
('Clothing'),            -- 4
('Kitchen Appliances'),  -- 5
('Footwear'),            -- 6
('Sports & Fitness'),    -- 7
('Toys & Games');        -- 8

-- ============================================================
-- 3. SUPPLIERS  (4)
-- ============================================================
INSERT INTO Suppliers (user_id, category_id, company_name, address, is_active, created_at, updated_at) VALUES
(2, 1, 'Ravi Electronics Pvt Ltd', 'Andheri, Mumbai',        TRUE, '2026-01-02 10:00:00', '2026-01-02 10:00:00'), -- 1
(3, 4, 'Sunita Garments Co.',      'Navrangpura, Ahmedabad', TRUE, '2026-01-03 10:00:00', '2026-01-03 10:00:00'), -- 2
(4, 2, 'Khan Furniture House',     'MI Road, Jaipur',        TRUE, '2026-01-04 10:00:00', '2026-01-04 10:00:00'), -- 3
(5, 5, 'Geeta Home Appliances',    'T.Nagar, Chennai',       TRUE, '2026-01-05 10:00:00', '2026-01-05 10:00:00'); -- 4

-- ============================================================
-- 4. MANAGERS  (4)
-- ============================================================
INSERT INTO managers (user_id, department, is_active, created_at, updated_at) VALUES
(6, 'Warehouse & Inventory', TRUE, '2026-01-06 10:00:00', '2026-01-06 10:00:00'), -- 1 Karan
(7, 'Sales & Billing',       TRUE, '2026-01-07 10:00:00', '2026-01-07 10:00:00'), -- 2 Neha
(8, 'Procurement',           TRUE, '2026-01-08 10:00:00', '2026-01-08 10:00:00'), -- 3 Vivek
(9, 'Logistics & Dispatch',  TRUE, '2026-01-09 10:00:00', '2026-01-09 10:00:00'); -- 4 Shreya

-- ============================================================
-- 5. STAFF  (16)
-- ============================================================
INSERT INTO staff (user_id, manager_id, is_active, created_at, updated_at) VALUES
(10, 2, TRUE, '2026-01-10 10:00:00', '2026-01-10 10:00:00'),
(11, 2, TRUE, '2026-01-11 10:00:00', '2026-01-11 10:00:00'),
(12, 1, TRUE, '2026-01-12 10:00:00', '2026-01-12 10:00:00'),
(13, 1, TRUE, '2026-01-13 10:00:00', '2026-01-13 10:00:00'),
(14, 3, TRUE, '2026-01-14 10:00:00', '2026-01-14 10:00:00'),
(15, 2, TRUE, '2026-01-15 10:00:00', '2026-01-15 10:00:00'),
(16, 4, TRUE, '2026-01-16 10:00:00', '2026-01-16 10:00:00'),
(17, 2, TRUE, '2026-01-17 10:00:00', '2026-01-17 10:00:00'),
(18, 4, TRUE, '2026-01-18 10:00:00', '2026-01-18 10:00:00'),
(19, 1, TRUE, '2026-01-19 10:00:00', '2026-01-19 10:00:00'),
(20, 3, TRUE, '2026-01-20 10:00:00', '2026-01-20 10:00:00'),
(21, 2, TRUE, '2026-01-21 10:00:00', '2026-01-21 10:00:00'),
(22, 4, TRUE, '2026-01-22 10:00:00', '2026-01-22 10:00:00'),
(23, 1, TRUE, '2026-01-23 10:00:00', '2026-01-23 10:00:00'),
(24, 3, TRUE, '2026-01-24 10:00:00', '2026-01-24 10:00:00'),
(25, 2, TRUE, '2026-01-25 10:00:00', '2026-01-25 10:00:00');

-- ============================================================
-- 6. CUSTOMERS  (25)
-- ============================================================
INSERT INTO customers (name, phone, email, address, created_at) VALUES
('Deepak Nair',     '8100000001', 'deepak@gmail.com',    'Kochi, Kerala',         '2026-01-15 11:00:00'),
('Meera Iyer',      '8100000002', 'meera@gmail.com',     'Coimbatore, TN',        '2026-01-18 11:00:00'),
('Suresh Pillai',   '8100000003', 'suresh@gmail.com',    'Trivandrum, Kerala',    '2026-01-20 11:00:00'),
('Anita Desai',     '8100000004', 'anita@gmail.com',     'Surat, Gujarat',        '2026-01-22 11:00:00'),
('Vikram Bose',     '8100000005', 'vikram@gmail.com',    'Howrah, WB',            '2026-01-25 11:00:00'),
('Pooja Reddy',     '8100000006', 'pooja@gmail.com',     'Vijayawada, AP',        '2026-01-28 11:00:00'),
('Manoj Tiwari',    '8100000007', 'manoj@gmail.com',     'Lucknow, UP',           '2026-02-01 11:00:00'),
('Kavitha Nair',    '8100000008', 'kavitha@gmail.com',   'Mangalore, Karnataka',  '2026-02-03 11:00:00'),
('Sanjay Mishra',   '8100000009', 'sanjay@gmail.com',    'Bhopal, MP',            '2026-02-05 11:00:00'),
('Lakshmi Rao',     '8100000010', 'lakshmi@gmail.com',   'Visakhapatnam, AP',     '2026-02-08 11:00:00'),
('Rajat Kapoor',    '8100000011', 'rajat@gmail.com',     'Gurgaon, HR',           '2026-02-12 11:00:00'),
('Sheetal Jain',    '8100000012', 'sheetal@gmail.com',   'Indore, MP',            '2026-02-15 11:00:00'),
('Harish Chandra',  '8100000013', 'harish@gmail.com',    'Dehradun, UK',          '2026-02-18 11:00:00'),
('Nidhi Saxena',    '8100000014', 'nidhi@gmail.com',     'Kanpur, UP',            '2026-02-22 11:00:00'),
('Bhavesh Patel',   '8100000015', 'bhavesh@gmail.com',   'Vadodara, GJ',          '2026-02-26 11:00:00'),
('Tanya Malhotra',  '8100000016', 'tanya@gmail.com',     'Amritsar, PB',          '2026-03-02 11:00:00'),
('Ramesh Iyengar',  '8100000017', 'ramesh@gmail.com',    'Mysore, KA',            '2026-03-06 11:00:00'),
('Smita Kulkarni',  '8100000018', 'smita@gmail.com',     'Nashik, MH',            '2026-03-10 11:00:00'),
('Aakash Verma',    '8100000019', 'aakash@gmail.com',    'Faridabad, HR',         '2026-03-14 11:00:00'),
('Ishita Sen',      '8100000020', 'ishita@gmail.com',    'Siliguri, WB',          '2026-03-18 11:00:00'),
('Gopal Krishnan',  '8100000021', 'gopal@gmail.com',     'Madurai, TN',           '2026-03-22 11:00:00'),
('Ritika Aggarwal', '8100000022', 'ritika@gmail.com',    'Meerut, UP',            '2026-03-26 11:00:00'),
('Yusuf Sheikh',    '8100000023', 'yusuf@gmail.com',     'Aurangabad, MH',        '2026-04-01 11:00:00'),
('Preeti Sinha',    '8100000024', 'preeti@gmail.com',    'Jamshedpur, JH',        '2026-04-08 11:00:00'),
('Devansh Mehra',   '8100000025', 'devansh@gmail.com',   'Udaipur, RJ',           '2026-04-15 11:00:00');

-- ============================================================
-- 7. PRODUCTS  (25)
-- ============================================================
INSERT INTO products (name, description, quantity, sku, supplier_id, supplier_to_admin_price, admin_to_user_price, is_active, category_id, created_at, updated_at) VALUES
-- Electronics (supplier 1)
('Samsung 65" LED TV',     '4K UHD Smart TV',              30, 'ELEC-TV-001', 1, 28000.00, 35000.00, TRUE, 1, '2026-01-10 12:00:00', '2026-01-10 12:00:00'), -- 1
('LG 1.5 Ton AC',          '5 Star Split AC',              20, 'ELEC-AC-001', 1, 32000.00, 40000.00, TRUE, 1, '2026-01-10 12:00:00', '2026-01-10 12:00:00'), -- 2
('Sony Bluetooth Speaker', 'Portable Waterproof',          50, 'ELEC-SP-001', 1,  2500.00,  3500.00, TRUE, 1, '2026-01-10 12:00:00', '2026-01-10 12:00:00'), -- 3
('HP Laptop 15s',          'i5, 8GB, 512GB SSD',           15, 'ELEC-LP-001', 1, 48000.00, 58000.00, TRUE, 1, '2026-01-11 12:00:00', '2026-01-11 12:00:00'), -- 4
('boAt Earbuds',           'ANC Wireless',                100, 'ELEC-EB-001', 1,  1200.00,  1800.00, TRUE, 1, '2026-01-11 12:00:00', '2026-01-11 12:00:00'), -- 5
('Canon DSLR',             'EOS 1500D, 24MP',              10, 'ELEC-CM-001', 1, 32000.00, 40000.00, TRUE, 1, '2026-01-11 12:00:00', '2026-01-11 12:00:00'), -- 6
('Lenovo Tab M10',         '10.1" 4GB RAM',                25, 'ELEC-TB-001', 1, 12000.00, 16000.00, TRUE, 1, '2026-01-12 12:00:00', '2026-01-12 12:00:00'), -- 7
-- Clothing (supplier 2)
('Men Formal Shirt',       'Cotton Full Sleeve',          200, 'CLTH-SH-001', 2,   350.00,   599.00, TRUE, 4, '2026-01-12 12:00:00', '2026-01-12 12:00:00'), -- 8
('Women Kurti',            'Rayon Printed',               150, 'CLTH-KU-001', 2,   280.00,   499.00, TRUE, 4, '2026-01-13 12:00:00', '2026-01-13 12:00:00'), -- 9
('Denim Jeans',            'Slim Fit Dark Blue',          120, 'CLTH-JN-001', 2,   600.00,   999.00, TRUE, 4, '2026-01-13 12:00:00', '2026-01-13 12:00:00'), -- 10
('Sports Track Pant',      'Polyester Quick Dry',         180, 'CLTH-TP-001', 2,   250.00,   449.00, TRUE, 4, '2026-01-13 12:00:00', '2026-01-13 12:00:00'), -- 11
('Kids T-Shirt',           'Round Neck',                  300, 'CLTH-KT-001', 2,   150.00,   249.00, TRUE, 4, '2026-01-14 12:00:00', '2026-01-14 12:00:00'), -- 12
('Winter Jacket',          'Padded Water Resistant',       60, 'CLTH-WJ-001', 2,   900.00,  1499.00, TRUE, 4, '2026-01-14 12:00:00', '2026-01-14 12:00:00'), -- 13
('Saree',                  'Silk Festive',                 40, 'CLTH-SR-001', 2,  1200.00,  1999.00, TRUE, 4, '2026-01-14 12:00:00', '2026-01-14 12:00:00'), -- 14
-- Furniture (supplier 3)
('Office Chair',           'Mesh Ergonomic',               40, 'FURN-CH-001', 3,  3500.00,  5499.00, TRUE, 2, '2026-01-15 12:00:00', '2026-01-15 12:00:00'), -- 15
('Wooden Dining Table',    '6 Seater Sheesham',            15, 'FURN-DT-001', 3, 18000.00, 24999.00, TRUE, 2, '2026-01-15 12:00:00', '2026-01-15 12:00:00'), -- 16
('Queen Size Bed',         'Hydraulic Storage',            10, 'FURN-BD-001', 3, 22000.00, 29999.00, TRUE, 2, '2026-01-16 12:00:00', '2026-01-16 12:00:00'), -- 17
('Bookshelf',              '5-Tier Engineered Wood',       30, 'FURN-BS-001', 3,  2200.00,  3499.00, TRUE, 2, '2026-01-16 12:00:00', '2026-01-16 12:00:00'), -- 18
-- Kitchen Appliances (supplier 4)
('Prestige Mixer Grinder', '750W 3 Jars',                  60, 'KITC-MX-001', 4,  2400.00,  3499.00, TRUE, 5, '2026-01-17 12:00:00', '2026-01-17 12:00:00'), -- 19
('Philips Air Fryer',      '4.1 L Digital',                30, 'KITC-AF-001', 4,  6500.00,  8999.00, TRUE, 5, '2026-01-17 12:00:00', '2026-01-17 12:00:00'), -- 20
('Bajaj Microwave Oven',   '20L Solo',                     25, 'KITC-MW-001', 4,  4800.00,  6499.00, TRUE, 5, '2026-01-18 12:00:00', '2026-01-18 12:00:00'), -- 21
('Induction Cooktop',      '2000W',                        50, 'KITC-IN-001', 4,  1800.00,  2499.00, TRUE, 5, '2026-01-18 12:00:00', '2026-01-18 12:00:00'), -- 22
('Electric Kettle 1.5L',   'Stainless Steel',              80, 'KITC-EK-001', 4,   650.00,   999.00, TRUE, 5, '2026-01-19 12:00:00', '2026-01-19 12:00:00'), -- 23
('Hand Blender',           '300W',                         70, 'KITC-HB-001', 4,   900.00,  1399.00, TRUE, 5, '2026-01-19 12:00:00', '2026-01-19 12:00:00'), -- 24
('Toaster 2-Slice',        'Pop-up',                       45, 'KITC-TS-001', 4,  1100.00,  1699.00, TRUE, 5, '2026-01-20 12:00:00', '2026-01-20 12:00:00'); -- 25

-- ============================================================
-- 8. INVENTORY  (one row per product, 25 rows)
-- ============================================================
INSERT INTO inventory (product_id, available_stock, reorder_level, last_updated) VALUES
(1,  50, 10, '2026-01-20 13:00:00'),
(2,  30,  5, '2026-01-20 13:00:00'),
(3, 100, 20, '2026-01-20 13:00:00'),
(4,  20,  5, '2026-01-20 13:00:00'),
(5, 200, 30, '2026-01-20 13:00:00'),
(6,  15,  3, '2026-01-20 13:00:00'),
(7,  40, 10, '2026-01-20 13:00:00'),
(8, 300, 50, '2026-01-21 13:00:00'),
(9, 250, 40, '2026-01-21 13:00:00'),
(10,200, 30, '2026-01-21 13:00:00'),
(11,350, 60, '2026-01-21 13:00:00'),
(12,500, 80, '2026-01-21 13:00:00'),
(13, 80, 15, '2026-01-21 13:00:00'),
(14, 60, 10, '2026-01-21 13:00:00'),
(15, 70, 15, '2026-01-22 13:00:00'),
(16, 25,  5, '2026-01-22 13:00:00'),
(17, 18,  4, '2026-01-22 13:00:00'),
(18, 55, 12, '2026-01-22 13:00:00'),
(19,120, 25, '2026-01-23 13:00:00'),
(20, 45, 10, '2026-01-23 13:00:00'),
(21, 40,  8, '2026-01-23 13:00:00'),
(22, 90, 20, '2026-01-23 13:00:00'),
(23,140, 25, '2026-01-23 13:00:00'),
(24,110, 20, '2026-01-23 13:00:00'),
(25, 70, 15, '2026-01-23 13:00:00');

-- ============================================================
-- 9. PURCHASES  (25)  spread Jan→May
-- ============================================================
INSERT INTO purchases (supplier_id, status, total_amount, confirmed_by, confirmed_at, created_at, updated_at) VALUES
(1, 'CONFIRMED', 476000.00, 1,    '2026-01-25 10:00:00', '2026-01-22 09:00:00', '2026-01-25 10:00:00'), -- 1
(2, 'CONFIRMED', 129000.00, 6,    '2026-01-28 10:00:00', '2026-01-25 09:00:00', '2026-01-28 10:00:00'), -- 2
(3, 'CONFIRMED', 244500.00, 8,    '2026-02-02 10:00:00', '2026-01-30 09:00:00', '2026-02-02 10:00:00'), -- 3
(4, 'CONFIRMED', 168000.00, 1,    '2026-02-05 10:00:00', '2026-02-02 09:00:00', '2026-02-05 10:00:00'), -- 4
(1, 'CONFIRMED',  64000.00, 1,    '2026-02-10 10:00:00', '2026-02-07 09:00:00', '2026-02-10 10:00:00'), -- 5
(2, 'CONFIRMED',  45000.00, 6,    '2026-02-14 10:00:00', '2026-02-12 09:00:00', '2026-02-14 10:00:00'), -- 6
(3, 'CONFIRMED',  85500.00, 8,    '2026-02-18 10:00:00', '2026-02-15 09:00:00', '2026-02-18 10:00:00'), -- 7
(4, 'CONFIRMED',  72000.00, 1,    '2026-02-22 10:00:00', '2026-02-19 09:00:00', '2026-02-22 10:00:00'), -- 8
(1, 'CONFIRMED', 140000.00, 1,    '2026-02-28 10:00:00', '2026-02-25 09:00:00', '2026-02-28 10:00:00'), -- 9
(2, 'CONFIRMED',  64000.00, 6,    '2026-03-04 10:00:00', '2026-03-01 09:00:00', '2026-03-04 10:00:00'), -- 10
(3, 'CONFIRMED', 120000.00, 8,    '2026-03-09 10:00:00', '2026-03-06 09:00:00', '2026-03-09 10:00:00'), -- 11
(4, 'CONFIRMED',  39000.00, 1,    '2026-03-13 10:00:00', '2026-03-10 09:00:00', '2026-03-13 10:00:00'), -- 12
(1, 'CONFIRMED',  96000.00, 1,    '2026-03-18 10:00:00', '2026-03-15 09:00:00', '2026-03-18 10:00:00'), -- 13
(2, 'CONFIRMED',  35000.00, 6,    '2026-03-22 10:00:00', '2026-03-19 09:00:00', '2026-03-22 10:00:00'), -- 14
(3, 'CONFIRMED',  44000.00, 8,    '2026-03-27 10:00:00', '2026-03-24 09:00:00', '2026-03-27 10:00:00'), -- 15
(4, 'CONFIRMED',  54000.00, 1,    '2026-04-01 10:00:00', '2026-03-29 09:00:00', '2026-04-01 10:00:00'), -- 16
(1, 'CONFIRMED', 100000.00, 1,    '2026-04-06 10:00:00', '2026-04-03 09:00:00', '2026-04-06 10:00:00'), -- 17
(2, 'CONFIRMED',  21000.00, 6,    '2026-04-11 10:00:00', '2026-04-08 09:00:00', '2026-04-11 10:00:00'), -- 18
(3, 'CONFIRMED',  88000.00, 8,    '2026-04-16 10:00:00', '2026-04-13 09:00:00', '2026-04-16 10:00:00'), -- 19
(4, 'CONFIRMED',  26000.00, 1,    '2026-04-21 10:00:00', '2026-04-18 09:00:00', '2026-04-21 10:00:00'), -- 20
(1, 'DELIVERED', 80000.00,  NULL, NULL,                  '2026-04-25 09:00:00', '2026-04-28 10:00:00'), -- 21
(2, 'DELIVERED', 18000.00,  NULL, NULL,                  '2026-04-28 09:00:00', '2026-05-01 10:00:00'), -- 22
(3, 'DELIVERED', 35000.00,  NULL, NULL,                  '2026-05-01 09:00:00', '2026-05-04 10:00:00'), -- 23
(4, 'PENDING',       0.00,  NULL, NULL,                  '2026-05-05 09:00:00', '2026-05-05 09:00:00'), -- 24
(1, 'PENDING',       0.00,  NULL, NULL,                  '2026-05-08 09:00:00', '2026-05-08 09:00:00'); -- 25

-- ============================================================
-- 10. PURCHASE ITEMS
-- ============================================================
INSERT INTO purchase_items (purchase_id, product_id, quantity, unit_price, sub_total) VALUES
-- Purchase 1 (electronics)
(1, 1, 5,  28000.00, 140000.00),
(1, 2, 3,  32000.00,  96000.00),
(1, 3, 20,  2500.00,  50000.00),
(1, 4, 2,  48000.00,  96000.00),
(1, 5, 40,  1200.00,  48000.00),
(1, 7, 2,  12000.00,  24000.00),
(1, 6, 1,  32000.00,  22000.00),
-- Purchase 2 (clothing)
(2, 8,  50,  350.00,  17500.00),
(2, 9,  50,  280.00,  14000.00),
(2, 10, 30,  600.00,  18000.00),
(2, 11, 60,  250.00,  15000.00),
(2, 12,100,  150.00,  15000.00),
(2, 13, 20,  900.00,  18000.00),
(2, 14, 15, 1200.00,  18000.00),
(2, 8,  40,  350.00,  13500.00),
-- Purchase 3 (furniture)
(3, 15, 20, 3500.00,  70000.00),
(3, 16,  5,18000.00,  90000.00),
(3, 17,  3,22000.00,  66000.00),
(3, 18,  8, 2200.00,  18500.00),
-- Purchase 4 (kitchen)
(4, 19, 25, 2400.00,  60000.00),
(4, 20, 10, 6500.00,  65000.00),
(4, 21,  8, 4800.00,  38400.00),
(4, 23, 10,  650.00,   4600.00),
-- Purchase 5
(5, 4, 1,  48000.00,  48000.00),
(5, 6, 1,  32000.00,  16000.00),
-- Purchase 6
(6, 8, 50, 350.00, 17500.00),
(6, 12,100,150.00, 15000.00),
(6, 11, 50,250.00, 12500.00),
-- Purchase 7
(7, 15, 10,3500.00, 35000.00),
(7, 18, 10,2200.00, 22000.00),
(7, 16,  1,18000.00,28500.00),
-- Purchase 8
(8, 24, 30, 900.00, 27000.00),
(8, 25, 20,1100.00, 22000.00),
(8, 22, 10,1800.00, 23000.00),
-- Purchase 9
(9, 1, 5,  28000.00, 140000.00),
-- Purchase 10
(10, 9, 80, 280.00, 22400.00),
(10, 13,40, 900.00, 36000.00),
(10, 14, 5,1200.00,  5600.00),
-- Purchase 11
(11, 16, 4,18000.00, 72000.00),
(11, 18,20, 2200.00, 48000.00),
-- Purchase 12
(12, 23,30,  650.00, 19500.00),
(12, 24,15,  900.00, 13500.00),
(12, 25, 4, 1100.00,  6000.00),
-- Purchase 13
(13, 2, 3, 32000.00, 96000.00),
-- Purchase 14
(14, 10,30,  600.00, 18000.00),
(14, 11,40,  250.00, 10000.00),
(14, 12,40,  150.00,  7000.00),
-- Purchase 15
(15, 15, 5, 3500.00, 17500.00),
(15, 18,12, 2200.00, 26500.00),
-- Purchase 16
(16, 19,10, 2400.00, 24000.00),
(16, 20, 3, 6500.00, 19500.00),
(16, 23,15,  650.00, 10500.00),
-- Purchase 17
(17, 5, 50, 1200.00, 60000.00),
(17, 7,  3,12000.00, 40000.00),
-- Purchase 18
(18, 8, 30,  350.00, 10500.00),
(18, 9, 25,  280.00,  7000.00),
(18, 12,20,  150.00,  3500.00),
-- Purchase 19
(19, 17, 4,22000.00, 88000.00),
-- Purchase 20
(20, 22, 8, 1800.00, 14400.00),
(20, 24,10,  900.00,  9000.00),
(20, 25, 2, 1100.00,  2600.00),
-- Purchase 21 DELIVERED
(21, 4, 1, 48000.00, 48000.00),
(21, 5, 20,1200.00, 24000.00),
(21, 3,  4,2500.00,  8000.00),
-- Purchase 22 DELIVERED
(22, 8, 30,  350.00, 10500.00),
(22, 11,30,  250.00,  7500.00),
-- Purchase 23 DELIVERED
(23, 15, 5, 3500.00, 17500.00),
(23, 18, 8, 2200.00, 17500.00);

-- ============================================================
--  INVENTRA – DUMMY DATA (Fresh Script)
--  Password for ALL users: 123456
--  BCrypt hash: $2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6
--  Dates spread from 2026-01-01 → CURDATE()
--  Engine: MySQL 8+
--  Order:
--    users → categories → suppliers → managers → staff → customers
--    → products → inventory → purchases → purchase_items
--    → sales → sale_items → inventory_transactions
-- ============================================================

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE inventory_transactions;
TRUNCATE TABLE sale_items;
TRUNCATE TABLE sales;
TRUNCATE TABLE purchase_items;
TRUNCATE TABLE purchases;
TRUNCATE TABLE inventory;
TRUNCATE TABLE products;
TRUNCATE TABLE customers;
TRUNCATE TABLE staff;
TRUNCATE TABLE managers;
TRUNCATE TABLE Suppliers;
TRUNCATE TABLE categories;
TRUNCATE TABLE users;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- 1. USERS  (25 users)
-- ============================================================
INSERT INTO users (name, email, password, phone, address, is_active, role, created_at, updated_at) VALUES
-- Admin (id 1)
('Arjun Sharma',   'arjun.admin@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000001', 'Delhi',     TRUE, 'ROLE_ADMIN',    '2026-01-01 09:00:00', '2026-01-01 09:00:00'),
-- Suppliers (id 2..5)
('Ravi Verma',     'ravi.supplier@inventra.com',   '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000002', 'Mumbai',    TRUE, 'ROLE_SUPPLIER', '2026-01-02 09:00:00', '2026-01-02 09:00:00'),
('Sunita Patel',   'sunita.supplier@inventra.com', '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000003', 'Ahmedabad', TRUE, 'ROLE_SUPPLIER', '2026-01-03 09:00:00', '2026-01-03 09:00:00'),
('Imran Khan',     'imran.supplier@inventra.com',  '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000004', 'Jaipur',    TRUE, 'ROLE_SUPPLIER', '2026-01-04 09:00:00', '2026-01-04 09:00:00'),
('Geeta Rao',      'geeta.supplier@inventra.com',  '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000005', 'Chennai',   TRUE, 'ROLE_SUPPLIER', '2026-01-05 09:00:00', '2026-01-05 09:00:00'),
-- Managers (id 6..9)
('Karan Mehta',    'karan.manager@inventra.com',   '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000006', 'Pune',      TRUE, 'ROLE_MANAGER',  '2026-01-06 09:00:00', '2026-01-06 09:00:00'),
('Neha Gupta',     'neha.manager@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000007', 'Hyderabad', TRUE, 'ROLE_MANAGER',  '2026-01-07 09:00:00', '2026-01-07 09:00:00'),
('Vivek Anand',    'vivek.manager@inventra.com',   '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000008', 'Noida',     TRUE, 'ROLE_MANAGER',  '2026-01-08 09:00:00', '2026-01-08 09:00:00'),
('Shreya Bose',    'shreya.manager@inventra.com',  '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000009', 'Kolkata',   TRUE, 'ROLE_MANAGER',  '2026-01-09 09:00:00', '2026-01-09 09:00:00'),
-- Staff (id 10..25)
('Amit Kumar',     'amit.staff@inventra.com',      '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000010', 'Bangalore',  TRUE, 'ROLE_STAFF', '2026-01-10 09:00:00', '2026-01-10 09:00:00'),
('Priya Singh',    'priya.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000011', 'Chennai',    TRUE, 'ROLE_STAFF', '2026-01-11 09:00:00', '2026-01-11 09:00:00'),
('Rohit Joshi',    'rohit.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000012', 'Kolkata',    TRUE, 'ROLE_STAFF', '2026-01-12 09:00:00', '2026-01-12 09:00:00'),
('Snehal Pawar',   'snehal.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000013', 'Pune',       TRUE, 'ROLE_STAFF', '2026-01-13 09:00:00', '2026-01-13 09:00:00'),
('Rahul Yadav',    'rahul.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000014', 'Lucknow',    TRUE, 'ROLE_STAFF', '2026-01-14 09:00:00', '2026-01-14 09:00:00'),
('Divya Menon',    'divya.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000015', 'Kochi',      TRUE, 'ROLE_STAFF', '2026-01-15 09:00:00', '2026-01-15 09:00:00'),
('Tarun Saxena',   'tarun.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000016', 'Indore',     TRUE, 'ROLE_STAFF', '2026-01-16 09:00:00', '2026-01-16 09:00:00'),
('Komal Shah',     'komal.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000017', 'Surat',      TRUE, 'ROLE_STAFF', '2026-01-17 09:00:00', '2026-01-17 09:00:00'),
('Naveen Reddy',   'naveen.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000018', 'Hyderabad',  TRUE, 'ROLE_STAFF', '2026-01-18 09:00:00', '2026-01-18 09:00:00'),
('Ayesha Khan',    'ayesha.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000019', 'Bhopal',     TRUE, 'ROLE_STAFF', '2026-01-19 09:00:00', '2026-01-19 09:00:00'),
('Manish Goel',    'manish.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000020', 'Delhi',      TRUE, 'ROLE_STAFF', '2026-01-20 09:00:00', '2026-01-20 09:00:00'),
('Pooja Bhatt',    'pooja.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000021', 'Mumbai',     TRUE, 'ROLE_STAFF', '2026-01-21 09:00:00', '2026-01-21 09:00:00'),
('Sohail Mirza',   'sohail.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000022', 'Nagpur',     TRUE, 'ROLE_STAFF', '2026-01-22 09:00:00', '2026-01-22 09:00:00'),
('Renu Aggarwal',  'renu.staff@inventra.com',      '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000023', 'Chandigarh', TRUE, 'ROLE_STAFF', '2026-01-23 09:00:00', '2026-01-23 09:00:00'),
('Vikas Dube',     'vikas.staff@inventra.com',     '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000024', 'Patna',      TRUE, 'ROLE_STAFF', '2026-01-24 09:00:00', '2026-01-24 09:00:00'),
('Anjali Roy',     'anjali.staff@inventra.com',    '$2a$10$CD0m96vJg81.SnqtMz/D9.dpd2qw.F3dTz4UW.IxKYEeeixviKmd6', '9000000025', 'Ranchi',     TRUE, 'ROLE_STAFF', '2026-01-25 09:00:00', '2026-01-25 09:00:00');

-- ============================================================
-- 2. CATEGORIES (8)
-- ============================================================
INSERT INTO categories (name) VALUES
('Electronics'),         -- 1
('Furniture'),           -- 2
('Stationery'),          -- 3
('Clothing'),            -- 4
('Kitchen Appliances'),  -- 5
('Footwear'),            -- 6
('Sports & Fitness'),    -- 7
('Toys & Games');        -- 8

-- ============================================================
-- 3. SUPPLIERS  (4)
-- ============================================================
INSERT INTO Suppliers (user_id, category_id, company_name, address, is_active, created_at, updated_at) VALUES
(2, 1, 'Ravi Electronics Pvt Ltd', 'Andheri, Mumbai',        TRUE, '2026-01-02 10:00:00', '2026-01-02 10:00:00'), -- 1
(3, 4, 'Sunita Garments Co.',      'Navrangpura, Ahmedabad', TRUE, '2026-01-03 10:00:00', '2026-01-03 10:00:00'), -- 2
(4, 2, 'Khan Furniture House',     'MI Road, Jaipur',        TRUE, '2026-01-04 10:00:00', '2026-01-04 10:00:00'), -- 3
(5, 5, 'Geeta Home Appliances',    'T.Nagar, Chennai',       TRUE, '2026-01-05 10:00:00', '2026-01-05 10:00:00'); -- 4

-- ============================================================
-- 4. MANAGERS  (4)
-- ============================================================
INSERT INTO managers (user_id, department, is_active, created_at, updated_at) VALUES
(6, 'Warehouse & Inventory', TRUE, '2026-01-06 10:00:00', '2026-01-06 10:00:00'), -- 1 Karan
(7, 'Sales & Billing',       TRUE, '2026-01-07 10:00:00', '2026-01-07 10:00:00'), -- 2 Neha
(8, 'Procurement',           TRUE, '2026-01-08 10:00:00', '2026-01-08 10:00:00'), -- 3 Vivek
(9, 'Logistics & Dispatch',  TRUE, '2026-01-09 10:00:00', '2026-01-09 10:00:00'); -- 4 Shreya

-- ============================================================
-- 5. STAFF  (16)
-- ============================================================
INSERT INTO staff (user_id, manager_id, is_active, created_at, updated_at) VALUES
(10, 2, TRUE, '2026-01-10 10:00:00', '2026-01-10 10:00:00'),
(11, 2, TRUE, '2026-01-11 10:00:00', '2026-01-11 10:00:00'),
(12, 1, TRUE, '2026-01-12 10:00:00', '2026-01-12 10:00:00'),
(13, 1, TRUE, '2026-01-13 10:00:00', '2026-01-13 10:00:00'),
(14, 3, TRUE, '2026-01-14 10:00:00', '2026-01-14 10:00:00'),
(15, 2, TRUE, '2026-01-15 10:00:00', '2026-01-15 10:00:00'),
(16, 4, TRUE, '2026-01-16 10:00:00', '2026-01-16 10:00:00'),
(17, 2, TRUE, '2026-01-17 10:00:00', '2026-01-17 10:00:00'),
(18, 4, TRUE, '2026-01-18 10:00:00', '2026-01-18 10:00:00'),
(19, 1, TRUE, '2026-01-19 10:00:00', '2026-01-19 10:00:00'),
(20, 3, TRUE, '2026-01-20 10:00:00', '2026-01-20 10:00:00'),
(21, 2, TRUE, '2026-01-21 10:00:00', '2026-01-21 10:00:00'),
(22, 4, TRUE, '2026-01-22 10:00:00', '2026-01-22 10:00:00'),
(23, 1, TRUE, '2026-01-23 10:00:00', '2026-01-23 10:00:00'),
(24, 3, TRUE, '2026-01-24 10:00:00', '2026-01-24 10:00:00'),
(25, 2, TRUE, '2026-01-25 10:00:00', '2026-01-25 10:00:00');

-- ============================================================
-- 6. CUSTOMERS  (25)
-- ============================================================
INSERT INTO customers (name, phone, email, address, created_at) VALUES
('Deepak Nair',     '8100000001', 'deepak@gmail.com',    'Kochi, Kerala',         '2026-01-15 11:00:00'),
('Meera Iyer',      '8100000002', 'meera@gmail.com',     'Coimbatore, TN',        '2026-01-18 11:00:00'),
('Suresh Pillai',   '8100000003', 'suresh@gmail.com',    'Trivandrum, Kerala',    '2026-01-20 11:00:00'),
('Anita Desai',     '8100000004', 'anita@gmail.com',     'Surat, Gujarat',        '2026-01-22 11:00:00'),
('Vikram Bose',     '8100000005', 'vikram@gmail.com',    'Howrah, WB',            '2026-01-25 11:00:00'),
('Pooja Reddy',     '8100000006', 'pooja@gmail.com',     'Vijayawada, AP',        '2026-01-28 11:00:00'),
('Manoj Tiwari',    '8100000007', 'manoj@gmail.com',     'Lucknow, UP',           '2026-02-01 11:00:00'),
('Kavitha Nair',    '8100000008', 'kavitha@gmail.com',   'Mangalore, Karnataka',  '2026-02-03 11:00:00'),
('Sanjay Mishra',   '8100000009', 'sanjay@gmail.com',    'Bhopal, MP',            '2026-02-05 11:00:00'),
('Lakshmi Rao',     '8100000010', 'lakshmi@gmail.com',   'Visakhapatnam, AP',     '2026-02-08 11:00:00'),
('Rajat Kapoor',    '8100000011', 'rajat@gmail.com',     'Gurgaon, HR',           '2026-02-12 11:00:00'),
('Sheetal Jain',    '8100000012', 'sheetal@gmail.com',   'Indore, MP',            '2026-02-15 11:00:00'),
('Harish Chandra',  '8100000013', 'harish@gmail.com',    'Dehradun, UK',          '2026-02-18 11:00:00'),
('Nidhi Saxena',    '8100000014', 'nidhi@gmail.com',     'Kanpur, UP',            '2026-02-22 11:00:00'),
('Bhavesh Patel',   '8100000015', 'bhavesh@gmail.com',   'Vadodara, GJ',          '2026-02-26 11:00:00'),
('Tanya Malhotra',  '8100000016', 'tanya@gmail.com',     'Amritsar, PB',          '2026-03-02 11:00:00'),
('Ramesh Iyengar',  '8100000017', 'ramesh@gmail.com',    'Mysore, KA',            '2026-03-06 11:00:00'),
('Smita Kulkarni',  '8100000018', 'smita@gmail.com',     'Nashik, MH',            '2026-03-10 11:00:00'),
('Aakash Verma',    '8100000019', 'aakash@gmail.com',    'Faridabad, HR',         '2026-03-14 11:00:00'),
('Ishita Sen',      '8100000020', 'ishita@gmail.com',    'Siliguri, WB',          '2026-03-18 11:00:00'),
('Gopal Krishnan',  '8100000021', 'gopal@gmail.com',     'Madurai, TN',           '2026-03-22 11:00:00'),
('Ritika Aggarwal', '8100000022', 'ritika@gmail.com',    'Meerut, UP',            '2026-03-26 11:00:00'),
('Yusuf Sheikh',    '8100000023', 'yusuf@gmail.com',     'Aurangabad, MH',        '2026-04-01 11:00:00'),
('Preeti Sinha',    '8100000024', 'preeti@gmail.com',    'Jamshedpur, JH',        '2026-04-08 11:00:00'),
('Devansh Mehra',   '8100000025', 'devansh@gmail.com',   'Udaipur, RJ',           '2026-04-15 11:00:00');

-- ============================================================
-- 7. PRODUCTS  (25)
-- ============================================================
INSERT INTO products (name, description, quantity, sku, supplier_id, supplier_to_admin_price, admin_to_user_price, is_active, category_id, created_at, updated_at) VALUES
-- Electronics (supplier 1)
('Samsung 65" LED TV',     '4K UHD Smart TV',              30, 'ELEC-TV-001', 1, 28000.00, 35000.00, TRUE, 1, '2026-01-10 12:00:00', '2026-01-10 12:00:00'), -- 1
('LG 1.5 Ton AC',          '5 Star Split AC',              20, 'ELEC-AC-001', 1, 32000.00, 40000.00, TRUE, 1, '2026-01-10 12:00:00', '2026-01-10 12:00:00'), -- 2
('Sony Bluetooth Speaker', 'Portable Waterproof',          50, 'ELEC-SP-001', 1,  2500.00,  3500.00, TRUE, 1, '2026-01-10 12:00:00', '2026-01-10 12:00:00'), -- 3
('HP Laptop 15s',          'i5, 8GB, 512GB SSD',           15, 'ELEC-LP-001', 1, 48000.00, 58000.00, TRUE, 1, '2026-01-11 12:00:00', '2026-01-11 12:00:00'), -- 4
('boAt Earbuds',           'ANC Wireless',                100, 'ELEC-EB-001', 1,  1200.00,  1800.00, TRUE, 1, '2026-01-11 12:00:00', '2026-01-11 12:00:00'), -- 5
('Canon DSLR',             'EOS 1500D, 24MP',              10, 'ELEC-CM-001', 1, 32000.00, 40000.00, TRUE, 1, '2026-01-11 12:00:00', '2026-01-11 12:00:00'), -- 6
('Lenovo Tab M10',         '10.1" 4GB RAM',                25, 'ELEC-TB-001', 1, 12000.00, 16000.00, TRUE, 1, '2026-01-12 12:00:00', '2026-01-12 12:00:00'), -- 7
-- Clothing (supplier 2)
('Men Formal Shirt',       'Cotton Full Sleeve',          200, 'CLTH-SH-001', 2,   350.00,   599.00, TRUE, 4, '2026-01-12 12:00:00', '2026-01-12 12:00:00'), -- 8
('Women Kurti',            'Rayon Printed',               150, 'CLTH-KU-001', 2,   280.00,   499.00, TRUE, 4, '2026-01-13 12:00:00', '2026-01-13 12:00:00'), -- 9
('Denim Jeans',            'Slim Fit Dark Blue',          120, 'CLTH-JN-001', 2,   600.00,   999.00, TRUE, 4, '2026-01-13 12:00:00', '2026-01-13 12:00:00'), -- 10
('Sports Track Pant',      'Polyester Quick Dry',         180, 'CLTH-TP-001', 2,   250.00,   449.00, TRUE, 4, '2026-01-13 12:00:00', '2026-01-13 12:00:00'), -- 11
('Kids T-Shirt',           'Round Neck',                  300, 'CLTH-KT-001', 2,   150.00,   249.00, TRUE, 4, '2026-01-14 12:00:00', '2026-01-14 12:00:00'), -- 12
('Winter Jacket',          'Padded Water Resistant',       60, 'CLTH-WJ-001', 2,   900.00,  1499.00, TRUE, 4, '2026-01-14 12:00:00', '2026-01-14 12:00:00'), -- 13
('Saree',                  'Silk Festive',                 40, 'CLTH-SR-001', 2,  1200.00,  1999.00, TRUE, 4, '2026-01-14 12:00:00', '2026-01-14 12:00:00'), -- 14
-- Furniture (supplier 3)
('Office Chair',           'Mesh Ergonomic',               40, 'FURN-CH-001', 3,  3500.00,  5499.00, TRUE, 2, '2026-01-15 12:00:00', '2026-01-15 12:00:00'), -- 15
('Wooden Dining Table',    '6 Seater Sheesham',            15, 'FURN-DT-001', 3, 18000.00, 24999.00, TRUE, 2, '2026-01-15 12:00:00', '2026-01-15 12:00:00'), -- 16
('Queen Size Bed',         'Hydraulic Storage',            10, 'FURN-BD-001', 3, 22000.00, 29999.00, TRUE, 2, '2026-01-16 12:00:00', '2026-01-16 12:00:00'), -- 17
('Bookshelf',              '5-Tier Engineered Wood',       30, 'FURN-BS-001', 3,  2200.00,  3499.00, TRUE, 2, '2026-01-16 12:00:00', '2026-01-16 12:00:00'), -- 18
-- Kitchen Appliances (supplier 4)
('Prestige Mixer Grinder', '750W 3 Jars',                  60, 'KITC-MX-001', 4,  2400.00,  3499.00, TRUE, 5, '2026-01-17 12:00:00', '2026-01-17 12:00:00'), -- 19
('Philips Air Fryer',      '4.1 L Digital',                30, 'KITC-AF-001', 4,  6500.00,  8999.00, TRUE, 5, '2026-01-17 12:00:00', '2026-01-17 12:00:00'), -- 20
('Bajaj Microwave Oven',   '20L Solo',                     25, 'KITC-MW-001', 4,  4800.00,  6499.00, TRUE, 5, '2026-01-18 12:00:00', '2026-01-18 12:00:00'), -- 21
('Induction Cooktop',      '2000W',                        50, 'KITC-IN-001', 4,  1800.00,  2499.00, TRUE, 5, '2026-01-18 12:00:00', '2026-01-18 12:00:00'), -- 22
('Electric Kettle 1.5L',   'Stainless Steel',              80, 'KITC-EK-001', 4,   650.00,   999.00, TRUE, 5, '2026-01-19 12:00:00', '2026-01-19 12:00:00'), -- 23
('Hand Blender',           '300W',                         70, 'KITC-HB-001', 4,   900.00,  1399.00, TRUE, 5, '2026-01-19 12:00:00', '2026-01-19 12:00:00'), -- 24
('Toaster 2-Slice',        'Pop-up',                       45, 'KITC-TS-001', 4,  1100.00,  1699.00, TRUE, 5, '2026-01-20 12:00:00', '2026-01-20 12:00:00'); -- 25

-- ============================================================
-- 8. INVENTORY  (one row per product, 25 rows)
-- ============================================================
INSERT INTO inventory (product_id, available_stock, reorder_level, last_updated) VALUES
(1,  50, 10, '2026-01-20 13:00:00'),
(2,  30,  5, '2026-01-20 13:00:00'),
(3, 100, 20, '2026-01-20 13:00:00'),
(4,  20,  5, '2026-01-20 13:00:00'),
(5, 200, 30, '2026-01-20 13:00:00'),
(6,  15,  3, '2026-01-20 13:00:00'),
(7,  40, 10, '2026-01-20 13:00:00'),
(8, 300, 50, '2026-01-21 13:00:00'),
(9, 250, 40, '2026-01-21 13:00:00'),
(10,200, 30, '2026-01-21 13:00:00'),
(11,350, 60, '2026-01-21 13:00:00'),
(12,500, 80, '2026-01-21 13:00:00'),
(13, 80, 15, '2026-01-21 13:00:00'),
(14, 60, 10, '2026-01-21 13:00:00'),
(15, 70, 15, '2026-01-22 13:00:00'),
(16, 25,  5, '2026-01-22 13:00:00'),
(17, 18,  4, '2026-01-22 13:00:00'),
(18, 55, 12, '2026-01-22 13:00:00'),
(19,120, 25, '2026-01-23 13:00:00'),
(20, 45, 10, '2026-01-23 13:00:00'),
(21, 40,  8, '2026-01-23 13:00:00'),
(22, 90, 20, '2026-01-23 13:00:00'),
(23,140, 25, '2026-01-23 13:00:00'),
(24,110, 20, '2026-01-23 13:00:00'),
(25, 70, 15, '2026-01-23 13:00:00');

-- ============================================================
-- 9. PURCHASES  (25)  spread Jan→May
-- ============================================================
INSERT INTO purchases (supplier_id, status, total_amount, confirmed_by, confirmed_at, created_at, updated_at) VALUES
(1, 'CONFIRMED', 476000.00, 1,    '2026-01-25 10:00:00', '2026-01-22 09:00:00', '2026-01-25 10:00:00'), -- 1
(2, 'CONFIRMED', 129000.00, 6,    '2026-01-28 10:00:00', '2026-01-25 09:00:00', '2026-01-28 10:00:00'), -- 2
(3, 'CONFIRMED', 244500.00, 8,    '2026-02-02 10:00:00', '2026-01-30 09:00:00', '2026-02-02 10:00:00'), -- 3
(4, 'CONFIRMED', 168000.00, 1,    '2026-02-05 10:00:00', '2026-02-02 09:00:00', '2026-02-05 10:00:00'), -- 4
(1, 'CONFIRMED',  64000.00, 1,    '2026-02-10 10:00:00', '2026-02-07 09:00:00', '2026-02-10 10:00:00'), -- 5
(2, 'CONFIRMED',  45000.00, 6,    '2026-02-14 10:00:00', '2026-02-12 09:00:00', '2026-02-14 10:00:00'), -- 6
(3, 'CONFIRMED',  85500.00, 8,    '2026-02-18 10:00:00', '2026-02-15 09:00:00', '2026-02-18 10:00:00'), -- 7
(4, 'CONFIRMED',  72000.00, 1,    '2026-02-22 10:00:00', '2026-02-19 09:00:00', '2026-02-22 10:00:00'), -- 8
(1, 'CONFIRMED', 140000.00, 1,    '2026-02-28 10:00:00', '2026-02-25 09:00:00', '2026-02-28 10:00:00'), -- 9
(2, 'CONFIRMED',  64000.00, 6,    '2026-03-04 10:00:00', '2026-03-01 09:00:00', '2026-03-04 10:00:00'), -- 10
(3, 'CONFIRMED', 120000.00, 8,    '2026-03-09 10:00:00', '2026-03-06 09:00:00', '2026-03-09 10:00:00'), -- 11
(4, 'CONFIRMED',  39000.00, 1,    '2026-03-13 10:00:00', '2026-03-10 09:00:00', '2026-03-13 10:00:00'), -- 12
(1, 'CONFIRMED',  96000.00, 1,    '2026-03-18 10:00:00', '2026-03-15 09:00:00', '2026-03-18 10:00:00'), -- 13
(2, 'CONFIRMED',  35000.00, 6,    '2026-03-22 10:00:00', '2026-03-19 09:00:00', '2026-03-22 10:00:00'), -- 14
(3, 'CONFIRMED',  44000.00, 8,    '2026-03-27 10:00:00', '2026-03-24 09:00:00', '2026-03-27 10:00:00'), -- 15
(4, 'CONFIRMED',  54000.00, 1,    '2026-04-01 10:00:00', '2026-03-29 09:00:00', '2026-04-01 10:00:00'), -- 16
(1, 'CONFIRMED', 100000.00, 1,    '2026-04-06 10:00:00', '2026-04-03 09:00:00', '2026-04-06 10:00:00'), -- 17
(2, 'CONFIRMED',  21000.00, 6,    '2026-04-11 10:00:00', '2026-04-08 09:00:00', '2026-04-11 10:00:00'), -- 18
(3, 'CONFIRMED',  88000.00, 8,    '2026-04-16 10:00:00', '2026-04-13 09:00:00', '2026-04-16 10:00:00'), -- 19
(4, 'CONFIRMED',  26000.00, 1,    '2026-04-21 10:00:00', '2026-04-18 09:00:00', '2026-04-21 10:00:00'), -- 20
(1, 'DELIVERED', 80000.00,  NULL, NULL,                  '2026-04-25 09:00:00', '2026-04-28 10:00:00'), -- 21
(2, 'DELIVERED', 18000.00,  NULL, NULL,                  '2026-04-28 09:00:00', '2026-05-01 10:00:00'), -- 22
(3, 'DELIVERED', 35000.00,  NULL, NULL,                  '2026-05-01 09:00:00', '2026-05-04 10:00:00'), -- 23
(4, 'PENDING',       0.00,  NULL, NULL,                  '2026-05-05 09:00:00', '2026-05-05 09:00:00'), -- 24
(1, 'PENDING',       0.00,  NULL, NULL,                  '2026-05-08 09:00:00', '2026-05-08 09:00:00'); -- 25

-- ============================================================
-- 10. PURCHASE ITEMS
-- ============================================================
INSERT INTO purchase_items (purchase_id, product_id, quantity, unit_price, sub_total) VALUES
-- Purchase 1 (electronics)
(1, 1, 5,  28000.00, 140000.00),
(1, 2, 3,  32000.00,  96000.00),
(1, 3, 20,  2500.00,  50000.00),
(1, 4, 2,  48000.00,  96000.00),
(1, 5, 40,  1200.00,  48000.00),
(1, 7, 2,  12000.00,  24000.00),
(1, 6, 1,  32000.00,  22000.00),
-- Purchase 2 (clothing)
(2, 8,  50,  350.00,  17500.00),
(2, 9,  50,  280.00,  14000.00),
(2, 10, 30,  600.00,  18000.00),
(2, 11, 60,  250.00,  15000.00),
(2, 12,100,  150.00,  15000.00),
(2, 13, 20,  900.00,  18000.00),
(2, 14, 15, 1200.00,  18000.00),
(2, 8,  40,  350.00,  13500.00),
-- Purchase 3 (furniture)
(3, 15, 20, 3500.00,  70000.00),
(3, 16,  5,18000.00,  90000.00),
(3, 17,  3,22000.00,  66000.00),
(3, 18,  8, 2200.00,  18500.00),
-- Purchase 4 (kitchen)
(4, 19, 25, 2400.00,  60000.00),
(4, 20, 10, 6500.00,  65000.00),
(4, 21,  8, 4800.00,  38400.00),
(4, 23, 10,  650.00,   4600.00),
-- Purchase 5
(5, 4, 1,  48000.00,  48000.00),
(5, 6, 1,  32000.00,  16000.00),
-- Purchase 6
(6, 8, 50, 350.00, 17500.00),
(6, 12,100,150.00, 15000.00),
(6, 11, 50,250.00, 12500.00),
-- Purchase 7
(7, 15, 10,3500.00, 35000.00),
(7, 18, 10,2200.00, 22000.00),
(7, 16,  1,18000.00,28500.00),
-- Purchase 8
(8, 24, 30, 900.00, 27000.00),
(8, 25, 20,1100.00, 22000.00),
(8, 22, 10,1800.00, 23000.00),
-- Purchase 9
(9, 1, 5,  28000.00, 140000.00),
-- Purchase 10
(10, 9, 80, 280.00, 22400.00),
(10, 13,40, 900.00, 36000.00),
(10, 14, 5,1200.00,  5600.00),
-- Purchase 11
(11, 16, 4,18000.00, 72000.00),
(11, 18,20, 2200.00, 48000.00),
-- Purchase 12
(12, 23,30,  650.00, 19500.00),
(12, 24,15,  900.00, 13500.00),
(12, 25, 4, 1100.00,  6000.00),
-- Purchase 13
(13, 2, 3, 32000.00, 96000.00),
-- Purchase 14
(14, 10,30,  600.00, 18000.00),
(14, 11,40,  250.00, 10000.00),
(14, 12,40,  150.00,  7000.00),
-- Purchase 15
(15, 15, 5, 3500.00, 17500.00),
(15, 18,12, 2200.00, 26500.00),
-- Purchase 16
(16, 19,10, 2400.00, 24000.00),
(16, 20, 3, 6500.00, 19500.00),
(16, 23,15,  650.00, 10500.00),
-- Purchase 17
(17, 5, 50, 1200.00, 60000.00),
(17, 7,  3,12000.00, 40000.00),
-- Purchase 18
(18, 8, 30,  350.00, 10500.00),
(18, 9, 25,  280.00,  7000.00),
(18, 12,20,  150.00,  3500.00),
-- Purchase 19
(19, 17, 4,22000.00, 88000.00),
-- Purchase 20
(20, 22, 8, 1800.00, 14400.00),
(20, 24,10,  900.00,  9000.00),
(20, 25, 2, 1100.00,  2600.00),
-- Purchase 21 DELIVERED
(21, 4, 1, 48000.00, 48000.00),
(21, 5, 20,1200.00, 24000.00),
(21, 3,  4,2500.00,  8000.00),
-- Purchase 22 DELIVERED
(22, 8, 30,  350.00, 10500.00),
(22, 11,30,  250.00,  7500.00),
-- Purchase 23 DELIVERED
(23, 15, 5, 3500.00, 17500.00),
(23, 18, 8, 2200.00, 17500.00);
-- ============================================================
-- 11. SALES  (30)  spread Jan → May 2026
-- ============================================================

INSERT INTO sales
(sold_by, customer_id, total_amount, payment_mode, sale_date)
VALUES

(10,  1, 38500.00, 'UPI',    '2026-01-26 10:30:00'),
(11,  2,  1994.00, 'CASH',   '2026-01-29 11:00:00'),
(10,  3,  2997.00, 'CARD',   '2026-02-02 12:00:00'),
( 7,  4, 58000.00, 'CARD',   '2026-02-05 14:00:00'),
(11,  5,  2997.00, 'UPI',    '2026-02-08 13:00:00'),

( 1,  6, 16000.00, 'CARD',   '2026-02-11 10:00:00'),
(10,  7,  1245.00, 'CASH',   '2026-02-14 11:00:00'),
(11,  8, 37995.00, 'UPI',    '2026-02-17 15:00:00'),
(10,  9,  2997.00, 'CARD',   '2026-02-20 12:00:00'),
(12, 10,  1147.00, 'CASH',   '2026-02-23 11:00:00'),

(13, 11,  5499.00, 'UPI',    '2026-02-26 14:00:00'),
(15, 12, 24999.00, 'CREDIT', '2026-03-01 11:00:00'),
(11, 13,  3499.00, 'CARD',   '2026-03-04 12:00:00'),
(10, 14,  8999.00, 'UPI',    '2026-03-07 13:00:00'),
(17, 15,  6498.00, 'CASH',   '2026-03-10 14:00:00'),

(11, 16,  2998.00, 'CARD',   '2026-03-13 11:00:00'),
(10, 17, 35000.00, 'UPI',    '2026-03-17 10:00:00'),
(15, 18,  1998.00, 'CASH',   '2026-03-20 12:00:00'),
(21, 19,  9498.00, 'CREDIT', '2026-03-23 14:00:00'),
(11, 20, 29999.00, 'UPI',    '2026-03-27 13:00:00'),

(10, 21,  4497.00, 'CARD',   '2026-03-31 11:00:00'),
(25, 22,  3996.00, 'UPI',    '2026-04-04 12:00:00'),
(11, 23, 40000.00, 'CREDIT', '2026-04-08 14:00:00'),
(10, 24,  1799.00, 'CASH',   '2026-04-12 10:00:00'),
(15, 25,  4998.00, 'CARD',   '2026-04-16 13:00:00'),

( 7,  1,  6997.00, 'UPI',    '2026-04-20 11:00:00'),
(11,  2,  3499.00, 'CARD',   '2026-04-25 12:00:00'),
(10,  3,  1999.00, 'CASH',   '2026-04-29 14:00:00'),
(13,  5,  5499.00, 'UPI',    '2026-05-03 13:00:00'),
(11,  7,  1499.00, 'CASH',   '2026-05-07 11:00:00');
-- ============================================================
-- 12. SALE ITEMS  (totals match sales)
-- ============================================================
INSERT INTO sale_items (sale_id, product_id, quantity, price, subtotal) VALUES
-- 1: 35000 + 3500 = 38500
(1, 1, 1, 35000.00, 35000.00),
(1, 3, 1,  3500.00,  3500.00),
-- 2: 998 + 996 = 1994
(2, 9,  2, 499.00,  998.00),
(2, 12, 4, 249.00,  996.00),
-- 3
(3, 10, 3, 999.00, 2997.00),
-- 4
(4, 4, 1, 58000.00, 58000.00),
-- 5
(5, 10, 3, 999.00, 2997.00),
-- 6
(6, 7, 1, 16000.00, 16000.00),
-- 7
(7, 12, 5, 249.00, 1245.00),
-- 8: 35000 + 2995 = 37995
(8, 1, 1, 35000.00, 35000.00),
(8, 8, 5,   599.00,  2995.00),
-- 9
(9, 10, 3, 999.00, 2997.00),
-- 10: 898 + 249 = 1147
(10, 11, 2, 449.00, 898.00),
(10, 12, 1, 249.00, 249.00),
-- 11: chair 5499
(11, 15, 1, 5499.00, 5499.00),
-- 12: dining table
(12, 16, 1, 24999.00, 24999.00),
-- 13: mixer
(13, 19, 1, 3499.00, 3499.00),
-- 14: air fryer
(14, 20, 1, 8999.00, 8999.00),
-- 15: microwave + kettle = 6499 - oops 6498  -> 4999+1499? Use saree 1999*1 + jacket 1499*3=4497 -> won't match. Just do 2 kettles + AC? Use induction 2499*2 + kettle 999*1.5 -> integer. Use 3 kettles*999=2997 + 1 induction 2499 + 1 hand blender 1399? = 6895. 
-- Use microwave 6499 - too high for 6498. Use induction*2 (4998) + kettle 999 + handblender 501? No. Simplest: bookshelf*1 (3499) + mixer (3499) - 500 discount? Stick with: bookshelf 3499 + induction 2499 + kettle (no). 3499+2499 = 5998; add hand blender 1399 = 7397. 
-- Adjust to: induction 2499 *2 + electric kettle 999 *1 + toaster 1001 -> messy.
-- Use 2 mixer grinders (3499*2 = 6998). Close to 6498... let me set 6998. We'll fix sale 15 total later via UPDATE below.
(15, 19, 2, 3499.00, 6998.00),
-- 16: 2998 = 2 kettles*999 + 1000? Use 3 kettles*999=2997. 2 kettles 999 + handblender 1000? Use 2*kettle (1998) + 1*toaster (1000)? Use 2 kettles (1998) + 1 saree 1000 -> No. Use track pant 449*2 + jeans 999*2 = 898+1998 = 2896. Use kurti 499*6 = 2994. 
-- Use hand blender 1399 + electric kettle 999 + saree price 1999 = none match. 
-- Use 3 kurtis (1497) + 3 jeans (2997)? Too high. Use 6 kurtis = 2994. Closer. We'll set 2994 and update sale.
(16, 9, 6, 499.00, 2994.00),
-- 17: TV 35000
(17, 1, 1, 35000.00, 35000.00),
-- 18: 1998 = kurti*4 = 1996 or saree 1999. Use saree 1999.
(18, 14, 1, 1999.00, 1999.00),
-- 19: 9498 = air fryer 8999 + electric kettle 999? = 9998. Use mixer*2 (6998) + kettle (999) + toaster (1699) = 9696. Use 2 mixers 6998 + 1 hand blender 1399 + 1 toaster (1699-598)? Use induction*2 4998 + air fryer? too much. Use 2 mixers 6998 + 2 kettles 1998 = 8996. Use 2 mixers + 1 kettle + 1 hand blender = 6998+999+1399=9396. Set 9396.
(19, 19, 2, 3499.00, 6998.00),
(19, 23, 1,  999.00,  999.00),
(19, 24, 1, 1399.00, 1399.00),
-- 20: bed 29999
(20, 17, 1, 29999.00, 29999.00),
-- 21: 4497 = jeans*3 +kurti*3 = 2997+1497 = 4494. Use jeans 999*3 + kurti 499*3 = 4494. Set 4494.
(21, 10, 3, 999.00, 2997.00),
(21,  9, 3, 499.00, 1497.00),
-- 22: 3996 = kids tshirt 249*16 = 3984. Use kurti*8 = 3992. Use 4 jeans = 3996.
(22, 10, 4, 999.00, 3996.00),
-- 23: AC 40000? Yes admin price 40000.
(23, 2, 1, 40000.00, 40000.00),
-- 24: 1799 = boat earbuds 1800? Set 1800. 
(24, 5, 1, 1800.00, 1800.00),
-- 25: 4998 = induction 2499*2 = 4998 ✓
(25, 22, 2, 2499.00, 4998.00),
-- 26: 6997 = jeans*7 = 6993. Use kurti*14 = 6986. Use jacket*4 + kurti*2 = 5996+998 = 6994. Use 7 jeans 6993. Set 6993.
(26, 10, 7, 999.00, 6993.00),
-- 27: 3499 = mixer 3499 or bookshelf 3499 ✓
(27, 18, 1, 3499.00, 3499.00),
-- 28: 1999 = saree 1999 ✓
(28, 14, 1, 1999.00, 1999.00),
-- 29: 5499 = office chair 5499 ✓
(29, 15, 1, 5499.00, 5499.00),
-- 30: 1499 = winter jacket 1499 ✓
(30, 13, 1, 1499.00, 1499.00);

-- Sync sales totals with actual sale_items sums
SET SQL_SAFE_UPDATES = 0;

UPDATE sales s
SET s.total_amount = (
    SELECT COALESCE(SUM(si.subtotal), 0)
    FROM sale_items si
    WHERE si.sale_id = s.id
)
WHERE s.id IS NOT NULL;

SET SQL_SAFE_UPDATES = 1;
-- ============================================================
-- 13. INVENTORY TRANSACTIONS  (30+ rows: PURCHASE_IN / SALE_OUT / ADJUSTMENT)
--    Replace TransactionType enum values if your project uses different names.
-- ============================================================
INSERT INTO inventory_transactions (product_id, transaction_type, quantity, created_at) VALUES
-- Stock-in from confirmed purchases
( 1, 'STOCK_IN',   5, '2026-01-25 10:30:00'),
( 2, 'STOCK_IN',   3, '2026-01-25 10:30:00'),
( 3, 'STOCK_IN',  20, '2026-01-25 10:30:00'),
( 4, 'STOCK_IN',   2, '2026-01-25 10:30:00'),
( 5, 'STOCK_IN',  40, '2026-01-25 10:30:00'),
( 8, 'STOCK_IN',  50, '2026-01-28 10:30:00'),
( 9, 'STOCK_IN',  50, '2026-01-28 10:30:00'),
(10, 'STOCK_IN',  30, '2026-01-28 10:30:00'),
(15, 'STOCK_IN',  20, '2026-02-02 10:30:00'),
(16, 'STOCK_IN',   5, '2026-02-02 10:30:00'),
(19, 'STOCK_IN',  25, '2026-02-05 10:30:00'),
(20, 'STOCK_IN',  10, '2026-02-05 10:30:00'),
(17, 'STOCK_IN',   4, '2026-04-16 10:30:00'),
(22, 'STOCK_IN',   8, '2026-04-21 10:30:00'),
-- Stock-out from sales
( 1, 'STOCK_OUT',      1, '2026-01-26 10:35:00'),
( 3, 'STOCK_OUT',      1, '2026-01-26 10:35:00'),
( 9, 'STOCK_OUT',      2, '2026-01-29 11:05:00'),
(12, 'STOCK_OUT',      4, '2026-01-29 11:05:00'),
(10, 'STOCK_OUT',      3, '2026-02-02 12:05:00'),
( 4, 'STOCK_OUT',      1, '2026-02-05 14:05:00'),
(10, 'STOCK_OUT',      3, '2026-02-08 13:05:00'),
( 7, 'STOCK_OUT',      1, '2026-02-11 10:05:00'),
( 1, 'STOCK_OUT',      1, '2026-02-17 15:05:00'),
( 8, 'STOCK_OUT',      5, '2026-02-17 15:05:00'),
(15, 'STOCK_OUT',      1, '2026-02-26 14:05:00'),
(16, 'STOCK_OUT',      1, '2026-03-01 11:05:00'),
(19, 'STOCK_OUT',      1, '2026-03-04 12:05:00'),
(20, 'STOCK_OUT',      1, '2026-03-07 13:05:00'),
(17, 'STOCK_OUT',      1, '2026-03-27 13:05:00'),
( 5, 'STOCK_OUT',      1, '2026-04-12 10:05:00'),
( 2, 'STOCK_OUT',      1, '2026-04-08 14:05:00'),
(13, 'STOCK_OUT',      1, '2026-05-07 11:05:00'),
-- Manual adjustments (damage/audit)
( 5, 'STOCK_IN',   -2, '2026-03-15 18:00:00'),
(12, 'STOCK_IN',   -3, '2026-04-01 18:00:00'),
(23, 'STOCK_IN',    5, '2026-04-20 18:00:00'),
(11, 'STOCK_IN',   -1, '2026-05-02 18:00:00');

-- ============================================================
-- DONE
-- ============================================================

-- ============================================================
-- 12. SALE ITEMS  (totals match sales)
-- ============================================================
INSERT INTO sale_items (sale_id, product_id, quantity, price, subtotal) VALUES
-- 1: 35000 + 3500 = 38500
(1, 1, 1, 35000.00, 35000.00),
(1, 3, 1,  3500.00,  3500.00),
-- 2: 998 + 996 = 1994
(2, 9,  2, 499.00,  998.00),
(2, 12, 4, 249.00,  996.00),
-- 3
(3, 10, 3, 999.00, 2997.00),
-- 4
(4, 4, 1, 58000.00, 58000.00),
-- 5
(5, 10, 3, 999.00, 2997.00),
-- 6
(6, 7, 1, 16000.00, 16000.00),
-- 7
(7, 12, 5, 249.00, 1245.00),
-- 8: 35000 + 2995 = 37995
(8, 1, 1, 35000.00, 35000.00),
(8, 8, 5,   599.00,  2995.00),
-- 9
(9, 10, 3, 999.00, 2997.00),
-- 10: 898 + 249 = 1147
(10, 11, 2, 449.00, 898.00),
(10, 12, 1, 249.00, 249.00),
-- 11: chair 5499
(11, 15, 1, 5499.00, 5499.00),
-- 12: dining table
(12, 16, 1, 24999.00, 24999.00),
-- 13: mixer
(13, 19, 1, 3499.00, 3499.00),
-- 14: air fryer
(14, 20, 1, 8999.00, 8999.00),
-- 15: microwave + kettle = 6499 - oops 6498  -> 4999+1499? Use saree 1999*1 + jacket 1499*3=4497 -> won't match. Just do 2 kettles + AC? Use induction 2499*2 + kettle 999*1.5 -> integer. Use 3 kettles*999=2997 + 1 induction 2499 + 1 hand blender 1399? = 6895. 
-- Use microwave 6499 - too high for 6498. Use induction*2 (4998) + kettle 999 + handblender 501? No. Simplest: bookshelf*1 (3499) + mixer (3499) - 500 discount? Stick with: bookshelf 3499 + induction 2499 + kettle (no). 3499+2499 = 5998; add hand blender 1399 = 7397. 
-- Adjust to: induction 2499 *2 + electric kettle 999 *1 + toaster 1001 -> messy.
-- Use 2 mixer grinders (3499*2 = 6998). Close to 6498... let me set 6998. We'll fix sale 15 total later via UPDATE below.
(15, 19, 2, 3499.00, 6998.00),
-- 16: 2998 = 2 kettles*999 + 1000? Use 3 kettles*999=2997. 2 kettles 999 + handblender 1000? Use 2*kettle (1998) + 1*toaster (1000)? Use 2 kettles (1998) + 1 saree 1000 -> No. Use track pant 449*2 + jeans 999*2 = 898+1998 = 2896. Use kurti 499*6 = 2994. 
-- Use hand blender 1399 + electric kettle 999 + saree price 1999 = none match. 
-- Use 3 kurtis (1497) + 3 jeans (2997)? Too high. Use 6 kurtis = 2994. Closer. We'll set 2994 and update sale.
(16, 9, 6, 499.00, 2994.00),
-- 17: TV 35000
(17, 1, 1, 35000.00, 35000.00),
-- 18: 1998 = kurti*4 = 1996 or saree 1999. Use saree 1999.
(18, 14, 1, 1999.00, 1999.00),
-- 19: 9498 = air fryer 8999 + electric kettle 999? = 9998. Use mixer*2 (6998) + kettle (999) + toaster (1699) = 9696. Use 2 mixers 6998 + 1 hand blender 1399 + 1 toaster (1699-598)? Use induction*2 4998 + air fryer? too much. Use 2 mixers 6998 + 2 kettles 1998 = 8996. Use 2 mixers + 1 kettle + 1 hand blender = 6998+999+1399=9396. Set 9396.
(19, 19, 2, 3499.00, 6998.00),
(19, 23, 1,  999.00,  999.00),
(19, 24, 1, 1399.00, 1399.00),
-- 20: bed 29999
(20, 17, 1, 29999.00, 29999.00),
-- 21: 4497 = jeans*3 +kurti*3 = 2997+1497 = 4494. Use jeans 999*3 + kurti 499*3 = 4494. Set 4494.
(21, 10, 3, 999.00, 2997.00),
(21,  9, 3, 499.00, 1497.00),
-- 22: 3996 = kids tshirt 249*16 = 3984. Use kurti*8 = 3992. Use 4 jeans = 3996.
(22, 10, 4, 999.00, 3996.00),
-- 23: AC 40000? Yes admin price 40000.
(23, 2, 1, 40000.00, 40000.00),
-- 24: 1799 = boat earbuds 1800? Set 1800. 
(24, 5, 1, 1800.00, 1800.00),
-- 25: 4998 = induction 2499*2 = 4998 ✓
(25, 22, 2, 2499.00, 4998.00),
-- 26: 6997 = jeans*7 = 6993. Use kurti*14 = 6986. Use jacket*4 + kurti*2 = 5996+998 = 6994. Use 7 jeans 6993. Set 6993.
(26, 10, 7, 999.00, 6993.00),
-- 27: 3499 = mixer 3499 or bookshelf 3499 ✓
(27, 18, 1, 3499.00, 3499.00),
-- 28: 1999 = saree 1999 ✓
(28, 14, 1, 1999.00, 1999.00),
-- 29: 5499 = office chair 5499 ✓
(29, 15, 1, 5499.00, 5499.00),
-- 30: 1499 = winter jacket 1499 ✓
(30, 13, 1, 1499.00, 1499.00);

-- Sync sales totals with actual sale_items sums
SET SQL_SAFE_UPDATES = 0;

UPDATE sales s
SET s.total_amount = (
    SELECT COALESCE(SUM(si.subtotal), 0)
    FROM sale_items si
    WHERE si.sale_id = s.id
)
WHERE s.id IS NOT NULL;

SET SQL_SAFE_UPDATES = 1;
-- ============================================================
-- 13. INVENTORY TRANSACTIONS  (30+ rows: PURCHASE_IN / SALE_OUT / ADJUSTMENT)
--    Replace TransactionType enum values if your project uses different names.
-- ============================================================
INSERT INTO inventory_transactions (product_id, transaction_type, quantity, created_at) VALUES
-- Stock-in from confirmed purchases
( 1, 'STOCK_IN',   5, '2026-01-25 10:30:00'),
( 2, 'STOCK_IN',   3, '2026-01-25 10:30:00'),
( 3, 'STOCK_IN',  20, '2026-01-25 10:30:00'),
( 4, 'STOCK_IN',   2, '2026-01-25 10:30:00'),
( 5, 'STOCK_IN',  40, '2026-01-25 10:30:00'),
( 8, 'STOCK_IN',  50, '2026-01-28 10:30:00'),
( 9, 'STOCK_IN',  50, '2026-01-28 10:30:00'),
(10, 'STOCK_IN',  30, '2026-01-28 10:30:00'),
(15, 'STOCK_IN',  20, '2026-02-02 10:30:00'),
(16, 'STOCK_IN',   5, '2026-02-02 10:30:00'),
(19, 'STOCK_IN',  25, '2026-02-05 10:30:00'),
(20, 'STOCK_IN',  10, '2026-02-05 10:30:00'),
(17, 'STOCK_IN',   4, '2026-04-16 10:30:00'),
(22, 'STOCK_IN',   8, '2026-04-21 10:30:00'),
-- Stock-out from sales
( 1, 'STOCK_OUT',      1, '2026-01-26 10:35:00'),
( 3, 'STOCK_OUT',      1, '2026-01-26 10:35:00'),
( 9, 'STOCK_OUT',      2, '2026-01-29 11:05:00'),
(12, 'STOCK_OUT',      4, '2026-01-29 11:05:00'),
(10, 'STOCK_OUT',      3, '2026-02-02 12:05:00'),
( 4, 'STOCK_OUT',      1, '2026-02-05 14:05:00'),
(10, 'STOCK_OUT',      3, '2026-02-08 13:05:00'),
( 7, 'STOCK_OUT',      1, '2026-02-11 10:05:00'),
( 1, 'STOCK_OUT',      1, '2026-02-17 15:05:00'),
( 8, 'STOCK_OUT',      5, '2026-02-17 15:05:00'),
(15, 'STOCK_OUT',      1, '2026-02-26 14:05:00'),
(16, 'STOCK_OUT',      1, '2026-03-01 11:05:00'),
(19, 'STOCK_OUT',      1, '2026-03-04 12:05:00'),
(20, 'STOCK_OUT',      1, '2026-03-07 13:05:00'),
(17, 'STOCK_OUT',      1, '2026-03-27 13:05:00'),
( 5, 'STOCK_OUT',      1, '2026-04-12 10:05:00'),
( 2, 'STOCK_OUT',      1, '2026-04-08 14:05:00'),
(13, 'STOCK_OUT',      1, '2026-05-07 11:05:00'),
-- Manual adjustments (damage/audit)
( 5, 'STOCK_IN',   -2, '2026-03-15 18:00:00'),
(12, 'STOCK_IN',   -3, '2026-04-01 18:00:00'),
(23, 'STOCK_IN',    5, '2026-04-20 18:00:00'),
(11, 'STOCK_IN',   -1, '2026-05-02 18:00:00');

-- ============================================================
-- DONE
-- ============================================================
