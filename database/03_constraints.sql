-- EnterpriseHub Referential Integrity & Constraints Verification Script

-- 1. Foreign Key Verification: Circular dependency check between departments & employees
-- manager_id in departments references employees(employee_id)
ALTER TABLE departments ADD CONSTRAINT fk_dept_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id) ON DELETE SET NULL;

-- 2. Domain constraints verification
-- Check salary > 0
-- Check quantity >= 0
-- Check email UNIQUE
