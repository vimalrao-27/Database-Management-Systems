# 🗄️ Database Management Systems

<div align="center">

### 📚 DBMS Coursework & Database Design

**ER Diagrams • Relational Schemas • SQL • Database Modelling**

[![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge\&logo=github)](https://github.com/vimalrao-27/Database-Management-Systems)
[![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge\&logo=mysql\&logoColor=white)](https://www.mysql.com/)
[![DBMS](https://img.shields.io/badge/Subject-DBMS-orange?style=for-the-badge)](#)
[![Academic](https://img.shields.io/badge/Project-Academic-success?style=for-the-badge)](#)

</div>

---

## 📌 About This Repository

This repository contains my **Database Management Systems (DBMS) coursework, assignments, ER diagrams, relational schemas, and SQL implementations**.

The current project focuses on designing a database for a real-world **🍔 Online Food Delivery System**, covering the complete process from identifying entities and relationships to creating a relational database using MySQL.

### 🔍 Topics Covered

* 🧩 Entity and Attribute Identification
* 🔑 Primary Keys (PK)
* 🔗 Foreign Keys (FK)
* 🔄 Relationships & Cardinality
* 🗺️ Entity Relationship (ER) Diagrams
* 📐 Relational Schema Design
* 🔀 Many-to-Many (M:N) Relationship Conversion
* 💻 MySQL Database Design
* 📄 DBMS Assignment Documentation

---

# 🍔 Online Food Delivery System

The **Online Food Delivery System** is a database model designed to manage the core operations of an online food ordering platform.

It represents customers, delivery addresses, restaurants, menu items, orders, delivery partners, order items, and payments.

---

## 🧩 Main Entities

| Entity                  | Description                                                   |
| :---------------------- | :------------------------------------------------------------ |
| 👤 **Customer**         | Stores customer account and contact information               |
| 🏠 **Address**          | Stores delivery addresses belonging to customers              |
| 🍽️ **Restaurant**      | Stores restaurant information and ratings                     |
| 🍕 **Menu_Item**        | Stores food items offered by restaurants                      |
| 🛵 **Delivery_Partner** | Stores delivery partner and vehicle information               |
| 🧾 **Orders**           | Stores customer orders, status, date, and total amount        |
| 📦 **Order_Item**       | Connects orders with menu items and stores quantity and price |
| 💳 **Payment**          | Stores payment details associated with an order               |

---

# 🔗 Database Relationships

| Relationship              | Cardinality | Description                                      |
| :------------------------ | :---------: | :----------------------------------------------- |
| Customer → Address        |  **1 : N**  | One customer can have multiple addresses         |
| Customer → Orders         |  **1 : N**  | One customer can place multiple orders           |
| Restaurant → Menu_Item    |  **1 : N**  | One restaurant can offer multiple menu items     |
| Restaurant → Orders       |  **1 : N**  | One restaurant can receive multiple orders       |
| Delivery_Partner → Orders |  **1 : N**  | One delivery partner can handle multiple orders  |
| Orders → Order_Item       |  **1 : N**  | One order can contain multiple order items       |
| Menu_Item → Order_Item    |  **1 : N**  | One menu item can appear in multiple order items |
| Orders ↔ Menu_Item        |  **M : N**  | Resolved through `Order_Item`                    |
| Orders → Payment          |  **1 : 1**  | Each order is associated with one payment        |

---

## 🔀 M:N Relationship Conversion

The **Orders ↔ Menu_Item** relationship is a **Many-to-Many (M:N)** relationship.

To convert it into relational tables, an associative entity called **`Order_Item`** is introduced.

```text
Orders  M ───────── N  Menu_Item
              │
              ▼
          Order_Item
```

### Associative Table

```sql
ORDER_ITEM(
    Order_ID,
    Item_ID,
    Quantity,
    Unit_Price
)
```

**Composite Primary Key:**

```text
(Order_ID, Item_ID)
```

---

# 🗺️ Entity Relationship Diagram

## 🍔 Online Food Delivery ERD

<p align="center">
  <img src="ONLINE%20FOOD%20DELIVERY%20SYSTEM/online_food_delivery_ERD.png" alt="Online Food Delivery ER Diagram" width="100%">
</p>

> 📌 The ER diagram represents entities, attributes, primary keys, relationships, foreign keys, and cardinalities used in the database design.

---

# 📐 Relational Schema

The ER model is converted into the following relational schema.

### 👤 CUSTOMER

```text
Customer(
    Customer_ID,
    Name,
    Email,
    Phone,
    Password
)
```

**Primary Key:** `Customer_ID`

---

### 🏠 ADDRESS

```text
Address(
    Address_ID,
    Customer_ID,
    House_No,
    Street,
    City,
    Pincode
)
```

**Primary Key:** `Address_ID`
**Foreign Key:** `Customer_ID → Customer.Customer_ID`

---

### 🍽️ RESTAURANT

```text
Restaurant(
    Restaurant_ID,
    Restaurant_Name,
    Phone,
    Address,
    Rating
)
```

**Primary Key:** `Restaurant_ID`

---

### 🍕 MENU_ITEM

```text
Menu_Item(
    Item_ID,
    Restaurant_ID,
    Item_Name,
    Description,
    Price,
    Availability
)
```

**Primary Key:** `Item_ID`
**Foreign Key:** `Restaurant_ID → Restaurant.Restaurant_ID`

---

### 🛵 DELIVERY_PARTNER

```text
Delivery_Partner(
    Delivery_ID,
    Name,
    Phone,
    Vehicle_Number,
    Status
)
```

**Primary Key:** `Delivery_ID`

---

### 🧾 ORDERS

```text
Orders(
    Order_ID,
    Customer_ID,
    Restaurant_ID,
    Address_ID,
    Delivery_ID,
    Order_Date,
    Order_Status,
    Total_Amount
)
```

**Primary Key:** `Order_ID`

**Foreign Keys:**

```text
Customer_ID   → Customer.Customer_ID
Restaurant_ID → Restaurant.Restaurant_ID
Address_ID    → Address.Address_ID
Delivery_ID   → Delivery_Partner.Delivery_ID
```

---

### 📦 ORDER_ITEM

```text
Order_Item(
    Order_ID,
    Item_ID,
    Quantity,
    Unit_Price
)
```

**Primary Key:**

```text
(Order_ID, Item_ID)
```

**Foreign Keys:**

```text
Order_ID → Orders.Order_ID
Item_ID  → Menu_Item.Item_ID
```

---

### 💳 PAYMENT

```text
Payment(
    Payment_ID,
    Order_ID,
    Payment_Method,
    Payment_Status,
    Payment_Date,
    Amount
)
```

**Primary Key:** `Payment_ID`
**Foreign Key:** `Order_ID → Orders.Order_ID`

---

# 📊 Database Design Summary

| Table              | Primary Key           | Foreign Key(s)                                              |
| :----------------- | :-------------------- | :---------------------------------------------------------- |
| `Customer`         | `Customer_ID`         | —                                                           |
| `Address`          | `Address_ID`          | `Customer_ID`                                               |
| `Restaurant`       | `Restaurant_ID`       | —                                                           |
| `Menu_Item`        | `Item_ID`             | `Restaurant_ID`                                             |
| `Delivery_Partner` | `Delivery_ID`         | —                                                           |
| `Orders`           | `Order_ID`            | `Customer_ID`, `Restaurant_ID`, `Address_ID`, `Delivery_ID` |
| `Order_Item`       | `(Order_ID, Item_ID)` | `Order_ID`, `Item_ID`                                       |
| `Payment`          | `Payment_ID`          | `Order_ID`                                                  |

---

# 📂 Repository Structure

```text
Database-Management-Systems/
│
└── 📁 ONLINE FOOD DELIVERY SYSTEM/
    │
    ├── 📄 assignment 1.txt
    ├── 📄 assignment 2.txt
    │
    ├── 📄 DBMS Assignment Online Food Delivery System.docx
    ├── 📄 DBMS Assignment Online Food Delivery System.pdf
    │
    ├── 📄 Online_Food_Delivery_ER_Assignment.docx
    ├── 📄 Online_Food_Delivery_ER_Assignment2.pdf
    │
    ├── 🖼️ ONLINE FOOD DELIVERY SYSTEM(1).png
    ├── 🖼️ ONLINE FOOD DELIVERY SYSTEM.png
    ├── 🖼️ Online Food.png
    ├── 🖼️ online_food_delivery_ERD.png
    │
    └── 💻 online_food_delivery_schema.sql
```

---

# 📝 Assignment 1

### Objective

Select a real-world application and identify the database tables required to manage it.

### Covered Topics

* Application name and purpose
* Required database tables
* Columns / attributes
* Relationships between tables
* Purpose of each table

📄 **[View Assignment 1](ONLINE%20FOOD%20DELIVERY%20SYSTEM/assignment%201.txt)**

---

# 📝 Assignment 2

## ER Diagram Design & Relational Schema

### Objective

Design a complete **Entity Relationship Diagram** for the selected application and convert it into a **Relational Schema**.

### Covered Topics

* Entities and attributes
* Primary Keys
* Foreign Keys
* Relationships
* Cardinalities
* ER Diagram
* Relational Schema
* M:N relationship conversion
* Relationship explanations

### 📄 Assignment Files

* **[Assignment 2 Instructions](ONLINE%20FOOD%20DELIVERY%20SYSTEM/assignment%202.txt)**
* **[Assignment 2 PDF](ONLINE%20FOOD%20DELIVERY%20SYSTEM/Online_Food_Delivery_ER_Assignment2.pdf)**
* **[Assignment 2 DOCX](ONLINE%20FOOD%20DELIVERY%20SYSTEM/Online_Food_Delivery_ER_Assignment.docx)**

---

# 💻 MySQL Implementation

The relational schema is implemented using **MySQL**.

### 📌 SQL File

**[online_food_delivery_schema.sql](ONLINE%20FOOD%20DELIVERY%20SYSTEM/online_food_delivery_schema.sql)**

### ⚙️ Includes

* ✅ Database creation
* ✅ Table creation
* ✅ Primary keys
* ✅ Foreign keys
* ✅ Unique constraints
* ✅ Default values
* ✅ Referential actions
* ✅ Composite primary key for `Order_Item`
* ✅ 1:1 relationship enforcement for `Payment`

### ▶️ Run the Database

Open the SQL file using **MySQL Workbench** or another MySQL client.

```sql
SOURCE online_food_delivery_schema.sql;
```

---

# 🛠️ Tools & Technologies

| Tool                      | Purpose                               |
| :------------------------ | :------------------------------------ |
| 🐬 **MySQL**              | Database implementation               |
| 🧰 **MySQL Workbench**    | SQL development & database management |
| 🗺️ **ERDPlus / Draw.io** | ER diagram modelling                  |
| 📄 **Microsoft Word**     | Assignment documentation              |
| 📕 **PDF**                | Assignment submission                 |
| 🐙 **GitHub**             | Version control & project hosting     |

---

# 🎯 Learning Outcomes

Through this project, I practiced:

* 🧩 Identifying entities and attributes
* 🔑 Designing primary and foreign keys
* 🔗 Modelling database relationships
* 🔢 Understanding cardinality
* 🗺️ Creating ER diagrams
* 📐 Converting ER models into relational schemas
* 🔀 Resolving M:N relationships
* 💻 Writing SQL DDL statements
* 🗂️ Organizing database documentation
* 🐙 Managing coursework using GitHub

---

# 👨‍💻 Author

<div align="center">

## **Vimal Rao**

BCA Student | Database & Software Development Learner

[![GitHub](https://img.shields.io/badge/GitHub-vimalrao--27-181717?style=for-the-badge\&logo=github)](https://github.com/vimalrao-27)

</div>

---

# 📚 Academic Project

This repository contains **college DBMS coursework and assignments** created for academic learning, database modelling practice, and documentation.

### 🚀 Keep Learning. Keep Building.

> **Learn • Improve • Keep Moving Forward 🚀**

---

<div align="center">

⭐ **Thanks for visiting this repository!**

</div>
