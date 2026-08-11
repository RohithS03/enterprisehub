# Database Design & Schema Specifications

---

## Relational Tables Summary

| Table Name | Primary Key | Key Foreign Keys | Purpose |
| :--- | :--- | :--- | :--- |
| `locations` | `location_id` | - | Physical office, warehouse & branch cities |
| `departments` | `department_id` | `location_id`, `manager_id` | Organizational structure |
| `employees` | `employee_id` | `department_id`, `manager_id` | Staff records, salaries & hierarchy |
| `projects` | `project_id` | `department_id` | Enterprise projects & budgets |
| `employee_projects` | `(employee_id, project_id)` | `employee_id`, `project_id` | Junction table for M:N project assignment |
| `salespersons` | `salesperson_id` | - | Sales reps & commission rates |
| `customers` | `customer_id` | `salesperson_id` | Customer profiles & grades |
| `orders` | `order_id` | `customer_id`, `salesperson_id` | Customer purchase orders |
| `order_items` | `(order_id, product_id)` | `order_id`, `product_id` | Order line items & unit pricing |
| `categories` | `category_id` | - | Product category taxonomy |
| `suppliers` | `supplier_id` | - | Equipment suppliers |
| `products` | `product_id` | `category_id`, `supplier_id` | Product catalog & global stock |
| `warehouses` | `warehouse_id` | `location_id` | Distribution warehouses |
| `inventory` | `(warehouse_id, product_id)` | `warehouse_id`, `product_id` | Warehouse stock allocations |
| `publishers` | `publisher_id` | - | Book publishing companies |
| `authors` | `author_id` | - | Book authors |
| `books` | `book_id` | `publisher_id` | Library catalog titles |
| `book_authors` | `(book_id, author_id)` | `book_id`, `author_id` | M:N Book-Author mapping |
| `library_branches` | `branch_id` | - | Physical library branches |
| `book_copies` | `(book_id, branch_id)` | `book_id`, `branch_id` | Copies per branch |
| `members` | `member_id` | - | Library borrowers |
| `book_lending` | `lending_id` | `book_id`, `branch_id`, `member_id` | Loan tracking |
| `employee_salary_audit` | `audit_id` | - | Salary update audit log |
