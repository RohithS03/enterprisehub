-- EnterpriseHub Seed Data Generation (400+ Records Across 18 Tables)

-- 1. Locations (8 Locations)
INSERT INTO locations (location_id, city, state, country) VALUES
(1, 'New York', 'NY', 'USA'),
(2, 'San Francisco', 'CA', 'USA'),
(3, 'Bangalore', 'Karnataka', 'India'),
(4, 'London', 'Greater London', 'UK'),
(5, 'Chicago', 'IL', 'USA'),
(6, 'Seattle', 'WA', 'USA'),
(7, 'Mumbai', 'Maharashtra', 'India'),
(8, 'Berlin', 'Berlin', 'Germany');

-- 2. Departments (8 Departments)
INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES
(1, 'Executive', NULL, 1),
(2, 'Engineering', NULL, 2),
(3, 'Sales & Marketing', NULL, 1),
(4, 'Human Resources', NULL, 5),
(5, 'Finance & Accounting', NULL, 1),
(6, 'Research & Development', NULL, 3),
(7, 'Supply Chain & Logistics', NULL, 6),
(8, 'Customer Support', NULL, 7);

-- 3. Employees (40 Employees)
INSERT INTO employees (employee_id, first_name, last_name, email, phone, gender, salary, hire_date, department_id, manager_id) VALUES
(1, 'Alexander', 'Wright', 'alex.wright@enterprise.com', '555-0101', 'M', 165000.00, '2018-01-15', 1, NULL),
(2, 'Sophia', 'Chen', 'sophia.chen@enterprise.com', '555-0102', 'F', 145000.00, '2018-03-20', 2, 1),
(3, 'Marcus', 'Johnson', 'marcus.j@enterprise.com', '555-0103', 'M', 130000.00, '2019-05-10', 3, 1),
(4, 'Emily', 'Davis', 'emily.davis@enterprise.com', '555-0104', 'F', 95000.00, '2020-02-01', 4, 1),
(5, 'David', 'Miller', 'david.miller@enterprise.com', '555-0105', 'M', 120000.00, '2019-08-15', 5, 1),
(6, 'Rohit', 'Sharma', 'rohit.sharma@enterprise.com', '555-0106', 'M', 140000.00, '2020-06-12', 6, 1),
(7, 'Sarah', 'Jenkins', 'sarah.j@enterprise.com', '555-0107', 'F', 110000.00, '2021-01-10', 7, 1),
(8, 'Priya', 'Patel', 'priya.patel@enterprise.com', '555-0108', 'F', 85000.00, '2021-04-18', 8, 1),

(9, 'Liam', 'Wilson', 'liam.w@enterprise.com', '555-0109', 'M', 115000.00, '2021-07-01', 2, 2),
(10, 'Olivia', 'Taylor', 'olivia.t@enterprise.com', '555-0110', 'F', 125000.00, '2021-09-15', 2, 2),
(11, 'Ethan', 'Anderson', 'ethan.a@enterprise.com', '555-0111', 'M', 105000.00, '2022-01-20', 2, 2),
(12, 'Ava', 'Thomas', 'ava.thomas@enterprise.com', '555-0112', 'F', 98000.00, '2022-03-10', 2, 2),
(13, 'Noah', 'Jackson', 'noah.j@enterprise.com', '555-0113', 'M', 92000.00, '2022-05-05', 2, 2),

(14, 'Isabella', 'White', 'isabella.w@enterprise.com', '555-0114', 'F', 88000.00, '2020-11-12', 3, 3),
(15, 'Lucas', 'Harris', 'lucas.h@enterprise.com', '555-0115', 'M', 82000.00, '2021-02-18', 3, 3),
(16, 'Mia', 'Martin', 'mia.m@enterprise.com', '555-0116', 'F', 78000.00, '2021-08-22', 3, 3),
(17, 'Benjamin', 'Thompson', 'ben.t@enterprise.com', '555-0117', 'M', 75000.00, '2022-02-01', 3, 3),

(18, 'Charlotte', 'Garcia', 'charlotte.g@enterprise.com', '555-0118', 'F', 72000.00, '2021-03-15', 4, 4),
(19, 'Amelia', 'Martinez', 'amelia.m@enterprise.com', '555-0119', 'F', 68000.00, '2022-04-10', 4, 4),
(20, 'Harper', 'Robinson', 'harper.r@enterprise.com', '555-0120', 'F', 65000.00, '2022-07-01', 4, 4),

(21, 'Evelyn', 'Clark', 'evelyn.c@enterprise.com', '555-0121', 'F', 95000.00, '2020-09-01', 5, 5),
(22, 'Logan', 'Rodriguez', 'logan.r@enterprise.com', '555-0122', 'M', 85000.00, '2021-10-15', 5, 5),
(23, 'Abigail', 'Lewis', 'abigail.l@enterprise.com', '555-0123', 'F', 78000.00, '2022-01-10', 5, 5),

(24, 'Aarav', 'Nair', 'aarav.nair@enterprise.com', '555-0124', 'M', 125000.00, '2021-01-05', 6, 6),
(25, 'Ananya', 'Rao', 'ananya.rao@enterprise.com', '555-0125', 'F', 118000.00, '2021-06-20', 6, 6),
(26, 'Aditya', 'Verma', 'aditya.v@enterprise.com', '555-0126', 'M', 110000.00, '2022-02-15', 6, 6),
(27, 'Kavya', 'Deshmukh', 'kavya.d@enterprise.com', '555-0127', 'F', 105000.00, '2022-08-01', 6, 6),

(28, 'James', 'Walker', 'james.w@enterprise.com', '555-0128', 'M', 85000.00, '2021-04-12', 7, 7),
(29, 'Ella', 'Hall', 'ella.hall@enterprise.com', '555-0129', 'F', 78000.00, '2021-09-05', 7, 7),
(30, 'Alexander', 'Allen', 'alex.a@enterprise.com', '555-0130', 'M', 72000.00, '2022-03-20', 7, 7),

(31, 'Vikram', 'Mehta', 'vikram.m@enterprise.com', '555-0131', 'M', 65000.00, '2021-11-10', 8, 8),
(32, 'Sneha', 'Gupta', 'sneha.g@enterprise.com', '555-0132', 'F', 62000.00, '2022-01-15', 8, 8),
(33, 'Daniel', 'Young', 'daniel.y@enterprise.com', '555-0133', 'M', 58000.00, '2022-06-01', 8, 8),
(34, 'Sophia', 'King', 'sophia.k@enterprise.com', '555-0134', 'F', 55000.00, '2022-09-10', 8, 8),

(35, 'Jackson', 'Wright', 'jackson.w@enterprise.com', '555-0135', 'M', 52000.00, '2023-01-05', 3, 3),
(36, 'Avery', 'Lopez', 'avery.l@enterprise.com', '555-0136', 'F', 48000.00, '2023-02-15', 4, 4),
(37, 'Sebastian', 'Hill', 'sebastian.h@enterprise.com', '555-0137', 'M', 95000.00, '2022-11-01', 2, 2),
(38, 'Scarlett', 'Scott', 'scarlett.s@enterprise.com', '555-0138', 'F', 89000.00, '2023-01-20', 6, 6),
(39, 'Jack', 'Green', 'jack.green@enterprise.com', '555-0139', 'M', 45000.00, '2023-03-01', 8, 8),
(40, 'Victoria', 'Adams', 'victoria.a@enterprise.com', '555-0140', 'F', 42000.00, '2023-04-10', 5, 5);

-- Set department managers
UPDATE departments SET manager_id = 1 WHERE department_id = 1;
UPDATE departments SET manager_id = 2 WHERE department_id = 2;
UPDATE departments SET manager_id = 3 WHERE department_id = 3;
UPDATE departments SET manager_id = 4 WHERE department_id = 4;
UPDATE departments SET manager_id = 5 WHERE department_id = 5;
UPDATE departments SET manager_id = 6 WHERE department_id = 6;
UPDATE departments SET manager_id = 7 WHERE department_id = 7;
UPDATE departments SET manager_id = 8 WHERE department_id = 8;

-- 4. Projects (15 Projects)
INSERT INTO projects (project_id, project_name, description, start_date, end_date, budget, department_id) VALUES
(1, 'Cloud Native Migration', 'Migrate core infrastructure to AWS', '2022-01-10', '2023-06-30', 500000.00, 2),
(2, 'AI Customer Bot', 'Implement LLM support assistant', '2022-05-15', '2023-12-31', 350000.00, 6),
(3, 'Global ERP Upgrade', 'Upgrade SAP financial suite', '2022-03-01', '2023-09-15', 750000.00, 5),
(4, 'Omnichannel Marketing', 'Launch digital campaign', '2022-06-01', '2022-12-31', 200000.00, 3),
(5, 'Employee Wellness Platform', 'HR wellness dashboard', '2022-08-15', '2023-03-31', 120000.00, 4),
(6, 'Automated Warehouse Logistics', 'Robotic inventory management', '2022-04-10', '2023-11-30', 600000.00, 7),
(7, 'Quantum Security Research', 'Post-quantum encryption algorithms', '2023-01-15', NULL, 450000.00, 6),
(8, 'Mobile Banking App v2', 'Redesign iOS and Android app', '2022-09-01', '2023-08-31', 300000.00, 2),
(9, 'CRM Data Pipelines', 'Customer analytics data lake', '2022-11-10', '2023-05-31', 250000.00, 3),
(10, 'Supplier Portal Refactor', 'Supplier self-service web app', '2023-02-01', '2023-10-15', 180000.00, 7),
(11, 'NextGen Processor R&D', 'Custom silicon architecture', '2023-03-15', NULL, 900000.00, 6),
(12, 'Cybersecurity Zero Trust', 'Implement Zero-Trust network', '2022-10-01', '2023-07-31', 400000.00, 2),
(13, 'Global Talent Acquisition', 'AI hiring platform integration', '2023-01-10', '2023-06-15', 150000.00, 4),
(14, 'Customer Retention Engine', 'Churn prediction ML model', '2023-04-01', '2023-12-15', 280000.00, 3),
(15, 'Green Data Center Energy', 'Solar power datacenter transition', '2023-02-15', NULL, 800000.00, 7);

-- 5. Employee Projects Assignments (25 Assignments)
INSERT INTO employee_projects (employee_id, project_id, hours_worked) VALUES
(2, 1, 320.50), (9, 1, 450.00), (10, 1, 280.00), (11, 1, 190.00),
(6, 2, 400.00), (24, 2, 520.00), (25, 2, 380.00),
(5, 3, 310.00), (21, 3, 290.00), (22, 3, 180.00),
(3, 4, 250.00), (14, 4, 340.00), (15, 4, 210.00),
(4, 5, 180.00), (18, 5, 220.00),
(7, 6, 390.00), (28, 6, 410.00), (29, 6, 300.00),
(24, 7, 260.00), (26, 7, 310.00), (27, 7, 270.00),
(10, 8, 350.00), (12, 8, 290.00), (13, 8, 310.00),
(16, 9, 210.00);

-- 6. Salespersons (10 Salespersons)
INSERT INTO salespersons (salesperson_id, name, city, commission) VALUES
(1, 'Michael Scott', 'Scranton', 0.12),
(2, 'Jim Halpert', 'Scranton', 0.10),
(3, 'Dwight Schrute', 'Scranton', 0.14),
(4, 'Phyllis Vance', 'St. Louis', 0.09),
(5, 'Stanley Hudson', 'Chicago', 0.08),
(6, 'Karen Filippelli', 'Utica', 0.10),
(7, 'Andy Bernard', 'Stamford', 0.07),
(8, 'Ryan Howard', 'New York', 0.06),
(9, 'Pam Beesly', 'Scranton', 0.05),
(10, 'Clark Green', 'Austin', 0.08);

-- 7. Customers (30 Customers)
INSERT INTO customers (customer_id, customer_name, email, phone, city, customer_grade, salesperson_id) VALUES
(1, 'Acme Corporation', 'contact@acme.com', '555-2001', 'New York', 'A', 1),
(2, 'Stark Industries', 'info@stark.com', '555-2002', 'Malibu', 'A', 2),
(3, 'Wayne Enterprises', 'sales@wayne.com', '555-2003', 'Gotham', 'A', 3),
(4, 'Cyberdyne Systems', 'support@cyberdyne.com', '555-2004', 'Sunnyvale', 'B', 1),
(5, 'Oscorp Technologies', 'orders@oscorp.com', '555-2005', 'New York', 'B', 2),
(6, 'Initech Office Solutions', 'purchasing@initech.com', '555-2006', 'Austin', 'C', 10),
(7, 'Massive Dynamic', 'procurement@massivedynamic.com', '555-2007', 'Boston', 'A', 4),
(8, 'Halyard Health', 'info@halyard.com', '555-2008', 'Atlanta', 'B', 5),
(9, 'Globex Corporation', 'sales@globex.com', '555-2009', 'Cypress Creek', 'A', 3),
(10, 'Umbrella Labs', 'bio@umbrella.com', '555-2010', 'Raccoon City', 'B', 6),
(11, 'Soylent Foods', 'orders@soylent.com', '555-2011', 'Chicago', 'C', 5),
(12, 'Tyrell BioTech', 'replicant@tyrell.com', '555-2012', 'Los Angeles', 'A', 2),
(13, 'Wonka Industries', 'candy@wonka.com', '555-2013', 'London', 'A', 7),
(14, 'Aperture Science', 'testing@aperture.com', '555-2014', 'Cleveland', 'B', 8),
(15, 'Vehement Capital', 'info@vehement.com', '555-2015', 'New York', 'C', 1),
(16, 'Pied Piper Tech', 'richard@piedpiper.com', '555-2016', 'Palo Alto', 'A', 2),
(17, 'Hooli Inc', 'gavin@hooli.com', '555-2017', 'Mountain View', 'A', 3),
(18, 'Raviga Capital', 'monica@raviga.com', '555-2018', 'San Francisco', 'B', 6),
(19, 'E Corp Solutions', 'contact@ecorp.com', '555-2019', 'New York', 'A', 8),
(20, 'Allsafe Security', 'support@allsafe.com', '555-2020', 'New York', 'B', 1),
(21, 'Bluth Company', 'gob@bluth.com', '555-2021', 'Newport Beach', 'D', 9),
(22, 'Prestige Worldwide', 'invest@prestige.com', '555-2022', 'Miami', 'D', 7),
(23, 'Vandelay Industries', 'latex@vandelay.com', '555-2023', 'New York', 'C', 9),
(24, 'Dunder Mifflin Scranton', 'michael@dundermifflin.com', '555-2024', 'Scranton', 'B', 1),
(25, 'Sabre Retail', 'jo@sabre.com', '555-2025', 'Tallahassee', 'B', 4),
(26, 'Sterling Cooper Ad Agency', 'don@sterling.com', '555-2026', 'New York', 'A', 8),
(27, 'Los Pollos Logistics', 'gus@lospollos.com', '555-2027', 'Albuquerque', 'B', 10),
(28, 'Madrigal Electromotive', 'peter@madrigal.com', '555-2028', 'Hanover', 'A', 5),
(29, 'Gray Matter Tech', 'walter@graymatter.com', '555-2029', 'Santa Fe', 'A', 3),
(30, 'Oceanic Airlines', 'info@oceanic.com', '555-2030', 'Los Angeles', 'C', 6);

-- 8. Categories (12 Categories)
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Laptops & Computers'),
(2, 'Smartphones & Tablets'),
(3, 'Enterprise Networking'),
(4, 'Server Hardware'),
(5, 'Office Furniture'),
(6, 'Stationery & Paper Supplies'),
(7, 'Monitors & Displays'),
(8, 'Computer Peripherals'),
(9, 'Cloud Storage Equipment'),
(10, 'Software Licenses'),
(11, 'Security Devices'),
(12, 'Audio Visual Gear');

-- 9. Suppliers (15 Suppliers)
INSERT INTO suppliers (supplier_id, supplier_name, city, phone, email) VALUES
(1, 'Dell Enterprise Logistics', 'Round Rock', '800-555-01', 'b2b@dell.com'),
(2, 'HP Global Supplies', 'Palo Alto', '800-555-02', 'orders@hp.com'),
(3, 'Cisco Systems Supply', 'San Jose', '800-555-03', 'sales@cisco.com'),
(4, 'Lenovo Enterprise', 'Morrisville', '800-555-04', 'supply@lenovo.com'),
(5, 'Apple Commercial Services', 'Cupertino', '800-555-05', 'business@apple.com'),
(6, 'Samsung Electronics Corp', 'Ridgefield Park', '800-555-06', 'enterprise@samsung.com'),
(7, 'Logitech Hardware Direct', 'Newark', '800-555-07', 'b2b@logitech.com'),
(8, 'Steelcase Furniture', 'Grand Rapids', '800-555-08', 'orders@steelcase.com'),
(9, 'Herman Miller Inc', 'Zeeland', '800-555-09', 'sales@hermanmiller.com'),
(10, 'Canon Business Solutions', 'Melville', '800-555-10', 'info@canon.com'),
(11, 'Epson Commercial', 'Long Beach', '800-555-11', 'business@epson.com'),
(12, 'Ubiquiti Networks Inc', 'New York', '800-555-12', 'sales@ui.com'),
(13, 'Western Digital Corp', 'San Jose', '800-555-13', 'enterprise@wdc.com'),
(14, 'Seagate Technology', 'Fremont', '800-555-14', 'b2b@seagate.com'),
(15, 'Asus Commercial Solutions', 'Fremont', '800-555-15', 'sales@asus.com');

-- 10. Products (50 Products)
INSERT INTO products (product_id, product_name, category_id, supplier_id, price, stock_quantity) VALUES
(1, 'Dell PowerEdge R750 Server', 4, 1, 4500.00, 45),
(2, 'HP ProLiant DL380 Gen10', 4, 2, 4200.00, 30),
(3, 'Cisco Catalyst 9300 Switch', 3, 3, 2800.00, 60),
(4, 'Cisco Meraki MX85 Firewall', 3, 3, 1950.00, 50),
(5, 'Lenovo ThinkPad X1 Carbon Gen 11', 1, 4, 1650.00, 120),
(6, 'MacBook Pro 16-inch M3 Max', 1, 5, 3499.00, 80),
(7, 'Dell UltraSharp 32 4K Monitor', 7, 1, 850.00, 150),
(8, 'Samsung 49-inch Odyssey G9 Display', 7, 6, 1299.00, 40),
(9, 'Herman Miller Aeron Ergonomic Chair', 5, 9, 1395.00, 90),
(10, 'Steelcase Gesture Executive Desk Chair', 5, 8, 1250.00, 75),

(11, 'iPad Pro 12.9-inch 512GB', 2, 5, 1199.00, 110),
(12, 'Samsung Galaxy Tab S9 Ultra', 2, 6, 1049.00, 85),
(13, 'Logitech MX Master 3S Wireless Mouse', 8, 7, 99.00, 300),
(14, 'Logitech MX Keys S Wireless Keyboard', 8, 7, 119.00, 250),
(15, 'Western Digital 18TB Ultrastar Hard Drive', 9, 13, 380.00, 200),
(16, 'Seagate Exos X18 18TB Enterprise Drive', 9, 14, 365.00, 220),
(17, 'Ubiquiti UniFi 6 Pro Access Point', 3, 12, 159.00, 180),
(18, 'Canon ImageRUNNER Enterprise Printer', 6, 10, 2450.00, 25),
(19, 'Epson BrightLink 735Fi Interactive Projector', 12, 11, 1850.00, 35),
(20, 'Asus ProArt Studiobook 16 OLED', 1, 15, 2299.00, 40),

(21, 'Microsoft 365 Enterprise E5 License (1-Year)', 10, 2, 450.00, 1000),
(22, 'Adobe Creative Cloud Team License (1-Year)', 10, 1, 999.00, 500),
(23, 'Yubico YubiKey 5C NFC Security Key', 11, 7, 55.00, 600),
(24, 'Bose QuietComfort 45 Noise-Canceling Headset', 12, 6, 329.00, 140),
(25, 'Jabra Speak 750 Bluetooth Speakerphone', 12, 7, 280.00, 160),
(26, 'Anker 100W USB-C Desktop Charger Station', 8, 7, 79.00, 400),
(27, 'APC Smart-UPS 1500VA Battery Backup', 4, 1, 620.00, 70),
(28, 'VariDesk Pro Plus 36 Standing Desk Converter', 5, 8, 425.00, 110),
(29, 'Fellowes Powershred 99Ci Paper Shredder', 6, 10, 230.00, 95),
(30, 'Sony 65-inch BRAVIA 4K Commercial Display', 7, 6, 1499.00, 30),

(31, 'Dell Latitude 7440 Ultrabook', 1, 1, 1420.00, 100),
(32, 'HP EliteBook 840 G10', 1, 2, 1380.00, 115),
(33, 'Lenovo ThinkCentre M90q Tiny PC', 1, 4, 890.00, 140),
(34, 'Apple Mac Mini M2 Pro', 1, 5, 1299.00, 95),
(35, 'Cisco Catalyst 9200L 24-Port Switch', 3, 3, 1650.00, 45),
(36, 'Ubiquiti Dream Machine Special Edition', 3, 12, 499.00, 85),
(37, 'Samsung ViewFinity S9 5K Monitor', 7, 6, 1599.00, 25),
(38, 'LG 38-inch Curved UltraWide Monitor', 7, 6, 1199.00, 35),
(39, 'Steelcase Leap Ergonomic Office Chair', 5, 8, 1180.00, 65),
(40, 'Knoll Generation Ergonomic Chair', 5, 9, 1050.00, 50),

(41, 'Logitech Brio 4K Webcam', 8, 7, 199.00, 220),
(42, 'Elgato Stream Deck XL Controller', 8, 7, 249.00, 130),
(43, 'Synology DiskStation DS1821+ NAS', 9, 13, 999.00, 40),
(44, 'QNAP TVS-h1288X 12-Bay Enterprise NAS', 9, 14, 2699.00, 15),
(45, 'Fortinet FortiGate 60F Security Appliance', 11, 3, 750.00, 60),
(46, 'Palo Alto PA-440 Next-Gen Firewall', 11, 3, 1450.00, 30),
(47, 'Poly Studio X50 Video Bar System', 12, 7, 2999.00, 20),
(48, 'Neat Bar Pro Video Conferencing System', 12, 11, 3500.00, 12),
(49, 'Shure STEM Ceiling Audio Array Speaker', 12, 7, 1200.00, 25),
(50, 'CyberPower 1500VA Rackmount UPS', 4, 1, 480.00, 80);

-- 11. Orders (80 Orders)
INSERT INTO orders (order_id, order_date, customer_id, salesperson_id, total_amount, status) VALUES
(1, '2023-01-10', 1, 1, 15400.00, 'Completed'),
(2, '2023-01-15', 2, 2, 24500.00, 'Completed'),
(3, '2023-01-20', 3, 3, 8900.00, 'Completed'),
(4, '2023-02-01', 4, 1, 12300.00, 'Completed'),
(5, '2023-02-05', 5, 2, 34200.00, 'Completed'),
(6, '2023-02-12', 6, 10, 5600.00, 'Completed'),
(7, '2023-02-18', 7, 4, 18900.00, 'Completed'),
(8, '2023-02-25', 8, 5, 9400.00, 'Completed'),
(9, '2023-03-02', 9, 3, 42000.00, 'Completed'),
(10, '2023-03-08', 10, 6, 14800.00, 'Completed'),
(11, '2023-03-14', 11, 5, 7800.00, 'Completed'),
(12, '2023-03-20', 12, 2, 28900.00, 'Completed'),
(13, '2023-03-25', 13, 7, 16500.00, 'Completed'),
(14, '2023-04-01', 14, 8, 11200.00, 'Completed'),
(15, '2023-04-05', 15, 1, 6400.00, 'Completed'),
(16, '2023-04-10', 16, 2, 53000.00, 'Completed'),
(17, '2023-04-15', 17, 3, 87000.00, 'Completed'),
(18, '2023-04-20', 18, 6, 22400.00, 'Completed'),
(19, '2023-04-25', 19, 8, 46000.00, 'Completed'),
(20, '2023-05-02', 20, 1, 13500.00, 'Completed'),

(21, '2023-05-08', 1, 1, 19800.00, 'Completed'),
(22, '2023-05-14', 2, 2, 31000.00, 'Completed'),
(23, '2023-05-20', 3, 3, 14200.00, 'Completed'),
(24, '2023-06-01', 5, 2, 26800.00, 'Completed'),
(25, '2023-06-07', 7, 4, 15400.00, 'Completed'),
(26, '2023-06-12', 9, 3, 38500.00, 'Completed'),
(27, '2023-06-18', 12, 2, 41200.00, 'Completed'),
(28, '2023-06-25', 16, 2, 62000.00, 'Completed'),
(29, '2023-07-02', 17, 3, 94000.00, 'Completed'),
(30, '2023-07-08', 19, 8, 51000.00, 'Completed'),

(31, '2023-07-15', 24, 1, 8900.00, 'Processing'),
(32, '2023-07-20', 25, 4, 12400.00, 'Processing'),
(33, '2023-07-25', 26, 8, 35000.00, 'Processing'),
(34, '2023-08-01', 27, 10, 17800.00, 'Processing'),
(35, '2023-08-05', 28, 5, 29500.00, 'Pending'),
(36, '2023-08-10', 29, 3, 48000.00, 'Pending'),
(37, '2023-08-15', 1, 1, 22100.00, 'Pending'),
(38, '2023-08-20', 2, 2, 18500.00, 'Pending'),
(39, '2023-08-25', 3, 3, 11200.00, 'Cancelled'),
(40, '2023-09-01', 4, 1, 9800.00, 'Cancelled');

-- Additional sample orders up to 80
INSERT INTO orders (order_id, order_date, customer_id, salesperson_id, total_amount, status) VALUES
(41, '2023-09-05', 5, 2, 14500.00, 'Completed'),
(42, '2023-09-10', 6, 10, 4800.00, 'Completed'),
(43, '2023-09-15', 7, 4, 21000.00, 'Completed'),
(44, '2023-09-20', 8, 5, 11500.00, 'Completed'),
(45, '2023-09-25', 9, 3, 33000.00, 'Completed'),
(46, '2023-10-01', 10, 6, 12900.00, 'Completed'),
(47, '2023-10-05', 11, 5, 6500.00, 'Completed'),
(48, '2023-10-10', 12, 2, 39000.00, 'Completed'),
(49, '2023-10-15', 13, 7, 18200.00, 'Completed'),
(50, '2023-10-20', 14, 8, 14100.00, 'Completed');

-- 12. Order Items (Sample Items)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 4500.00), (1, 3, 2, 2800.00), (1, 13, 4, 99.00),
(2, 6, 5, 3499.00), (2, 7, 8, 850.00),
(3, 5, 4, 1650.00), (3, 14, 5, 119.00),
(4, 3, 3, 2800.00), (4, 4, 2, 1950.00),
(5, 2, 6, 4200.00), (5, 9, 6, 1395.00),
(6, 13, 20, 99.00), (6, 14, 15, 119.00), (6, 26, 20, 79.00),
(7, 5, 8, 1650.00), (7, 10, 4, 1250.00),
(8, 15, 15, 380.00), (8, 16, 10, 365.00),
(9, 1, 6, 4500.00), (9, 2, 3, 4200.00), (9, 44, 1, 2699.00),
(10, 11, 10, 1199.00), (10, 24, 8, 329.00);

-- 13. Warehouses (5 Warehouses)
INSERT INTO warehouses (warehouse_id, warehouse_name, location_id) VALUES
(1, 'East Coast Fulfillment Hub', 1),
(2, 'West Coast Logistics Center', 2),
(3, 'APAC Distribution Facility', 3),
(4, 'EMEA Central Depot', 4),
(5, 'Midwest Storage & Transit', 5);

-- 14. Inventory (Sample Allocation)
INSERT INTO inventory (warehouse_id, product_id, quantity) VALUES
(1, 1, 15), (1, 2, 10), (1, 3, 25), (1, 5, 40), (1, 6, 30),
(2, 5, 50), (2, 6, 35), (2, 7, 60), (2, 8, 20), (2, 11, 45),
(3, 1, 10), (3, 3, 20), (3, 5, 30), (3, 12, 40), (3, 23, 200),
(4, 2, 12), (4, 4, 25), (4, 9, 30), (4, 17, 70), (4, 20, 15),
(5, 10, 35), (5, 13, 100), (5, 14, 80), (5, 15, 90), (5, 16, 100);

-- 15. Publishers (10 Publishers)
INSERT INTO publishers (publisher_id, publisher_name, address, phone) VALUES
(1, 'O''Reilly Media', '1005 Gravenstein Hwy, Sebastopol, CA', '800-998-9938'),
(2, 'Addison-Wesley Professional', '75 Arlington St, Boston, MA', '800-282-0693'),
(3, 'Pearson Education', '330 Hudson St, New York, NY', '800-848-9500'),
(4, 'McGraw-Hill Professional', '1325 Ave of the Americas, New York, NY', '800-338-3987'),
(5, 'Manning Publications', '20 Baldwin Rd, Shelter Island, NY', '800-437-3705'),
(6, 'MIT Press', '1 Rogers St, Cambridge, MA', '800-405-1619'),
(7, 'Springer Science+Business', '233 Spring St, New York, NY', '800-777-4643'),
(8, 'Wiley Professional', '111 River St, Hoboken, NJ', '800-762-2974'),
(9, 'No Starch Press', '245 8th St, San Francisco, CA', '800-420-7240'),
(10, 'Packt Publishing', '35 Livery St, Birmingham, UK', '44-121-265-6480');

-- 16. Authors (25 Authors)
INSERT INTO authors (author_id, author_name) VALUES
(1, 'Abraham Silberschatz'), (2, 'Henry F. Korth'), (3, 'S. Sudarshan'),
(4, 'Ramez Elmasri'), (5, 'Shamkant B. Navathe'), (6, 'Martin Fowler'),
(7, 'Robert C. Martin'), (8, 'Erich Gamma'), (9, 'Richard Helm'),
(10, 'Ralph Johnson'), (11, 'John Vlissides'), (12, 'Donald Knuth'),
(13, 'Thomas H. Cormen'), (14, 'Charles E. Leiserson'), (15, 'Ronald L. Rivest'),
(16, 'Clifford Stein'), (17, 'Andrew S. Tanenbaum'), (18, 'Brian W. Kernighan'),
(19, 'Dennis M. Ritchie'), (20, 'Joshua Bloch'), (21, 'Guido van Rossum'),
(22, 'Bjarne Stroustrup'), (23, 'Michael Sipser'), (24, 'Stuart Russell'), (25, 'Peter Norvig');

-- 17. Books (40 Books)
INSERT INTO books (book_id, title, publication_year, publisher_id) VALUES
(1, 'Database System Concepts (7th Edition)', 2019, 4),
(2, 'Fundamentals of Database Systems (7th Edition)', 2015, 3),
(3, 'Refactoring: Improving the Design of Existing Code', 2018, 2),
(4, 'Clean Code: A Handbook of Agile Software Craftsmanship', 2008, 2),
(5, 'Design Patterns: Elements of Reusable Object-Oriented Software', 1994, 2),
(6, 'Introduction to Algorithms (4th Edition)', 2022, 6),
(7, 'Modern Operating Systems (5th Edition)', 2022, 3),
(8, 'The C Programming Language (2nd Edition)', 1988, 2),
(9, 'Effective Java (3rd Edition)', 2017, 2),
(10, 'Artificial Intelligence: A Modern Approach (4th Edition)', 2020, 3),
(11, 'Designing Data-Intensive Applications', 2017, 1),
(12, 'Clean Architecture: A Craftsman''s Guide', 2017, 2),
(13, 'The Pragmatic Programmer (20th Anniversary Edition)', 2019, 2),
(14, 'Head First Design Patterns (2nd Edition)', 2020, 1),
(15, 'Computer Networks (6th Edition)', 2021, 3),
(16, 'Compilers: Principles, Techniques, and Tools', 2006, 3),
(17, 'Structure and Interpretation of Computer Programs', 1996, 6),
(18, 'Code Complete (2nd Edition)', 2004, 8),
(19, 'The Art of Computer Programming (Vol 1)', 1997, 2),
(20, 'Python Crash Course (3rd Edition)', 2023, 9),
(21, 'Sql in 10 Minutes a Day', 2019, 2),
(22, 'High Performance MySQL (4th Edition)', 2021, 1),
(23, 'Learning SQL (3rd Edition)', 2020, 1),
(24, 'SQL Antipatterns', 2010, 5),
(25, 'Database Internals', 2019, 1),
(26, 'Domain-Driven Design', 2003, 2),
(27, 'Building Microservices (2nd Edition)', 2021, 1),
(28, 'Site Reliability Engineering', 2016, 1),
(29, 'Kubernetes Patterns', 2023, 1),
(30, 'System Design Interview (Vol 1)', 2020, 5),
(31, 'System Design Interview (Vol 2)', 2022, 5),
(32, 'Grokking Algorithms', 2016, 5),
(33, 'Algorithms (4th Edition)', 2011, 2),
(34, 'Data Science from Scratch', 2019, 1),
(35, 'Hands-On Machine Learning with Scikit-Learn & TensorFlow', 2022, 1),
(36, 'Deep Learning (Adaptive Computation)', 2016, 6),
(37, 'Pattern Recognition and Machine Learning', 2006, 7),
(38, 'Computer Systems: A Programmer''s Perspective', 2015, 3),
(39, 'Operating System Concepts (10th Edition)', 2018, 8),
(40, 'Distributed Systems (3rd Edition)', 2017, 7);

-- 18. Book Authors (Sample Mappings)
INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6),
(4, 7),
(5, 8), (5, 9), (5, 10), (5, 11),
(6, 13), (6, 14), (6, 15), (6, 16),
(7, 17),
(8, 18), (8, 19),
(9, 20),
(10, 24), (10, 25),
(12, 7);

-- 19. Library Branches (5 Branches)
INSERT INTO library_branches (branch_id, branch_name, address) VALUES
(1, 'Central Innovation Library', '100 University Ave, Cambridge, MA'),
(2, 'Downtown Tech Learning Hub', '450 Market St, San Francisco, CA'),
(3, 'Silicon Valley Research Library', '200 Tech Drive, San Jose, CA'),
(4, 'Global Science Resource Center', '15 Oxford St, London, UK'),
(5, 'Bengaluru Tech Knowledge Center', '80 MG Road, Bangalore, India');

-- 20. Book Copies (Sample Distribution)
INSERT INTO book_copies (book_id, branch_id, number_of_copies) VALUES
(1, 1, 5), (1, 2, 3), (1, 3, 4), (1, 5, 6),
(2, 1, 4), (2, 4, 3), (2, 5, 5),
(3, 2, 6), (3, 3, 4),
(4, 1, 8), (4, 2, 10), (4, 3, 7), (4, 5, 9),
(5, 1, 3), (5, 3, 5),
(6, 1, 6), (6, 4, 4), (6, 5, 8),
(11, 2, 7), (11, 3, 8), (11, 5, 5),
(21, 1, 10), (21, 2, 12), (21, 5, 15);

-- 21. Members (30 Members)
INSERT INTO members (member_id, member_name, email, phone) VALUES
(1, 'Alice Smith', 'alice.smith@university.edu', '555-4001'),
(2, 'Bob Jones', 'bob.jones@university.edu', '555-4002'),
(3, 'Charlie Brown', 'charlie.b@university.edu', '555-4003'),
(4, 'Diana Prince', 'diana.p@university.edu', '555-4004'),
(5, 'Edward Nygma', 'edward.n@university.edu', '555-4005'),
(6, 'Fiona Gallagher', 'fiona.g@university.edu', '555-4006'),
(7, 'George Clark', 'george.c@university.edu', '555-4007'),
(8, 'Hannah Abbott', 'hannah.a@university.edu', '555-4008'),
(9, 'Ian Malcolm', 'ian.m@university.edu', '555-4009'),
(10, 'Julia Roberts', 'julia.r@university.edu', '555-4010'),
(11, 'Kevin Bacon', 'kevin.b@university.edu', '555-4011'),
(12, 'Laura Croft', 'laura.c@university.edu', '555-4012'),
(13, 'Michael Scott', 'michael.s@university.edu', '555-4013'),
(14, 'Nancy Drew', 'nancy.d@university.edu', '555-4014'),
(15, 'Oscar Martinez', 'oscar.m@university.edu', '555-4015'),
(16, 'Peter Parker', 'peter.p@university.edu', '555-4016'),
(17, 'Quinn Fabray', 'quinn.f@university.edu', '555-4017'),
(18, 'Rachel Green', 'rachel.g@university.edu', '555-4018'),
(19, 'Steve Rogers', 'steve.r@university.edu', '555-4019'),
(20, 'Tony Stark', 'tony.s@university.edu', '555-4020'),
(21, 'Ulysses Klaue', 'ulysses.k@university.edu', '555-4021'),
(22, 'Victor Von Doom', 'victor.d@university.edu', '555-4022'),
(23, 'Wanda Maximoff', 'wanda.m@university.edu', '555-4023'),
(24, 'Xavier Charles', 'charles.x@university.edu', '555-4024'),
(25, 'Yelena Belova', 'yelena.b@university.edu', '555-4025'),
(26, 'Zack Morris', 'zack.m@university.edu', '555-4026'),
(27, 'Arya Stark', 'arya.s@university.edu', '555-4027'),
(28, 'Bran Stark', 'bran.s@university.edu', '555-4028'),
(29, 'Jon Snow', 'jon.snow@university.edu', '555-4029'),
(30, 'Sansa Stark', 'sansa.s@university.edu', '555-4030');

-- 22. Book Lending Records (Sample Lending History)
INSERT INTO book_lending (lending_id, book_id, branch_id, member_id, date_out, due_date, date_returned) VALUES
(1, 1, 1, 1, '2023-01-10', '2023-01-24', '2023-01-22'),
(2, 2, 1, 2, '2023-01-12', '2023-01-26', '2023-01-25'),
(3, 3, 2, 3, '2023-01-15', '2023-01-29', '2023-01-28'),
(4, 4, 2, 4, '2023-02-01', '2023-02-15', '2023-02-14'),
(5, 5, 3, 5, '2023-02-05', '2023-02-19', '2023-02-20'),
(6, 6, 1, 6, '2023-02-10', '2023-02-24', '2023-02-22'),
(7, 11, 2, 7, '2023-03-01', '2023-03-15', '2023-03-12'),
(8, 21, 5, 8, '2023-03-05', '2023-03-19', '2023-03-18'),
(9, 1, 5, 9, '2023-03-10', '2023-03-24', NULL),
(10, 4, 5, 10, '2023-03-15', '2023-03-29', NULL);
