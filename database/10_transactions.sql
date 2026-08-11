-- EnterpriseHub ACID Transaction Demonstration Script

-- Scenario: Customer places an Order for 2 units of Laptop (Product #5)
START TRANSACTION;

-- Step 1: Insert Order
INSERT INTO orders (order_id, order_date, customer_id, salesperson_id, total_amount, status)
VALUES (999, CURDATE(), 1, 1, 3300.00, 'Processing');

-- Step 2: Insert Order Item
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (999, 5, 2, 1650.00);

-- Savepoint after item creation
SAVEPOINT item_added;

-- Step 3: Deduct stock from catalog
UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 5;

-- Commit Transaction
COMMIT;
