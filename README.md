# 🗄️ Database Management Systems

<div align="center">

### 🎓 College DBMS Assignments & Coursework

**ER Diagrams • Relational Schema • SQL • Database Design**

### 🏫 Alliance University

[![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![DBMS](https://img.shields.io/badge/Subject-DBMS-orange?style=for-the-badge)](#)
[![Academic](https://img.shields.io/badge/Project-College%20Assignment-success?style=for-the-badge)](#)

</div>

---

## 📌 About

This repository contains my **college Database Management Systems (DBMS) assignments and coursework** completed at **Alliance University**.

The projects focus on **database design, ER diagrams, relational schemas, relationships, keys, and MySQL**.

---

## 🍔 Project

### Online Food Delivery System

A database model designed for an online food delivery application.

**Main Entities:**

`Customer` • `Address` • `Restaurant` • `Menu_Item`  
`Orders` • `Order_Item` • `Delivery_Partner` • `Payment`

### 🔗 Relationships

- Customer → Address — **1:N**
- Customer → Orders — **1:N**
- Restaurant → Menu_Item — **1:N**
- Restaurant → Orders — **1:N**
- Delivery_Partner → Orders — **1:N**
- Orders → Order_Item — **1:N**
- Orders ↔ Menu_Item — **M:N**
- Orders → Payment — **1:1**

The **M:N relationship** between Orders and Menu Items is resolved using the `Order_Item` associative table.

---

## 🗺️ ER Diagram

<p align="center">
  <img src="College%20Assignment%202/online_food_delivery_ERD.png" alt="Online Food Delivery ER Diagram" width="100%">
</p>

---

## 📐 Relational Schema

```text
Customer(
    Customer_ID PK,
    Name,
    Email,
    Phone,
    Password
)

Address(
    Address_ID PK,
    Customer_ID FK,
    House_No,
    Street,
    City,
    Pincode
)

Restaurant(
    Restaurant_ID PK,
    Restaurant_Name,
    Phone,
    Address,
    Rating
)

Menu_Item(
    Item_ID PK,
    Restaurant_ID FK,
    Item_Name,
    Description,
    Price,
    Availability
)

Delivery_Partner(
    Delivery_ID PK,
    Name,
    Phone,
    Vehicle_Number,
    Status
)

Orders(
    Order_ID PK,
    Customer_ID FK,
    Restaurant_ID FK,
    Address_ID FK,
    Delivery_ID FK,
    Order_Date,
    Order_Status,
    Total_Amount
)

Order_Item(
    Order_ID PK/FK,
    Item_ID PK/FK,
    Quantity,
    Unit_Price
)

Payment(
    Payment_ID PK,
    Order_ID FK,
    Payment_Method,
    Payment_Status,
    Payment_Date,
    Amount
)
