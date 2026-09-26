# 🗄️ Database Management Systems

<div align="center">

<img src="https://img.shields.io/badge/DBMS-Coursework-336791?style=for-the-badge" alt="DBMS">
<img src="https://img.shields.io/badge/MySQL-SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
<img src="https://img.shields.io/badge/ER%20Model-Database%20Design-6C63FF?style=for-the-badge" alt="ER Model">
<img src="https://img.shields.io/badge/GitHub-Academic%20Projects-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">

<br><br>

### 📚 College DBMS Coursework & Assignments

**ER Diagrams • Relational Schemas • SQL • Database Modelling**

🎓 **Alliance University**

</div>

---

## 🌐 About This Repository

Welcome to my **Database Management Systems (DBMS)** repository! 👋

This repository documents my **college DBMS coursework, assignments, database modelling exercises, ER diagrams, relational schemas, SQL implementation, and supporting documentation**.

The practical application developed for this coursework is an:

# 🍔 Online Food Delivery System

The project transforms a real-world food-delivery workflow into a structured relational database using:

**Entities • Attributes • Primary Keys • Foreign Keys • Relationships • Cardinality • ER Modelling • Relational Schema • SQL**

> 🎓 **Academic Repository**
> Maintained for college coursework, practical learning, experimentation, and documenting my database-learning journey.

---

# 🧭 Quick Navigation

| 📌 Section               | 🔎 Explore                                     |
| :----------------------- | :--------------------------------------------- |
| 🍔 **Application**       | Online Food Delivery System                    |
| 📝 **Assignment 1**      | Application analysis and database requirements |
| 🗺️ **Assignment 2**     | ER diagram and relational schema               |
| 🖼️ **ER Design**        | Database diagrams and design versions          |
| 💻 **MySQL**             | SQL implementation                             |
| 📕 **Documentation**     | PDF and Word submissions                       |
| 🎯 **Learning Outcomes** | DBMS concepts practiced                        |

---

# 🚀 Database Design Journey

```text
🍔 Real-World Application
          ↓
🧩 Identify Entities
          ↓
🏷️ Define Attributes
          ↓
🔑 Select Primary & Foreign Keys
          ↓
🔗 Define Relationships
          ↓
🔢 Determine Cardinality
          ↓
🗺️ Create ER Diagram
          ↓
📐 Convert to Relational Schema
          ↓
💻 Implement with MySQL
          ↓
📚 Document the Work
```

---

# 🍔 Online Food Delivery System

The database model represents the major components required to manage an online food-delivery platform.

## 🧩 Main Entities

| Entity                  | Description                                         |
| :---------------------- | :-------------------------------------------------- |
| 👤 **Customer**         | Stores customer account and contact information     |
| 🏠 **Address**          | Stores delivery addresses belonging to customers    |
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
| Orders ↔ Menu_Item        |  **M : N**  | Resolved using Order_Item                       |
| Orders → Payment          |  **1 : 1**  | Each order has one payment                      |

---

# 🔀 Many-to-Many Relationship

A key part of the database design is the **Many-to-Many (M:N)** relationship between:

```text
Orders ↔ Menu_Item
```

An order can contain multiple menu items, while the same menu item can appear in many orders.

The M:N relationship is resolved using the associative entity:

### 📦 Order_Item

```text
        M                       N
Orders ───────────────────── Menu_Item
            \             /
             \           /
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

**Composite Primary Key:** `(Order_ID, Item_ID)`

---

# 🗺️ Entity Relationship Diagram

## 🍔 Online Food Delivery ERD

<p align="center">
  <img src="ONLINE%20FOOD%20DELIVERY%20SYSTEM/ER%20Diagram%20Design/online_food_delivery_ERD.png" alt="Online Food Delivery ER Diagram" width="100%">
</p>

> 📌 The ERD represents entities, attributes, relationships, primary keys, foreign keys, and cardinalities used in the database design.

### 🖼️ Additional ER Design Versions

| Diagram                                 | File                                                                                                         |
| :-------------------------------------- | :----------------------------------------------------------------------------------------------------------- |
| Online Food Delivery ER                 | [Open](ONLINE%20FOOD%20DELIVERY%20SYSTEM/ER%20Diagram%20Design/ONLINE%20FOOD%20DELIVERY%20ER.png)            |
| Online Food Delivery System             | [Open](ONLINE%20FOOD%20DELIVERY%20SYSTEM/ER%20Diagram%20Design/ONLINE%20FOOD%20DELIVERY%20SYSTEM.png)        |
| Online Food Delivery System – Version 1 | [Open](ONLINE%20FOOD%20DELIVERY%20SYSTEM/ER%20Diagram%20Design/ONLINE%20FOOD%20DELIVERY%20SYSTEM%281%29.png) |
| Online Food Delivery Table ER           | [Open](ONLINE%20FOOD%20DELIVERY%20SYSTEM/ER%20Diagram%20Design/ONLINE%20FOOD%20DELIVERY%20TABLE%20ER.png)    |
| Online Food                             | [Open](ONLINE%20FOOD%20DELIVERY%20SYSTEM/ER%20Diagram%20Design/Online%20Food.png)                            |

---

# 📐 Relational Schema

The conceptual ER model is converted into a relational database structure.

```text
Customer(
    Customer_ID,
    Name,
    Email,
    Phone,
    Password
)

Address(
    Address_ID,
    Customer_ID,
    House_No,
    Street,
    City,
    Pincode
)

Restaurant(
    Restaurant_ID,
    Restaurant_Name,
    Phone,
    Address,
    Rating
)

Menu_Item(
    Item_ID,
    Restaurant_ID,
    Item_Name,
    Description,
    Price,
    Availability
)

Delivery_Partner(
    Delivery_ID,
    Name,
    Phone,
    Vehicle_Number,
    Status
)

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

Order_Item(
    Order_ID,
    Item_ID,
    Quantity,
    Unit_Price
)

Payment(
    Payment_ID,
    Order_ID,
    Payment_Method,
    Payment_Status,
    Payment_Date,
    Amount
)
```

## 🔑 Key Mapping

| Table            | Primary Key         | Foreign Key(s)                                      |
| :--------------- | :------------------ | :-------------------------------------------------- |
| Customer         | Customer_ID         | —                                                   |
| Address          | Address_ID          | Customer_ID                                         |
| Restaurant       | Restaurant_ID       | —                                                   |
| Menu_Item        | Item_ID             | Restaurant_ID                                       |
| Delivery_Partner | Delivery_ID         | —                                                   |
| Orders           | Order_ID            | Customer_ID, Restaurant_ID, Address_ID, Delivery_ID |
| Order_Item       | (Order_ID, Item_ID) | Order_ID, Item_ID                                   |
| Payment          | Payment_ID          | Order_ID                                            |

---

# 📝 College Assignment 1

## 🎯 Objective

The first assignment focuses on selecting a real-world application and identifying the database structures required to manage it.

### 📚 Covered Topics

* 🏷️ Application name and purpose
* 🗃️ Database tables
* 🧩 Columns and attributes
* 🔗 Table relationships
* 📌 Purpose of each table

➡️ **[Open Assignment 1](ONLINE%20FOOD%20DELIVERY%20SYSTEM/assignment%20question/assignment%201.txt)**

Supporting documentation is available in the **PDF** and **Word** folders.

---

# 📝 College Assignment 2

## 🗺️ ER Diagram & Relational Schema

The second assignment focuses on transforming the selected application into a complete **Entity Relationship Model** and designing the corresponding relational schema.

### 📚 Covered Topics

* 🧩 Entities and attributes
* 🔑 Primary Keys and Foreign Keys
* 🔗 Relationships
* 🔢 Cardinality
* 🗺️ ER Diagram
* 📐 Relational Schema
* 🔀 M:N relationship conversion

➡️ **[Assignment 2 Instructions](ONLINE%20FOOD%20DELIVERY%20SYSTEM/assignment%20question/assignment%202.txt)**

### 📕 PDF Resources

* [DBMS Assignment 2 – Online Food Delivery System](ONLINE%20FOOD%20DELIVERY%20SYSTEM/PDF/DBMS%20Assignment%202%20-%20Online%20Food%20Delivery%20System.pdf)
* [DBMS Assignment Online Food Delivery System](ONLINE%20FOOD%20DELIVERY%20SYSTEM/PDF/DBMS%20Assignment%20Online%20Food%20Delivery%20System.pdf)
* [Online Food Delivery ER Assignment 2](ONLINE%20FOOD%20DELIVERY%20SYSTEM/PDF/Online_Food_Delivery_ER_Assignment2.pdf)

### 📄 Word Resources

* [DBMS Assignment 2 – Online Food Delivery System](ONLINE%20FOOD%20DELIVERY%20SYSTEM/Word/DBMS%20Assignment%202%20-%20Online%20Food%20Delivery%20System.docx)
* [DBMS Assignment Online Food Delivery System](ONLINE%20FOOD%20DELIVERY%20SYSTEM/Word/DBMS%20Assignment%20Online%20Food%20Delivery%20System.docx)
* [Online Food Delivery ER Assignment](ONLINE%20FOOD%20DELIVERY%20SYSTEM/Word/Online_Food_Delivery_ER_Assignment.docx)

---

# 💻 MySQL Implementation

The relational design is implemented using **MySQL**.

## 📌 SQL Schema

➡️ **[Open online_food_delivery_schema.sql](ONLINE%20FOOD%20DELIVERY%20SYSTEM/mysQL/online_food_delivery_schema.sql)**

### ⚙️ Includes

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

Open the SQL file in **MySQL Workbench** or another compatible MySQL client.

```sql
SOURCE online_food_delivery_schema.sql;
```

---

# 📂 Repository Structure

```text
Database-Management-Systems/
│
├── 📁 ONLINE FOOD DELIVERY SYSTEM/
│   │
│   ├── 📁 ER Diagram Design/
│   │   ├── 🖼️ ONLINE FOOD DELIVERY ER.png
│   │   ├── 🖼️ ONLINE FOOD DELIVERY SYSTEM.png
│   │   ├── 🖼️ ONLINE FOOD DELIVERY SYSTEM(1).png
│   │   ├── 🖼️ ONLINE FOOD DELIVERY TABLE ER.png
│   │   ├── 🖼️ Online Food.png
│   │   └── 🖼️ online_food_delivery_ERD.png
│   │
│   ├── 📁 PDF/
│   │   ├── 📕 DBMS Assignment 2 - Online Food Delivery System.pdf
│   │   ├── 📕 DBMS Assignment Online Food Delivery System.pdf
│   │   └── 📕 Online_Food_Delivery_ER_Assignment2.pdf
│   │
│   ├── 📁 Word/
│   │   ├── 📄 DBMS Assignment 2 - Online Food Delivery System.docx
│   │   ├── 📄 DBMS Assignment Online Food Delivery System.docx
│   │   └── 📄 Online_Food_Delivery_ER_Assignment.docx
│   │
│   ├── 📁 assignment question/
│   │   ├── 📄 assignment 1.txt
│   │   └── 📄 assignment 2.txt
│   │
│   └── 📁 mysQL/
│       └── 💻 online_food_delivery_schema.sql
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

| Tool / Technology         | Purpose                                  |
| :------------------------ | :--------------------------------------- |
| 🐬 **MySQL**              | Database implementation                  |
| 🧰 **MySQL Workbench**    | SQL development and database management  |
| 🗺️ **ERDPlus / Draw.io** | ER diagram and database modelling        |
| 📄 **Microsoft Word**     | Assignment documentation                 |
| 📕 **PDF**                | Assignment submission                    |
| 🐙 **GitHub**             | Version control and project organization |

---

# 🧠 DBMS Concepts Practiced

| Concept                  | Application                                     |
| :----------------------- | :---------------------------------------------- |
| 🧩 **Entities**          | Customer, Restaurant, Orders, Payment, and more |
| 🏷️ **Attributes**       | Properties describing each entity               |
| 🔑 **Primary Keys**      | Unique identification of records                |
| 🔗 **Foreign Keys**      | Connecting related tables                       |
| 🔢 **Cardinality**       | 1:1, 1:N, and M:N relationships                 |
| 🗺️ **ER Modelling**     | Visual database design                          |
| 📐 **Relational Schema** | Structured table design                         |
| 🔀 **M:N Conversion**    | Associative entity using Order_Item             |
| 💻 **SQL DDL**           | Database implementation                         |

---

# 🧪 Database Design Workflow

```text
                 ┌─────────────────────┐
                 │  Real-World System  │
                 └──────────┬──────────┘
                            ↓
                 ┌─────────────────────┐
                 │   Entity Analysis   │
                 └──────────┬──────────┘
                            ↓
                 ┌─────────────────────┐
                 │  Attribute Design   │
                 └──────────┬──────────┘
                            ↓
                 ┌─────────────────────┐
                 │ Keys & Relationships│
                 └──────────┬──────────┘
                            ↓
                 ┌─────────────────────┐
                 │      ER Diagram     │
                 └──────────┬──────────┘
                            ↓
                 ┌─────────────────────┐
                 │ Relational Schema   │
                 └──────────┬──────────┘
                            ↓
                 ┌─────────────────────┐
                 │   MySQL / SQL DDL   │
                 └─────────────────────┘
```

---

# 🎯 Learning Outcomes

Through this DBMS coursework, I practiced:

* 🧩 Identifying entities and attributes
* 🔑 Designing primary and foreign keys
* 🔗 Modelling database relationships
* 🔢 Understanding cardinality
* 🗺️ Creating ER diagrams
* 📐 Converting ER models into relational schemas
* 🔀 Resolving M:N relationships
* 💻 Writing SQL DDL statements
* 🧪 Applying database concepts to a real-world system
* 🗂️ Organizing academic database documentation using GitHub

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

<div align="center">

### 🗄️ Design the Data

### 🔗 Build the Relationships

### 💻 Write the SQL

### 🧠 Understand the Database

⭐ **Thanks for visiting my DBMS repository!**

**Learn • Model • Implement • Improve 🚀**

</div>
