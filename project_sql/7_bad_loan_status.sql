SELECT * FROM bank_loan_data


SELECT loan_status FROM bank_loan_data



-- Bad Loan Application Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0)
    /
    COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data

-- Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loan Funded Amount
SELECT SUM(loan_ammount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loan Total Received Amount
SELECT SUM(total_payment) AS Bad_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'