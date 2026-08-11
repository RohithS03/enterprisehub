-- EnterpriseHub DCL (Data Control Language) Script

-- 1. Create Roles / Users
CREATE USER IF NOT EXISTS 'db_admin'@'%' IDENTIFIED BY 'AdminPassword123!';
CREATE USER IF NOT EXISTS 'sales_manager'@'%' IDENTIFIED BY 'SalesPass123!';
CREATE USER IF NOT EXISTS 'read_only_user'@'%' IDENTIFIED BY 'ReadOnly123!';

-- 2. Grant Permissions
GRANT ALL PRIVILEGES ON enterprisehub.* TO 'db_admin'@'%';
GRANT SELECT, INSERT, UPDATE ON enterprisehub.orders TO 'sales_manager'@'%';
GRANT SELECT, INSERT, UPDATE ON enterprisehub.customers TO 'sales_manager'@'%';
GRANT SELECT ON enterprisehub.* TO 'read_only_user'@'%';

-- 3. Revoke Permissions Example
REVOKE UPDATE ON enterprisehub.customers FROM 'sales_manager'@'%';

FLUSH PRIVILEGES;
