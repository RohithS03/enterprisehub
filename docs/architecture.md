# Architecture: EnterpriseHub DBMS Platform

This document outlines the architecture of the **EnterpriseHub** DBMS and SQL operations platform.

---

## High-Level Architecture

```
+-------------------------------------------------------------+
|                      React + Vite UI                        |
|   (Dashboard, Schema Explorer, Query Catalog, Playground)   |
+------------------------------+------------------------------+
                               | REST API (HTTP/JSON)
                               v
+-------------------------------------------------------------+
|                     Flask Backend API                       |
|   (/api/metadata, /api/queries, /api/sql/execute, /api/viva) |
+------------------------------+------------------------------+
                               |
                               v
+-------------------------------------------------------------+
|                    EnterpriseHub Database                   |
|   - 18 Relational Tables across 5 Modules                   |
|   - 400+ Seeded Tuples, PK/FK Constraints                   |
|   - Views, B-Tree Indexes, Procedures, Triggers, ACID       |
+-------------------------------------------------------------+
```

---

## Relational Modules

1. **Organization**: `departments`, `employees`, `locations`
2. **Project Management**: `projects`, `employee_projects`
3. **Sales & Customers**: `customers`, `salespersons`, `orders`, `order_items`
4. **Inventory & Supplies**: `categories`, `products`, `suppliers`, `warehouses`, `inventory`
5. **Resource / Library**: `publishers`, `authors`, `books`, `book_authors`, `library_branches`, `book_copies`, `members`, `book_lending`
6. **Audit**: `employee_salary_audit`
