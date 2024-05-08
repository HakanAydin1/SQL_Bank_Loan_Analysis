SELECT * FROM bank_loan_data


SELECT loan_status FROM bank_loan_data

-- Good Loan Application Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
    /
    COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data

-- Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Funded Amount
SELECT SUM(loan_ammount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Total Received Amount
SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'



