-- EnterpriseHub Database Views

-- 1. employee_department_view (Employee + Department + Location)
CREATE OR REPLACE VIEW employee_department_view AS
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    e.email,
    e.salary,
    d.department_name,
    l.city AS location_city,
    l.country AS location_country
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
LEFT JOIN locations l ON d.location_id = l.location_id;

-- 2. customer_sales_view (Customer + Salesperson + Order Totals)
CREATE OR REPLACE VIEW customer_sales_view AS
SELECT 
    c.customer_id,
    c.customer_name,
    c.city AS customer_city,
    s.name AS salesperson_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0.00) AS lifetime_spending
FROM customers c
LEFT JOIN salespersons s ON c.salesperson_id = s.salesperson_id
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.city, s.name;

-- 3. product_inventory_view (Product + Category + Warehouse + Stock)
CREATE OR REPLACE VIEW product_inventory_view AS
SELECT 
    p.product_id,
    p.product_name,
    cat.category_name,
    p.price,
    p.stock_quantity AS global_catalog_stock,
    COALESCE(SUM(i.quantity), 0) AS warehouse_allocated_stock
FROM products p
LEFT JOIN categories cat ON p.category_id = cat.category_id
LEFT JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.product_id, p.product_name, cat.category_name, p.price, p.stock_quantity;

-- 4. available_books_view (Book + Branch + Available Copies)
CREATE OR REPLACE VIEW available_books_view AS
SELECT 
    b.book_id,
    b.title,
    pub.publisher_name,
    lb.branch_name,
    bc.number_of_copies
FROM books b
JOIN book_copies bc ON b.book_id = bc.book_id
JOIN library_branches lb ON bc.branch_id = lb.branch_id
LEFT JOIN publishers pub ON b.publisher_id = pub.publisher_id;

-- 5. project_employee_view (Project + Assigned Employees + Working Hours)
CREATE OR REPLACE VIEW project_employee_view AS
SELECT 
    p.project_id,
    p.project_name,
    d.department_name,
    COUNT(ep.employee_id) AS assigned_employees,
    COALESCE(SUM(ep.hours_worked), 0.00) AS total_hours_logged
FROM projects p
LEFT JOIN departments d ON p.department_id = d.department_id
LEFT JOIN employee_projects ep ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name, d.department_name;
