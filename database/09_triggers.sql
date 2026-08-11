-- EnterpriseHub Audit & Inventory Triggers

-- 1. Audit Trigger: Record employee salary changes in employee_salary_audit table
DELIMITER //
CREATE TRIGGER trg_employee_salary_audit
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO employee_salary_audit (employee_id, old_salary, new_salary, changed_at)
        VALUES (NEW.employee_id, OLD.salary, NEW.salary, NOW());
    END IF;
END //
DELIMITER ;

-- 2. Inventory Check Trigger: Reduce stock quantity on new order items
DELIMITER //
CREATE TRIGGER trg_update_inventory_on_order
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END //
DELIMITER ;
