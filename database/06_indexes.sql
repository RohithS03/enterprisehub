-- EnterpriseHub Database Indexes

CREATE INDEX idx_emp_email ON employees(email);
CREATE INDEX idx_emp_dept ON employees(department_id);
CREATE INDEX idx_emp_manager ON employees(manager_id);

CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_salesperson ON orders(salesperson_id);
CREATE INDEX idx_orders_date ON orders(order_date);

CREATE INDEX idx_prod_category ON products(category_id);
CREATE INDEX idx_prod_supplier ON products(supplier_id);

CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_lending_member ON book_lending(member_id);
