# Zepto SQL Data Cleaning and EDA Project

## 📌 Project Overview
This project focuses on cleaning and analyzing Zepto product data using SQL.
The goal is to prepare clean, reliable data and perform Exploratory Data Analysis (EDA)
to extract meaningful business insights.

---

## 🛠 Tools & Technologies
- MySQL
- SQL
- Window Functions
- CTE (Common Table Expressions)

---

## 📂 Dataset
- Source: Public dataset (Zepto product data)
- Format: CSV
- Imported into MySQL for analysis

---

## 🔄 Project Workflow

### 1. Data Import & Preview
- Imported CSV data into MySQL
- Previewed data using SELECT * and LIMIT
- Checked column structure and data types

### 2. Data Cleaning
- Removed duplicate records using ROW_NUMBER()
- Used staging tables to safely delete duplicates
- Handled NULL values
- Standardized text columns
- Validated data after cleaning

### 3. Data Validation
- Verified row counts
- Ensured no duplicate records remain
- Rechecked NULL values

### 4. Exploratory Data Analysis (EDA)
- Total number of products
- Category-wise product distribution
- Price (MRP) analysis
- Discount analysis
- Identification of high and low priced products

---

## 📊 Key Insights
- Certain categories contain a significantly higher number of products
- Product prices vary widely across categories
- Discounts are concentrated in specific product groups
- Cleaned data improves accuracy of analysis

---

## 📁 Files in Repository
- zepto_analysis.sql – SQL queries for data cleaning and EDA
- README.md – Project documentation



- Removed duplicate records using ROW_NUMBER()
- Used staging tables to safely delete duplicates
- …
