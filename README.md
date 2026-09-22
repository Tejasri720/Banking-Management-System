# 🏦 Banking Management System – MySQL

A **MySQL-based Banking Management System** developed as a database capstone project to manage bank branches, customers, account types, accounts, and transactions.

The project demonstrates practical implementation of SQL and MySQL concepts including **CRUD operations, joins, aggregate functions, subqueries, string and numeric functions, date functions, views, transactions, stored procedures, and triggers**.

---

## 📌 Project Objective

The objective of this project is to design and implement a **Banking Management System using MySQL** to efficiently manage customers, branches, accounts, account types, and transactions while maintaining data consistency and accuracy.

---

## 🎯 Problem Statement

Banks need to securely maintain customer account information and transaction records while ensuring **data consistency, accuracy, and efficient retrieval of information**.

This project provides a structured relational database for managing and analyzing banking-related information.

---

## 🗄️ Database Design

The project uses a database named:

```sql
bank
```

### Main Tables

The database consists of five main tables:

1. **Branches**
2. **Customers**
3. **Account_Types**
4. **Accounts**
5. **Transactions**

### Table Relationships

```text
Branches
   │
   │ branch_id
   ▼
Accounts ◄──── Customers
   │
   │ account_type_id
   ▼
Account_Types

Accounts
   │
   │ account_id
   ▼
Transactions
```

The `Accounts` table connects customers, branches, and account types, while the `Transactions` table is associated with individual accounts.

---

## 📋 Tables and Purpose

### 1. Branches

Stores information about bank branches.

| Column      | Description              |
| ----------- | ------------------------ |
| branch_id   | Unique branch identifier |
| branch_name | Name of the branch       |
| location    | Branch location          |
| ifsc_code   | IFSC code                |

### 2. Customers

Stores customer information.

| Column        | Description                |
| ------------- | -------------------------- |
| customer_id   | Unique customer identifier |
| customer_name | Customer name              |
| phone         | Customer phone number      |
| email         | Customer email             |
| address       | Customer address           |

### 3. Account_Types

Stores different types of bank accounts.

| Column            | Description                    |
| ----------------- | ------------------------------ |
| account_type_id   | Unique account type identifier |
| account_type_name | Savings / Current              |

### 4. Accounts

Stores customer account details.

| Column          | Description               |
| --------------- | ------------------------- |
| account_id      | Unique account identifier |
| branch_id       | Related branch            |
| customer_id     | Related customer          |
| account_type_id | Related account type      |
| account_number  | Bank account number       |
| balance         | Current account balance   |
| opening_date    | Account opening date      |
| status          | Active / Inactive         |

### 5. Transactions

Stores banking transaction records.

| Column           | Description                     |
| ---------------- | ------------------------------- |
| transaction_id   | Unique transaction identifier   |
| account_id       | Related account                 |
| transaction_type | Deposit / Withdrawal / Transfer |
| amount           | Transaction amount              |
| transaction_date | Transaction date                |
| description      | Transaction description         |

---

## 📊 Sample Data

The project includes sample data for:

* **10 Customers**
* **10 Branches**
* **2 Account Types**
* **15 Accounts**
* **30 Transactions**

### Account Types

| ID | Account Type |
| -: | ------------ |
|  1 | Savings      |
|  2 | Current      |

### Sample Accounts

| Account ID | Account Number | Type    |   Balance | Status |
| ---------: | -------------- | ------- | --------: | ------ |
|        101 | 100000001      | Savings |   ₹25,000 | Active |
|        102 | 100000002      | Savings |   ₹50,000 | Active |
|        103 | 200000003      | Current | ₹1,20,000 | Active |
|        104 | 100000004      | Savings |   ₹35,000 | Active |
|        105 | 100000005      | Savings |   ₹65,000 | Active |

---

# 🛠️ Technologies Used

* **MySQL**
* SQL
* MySQL Workbench

---

# 📚 SQL Concepts Implemented

## 1. CRUD Operations

Basic database operations:

* **Create** – `INSERT`
* **Read** – `SELECT`
* **Update** – `UPDATE`
* **Delete** – `DELETE`

---

## 2. Joins

The project uses joins to retrieve information from multiple related tables.

Example:

```sql
SELECT c.customer_name,
       a.account_number,
       at.account_type_name
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN account_types at
    ON at.account_type_id = a.account_type_id;
```

This combines information from the **Customers, Accounts, and Account_Types** tables.

---

## 3. Aggregate Functions

The project uses:

* `SUM()`
* `COUNT()`
* `AVG()`
* `MAX()`
* `MIN()`

Example:

```sql
SELECT
    MAX(balance) AS highest_balance,
    MIN(balance) AS lowest_balance,
    AVG(balance) AS average_balance
FROM accounts;
```

---

## 4. GROUP BY and HAVING

Example:

```sql
SELECT
    c.customer_name,
    COUNT(a.account_id) AS account_count
FROM accounts a
JOIN customers c
    ON c.customer_id = a.customer_id
GROUP BY c.customer_name
HAVING COUNT(a.account_id) > 1;
```

This identifies customers who own more than one account.

---

## 5. Subqueries

Example:

```sql
SELECT account_id, balance
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
);
```

The inner query calculates the average balance, and the outer query displays accounts with balances above that average.

---

## 6. String Functions

Functions used include:

* `UPPER()`
* `CONCAT()`

Example:

```sql
SELECT UPPER(c.customer_name),
       ROUND(a.balance)
FROM customers c
JOIN accounts a
    ON a.customer_id = c.customer_id;
```

---

## 7. Numeric Functions

The project uses:

* `ROUND()`
* `CEIL()`
* `FLOOR()`
* `ABS()`

Example:

```sql
SELECT
    CEIL(amount) AS ceiling_value,
    FLOOR(amount) AS floor_value
FROM transactions;
```

---

## 8. Date Functions

The project uses date-related functions such as:

* `MONTH()`
* `MONTHNAME()`

Example:

```sql
SELECT
    MONTHNAME(transaction_date) AS month_name,
    ROUND(SUM(amount), 2) AS total_amount
FROM transactions
GROUP BY MONTH(transaction_date),
         MONTHNAME(transaction_date);
```

---

# 👁️ Views

A view is created to display active account details along with customer and branch information.

```sql
CREATE VIEW active_customers AS
SELECT
    a.branch_id,
    a.customer_id,
    a.account_type_id,
    a.account_number,
    a.balance,
    a.opening_date,
    a.status,
    c.customer_name,
    c.phone,
    c.email,
    c.address,
    b.branch_name,
    b.location,
    b.ifsc_code
FROM accounts a
JOIN customers c
    ON a.customer_id = c.customer_id
JOIN branches b
    ON a.branch_id = b.branch_id
WHERE a.status = 'active';
```

The view can then be accessed using:

```sql
SELECT * FROM active_customers;
```

---

# 💳 Transaction Management

The project demonstrates transaction control using:

* `START TRANSACTION`
* `COMMIT`
* `ROLLBACK`

### Example: Transfer ₹10,000

```sql
START TRANSACTION;

UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 101;

UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 102;

COMMIT;
```

If the operation needs to be cancelled:

```sql
ROLLBACK;
```

This demonstrates transaction handling and data consistency.

---

# ⚙️ Stored Procedures

The project includes stored procedures for reusable database operations.

### Customer Account Procedure

Displays accounts belonging to a particular customer.

```sql
CALL customer_accounts(4);
```

### Account Transactions Procedure

Displays transactions associated with a particular account.

```sql
CALL account_transactions(101);
```

---

# 🔔 Triggers

The project includes trigger concepts for automating database operations.

### Transaction Log Trigger

When a new transaction is inserted, the transaction details can automatically be recorded in the `Transaction_Log` table.

The logged information includes:

* Transaction ID
* Account ID
* Transaction Type
* Amount
* Transaction Date

### Negative Balance Validation

Another trigger requirement is to prevent an account balance from being updated to a negative value.

---

# 📈 Business Queries

The project includes queries for:

* Customer details
* Active and inactive accounts
* Customer-account information
* Branch-wise information
* Highest account balance
* Total deposits
* Total account balance
* Highest, lowest and average balances
* Deposit and withdrawal totals
* Branch-wise customer count
* Savings and Current account counts
* Customers with multiple accounts
* Latest transaction for each account
* Accounts above average balance
* Monthly transaction summaries
* Top 5 accounts by balance
* Transaction counts by type

---

# 📂 Project Structure

```text
Banking-Management-System/
│
├── Banking_Management_System.sql
│
├── README.md
│
└── Banking_Management_System.pdf
```

---

# 🚀 How to Run the Project

### Step 1: Install MySQL

Install **MySQL Server** and **MySQL Workbench**.

### Step 2: Open the SQL File

Open:

```text
Banking_Management_System.sql
```

in MySQL Workbench.

### Step 3: Create the Database

```sql
CREATE DATABASE bank;
USE bank;
```

### Step 4: Execute the SQL Script

Run the table creation and sample data insertion statements.

### Step 5: Execute the Queries

Run the business-report queries to analyze the banking data.

---

# 🎓 Learning Outcomes

Through this project, I gained practical experience in:

* Relational database design
* Primary and foreign keys
* Data manipulation
* SQL querying
* Multi-table joins
* Aggregate functions
* Data grouping and filtering
* Subqueries
* SQL functions
* Views
* Transaction management
* Stored procedures
* Database triggers

---

# 👩‍💻 Author

**Kadavakollu Tejasri**

B.Tech – Electronics and Communication Engineering

---

## ⭐ Project Highlights

> **A practical MySQL database project demonstrating how SQL concepts can be applied to a real-world Banking Management System.**

If you find this project useful, feel free to ⭐ the repository!
