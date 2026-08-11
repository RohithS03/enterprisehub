-- EnterpriseHub Stored Procedures

-- 1. Get Employee Details with Department & Manager
DELIMITER //
CREATE PROCEDURE GetEmployeeDetails(IN emp_id INT)
BEGIN
    SELECT 
        e.employee_id,
        CONCAT(e.first_name, ' ', e.last_name) AS full_name,
        e.email,
        e.salary,
        e.hire_date,
        d.department_name,
        CONCAT(m.first_name, ' ', m.last_name) AS manager_name
    FROM employees e
    LEFT JOIN departments d ON e.department_id = d.department_id
    LEFT JOIN employees m ON e.manager_id = m.employee_id
    WHERE e.employee_id = emp_id;
END //
DELIMITER ;

-- 2. Get Low Stock Products below threshold
DELIMITER //
CREATE PROCEDURE GetLowStockProducts(IN threshold INT)
BEGIN
    SELECT 
        product_id,
        product_name,
        price,
        stock_quantity
    FROM products
    WHERE stock_quantity <= threshold
    ORDER BY stock_quantity ASC;
END //
DELIMITER ;
