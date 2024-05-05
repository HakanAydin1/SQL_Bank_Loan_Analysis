COPY bank_loan_data
FROM 'D:\Development\SQL_Bank_Loan_Analysis\csv_files\financial_loan.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');