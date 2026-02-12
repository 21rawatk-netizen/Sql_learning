-- ============================================
-- BANKING MANAGEMENT SYSTEM - FULL PROJECT
-- ============================================

-- 1️⃣ Create Database
DROP DATABASE IF EXISTS BankingSystem;
CREATE DATABASE BankingSystem;
USE BankingSystem;

-- ============================================
-- 2️⃣ TABLES
-- ============================================

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Accounts Table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20), -- Savings / Current
    balance DECIMAL(15,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    ON DELETE CASCADE
);

-- Transactions Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    transaction_type VARCHAR(20), -- Deposit / Withdraw / Transfer
    amount DECIMAL(15,2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
    ON DELETE CASCADE
);

-- Loans Table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    loan_amount DECIMAL(15,2),
    interest_rate DECIMAL(5,2),
    loan_status VARCHAR(20) DEFAULT 'Pending',

    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    ON DELETE CASCADE
);

-- ============================================
-- 3️⃣ SAMPLE DATA
-- ============================================

INSERT INTO Customers (first_name, last_name, email, phone, address)
VALUES
('Rahul', 'Sharma', 'rahul@gmail.com', '9876543210', 'Delhi'),
('Priya', 'Verma', 'priya@gmail.com', '9123456780', 'Mumbai'),
('Aman', 'Singh', 'aman@gmail.com', '9988776655', 'Pune');

INSERT INTO Accounts (customer_id, account_type, balance)
VALUES
(1, 'Savings', 5000.00),
(2, 'Current', 10000.00),
(3, 'Savings', 7000.00);

INSERT INTO Loans (customer_id, loan_amount, interest_rate, loan_status)
VALUES
(1, 50000, 7.5, 'Approved'),
(2, 100000, 8.2, 'Pending');

-- ============================================
-- 4️⃣ TRIGGER (Auto Update Balance)
-- ============================================

DELIMITER //

CREATE TRIGGER AfterTransactionInsert
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    IF NEW.transaction_type = 'Deposit' THEN
        UPDATE Accounts
        SET balance = balance + NEW.amount
        WHERE account_id = NEW.account_id;

    ELSEIF NEW.transaction_type = 'Withdraw' THEN
        UPDATE Accounts
        SET balance = balance - NEW.amount
        WHERE account_id = NEW.account_id;
    END IF;
END //

DELIMITER ;

-- ============================================
-- 5️⃣ STORED PROCEDURES
-- ============================================

-- Deposit Procedure
DELIMITER //

CREATE PROCEDURE DepositMoney(
    IN acc_id INT,
    IN amt DECIMAL(15,2)
)
BEGIN
    INSERT INTO Transactions(account_id, transaction_type, amount)
    VALUES (acc_id, 'Deposit', amt);
END //

DELIMITER ;

-- Withdraw Procedure
DELIMITER //

CREATE PROCEDURE WithdrawMoney(
    IN acc_id INT,
    IN amt DECIMAL(15,2)
)
BEGIN
    DECLARE current_balance DECIMAL(15,2);

    SELECT balance INTO current_balance
    FROM Accounts
    WHERE account_id = acc_id;

    IF current_balance >= amt THEN
        INSERT INTO Transactions(account_id, transaction_type, amount)
        VALUES (acc_id, 'Withdraw', amt);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient Balance';
    END IF;
END //

DELIMITER ;

-- Transfer Procedure
DELIMITER //

CREATE PROCEDURE TransferMoney(
    IN from_acc INT,
    IN to_acc INT,
    IN amt DECIMAL(15,2)
)
BEGIN
    CALL WithdrawMoney(from_acc, amt);
    CALL DepositMoney(to_acc, amt);
END //

DELIMITER ;

-- ============================================
-- 6️⃣ VIEW
-- ============================================

CREATE VIEW CustomerAccountView AS
SELECT 
    c.first_name,
    c.last_name,
    a.account_id,
    a.account_type,
    a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

-- ============================================
-- 7️⃣ TESTING QUERIES
-- ============================================

-- Deposit Example
-- CALL DepositMoney(1, 2000);

-- Withdraw Example
-- CALL WithdrawMoney(1, 1000);

-- Transfer Example
-- CALL TransferMoney(1, 2, 500);

-- Check Balance
-- SELECT balance FROM Accounts WHERE account_id = 1;

-- View All Transactions
-- SELECT * FROM Transactions;

-- Total Bank Balance
-- SELECT SUM(balance) AS total_bank_balance FROM Accounts;

-- View Customer Account Details
-- SELECT * FROM CustomerAccountView;

-- ============================================
-- END OF PROJECT
-- ============================================
