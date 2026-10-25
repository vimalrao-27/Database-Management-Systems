CREATE DATABASE IF NOT EXISTS online_food_delivery;
USE online_food_delivery;

CREATE TABLE Customer (
  Customer_ID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Email VARCHAR(150) NOT NULL,
  Phone VARCHAR(15) NOT NULL,
  Password_Hash VARCHAR(255) NOT NULL,
  PRIMARY KEY (Customer_ID),
  CONSTRAINT uq_customer_email UNIQUE (Email),
  CONSTRAINT uq_customer_phone UNIQUE (Phone)
) ENGINE=InnoDB;

CREATE TABLE Address (
  Address_ID INT NOT NULL AUTO_INCREMENT,
  Customer_ID INT NOT NULL,
  House_No VARCHAR(30),
  Street VARCHAR(150) NOT NULL,
  City VARCHAR(100) NOT NULL,
  Pincode VARCHAR(10) NOT NULL,
  PRIMARY KEY (Address_ID),
  UNIQUE KEY uq_address_owner (Address_ID, Customer_ID),
  CONSTRAINT fk_address_customer FOREIGN KEY (Customer_ID)
    REFERENCES Customer(Customer_ID) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE Restaurant (
  Restaurant_ID INT NOT NULL AUTO_INCREMENT,
  Restaurant_Name VARCHAR(150) NOT NULL,
  Phone VARCHAR(15),
  Address VARCHAR(255) NOT NULL,
  Rating DECIMAL(2,1) NOT NULL DEFAULT 0.0,
  PRIMARY KEY (Restaurant_ID),
  CONSTRAINT uq_restaurant_phone UNIQUE (Phone),
  CONSTRAINT ck_restaurant_rating CHECK (Rating BETWEEN 0.0 AND 5.0)
) ENGINE=InnoDB;

CREATE TABLE Menu_Item (
  Item_ID INT NOT NULL AUTO_INCREMENT,
  Restaurant_ID INT NOT NULL,
  Item_Name VARCHAR(150) NOT NULL,
  Description VARCHAR(500),
  Price DECIMAL(10,2) NOT NULL,
  Availability BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (Item_ID),
  CONSTRAINT ck_menu_price_nonnegative CHECK (Price >= 0.00),
  CONSTRAINT ck_menu_availability CHECK (Availability IN (0,1)),
  CONSTRAINT fk_menu_restaurant FOREIGN KEY (Restaurant_ID)
    REFERENCES Restaurant(Restaurant_ID) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE Delivery_Partner (
  Delivery_ID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Phone VARCHAR(15) NOT NULL,
  Vehicle_Number VARCHAR(20) NOT NULL,
  Status VARCHAR(30) NOT NULL DEFAULT 'Available',
  PRIMARY KEY (Delivery_ID),
  CONSTRAINT uq_delivery_phone UNIQUE (Phone),
  CONSTRAINT uq_delivery_vehicle UNIQUE (Vehicle_Number),
  CONSTRAINT ck_delivery_status CHECK (Status IN ('Available','Busy','Offline'))
) ENGINE=InnoDB;

CREATE TABLE Orders (
  Order_ID INT NOT NULL AUTO_INCREMENT,
  Customer_ID INT NOT NULL,
  Restaurant_ID INT NOT NULL,
  Address_ID INT NOT NULL,
  Delivery_ID INT NULL,
  Order_Date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Order_Status VARCHAR(30) NOT NULL DEFAULT 'Placed',
  PRIMARY KEY (Order_ID),
  KEY idx_orders_date (Order_Date),
  KEY idx_orders_status (Order_Status),
  CONSTRAINT ck_order_status CHECK (Order_Status IN ('Placed','Confirmed','Preparing','Out for Delivery','Delivered','Cancelled')),
  CONSTRAINT fk_orders_customer FOREIGN KEY (Customer_ID)
    REFERENCES Customer(Customer_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_orders_restaurant FOREIGN KEY (Restaurant_ID)
    REFERENCES Restaurant(Restaurant_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_orders_address_owner FOREIGN KEY (Address_ID, Customer_ID)
    REFERENCES Address(Address_ID, Customer_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_orders_delivery FOREIGN KEY (Delivery_ID)
    REFERENCES Delivery_Partner(Delivery_ID) ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE Order_Item (
  Order_ID INT NOT NULL,
  Item_ID INT NOT NULL,
  Quantity INT NOT NULL DEFAULT 1,
  Unit_Price DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (Order_ID, Item_ID),
  CONSTRAINT ck_order_item_quantity CHECK (Quantity > 0),
  CONSTRAINT ck_order_item_unit_price CHECK (Unit_Price >= 0.00),
  CONSTRAINT fk_order_item_order FOREIGN KEY (Order_ID)
    REFERENCES Orders(Order_ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_order_item_menu FOREIGN KEY (Item_ID)
    REFERENCES Menu_Item(Item_ID) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE Payment (
  Payment_ID INT NOT NULL AUTO_INCREMENT,
  Order_ID INT NOT NULL,
  Payment_Method VARCHAR(30) NOT NULL,
  Payment_Status VARCHAR(30) NOT NULL DEFAULT 'Pending',
  Payment_Date DATETIME NULL,
  PRIMARY KEY (Payment_ID),
  CONSTRAINT uq_payment_order UNIQUE (Order_ID),
  CONSTRAINT ck_payment_method CHECK (Payment_Method IN ('Cash','UPI','Card','Wallet','Net Banking')),
  CONSTRAINT ck_payment_status CHECK (Payment_Status IN ('Pending','Paid','Failed','Refunded')),
  CONSTRAINT ck_payment_date_for_completed CHECK (Payment_Status NOT IN ('Paid','Refunded') OR Payment_Date IS NOT NULL),
  CONSTRAINT fk_payment_order FOREIGN KEY (Order_ID)
    REFERENCES Orders(Order_ID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO Customer (Customer_ID, Name, Email, Phone, Password_Hash) VALUES
(1, 'Asha Menon', 'asha@example.com', '9000000001', 'demo_hash_customer_01'),
(2, 'Rahul Nair', 'rahul@example.com', '9000000002', 'demo_hash_customer_02'),
(3, 'Priya Sharma', 'priya@example.com', '9000000003', 'demo_hash_customer_03'),
(4, 'Arjun Reddy', 'arjun@example.com', '9000000004', 'demo_hash_customer_04'),
(5, 'Meera Iyer', 'meera@example.com', '9000000005', 'demo_hash_customer_05'),
(6, 'Kabir Das', 'kabir@example.com', '9000000006', 'demo_hash_customer_06'),
(7, 'Nisha Rao', 'nisha@example.com', '9000000007', 'demo_hash_customer_07');

INSERT INTO Address (Address_ID, Customer_ID, House_No, Street, City, Pincode) VALUES
(1, 1, '12A', 'Lake View Road', 'Bengaluru', '560001'),
(2, 1, 'B-204', 'Green Park Apartments', 'Bengaluru', '560034'),
(3, 2, '44', 'Temple Street', 'Hosur', '635109'),
(4, 3, '7C', 'Garden Main Road', 'Bengaluru', '560076'),
(5, 4, '18', 'Market Road', 'Hosur', '635110'),
(6, 5, '21/3', 'River View Street', 'Chennai', '600028'),
(7, 6, '5A', 'College Road', 'Hosur', '635126'),
(8, 7, '302', 'Sunrise Residency', 'Bengaluru', '560068');

INSERT INTO Restaurant (Restaurant_ID, Restaurant_Name, Phone, Address, Rating) VALUES
(1, 'Spice Route Kitchen', '9100000101', 'Indiranagar, Bengaluru', 4.50),
(2, 'Green Bowl Cafe', '9100000102', 'Anna Nagar, Hosur', 4.20),
(3, 'Urban Pizza Co.', '9100000103', 'Koramangala, Bengaluru', 4.40),
(4, 'Dosa Junction', '9100000104', 'Railway Station Road, Hosur', 4.10),
(5, 'Wok Express', '9100000105', 'Adyar, Chennai', 4.00);

INSERT INTO Menu_Item (Item_ID, Restaurant_ID, Item_Name, Description, Price, Availability) VALUES
(1, 1, 'Chicken Biryani', 'Fragrant rice with spices and chicken', 220.00, 1),
(2, 1, 'Paneer Biryani', 'Spiced paneer rice', 180.00, 1),
(3, 1, 'Vegetable Meals', 'South Indian vegetarian meal', 150.00, 1),
(4, 2, 'Veg Buddha Bowl', 'Rice, vegetables and house dressing', 160.00, 1),
(5, 2, 'Paneer Wrap', 'Paneer and salad in a flatbread wrap', 130.00, 1),
(6, 2, 'Lemon Iced Tea', 'Fresh lemon iced tea', 70.00, 1),
(7, 3, 'Margherita Pizza', 'Tomato, mozzarella and basil', 249.00, 1),
(8, 3, 'Farmhouse Pizza', 'Vegetables, cheese and tomato sauce', 329.00, 1),
(9, 3, 'Garlic Bread', 'Toasted garlic bread', 119.00, 1),
(10, 4, 'Masala Dosa', 'Crisp dosa with potato masala', 90.00, 1),
(11, 4, 'Ghee Roast Dosa', 'Dosa roasted with ghee', 140.00, 1),
(12, 4, 'Filter Coffee', 'Traditional filter coffee', 40.00, 1),
(13, 5, 'Veg Hakka Noodles', 'Stir-fried noodles with vegetables', 180.00, 1),
(14, 5, 'Chilli Paneer', 'Paneer tossed in Indo-Chinese sauce', 220.00, 1),
(15, 5, 'Spring Rolls', 'Crisp vegetable spring rolls', 120.00, 1);

INSERT INTO Delivery_Partner (Delivery_ID, Name, Phone, Vehicle_Number, Status) VALUES
(1, 'Rohan Singh', '9200000101', 'KA05AB1234', 'Busy'),
(2, 'Kavya Patel', '9200000102', 'KA03CD2345', 'Available'),
(3, 'Imran Khan', '9200000103', 'TN70EF3456', 'Busy'),
(4, 'Sneha Rao', '9200000104', 'KA51GH4567', 'Offline');

INSERT INTO Orders (Order_ID, Customer_ID, Restaurant_ID, Address_ID, Delivery_ID, Order_Date, Order_Status) VALUES
(1, 1, 1, 1, 1, '2026-10-21 12:15:00', 'Delivered'),
(2, 2, 2, 3, 2, '2026-10-21 19:05:00', 'Delivered'),
(3, 3, 3, 4, 3, '2026-10-22 13:20:00', 'Delivered'),
(4, 1, 4, 2, 1, '2026-10-22 20:00:00', 'Delivered'),
(5, 4, 5, 5, 4, '2026-10-23 12:00:00', 'Out for Delivery'),
(6, 5, 1, 6, 2, '2026-10-23 13:30:00', 'Preparing'),
(7, 6, 3, 7, NULL, '2026-10-23 19:00:00', 'Placed'),
(8, 2, 4, 3, 3, '2026-10-24 08:45:00', 'Delivered'),
(9, 7, 2, 8, 4, '2026-10-24 12:00:00', 'Confirmed'),
(10, 3, 5, 4, NULL, '2026-10-24 12:30:00', 'Placed'),
(11, 4, 3, 5, 1, '2026-10-20 20:00:00', 'Delivered'),
(12, 5, 1, 6, 2, '2026-10-20 12:10:00', 'Cancelled');

INSERT INTO Order_Item (Order_ID, Item_ID, Quantity, Unit_Price) VALUES
(1, 1, 2, 220.00),
(1, 3, 1, 150.00),
(2, 4, 1, 160.00),
(2, 6, 2, 70.00),
(3, 7, 1, 249.00),
(3, 9, 1, 119.00),
(4, 10, 2, 90.00),
(4, 12, 2, 40.00),
(5, 13, 2, 180.00),
(5, 15, 1, 120.00),
(6, 2, 1, 180.00),
(6, 1, 1, 220.00),
(7, 8, 1, 329.00),
(8, 11, 1, 140.00),
(8, 12, 1, 40.00),
(9, 5, 2, 130.00),
(9, 4, 1, 160.00),
(10, 14, 1, 220.00),
(10, 13, 1, 180.00),
(11, 7, 2, 249.00),
(12, 3, 1, 150.00);

INSERT INTO Payment (Payment_ID, Order_ID, Payment_Method, Payment_Status, Payment_Date) VALUES
(1, 1, 'UPI', 'Paid', '2026-10-21 12:18:00'),
(2, 2, 'Card', 'Paid', '2026-10-21 19:08:00'),
(3, 3, 'UPI', 'Paid', '2026-10-22 13:23:00'),
(4, 4, 'Cash', 'Paid', '2026-10-22 20:35:00'),
(5, 5, 'UPI', 'Pending', NULL),
(6, 6, 'Card', 'Pending', NULL),
(7, 7, 'UPI', 'Pending', NULL),
(8, 8, 'Cash', 'Paid', '2026-10-24 09:10:00'),
(9, 9, 'Wallet', 'Pending', NULL),
(10, 10, 'UPI', 'Failed', '2026-10-24 12:32:00'),
(11, 11, 'Card', 'Paid', '2026-10-20 20:04:00'),
(12, 12, 'UPI', 'Refunded', '2026-10-20 12:40:00');

-- Expected row counts: Customer 7, Address 8, Restaurant 5, Menu_Item 15,
-- Delivery_Partner 4, Orders 12, Order_Item 21, Payment 12.
SELECT 'Customer' AS Table_Name, COUNT(*) AS Row_Count FROM Customer
UNION ALL SELECT 'Address', COUNT(*) FROM Address
UNION ALL SELECT 'Restaurant', COUNT(*) FROM Restaurant
UNION ALL SELECT 'Menu_Item', COUNT(*) FROM Menu_Item
UNION ALL SELECT 'Delivery_Partner', COUNT(*) FROM Delivery_Partner
UNION ALL SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL SELECT 'Order_Item', COUNT(*) FROM Order_Item
UNION ALL SELECT 'Payment', COUNT(*) FROM Payment;
