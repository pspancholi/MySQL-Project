# 🗂 Criminal Management System – SQL Project

## 📌 Project Overview

This project demonstrates practical SQL query implementation on a criminal case management database. The system models the relationship between criminals, officers, and cases.

- A criminal can be involved in multiple cases.
- An officer can handle multiple cases.
- Each case is linked to one criminal and one officer.

The objective of this project is to practice real-world SQL querying techniques including joins, grouping, filtering, aggregation, and subqueries.

---

## 📊 Queries Executed

### 1️⃣ Officers Who Have Not Handled Any Cases
Identified officers who are not assigned to any case using a LEFT JOIN and NULL filtering logic.

### 2️⃣ Criminals With or Without Cases
Displayed all criminals along with their case IDs, including criminals who do not have any registered case.

### 3️⃣ Open Cases of a Specific Type
Filtered cases based on case type and status to display only active (open) cases of a particular category.

### 4️⃣ Criminals Based on Name Pattern
Retrieved criminals whose names start with a specific letter using pattern matching.

### 5️⃣ Total Cases Handled by Each Officer
Calculated how many cases each officer has handled using GROUP BY and COUNT functions.

### 6️⃣ Officers Handling More Than a Certain Number of Cases
Filtered grouped results using HAVING to show only officers who handled more than a specified number of cases.

### 7️⃣ Criminals Arrested After a Specific Date
Filtered criminals based on arrest date to identify recent arrests.

### 8️⃣ Cases Based on Criminal’s City
Displayed cases where the associated criminal belongs to a specific city using JOIN operations.

### 9️⃣ Criminals Involved in Multiple Cases
Identified repeat offenders by counting the number of cases associated with each criminal.

### 🔟 Officer Handling the Maximum Number of Cases
Used aggregation and a subquery to determine which officer has handled the highest number of cases.

---

## 🎯 SQL Concepts Covered

- One-to-Many Relationships  
- LEFT JOIN  
- GROUP BY  
- HAVING Clause  
- Aggregate Functions (COUNT)  
- Subqueries  
- WHERE Filtering  
- Pattern Matching (LIKE)  
- Date Filtering  

---

## 🚀 Skills Demonstrated

- Relational database understanding  
- Analytical SQL query writing  
- Data filtering and aggregation  
- Business-oriented problem solving  
- Handling NULL values  
- Working with grouped data  

---

