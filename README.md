# 📊 Retail Order Analysis Using SQL

## 📌 Project Overview
This project analyzes a retail e-commerce dataset using SQL to solve real-world business problems related to customers, orders, products, inventory, and shipping.

The analysis was performed using DB Browser for SQLite / MySQL Workbench and focuses on extracting business insights through complex SQL queries.

---

## 🎯 Objectives
- Analyze customer purchasing behavior
- Evaluate product performance and pricing strategies
- Study inventory and stock status
- Identify geographic and shipping patterns
- Solve real-world business questions using SQL

---

## 🛠️ Tools Used
- SQL (MySQL / SQLite)
- DB Browser for SQLite / MySQL Workbench

---

## 📌 Business Questions Solved

### 🧑‍💼 Customer & Order Analysis
- Retrieved customer details along with order and product information, including customers with no orders.
- Identified customers purchasing more than 10 items per shipped order.
- Calculated total quantity of products shipped per order.
- Filtered order details based on specific conditions (e.g., order_id > 10060).

---

### 📦 Product & Pricing Analysis
- Applied dynamic pricing rules using CASE statements based on product category.
- Identified product classes with highest shipment quantities outside India (excluding USA).
- Calculated total product quantity and value across categories.
- Analyzed frequently purchased product combinations.

---

### 📊 Inventory & Stock Analysis
- Classified stock status as:
  - Low stock
  - In stock
  - Enough stock
  - Out of stock
- Applied category-based inventory rules for better business understanding.

---

### 🌍 Geographic Analysis
- Counted number of cities per country (excluding USA and Malaysia).
- Identified countries with multiple cities.
- Analyzed shipping patterns based on postal codes.

---

### 🔍 Advanced SQL Concepts Used
- JOINs (INNER, LEFT, RIGHT, CROSS)
- CASE statements for business logic
- GROUP BY and HAVING for aggregations
- Subqueries for advanced filtering
- Pattern matching using LIKE
- Aggregate functions (SUM, COUNT)

---

## 📌 Key Business Insights
- A small number of products contribute significantly to total sales.
- Certain product categories have higher demand in specific regions.
- Inventory levels vary widely across categories.
- Repeat customers contribute heavily to overall sales volume.
- Pricing strategy can be optimized using category-based rules.

---

## 📁 Repository Structure
