🗄️ Database Management Systems

A collection of DBMS coursework, assignments, ER diagrams, relational schemas, and SQL resources created as part of my academic work.

This repository currently focuses on an Online Food Delivery System as the selected real-world database application.

📌 Repository Overview

The project demonstrates how a real-world food delivery application can be represented using database concepts, including:

Database table identification

Entities and attributes

Primary Keys (PK)

Foreign Keys (FK)

Relationships and cardinalities

Entity Relationship (ER) diagrams

Relational schema design

Many-to-Many (M) relationship conversion

MySQL table creation

🍔 Application: Online Food Delivery System

The Online Food Delivery System models the major data required to manage customers, addresses, restaurants, menu items, delivery partners, orders, order items, and payments.

Main Entities

Entity

Purpose

Customer

Stores customer account and contact information

Address

Stores delivery addresses associated with customers

Restaurant

Stores restaurant information and ratings

Menu_Item

Stores food items offered by restaurants

Delivery_Partner

Stores delivery partner and vehicle details

Orders

Stores customer orders and order status

Order_Item

Associates orders with menu items and stores quantity/price

Payment

Stores payment information for orders

🧩 Database Relationships

Relationship

Cardinality

Description

Customer → Address

1 : N

One customer can have multiple addresses

Customer → Orders

1 : N

One customer can place multiple orders

Restaurant → Menu_Item

1 : N

One restaurant can offer multiple menu items

Restaurant → Orders

1 : N

One restaurant can receive multiple orders

Delivery_Partner → Orders

1 : N

One delivery partner can handle multiple orders

Orders → Order_Item

1 : N

One order can contain multiple order items

Menu_Item → Order_Item

1 : N

One menu item can appear in multiple order items

Orders → Menu_Item

M : N

Resolved through Order_Item

Orders → Payment

1 : 1

Each order is associated with one payment

🔗 M Relationship Conversion

The Orders ↔ Menu_Item many-to-many relationship is resolved using the associative table:

ORDER_ITEM(Order_ID, Item_ID, Quantity, Unit_Price)

Composite Primary Key: (Order_ID, Item_ID)

🗺️ ER Diagram

Online Food Delivery ERD



Additional ER diagram versions are available in the project folder.

📐 Relational Schema

CUSTOMER

Customer(Customer_ID, Name, Email, Phone, Password)

PK: Customer_ID

ADDRESS

Address(Address_ID, Customer_ID, House_No, Street, City, Pincode)

PK: Address_ID
FK: Customer_ID → Customer.Customer_ID

RESTAURANT

Restaurant(Restaurant_ID, Restaurant_Name, Phone, Address, Rating)

PK: Restaurant_ID

MENU_ITEM

Menu_Item(Item_ID, Restaurant_ID, Item_Name, Description, Price, Availability)

PK: Item_ID
FK: Restaurant_ID → Restaurant.Restaurant_ID

DELIVERY_PARTNER

Delivery_Partner(Delivery_ID, Name, Phone, Vehicle_Number, Status)

PK: Delivery_ID

ORDERS

Orders(Order_ID, Customer_ID, Restaurant_ID, Address_ID, Delivery_ID,
       Order_Date, Order_Status, Total_Amount)

PK: Order_ID
FKs: Customer_ID, Restaurant_ID, Address_ID, Delivery_ID

ORDER_ITEM

Order_Item(Order_ID, Item_ID, Quantity, Unit_Price)

PK: (Order_ID, Item_ID)
FKs: Order_ID → Orders.Order_ID, Item_ID → Menu_Item.Item_ID

PAYMENT

Payment(Payment_ID, Order_ID, Payment_Method, Payment_Status,
        Payment_Date, Amount)

PK: Payment_ID
FK: Order_ID → Orders.Order_ID

📂 Repository Structure

Database-Management-Systems/
└── ONLINE FOOD DELIVERY SYSTEM/
    ├── assignment 1.txt
    ├── assignment 2.txt
    ├── DBMS Assignment Online Food Delivery System.docx
    ├── DBMS Assignment Online Food Delivery System.pdf
    ├── Online_Food_Delivery_ER_Assignment.docx
    ├── Online_Food_Delivery_ER_Assignment2.pdf
    ├── ONLINE FOOD DELIVERY SYSTEM(1).png
    ├── ONLINE FOOD DELIVERY SYSTEM.png
    ├── Online Food.png
    ├── online_food_delivery_ERD.png
    └── online_food_delivery_schema.sql

📝 Assignment 1

Objective: Select a real-world application and identify the database tables required to manage it.

The first assignment covers:

Application name and purpose

Required database tables

Columns / attributes

Table relationships

Purpose of each table

📄 View Assignment 1

📝 Assignment 2 — ER Diagram & Relational Schema

Objective: Design a complete ER diagram for the selected application and convert it into a relational schema.

The second assignment covers:

Entities and attributes

Primary Keys

Foreign Keys

Relationships

Cardinalities

ER diagram

Relational schema

M relationship conversion

Relationship explanations

📄 View Assignment 2 Instructions

📄 Assignment 2 PDF

📄 Assignment 2 DOCX

💻 MySQL Schema

The database structure is implemented in:

📌 online_food_delivery_schema.sql

The SQL script includes:

Database creation

Table creation

Primary keys

Foreign keys

Unique constraints

Default values

Referential actions

Composite primary key for Order_Item

1:1 enforcement for Payment

Run the SQL

Open the script in MySQL Workbench or another MySQL client and execute it.

SOURCE online_food_delivery_schema.sql;

🛠️ Tools Used

MySQL / MySQL Workbench — relational database and SQL

ERDPlus / Draw.io — ER modelling and diagram design

Microsoft Word / PDF — assignment documentation

GitHub — version control and project submission

🎯 Learning Outcomes

This repository demonstrates practical understanding of:

Entity identification

Attribute modelling

Primary and foreign key design

ER modelling

Cardinality

Relational schema conversion

M relationship resolution

SQL DDL and database structure

Documentation and version control

👨‍💻 Author

Vimal Rao

GitHub: @vimalrao-27

📚 Academic Project

This repository contains college DBMS coursework and assignments created for academic learning and demonstration purposes.

Learn • Improve • Keep Moving Forward 🚀
