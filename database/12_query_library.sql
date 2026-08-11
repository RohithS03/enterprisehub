-- EnterpriseHub Master SQL Query Library (100+ Unique Executable Queries)

-- ========================================================
-- CATEGORY 1: BASIC SELECT, WHERE, LIKE, IN, ORDER BY (20 QUERIES)
-- ========================================================

-- Q1: Select all employees with basic details
SELECT employee_id, first_name, last_name, email, salary FROM employees;

-- Q2: Select employees with salary greater than 100,000
SELECT * FROM employees WHERE salary > 100000.00;

-- Q3: Distinct employee genders
SELECT DISTINCT gender FROM employees;

-- Q4: Employees hired between 2020 and 2022
SELECT * FROM employees WHERE hire_date BETWEEN '2020-01-01' AND '2022-12-31';

-- Q5: Employees belonging to Engineering or Research departments (IDs 2, 6)
SELECT * FROM employees WHERE department_id IN (2, 6);

-- Q6: Employees not in Sales or HR departments
SELECT * FROM employees WHERE department_id NOT IN (3, 4);

-- Q7: Employees with email ending in '@enterprise.com'
SELECT * FROM employees WHERE email LIKE '%@enterprise.com';

-- Q8: Customers located in New York or Chicago
SELECT * FROM customers WHERE city IN ('New York', 'Chicago');

-- Q9: Products with price between $500 and $2000 ordered by price descending
SELECT * FROM products WHERE price BETWEEN 500 AND 2000 ORDER BY price DESC;

-- Q10: Top 5 highest paid employees
SELECT employee_id, first_name, last_name, salary FROM employees ORDER BY salary DESC LIMIT 5;

-- Q11: Employees with phone numbers starting with '555-01'
SELECT * FROM employees WHERE phone LIKE '555-01%';

-- Q12: Projects with budget greater than $300,000 and starting in 2022
SELECT * FROM projects WHERE budget > 300000 AND start_date >= '2022-01-01';

-- Q13: Completed orders ordered by total amount descending
SELECT * FROM orders WHERE status = 'Completed' ORDER BY total_amount DESC;

-- Q14: Products with stock quantity less than 40 units
SELECT * FROM products WHERE stock_quantity < 40;

-- Q15: Books published after 2015
SELECT * FROM books WHERE publication_year > 2015;

-- Q16: Grade A customers located in New York
SELECT * FROM customers WHERE customer_grade = 'A' AND city = 'New York';

-- Q17: Employees without a manager assigned
SELECT * FROM employees WHERE manager_id IS NULL;

-- Q18: Orders placed in the month of March 2023
SELECT * FROM orders WHERE order_date BETWEEN '2023-03-01' AND '2023-03-31';

-- Q19: Top 10 cheapest products in catalog
SELECT product_name, price FROM products ORDER BY price ASC LIMIT 10;

-- Q20: Paginated employee query (Page 2, Limit 5 offset 5)
SELECT employee_id, first_name, last_name FROM employees ORDER BY employee_id LIMIT 5 OFFSET 5;


-- ========================================================
-- CATEGORY 2: AGGREGATE FUNCTIONS & GROUP BY / HAVING (15 QUERIES)
-- ========================================================

-- Q21: Total salary expenditure across company
SELECT SUM(salary) AS total_payroll FROM employees;

-- Q22: Average employee salary
SELECT AVG(salary) AS avg_company_salary FROM employees;

-- Q23: Minimum and Maximum employee salary
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM employees;

-- Q24: Total count of employees per department
SELECT department_id, COUNT(*) AS emp_count FROM employees GROUP BY department_id;

-- Q25: Average salary per department
SELECT department_id, AVG(salary) AS avg_salary FROM employees GROUP BY department_id;

-- Q26: Departments with more than 5 employees (HAVING clause)
SELECT department_id, COUNT(*) AS emp_count FROM employees GROUP BY department_id HAVING COUNT(*) > 5;

-- Q27: Total sales volume per customer
SELECT customer_id, SUM(total_amount) AS lifetime_spent FROM orders GROUP BY customer_id;

-- Q28: Customers who spent more than $30,000 total (HAVING clause)
SELECT customer_id, SUM(total_amount) AS total_spent FROM orders GROUP BY customer_id HAVING SUM(total_amount) > 30000;

-- Q29: Average product price per category
SELECT category_id, AVG(price) AS avg_cat_price FROM products GROUP BY category_id;

-- Q30: Categories with average price greater than $1,000
SELECT category_id, AVG(price) AS avg_price FROM products GROUP BY category_id HAVING AVG(price) > 1000;

-- Q31: Total stock quantity per warehouse
SELECT warehouse_id, SUM(quantity) AS total_stock FROM inventory GROUP BY warehouse_id;

-- Q32: Number of books per publisher
SELECT publisher_id, COUNT(*) AS book_count FROM books GROUP BY publisher_id;

-- Q33: Publishers with more than 3 books published
SELECT publisher_id, COUNT(*) AS book_count FROM books GROUP BY publisher_id HAVING COUNT(*) > 3;

-- Q34: Salespersons managing more than 3 customers
SELECT salesperson_id, COUNT(*) AS customer_count FROM customers GROUP BY salesperson_id HAVING COUNT(*) > 3;

-- Q35: Count of orders by order status
SELECT status, COUNT(*) AS order_count FROM orders GROUP BY status;


-- ========================================================
-- CATEGORY 3: JOINS (INNER, LEFT, RIGHT, CROSS, SELF) (15 QUERIES)
-- ========================================================

-- Q36: INNER JOIN: Employee Name and Department Name
SELECT e.first_name, e.last_name, d.department_name FROM employees e INNER JOIN departments d ON e.department_id = d.department_id;

-- Q37: LEFT JOIN: All Employees and Department Name (includes employees without department)
SELECT e.first_name, e.last_name, d.department_name FROM employees e LEFT JOIN departments d ON e.department_id = d.department_id;

-- Q38: SELF JOIN: Employee Name and Manager Name
SELECT e.first_name AS employee, m.first_name AS manager FROM employees e LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- Q39: Customer Name and Assigned Salesperson Name
SELECT c.customer_name, s.name AS salesperson_name FROM customers c LEFT JOIN salespersons s ON c.salesperson_id = s.salesperson_id;

-- Q40: Orders with Customer Name and Order Total
SELECT o.order_id, o.order_date, c.customer_name, o.total_amount FROM orders o JOIN customers c ON o.customer_id = c.customer_id;

-- Q41: Products with Category Name and Supplier Name
SELECT p.product_name, c.category_name, s.supplier_name, p.price FROM products p JOIN categories c ON p.category_id = c.category_id JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- Q42: Books with Publisher Name and Publication Year
SELECT b.title, p.publisher_name, b.publication_year FROM books b JOIN publishers p ON b.publisher_id = p.publisher_id;

-- Q43: Books and Author Names
SELECT b.title, a.author_name FROM books b JOIN book_authors ba ON b.book_id = ba.book_id JOIN authors a ON ba.author_id = a.author_id;

-- Q44: Library Book Copies per Branch
SELECT b.title, lb.branch_name, bc.number_of_copies FROM book_copies bc JOIN books b ON bc.book_id = b.book_id JOIN library_branches lb ON bc.branch_id = lb.branch_id;

-- Q45: Employee Project Hours Worked
SELECT e.first_name, e.last_name, p.project_name, ep.hours_worked FROM employee_projects ep JOIN employees e ON ep.employee_id = e.employee_id JOIN projects p ON ep.project_id = p.project_id;

-- Q46: Department Name and Location City
SELECT d.department_name, l.city, l.country FROM departments d JOIN locations l ON d.location_id = l.location_id;

-- Q47: Warehouses and Location Details
SELECT w.warehouse_name, l.city, l.state FROM warehouses w JOIN locations l ON w.location_id = l.location_id;

-- Q48: CROSS JOIN: Category and Supplier Combination Matrix
SELECT c.category_name, s.supplier_name FROM categories c CROSS JOIN suppliers s LIMIT 20;

-- Q49: Order Items with Product Name and Subtotal
SELECT oi.order_id, p.product_name, oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) AS subtotal FROM order_items oi JOIN products p ON oi.product_id = p.product_id;

-- Q50: Book Lending Details (Member Name, Book Title, Branch Name)
SELECT bl.lending_id, m.member_name, b.title, lb.branch_name, bl.date_out, bl.due_date FROM book_lending bl JOIN members m ON bl.member_id = m.member_id JOIN books b ON bl.book_id = b.book_id JOIN library_branches lb ON bl.branch_id = lb.branch_id;


-- ========================================================
-- CATEGORY 4: SUBQUERIES & CORRELATED SUBQUERIES (15 QUERIES)
-- ========================================================

-- Q51: Scalar Subquery: Employees earning more than company average salary
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

-- Q52: Single-Row Subquery: Employee with the maximum salary
SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);

-- Q53: Multi-Row Subquery (IN): Employees in departments located in USA
SELECT * FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE location_id IN (SELECT location_id FROM locations WHERE country = 'USA'));

-- Q54: Correlated Subquery: Employees earning more than average salary of their OWN department
SELECT e.employee_id, e.first_name, e.last_name, e.salary, e.department_id FROM employees e WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);

-- Q55: EXISTS: Customers who have placed at least one order
SELECT c.customer_id, c.customer_name FROM customers c WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id);

-- Q56: NOT EXISTS: Customers who have NEVER placed an order
SELECT c.customer_id, c.customer_name FROM customers c WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id);

-- Q57: Products that have NEVER been ordered
SELECT p.product_id, p.product_name FROM products p WHERE NOT EXISTS (SELECT 1 FROM order_items oi WHERE oi.product_id = p.product_id);

-- Q58: Employees assigned to at least one project
SELECT e.employee_id, e.first_name, e.last_name FROM employees e WHERE EXISTS (SELECT 1 FROM employee_projects ep WHERE ep.employee_id = e.employee_id);

-- Q59: Employees NOT assigned to any project
SELECT e.employee_id, e.first_name, e.last_name FROM employees e WHERE NOT EXISTS (SELECT 1 FROM employee_projects ep WHERE ep.employee_id = e.employee_id);

-- Q60: Department with the highest average salary
SELECT department_id, AVG(salary) FROM employees GROUP BY department_id ORDER BY AVG(salary) DESC LIMIT 1;

-- Q61: Customers spending more than average customer spending
SELECT customer_id, SUM(total_amount) FROM orders GROUP BY customer_id HAVING SUM(total_amount) > (SELECT AVG(total_amount) FROM orders);

-- Q62: Books written by authors who have authored more than 1 book
SELECT b.title FROM books b WHERE b.book_id IN (SELECT ba.book_id FROM book_authors ba WHERE ba.author_id IN (SELECT author_id FROM book_authors GROUP BY author_id HAVING COUNT(*) > 1));

-- Q63: Employees earning more than their manager
SELECT e.first_name AS emp_name, e.salary AS emp_salary, m.first_name AS mgr_name, m.salary AS mgr_salary FROM employees e JOIN employees m ON e.manager_id = m.employee_id WHERE e.salary > m.salary;

-- Q64: Second highest employee salary
SELECT MAX(salary) AS second_highest FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);

-- Q65: Nth Highest Salary (3rd highest salary using subquery)
SELECT MIN(salary) FROM (SELECT DISTINCT salary FROM employees ORDER BY salary DESC LIMIT 3) AS top3;


-- ========================================================
-- CATEGORY 5: ADVANCED WINDOW FUNCTIONS (10 QUERIES)
-- ========================================================

-- Q66: ROW_NUMBER() Employee salary rank across company
SELECT employee_id, first_name, salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS salary_rank FROM employees;

-- Q67: RANK() Salary rank within department
SELECT employee_id, first_name, department_id, salary, RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dept_salary_rank FROM employees;

-- Q68: DENSE_RANK() Salary rank within department without gaps
SELECT employee_id, first_name, department_id, salary, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_rank FROM employees;

-- Q69: Top 3 highest paid employees per department using CTE/Window Function
WITH RankedEmps AS (
    SELECT employee_id, first_name, department_id, salary, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) as rk FROM employees
)
SELECT * FROM RankedEmps WHERE rk <= 3;

-- Q70: Running Total of Order Sales over time
SELECT order_id, order_date, total_amount, SUM(total_amount) OVER (ORDER BY order_date) AS running_total FROM orders;

-- Q71: LAG() Previous order total for customer comparison
SELECT order_id, customer_id, order_date, total_amount, LAG(total_amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_amount FROM orders;

-- Q72: LEAD() Next order total for customer analysis
SELECT order_id, customer_id, order_date, total_amount, LEAD(total_amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_order_amount FROM orders;

-- Q73: Difference between current order and previous order total
SELECT order_id, customer_id, total_amount, total_amount - LAG(total_amount, 1, total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS diff_from_prev FROM orders;

-- Q74: Average department salary alongside employee salary using OVER(PARTITION BY)
SELECT employee_id, first_name, salary, department_id, AVG(salary) OVER (PARTITION BY department_id) AS dept_avg_salary FROM employees;

-- Q75: Percentile rank of employee salary
SELECT employee_id, first_name, salary, PERCENT_RANK() OVER (ORDER BY salary) AS salary_percentile FROM employees;


-- ========================================================
-- CATEGORY 6: SET OPERATIONS, CASE, STRING, DATE (15 QUERIES)
-- ========================================================

-- Q76: UNION: Cities of employees UNION Cities of customers
SELECT city FROM locations UNION SELECT city FROM customers;

-- Q77: UNION ALL: All customer cities and supplier cities
SELECT city FROM customers UNION ALL SELECT city FROM suppliers;

-- Q78: CASE Statement: Salary level classification
SELECT first_name, salary, CASE WHEN salary >= 120000 THEN 'Executive' WHEN salary >= 80000 THEN 'Senior' ELSE 'Mid/Junior' END AS salary_tier FROM employees;

-- Q79: CASE Statement: Customer Tier classification
SELECT customer_name, customer_grade, CASE customer_grade WHEN 'A' THEN 'VIP Platinum' WHEN 'B' THEN 'Gold Preferred' ELSE 'Standard' END AS tier_name FROM customers;

-- Q80: CASE Statement: Product Stock Level status
SELECT product_name, stock_quantity, CASE WHEN stock_quantity = 0 THEN 'Out of Stock' WHEN stock_quantity < 30 THEN 'Low Stock' ELSE 'Sufficient' END AS stock_status FROM products;

-- Q81: CONCAT: Employee full name and formatted email
SELECT CONCAT(first_name, ' ', last_name) AS full_name, LOWER(email) AS clean_email FROM employees;

-- Q82: UPPER and LENGTH: Upper case product name and title length
SELECT UPPER(product_name), LENGTH(product_name) AS char_count FROM products;

-- Q83: SUBSTRING and TRIM: Extract domain from employee email
SELECT email, SUBSTRING(email, INSTR(email, '@') + 1) AS domain FROM employees;

-- Q84: DATEDIFF: Calculate employee tenure in days
SELECT first_name, hire_date, DATEDIFF(CURDATE(), hire_date) AS tenure_days FROM employees;

-- Q85: YEAR and MONTH: Extract year and month of orders
SELECT order_id, YEAR(order_date) AS order_year, MONTH(order_date) AS order_month FROM orders;

-- Q86: ROUND and CEIL: Price calculations
SELECT product_name, price, ROUND(price, 0) AS rounded_price, CEIL(price) AS ceiling_price FROM products;

-- Q87: DATE_ADD: Calculate due date (+14 days)
SELECT order_id, order_date, DATE_ADD(order_date, INTERVAL 14 DAY) AS payment_due_date FROM orders;

-- Q88: Overdue Book Lending Records
SELECT * FROM book_lending WHERE date_returned IS NULL AND due_date < CURDATE();

-- Q89: Projects duration in months
SELECT project_name, TIMESTAMPDIFF(MONTH, start_date, end_date) AS duration_months FROM projects WHERE end_date IS NOT NULL;

-- Q90: Monthly Revenue summary
SELECT YEAR(order_date) AS yr, MONTH(order_date) AS mth, SUM(total_amount) AS monthly_revenue FROM orders GROUP BY YEAR(order_date), MONTH(order_date);


-- ========================================================
-- CATEGORY 7: ADVANCED RELATIONAL INTERVIEW CHALLENGES (10 QUERIES)
-- ========================================================

-- Q91: Employees working on ALL projects of department #2
SELECT e.employee_id, e.first_name FROM employees e WHERE NOT EXISTS (
    SELECT p.project_id FROM projects p WHERE p.department_id = 2 AND NOT EXISTS (
        SELECT ep.project_id FROM employee_projects ep WHERE ep.employee_id = e.employee_id AND ep.project_id = p.project_id
    )
);

-- Q92: Customers sharing same city but having different salespersons
SELECT c1.customer_name AS customer1, c2.customer_name AS customer2, c1.city FROM customers c1 JOIN customers c2 ON c1.city = c2.city AND c1.customer_id < c2.customer_id WHERE c1.salesperson_id <> c2.salesperson_id;

-- Q93: Most expensive product in every category
SELECT p.product_name, p.category_id, p.price FROM products p WHERE p.price = (SELECT MAX(price) FROM products WHERE category_id = p.category_id);

-- Q94: Third highest order value
SELECT DISTINCT total_amount FROM orders ORDER BY total_amount DESC LIMIT 1 OFFSET 2;

-- Q95: Top 3 customers by total spending
SELECT c.customer_name, SUM(o.total_amount) AS total_spent FROM customers c JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.customer_id, c.customer_name ORDER BY total_spent DESC LIMIT 3;

-- Q96: Departments with no assigned projects
SELECT d.department_name FROM departments d LEFT JOIN projects p ON d.department_id = p.department_id WHERE p.project_id IS NULL;

-- Q97: Projects with no assigned employees
SELECT p.project_name FROM projects p LEFT JOIN employee_projects ep ON p.project_id = ep.project_id WHERE ep.employee_id IS NULL;

-- Q98: Books borrowed more than average number of lending times
SELECT b.title, COUNT(bl.lending_id) AS borrow_count FROM books b JOIN book_lending bl ON b.book_id = bl.book_id GROUP BY b.book_id, b.title HAVING COUNT(bl.lending_id) > (SELECT COUNT(*)/COUNT(DISTINCT book_id) FROM book_lending);

-- Q99: Authors whose books exist in more than 1 branch
SELECT a.author_name FROM authors a JOIN book_authors ba ON a.author_id = ba.author_id JOIN book_copies bc ON ba.book_id = bc.book_id GROUP BY a.author_id, a.author_name HAVING COUNT(DISTINCT bc.branch_id) > 1;

-- Q100: Employees whose salary is in the top 10% of company
SELECT employee_id, first_name, salary FROM (SELECT employee_id, first_name, salary, PERCENT_RANK() OVER (ORDER BY salary) AS pr FROM employees) AS ranked WHERE pr >= 0.90;
