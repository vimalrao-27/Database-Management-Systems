-- ============================================================
-- Online Food Delivery System - Relational Schema
-- Generated from the ER Diagram (Assignment 2)
-- ============================================================

CREATE DATABASE IF NOT EXISTS online_food_delivery;
USE online_food_delivery;

-- 1. CUSTOMER
CREATE TABLE Customer (
    Customer_ID   INT PRIMARY KEY AUTO_INCREMENT,
    Name          VARCHAR(100) NOT NULL,
    Email         VARCHAR(150) NOT NULL UNIQUE,
    Phone         VARCHAR(15)  NOT NULL UNIQUE,
    Password      VARCHAR(255) NOT NULL
);

-- 2. ADDRESS  (weak entity: 1 Customer -> N Address)
CREATE TABLE Address (
    Address_ID    INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID   INT NOT NULL,
    House_No      VARCHAR(30),
    Street        VARCHAR(150) NOT NULL,
    City          VARCHAR(100) NOT NULL,
    Pincode       VARCHAR(10)  NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
        ON DELETE CASCADE
);

-- 3. RESTAURANT
CREATE TABLE Restaurant (
    Restaurant_ID    INT PRIMARY KEY AUTO_INCREMENT,
    Restaurant_Name  VARCHAR(150) NOT NULL,
    Phone            VARCHAR(15),
    Address          VARCHAR(255) NOT NULL,
    Rating           DECIMAL(2,1) DEFAULT 0.0
);

-- 4. MENU_ITEM  (1 Restaurant -> N Menu_Item)
CREATE TABLE Menu_Item (
    Item_ID        INT PRIMARY KEY AUTO_INCREMENT,
    Restaurant_ID  INT NOT NULL,
    Item_Name      VARCHAR(150) NOT NULL,
    Description    VARCHAR(500),
    Price          DECIMAL(10,2) NOT NULL,
    Availability   BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
        ON DELETE CASCADE
);

-- 5. DELIVERY_PARTNER
CREATE TABLE Delivery_Partner (
    Delivery_ID      INT PRIMARY KEY AUTO_INCREMENT,
    Name             VARCHAR(100) NOT NULL,
    Phone            VARCHAR(15) NOT NULL UNIQUE,
    Vehicle_Number   VARCHAR(20) NOT NULL UNIQUE,
    Status           VARCHAR(30) DEFAULT 'Available'
);

-- 6. ORDERS  (Customer, Restaurant, Address, Delivery_Partner all 1 -> N Orders)
CREATE TABLE Orders (
    Order_ID       INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID    INT NOT NULL,
    Restaurant_ID  INT NOT NULL,
    Address_ID     INT NOT NULL,
    Delivery_ID    INT,
    Order_Date     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Order_Status   VARCHAR(30) NOT NULL DEFAULT 'Placed',
    Total_Amount   DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Customer_ID)   REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID),
    FOREIGN KEY (Address_ID)    REFERENCES Address(Address_ID),
    FOREIGN KEY (Delivery_ID)   REFERENCES Delivery_Partner(Delivery_ID)
);

-- 7. ORDER_ITEM  (associative table resolving M:N between Orders and Menu_Item)
CREATE TABLE Order_Item (
    Order_ID    INT NOT NULL,
    Item_ID     INT NOT NULL,
    Quantity    INT NOT NULL DEFAULT 1,
    Unit_Price  DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Order_ID, Item_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE,
    FOREIGN KEY (Item_ID)  REFERENCES Menu_Item(Item_ID)
);

-- 8. PAYMENT  (1:1 with Orders -> Order_ID is UNIQUE)
CREATE TABLE Payment (
    Payment_ID      INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID        INT NOT NULL UNIQUE,
    Payment_Method  VARCHAR(30) NOT NULL,
    Payment_Status  VARCHAR(30) NOT NULL DEFAULT 'Pending',
    Payment_Date    DATETIME,
    Amount          DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);
