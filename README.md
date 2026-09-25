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
📝 College Assignments
📘 Assignment 1

Database Tables & Application Design

Covers:

Application selection
Tables
Attributes
Relationships
Purpose of tables

📂 College Assignment 1/

📗 Assignment 2

ER Diagram Design & Relational Schema

Covers:

Entities & Attributes
Primary Keys
Foreign Keys
Relationships
Cardinalities
ER Diagram
Relational Schema
M:N Relationship Conversion

📂 College Assignment 2/

💻 MySQL

The database schema is implemented using MySQL.

📄 online_food_delivery_schema.sql

Includes

✅ Database creation
✅ Tables
✅ Primary Keys
✅ Foreign Keys
✅ Constraints
✅ Relationships
✅ Composite Key for Order_Item

🛠️ Tools
Tool	Purpose
🐬 MySQL	Database implementation
🧰 MySQL Workbench	SQL & database management
🗺️ ERDPlus / Draw.io	ER diagram design
📄 Microsoft Word	Assignment documentation
🐙 GitHub	Project & coursework management
📂 Repository Structure
Database-Management-Systems/
│
├── 📁 College Assignment 1/
│   ├── assignment 1.txt
│   ├── DBMS Assignment Online Food Delivery System.docx
│   ├── DBMS Assignment Online Food Delivery System.pdf
│   └── 🖼️ ER Diagram Images
│
├── 📁 College Assignment 2/
│   ├── assignment 2.txt
│   ├── Online_Food_Delivery_ER_Assignment.docx
│   ├── Online_Food_Delivery_ER_Assignment2.pdf
│   ├── online_food_delivery_ERD.png
│   └── online_food_delivery_schema.sql
│
└── README.md
🎯 Learning Outcomes

Through these college DBMS assignments, I practiced:

Database Design • ER Modelling • SQL • Relational Schema • PK/FK • Cardinality • M:N Relationships

👨‍💻 Author
<div align="center">
Vimal Rao

BCA Student | Alliance University

</div>
<div align="center">
📚 College Academic Project

Learn • Improve • Keep Moving Forward 🚀

⭐ Thanks for visiting my repository!

</div> ```
