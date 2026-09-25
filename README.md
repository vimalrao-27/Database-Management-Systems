# 🗄️ Database Management Systems

<div align="center">

### 📚 College DBMS Coursework & Assignments

**ER Diagrams • Relational Schemas • SQL • Database Modelling**

🎓 **Alliance University**



\

</div>

---

## 📌 About This Repository

This repository contains my **college Database Management Systems (DBMS) assignments and coursework** completed as part of my academic studies at **Alliance University**.

It includes database modelling exercises, ER diagrams, relational schemas, SQL scripts, and assignment documentation based on a real-world **🍔 Online Food Delivery System**.

### 🔍 Topics Covered

* 🧩 Entity and Attribute Identification
* 🔑 Primary Keys (PK)
* 🔗 Foreign Keys (FK)
* 🔄 Relationships & Cardinality
* 🗺️ Entity Relationship (ER) Diagrams
* 📐 Relational Schema Design
* 🔀 Many-to-Many (M) Relationship Conversion
* 💻 MySQL Database Design
* 📄 College Assignment Documentation

---

# 🍔 Application: Online Food Delivery System

For my **college DBMS assignment**, I selected an **Online Food Delivery System** as the real-world application.

The database model represents the major components required to manage customers, delivery addresses, restaurants, menu items, delivery partners, orders, order items, and payments.

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

## 🔀 M Relationship Conversion

The **Orders ↔ Menu_Item** relationship is a **Many-to-Many (M)** relationship.

It is resolved using the associative entity **`Order_Item`**.

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

**Composite Primary Key:** `(Order_ID, Item_ID)`

---

# 🗺️ Entity Relationship Diagram

## 🍔 Online Food Delivery ERD

<p align="center">
  <img src="ONLINE%20FOOD%20DELIVERY%20SYSTEM/online_food_delivery_ERD.png" alt="Online Food Delivery ER Diagram" width="100%">
</p>

> 📌 This ER diagram was created for my **college DBMS Assignment 2** and represents entities, attributes, relationships, primary keys, foreign keys, and cardinalities.

---

# 📐 Relational Schema

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

**PK:** `Customer_ID`

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

**PK:** `Address_ID`
**FK:** `Customer_ID → Customer.Customer_ID`

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

**PK:** `Restaurant_ID`

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

**PK:** `Item_ID`
**FK:** `Restaurant_ID → Restaurant.Restaurant_ID`

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

**PK:** `Delivery_ID`

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

**PK:** `Order_ID`

**Foreign Keys:**

```text
Customer_ID   → Customer.Customer_ID
Restaurant_ID → Restaurant.Restaurant_ID
Address_ID    → Address.Address_ID
Delivery_ID   → Delivery_Partner.Delivery_ID
```

### 📦 ORDER_ITEM

```text
Order_Item(
    Order_ID,
    Item_ID,
    Quantity,
    Unit_Price
)
```

**PK:** `(Order_ID, Item_ID)`

**Foreign Keys:**

```text
Order_ID → Orders.Order_ID
Item_ID  → Menu_Item.Item_ID
```

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

**PK:** `Payment_ID`
**FK:** `Order_ID → Orders.Order_ID`

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

# 📝 College Assignment 1

### Objective

For the first **college DBMS assignment**, a real-world application was selected and the database tables required to manage it were identified.

### Covered Topics

* Application name and purpose
* Required database tables
* Columns / attributes
* Table relationships
* Purpose of each table

📄 **[View Assignment 1](ONLINE%20FOOD%20DELIVERY%20SYSTEM/assignment%201.txt)**

---

# 📝 College Assignment 2

## ER Diagram Design & Relational Schema

The second **college DBMS assignment** focuses on designing a complete ER diagram for the selected application and converting the ER model into a relational schema.

### Covered Topics

* Entities and attributes
* Primary Keys
* Foreign Keys
* Relationships
* Cardinalities
* ER Diagram
* Relational Schema
* M relationship conversion
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

### ▶️ Run the SQL

Open the SQL file in **MySQL Workbench** or another MySQL client.

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

Through this **college DBMS project**, I practiced:

* 🧩 Identifying entities and attributes
* 🔑 Designing primary and foreign keys
* 🔗 Modelling database relationships
* 🔢 Understanding cardinality
* 🗺️ Creating ER diagrams
* 📐 Converting ER models into relational schemas
* 🔀 Resolving M relationships
* 💻 Writing SQL DDL statements
* 🗂️ Organizing database documentation
* 🐙 Managing academic coursework using GitHub

---

# 🎓 Academic Information

**University:** Alliance University
**Course:** Bachelor of Computer Applications (BCA)
**Subject:** Database Management Systems (DBMS)
**Project Type:** College Assignment

This repository is maintained as part of my **college academic coursework and DBMS learning**.

---

# 👨‍💻 Author

<div align="center">

## **Vimal Rao**

**BCA Student | Alliance University**

</div>

---

## 📚 Academic Project

This repository contains **college DBMS assignments and coursework** created for academic learning, database modelling practice, SQL implementation, and documentation.

> **Learn • Improve • Keep Moving Forward 🚀 **

---

<div align="center">

⭐ **Thanks for visiting my DBMS repository!**

</div>
