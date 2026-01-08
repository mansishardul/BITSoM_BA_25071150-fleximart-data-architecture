
# FlexiMart Database Schema Documentation

## 1. Entity Overview

### customers
Stores customer details.

**Fields:**
- customer_id (PK)
- first_name
- last_name
- email
- phone
- city
- registration_date

**Relationship:**  
One customer can have many sales.

---

### products
Stores product information.

**Fields:**
- product_id (PK)
- product_name
- category
- price
- stock_quantity

**Relationship:**  
One product can appear in many sales.

---

### sales
Stores sales transactions.

**Fields:**
- transaction_id (PK)
- customer_id (FK)
- product_id (FK)
- quantity
- unit_price
- transaction_date
- status

**Relationship:**  
Each sale belongs to one customer and one product.

---

## 2. Normalization (3NF)

The database follows Third Normal Form (3NF):
- Each table has a primary key.
- All non-key fields depend only on the primary key.
- No duplicate or unnecessary data.

**Benefits:**
- Easy updates
- No data duplication
- Safe insert and delete operations

---

## 3. Sample Data

### customers
| customer_id | first_name | city   |
|------------|------------|--------|
| C001 | Rahul | Delhi |
| C002 | Anita | Mumbai |

### products
| product_id | product_name | price |
|-----------|--------------|-------|
| P001 | Laptop | 55000 |
| P002 | Headphones | 2500 |

### sales
| transaction_id | customer_id | product_id | quantity |
|---------------|------------|------------|----------|
| T001 | C001 | P001 | 1 |
| T002 | C002 | P002 | 2 |

---

## Conclusion

This schema is simple, well-organized, and normalized to 3NF. It supports reliable sales tracking while keeping customer and product data consistent.
