# 🗄️ Database Management Systems

<div align="center">

<img src="https://img.shields.io/badge/DBMS-Coursework-336791?style=for-the-badge" alt="DBMS">
<img src="https://img.shields.io/badge/MySQL-SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
<img src="https://img.shields.io/badge/ER%20Model-Database%20Design-6C63FF?style=for-the-badge" alt="ER Model">
<img src="https://img.shields.io/badge/GitHub-Academic%20Projects-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">

<br>

### 📚 College DBMS Coursework & Assignments

**ER Diagrams • Relational Schemas • SQL • Database Modelling**

🎓 **Alliance University**

</div>

---

## 🌐 About This Repository

Welcome to my **Database Management Systems (DBMS)** repository! 👋

This repository documents my **college DBMS coursework, assignments, database modelling exercises, ER diagrams, relational schemas, SQL implementation, and supporting documentation**.

The main real-world application explored in this coursework is an:

# 🍔 Online Food Delivery System

The project takes a real-world food-delivery workflow and converts it into a structured relational database using concepts such as **entities, attributes, primary keys, foreign keys, relationships, cardinality, ER modelling, relational schema design, and SQL**.

> 🎓 **Academic Project**
> This repository is maintained for college coursework, practical learning, experimentation, and documenting my database-learning journey.

---

# 🧭 Quick Navigation

| 📌 Section                  | 🔎 Explore                                     |
| :-------------------------- | :--------------------------------------------- |
| 📝 **Assignment 1**         | Application analysis and database requirements |
| 🗺️ **Assignment 2**        | ER diagram and relational schema               |
| 🧩 **Database Design**      | Entities, keys, relationships, and cardinality |
| 💻 **SQL Implementation**   | MySQL database schema                          |
| 📂 **Repository Structure** | Project files and documentation                |
| 🛠️ **Tools**               | Technologies used                              |
| 🎯 **Learning Outcomes**    | Concepts and skills practiced                  |

---

# 🚀 What This Repository Covers

```text
Real-World Problem
       ↓
Identify Entities
       ↓
Define Attributes
       ↓
Choose Primary & Foreign Keys
       ↓
Define Relationships
       ↓
Determine Cardinality
       ↓
Create ER Diagram
       ↓
Convert ER Model → Relational Schema
       ↓
Implement with SQL
       ↓
Document & Organize
```

---

# 🍔 Online Food Delivery System

The database model represents the major components required to manage an online food-delivery system.

### 🧩 Main Components

| Entity                  | Description                                         |
| :---------------------- | :-------------------------------------------------- |
| 👤 **Customer**         | Stores customer account and contact information     |
| 🏠 **Address**          | Stores customer delivery addresses                  |
| 🍽️ **Restaurant**      | Stores restaurant information and ratings           |
| 🍕 **Menu_Item**        | Stores food items offered by restaurants            |
| 🛵 **Delivery_Partner** | Stores delivery partner and vehicle information     |
| 🧾 **Orders**           | Stores customer orders and order details            |
| 📦 **Order_Item**       | Connects orders and menu items                      |
| 💳 **Payment**          | Stores payment information associated with an order |

---

# 🔗 Database Relationships

| Relationship              | Cardinality | Meaning                                         |
| :------------------------ | :---------: | :---------------------------------------------- |
| Customer → Address        |  **1 : N**  | One customer can have multiple addresses        |
| Customer → Orders         |  **1 : N**  | One customer can place multiple orders          |
| Restaurant → Menu_Item    |  **1 : N**  | One restaurant can have multiple menu items     |
| Restaurant → Orders       |  **1 : N**  | One restaurant can receive multiple orders      |
| Delivery_Partner → Orders |  **1 : N**  | One delivery partner can handle multiple orders |
| Orders → Order_Item       |  **1 : N**  | One order can contain multiple items            |
| Menu_Item → Order_Item    |  **1 : N**  | One menu item can occur in multiple order items |
| Orders ↔ Menu_Item        |  **M : N**  | Resolved using `Order_Item`                     |
| Orders → Payment          |  **1 : 1**  | Each order has one payment                      |

---

# 🔀 M:N Relationship Conversion

One of the important parts of the design is the **Many-to-Many relationship** between:

```text
Orders ↔ Menu_Item
```

A single order can contain multiple menu items, while a menu item can appear in multiple orders.

To resolve this relationship, the associative entity:

### 📦 `Order_Item`

is introduced.

```text
        M                      N
Orders ───────────────────── Menu_Item
          \                /
           \              /
             Order_Item
```

### Structure

```text
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
  <img src="College%20Assignment%202/online_food_delivery_ERD.png" alt="Online Food Delivery ER Diagram" width="100%">
</p>

> 📌 The ER diagram represents the entities, attributes, relationships, primary keys, foreign keys, and cardinalities used in the database design.

---

# 📐 Relational Schema

## 👤 CUSTOMER

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

---

## 🏠 ADDRESS

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

---

## 🍽️ RESTAURANT

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

---

## 🍕 MENU_ITEM

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

---

## 🛵 DELIVERY_PARTNER

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

---

## 🧾 ORDERS

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

### Foreign Keys

```text
Customer_ID   → Customer.Customer_ID
Restaurant_ID → Restaurant.Restaurant_ID
Address_ID    → Address.Address_ID
Delivery_ID   → Delivery_Partner.Delivery_ID
```

---

## 📦 ORDER_ITEM

```text
Order_Item(
    Order_ID,
    Item_ID,
    Quantity,
    Unit_Price
)
```

**PK:** `(Order_ID, Item_ID)`

### Foreign Keys

```text
Order_ID → Orders.Order_ID
Item_ID  → Menu_Item.Item_ID
```

---

## 💳 PAYMENT

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

| Table              | 🔑 Primary Key        | 🔗 Foreign Keys                                             |
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

# 📝 College Assignment 1

## 🎯 Objective

The first assignment focuses on selecting a real-world application and identifying the database structures required to manage it.

### 📚 Covered Topics

* 🏷️ Application name and purpose
* 🗃️ Database tables
* 🧩 Columns / attributes
* 🔗 Table relationships
* 📌 Purpose of each table

### 📄 Assignment

➡️ **[Open Assignment 1](College%20Assignment%201/assignment%201.txt)**

The folder also contains the assignment documentation and supporting images.

---

# 📝 College Assignment 2

## 🗺️ ER Diagram & Relational Schema

The second assignment focuses on converting the selected application into a complete **Entity Relationship Model** and then designing the corresponding relational schema.

### 📚 Covered Topics

* 🧩 Entities
* 🏷️ Attributes
* 🔑 Primary Keys
* 🔗 Foreign Keys
* 🔄 Relationships
* 🔢 Cardinality
* 🗺️ ER Diagram
* 📐 Relational Schema
* 🔀 M:N relationship conversion

### 📄 Assignment Resources

➡️ **[Assignment 2 Instructions](College%20Assignment%202/assignment%202.txt)**
➡️ **[Assignment 2 PDF](College%20Assignment%202/Online_Food_Delivery_ER_Assignment2.pdf)**
➡️ **[Assignment 2 DOCX](College%20Assignment%202/Online_Food_Delivery_ER_Assignment.docx)**

---

# 💻 MySQL Implementation

The relational design is implemented using **MySQL**.

## 📌 SQL Schema

➡️ **[Open `online_food_delivery_schema.sql`](College%20Assignment%202/online_food_delivery_schema.sql)**

### ⚙️ SQL Includes

```text
✅ Database creation
✅ Table creation
✅ Primary keys
✅ Foreign keys
✅ Unique constraints
✅ Default values
✅ Referential actions
✅ Composite primary key
✅ Payment relationship constraints
```

### ▶️ Run the SQL

Open the SQL file using **MySQL Workbench** or another compatible MySQL client.

```sql
SOURCE online_food_delivery_schema.sql;
```

---

# 📂 Repository Structure

```text
Database-Management-Systems/
│
├── 📁 College Assignment 1/
│   │
│   ├── 📄 assignment 1.txt
│   ├── 📄 DBMS Assignment Online Food Delivery System.docx
│   ├── 📄 DBMS Assignment Online Food Delivery System.pdf
│   ├── 🖼️ ONLINE FOOD DELIVERY SYSTEM(1).png
│   ├── 🖼️ ONLINE FOOD DELIVERY SYSTEM.png
│   └── 🖼️ Online Food.png
│
├── 📁 College Assignment 2/
│   │
│   ├── 📄 assignment 2.txt
│   ├── 📄 Online_Food_Delivery_ER_Assignment.docx
│   ├── 📄 Online_Food_Delivery_ER_Assignment2.pdf
│   ├── 🖼️ online_food_delivery_ERD.png
│   └── 💻 online_food_delivery_schema.sql
│
└── 📘 README.md
```

---

# 🛠️ Tools & Technologies

<p align="center">

<img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/MySQL%20Workbench-4479A1?style=flat-square&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/ERDPlus-Design-6C63FF?style=flat-square">
<img src="https://img.shields.io/badge/Draw.io-Diagrams-F08705?style=flat-square&logo=diagramsdotnet&logoColor=white">
<img src="https://img.shields.io/badge/Microsoft%20Word-Documentation-2B579A?style=flat-square&logo=microsoftword&logoColor=white">
<img src="https://img.shields.io/badge/GitHub-Version%20Control-181717?style=flat-square&logo=github&logoColor=white">

</p>

| Tool                      | Purpose                                  |
| :------------------------ | :--------------------------------------- |
| 🐬 **MySQL**              | Database implementation                  |
| 🧰 **MySQL Workbench**    | SQL development and database management  |
| 🗺️ **ERDPlus / Draw.io** | ER diagram and database modelling        |
| 📄 **Microsoft Word**     | Assignment documentation                 |
| 📕 **PDF**                | Assignment submission                    |
| 🐙 **GitHub**             | Version control and project organization |

---

# 🧠 DBMS Concepts Practiced

This repository helped me practice the following concepts:

### 🧩 Database Modelling

Understanding how a real-world system can be represented as entities, attributes, and relationships.

### 🔑 Keys

Working with:

```text
Primary Key
Foreign Key
Composite Primary Key
```

### 🔗 Relationships

```text
1 : 1
1 : N
M : N
```

### 🔢 Cardinality

Understanding how many instances of one entity can be associated with another.

### 🗺️ ER Modelling

Designing Entity Relationship Diagrams to visually represent database structures.

### 📐 Relational Schema

Transforming the conceptual ER model into a structured relational database design.

### 💻 SQL

Implementing the database structure using SQL DDL statements.

---

# 🎯 Learning Outcomes

Through this coursework, I practiced:

* 🧩 Identifying entities and attributes
* 🔑 Designing primary and foreign keys
* 🔗 Modelling database relationships
* 🔢 Understanding cardinality
* 🗺️ Creating ER diagrams
* 📐 Converting ER models into relational schemas
* 🔀 Resolving M:N relationships
* 💻 Writing SQL DDL statements
* 🗂️ Organizing database documentation
* 🐙 Managing academic coursework with GitHub

---

# 🧭 My DBMS Learning Path

```text
📚 Learn Concepts
        ↓
🧩 Model the Problem
        ↓
🗺️ Design the ER Diagram
        ↓
📐 Build the Relational Schema
        ↓
💻 Implement with SQL
        ↓
🔍 Test & Analyze
        ↓
📚 Document the Work
```

---

# 🎓 Academic Information

|                    |                                         |
| :----------------- | :-------------------------------------- |
| 🏫 **University**  | Alliance University                     |
| 🎓 **Course**      | Bachelor of Computer Applications (BCA) |
| 📚 **Subject**     | Database Management Systems             |
| 📝 **Work Type**   | College Coursework & Assignments        |
| 🍔 **Application** | Online Food Delivery System             |

---

# 👨‍💻 Author

<div align="center">

## **N.R. Vimal Kumar Rao**

### BCA Student • Alliance University

<a href="https://github.com/vimalrao-27">
  <img src="https://img.shields.io/badge/GitHub-vimalrao--27-181717?style=for-the-badge&logo=github&logoColor=white">
</a>

</div>

---

# 📚 Academic Project

This repository represents my practical work in **Database Management Systems**, from understanding a real-world problem to designing its database structure and implementing it using SQL.

> **Learn • Improve • Keep Moving Forward 🚀**

---

<div align="center">

### 🗄️ Design the Data

### 🔗 Build the Relationships

### 💻 Write the SQL

### 📊 Understand the Database

<br>
⭐ Support

Found something useful here?

Consider giving the repository a ⭐ — it helps motivate me to keep building and learning.
<br>
⭐ **Thanks for visiting my DBMS repository!**

</div>
