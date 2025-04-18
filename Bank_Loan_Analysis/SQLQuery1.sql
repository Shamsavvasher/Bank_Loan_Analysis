
SELECT * FROM bank_loan_data;

SELECT COUNT(id) as Total_Loan_Applications FROM bank_loan_data;

SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM 
bank_loan_data WHERE MONTH(issue_date) =11 AND YEAR(issue_date)=2021;


SELECT SUM(loan_amount) as MTD_Total_Funded_amount FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021;

SELECT SUM(loan_amount) as PMTD_Total_Funded_amount FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021;

SELECT SUM(total_payment) AS MTD_Total_amount_recived from bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021;


SELECT ROUND(AVG(int_rate),4)*100 as AVG_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021;

SELECT AVG(dti)*100 as AVG_DTI FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021;

--good Loan issued
SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
	/
	COUNT(id) AS Good_loan_percentage
FROM bank_loan_data

SELECT COUNT(id) as Good_loan_Applications FROM bank_loan_data
WHERE loan_status='Fully Paid' OR loan_status ='Current'

SELECT SUM(loan_amount) as Good_loan_Funded_Amount FROM bank_loan_data
WHERE loan_status='Fully Paid' OR loan_status ='Current'

SELECT SUM(total_payment) as Good_loan_Amount_Recived FROM bank_loan_data
WHERE loan_status='Fully Paid' OR loan_status ='Current'

--Bad Loan Issued
SELECT 
	(COUNT(CASE WHEN loan_status = 'Charged Off' OR loan_status = 'Current' THEN id END)*100.0)
	/
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data

SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'charged Off'

SELECT SUM(total_payment) AS Bad_Loan_Amount_Recived FROM bank_loan_data
WHERE loan_status = 'charged Off'

SELECT
loan_status,
COUNT(id) AS Total_Loan_Applications,
SUM(total_payment) AS Total_Amount_Recived,
SUM(loan_amount) AS Total_Funded_Amount,
AVG(int_rate * 100) AS Intrest_Rate,
AVG(dti * 100) AS DTI
FROM
bank_loan_data
GROUP BY 
loan_status


SELECT loan_status,
SUM(total_payment) AS MTD_Total_Amount_Recived,
SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data 
WHERE MONTH(issue_date) =12
GROUP BY loan_status;

SELECT
	MONTH(issue_date) AS Month_Number,
	DATENAME(MONTH,issue_date) AS Month_Name,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) As Total_Recived_Amount
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH,issue_date)
ORDER BY MONTH(issue_date)

SELECT
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) As Total_Recived_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY COUNT(id) DESC

SELECT
	term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) As Total_Recived_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY term DESC

SELECT
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) As Total_Recived_Amount
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length 

SELECT
	purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) As Total_Recived_Amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC

SELECT
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) As Total_Recived_Amount
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC