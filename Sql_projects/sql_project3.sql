/*Banking Transaction Fraud Detection*/
CREATE TABLE transactions (
    txn_id INT PRIMARY KEY,
    account_id INT,
    amount INT,
    txn_date DATE
);
INSERT INTO transactions VALUES
(1,101,2000,'2024-01-01'),
(2,101,2200,'2024-01-02'),
(3,101,15000,'2024-01-03'),
(4,102,3000,'2024-01-01'),
(5,102,3200,'2024-01-02');
SELECT *
FROM (
    SELECT *,
           AVG(amount) OVER (PARTITION BY account_id) AS avg_amt
    FROM transactions
) t
WHERE amount > avg_amt * 3;
