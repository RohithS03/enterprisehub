-- EnterpriseHub Stored Functions

-- 1. Calculate Experience in Years
DELIMITER //
CREATE FUNCTION CalculateExperience(h_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, h_date, CURDATE());
END //
DELIMITER ;

-- 2. Customer Tier Classifier
DELIMITER //
CREATE FUNCTION GetCustomerTier(total_spent DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF total_spent >= 50000.00 THEN
        RETURN 'Platinum';
    ELSEIF total_spent >= 20000.00 THEN
        RETURN 'Gold';
    ELSEIF total_spent >= 5000.00 THEN
        RETURN 'Silver';
    ELSE
        RETURN 'Bronze';
    END IF;
END //
DELIMITER ;
