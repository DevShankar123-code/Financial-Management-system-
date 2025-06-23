CREATE DATABASE Financial_management_systems;
USE Financial_management_systems;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    account_type varchar(255) NOT NULL,
    balance DECIMAL(10, 2) DEFAULT 0.00,
    opened_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status varchar(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE
);
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    loan_type VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    interest_rate DECIMAL(5, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('Approved', 'Pending', 'Rejected') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
CREATE TABLE Investments (
    investment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    investment_type VARCHAR(50) NOT NULL,
    amount_invested DECIMAL(10, 2) NOT NULL,
    date_invested DATE NOT NULL,
    current_value DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id) ON DELETE CASCADE
);

CREATE TABLE Admins (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('SuperAdmin', 'Manager', 'Auditor') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
show tables;

INSERT INTO users values(01,"Dev Shankar","devshankar3@gmail.com","7894568978","Delhi","2024-05-19 08:40:50");
INSERT INTO users values(02,"Rahul","rahul05@gmail.com","9130258549","South west delhi","2025-03-19 10:43:40");
INSERT INTO users values(03,"Amit Gond","amitji@gmail.com","8585697489","North Delhi","2025-03-21 13:11:03");
INSERT INTO users values(04,"Zahid Ali","zahidali34@gmail.com","7859652541","East Delhi","2025-04-01 07:40:47");
INSERT INTO users values(05,"Nitin kumar","sainiNitin10@gmail.com","8595784589","south west delhi","2025-04-05 11:51:31");


INSERT INTO Accounts values(001,01,"Savings",18000.56,"2024-05-19 08:40:50","Active");
INSERT INTO Accounts values(002,02,"Business",50000.85,"2025-03-19 10:43:40","Active");
INSERT INTO Accounts values(003,03,"Savings",10000.80,"2025-03-21 13:11:03","Inactive");
INSERT INTO Accounts values(004,04,"Business",200000.90,"2025-04-01 07:40:47","Active");
INSERT INTO Accounts values(005,05,"Business",195266.66,"2025-04-05 11:51:31","Inactive");

UPDATE users SET Created_at = "2024-05-19 08:40:50" where user_id = 1;
UPDATE users SET Created_at = "2025-03-19 10:43:40" where user_id = 2;
UPDATE users SET Created_at = "2025-03-21 13:11:03" where user_id = 3;
UPDATE users SET Created_at = "2025-04-01 07:40:47" where user_id = 4;
UPDATE users SET Created_at = "2025-04-05 11:51:31" where user_id = 5;
UPDATE Accounts SET opened_date = "2024-05-19 08:40:50" where user_id = 1;
UPDATE Accounts SET account_id=78945869 where user_id = 1;
UPDATE Accounts SET account_id=78523658 where user_id = 2;
UPDATE Accounts SET account_id=79025484 where user_id = 3;
UPDATE Accounts SET account_id=79177859 where user_id = 4;
UPDATE Accounts SET account_id=79258967 where user_id = 5;


INSERT INTO Transactions values(1107854698,78945869,'Deposit',1000,"2024-06-19","Deposit amount");
INSERT INTO Transactions values(1125689578,78523658,'Transfer',5000,"2025-05-19","Salary Payement");
INSERT INTO Transactions values(1120549854,79025484,'Withdrawal',8000,"2025-03-21","Property Purchase");
INSERT INTO Transactions values(1158978546,79177859,'Deposit',6000,"2025-04-01","Deposit amount");
INSERT INTO Transactions values(1178542146,79258967,'Transfer',9000,"2025-04-05","game Purchase");

select * from Loans;
INSERT INTO Loans VALUES (1102546897,1, 'Home Loan', 120000.00, 7.25, '2024-08-15', '2034-01-15', 'Approved');
INSERT INTO Loans VALUES (1225468978,2, 'Car Loan', 500000.00, 8.50, '2025-07-01', '2028-07-01', 'Pending');
INSERT INTO Loans VALUES (1358965745,3, 'Personal Loan', 200000.00, 10.75, '2025-05-10', '2027-02-10', 'Rejected');
INSERT INTO Loans VALUES (1458468957,4, 'Education Loan', 750000.00, 6.95, '2025-08-20', '2029-08-20', 'Approved');
INSERT INTO Loans VALUES (1568587458,5, 'Business Loan', 150000.00, 9.25, '2025-06-01', '2030-06-01', 'Pending');


INSERT INTO Investments VALUES (0017854963 ,1, 'Stocks', 100000.00, '2025-05-10', 125000.00);
INSERT INTO Investments VALUES (0025896587 ,2, 'Mutual Fund', 50000.00, '2025-09-01', 56500.00);
INSERT INTO Investments VALUES (0038446854 ,3, 'Fixed Deposit', 200000.00, '2025-06-15', 206000.00);
INSERT INTO Investments VALUES (0046897854 ,4, 'Real Estate', 800000.00, '2025-09-20', 950000.00);
INSERT INTO Investments VALUES (0056845987 ,5, 'Crypto', 30000.00, '2025-12-05', 27500.00);


INSERT INTO Payments VALUES (11102547 ,1102546897, 125000.00,"2030-02-15",'Bank Transfer');
INSERT INTO Payments VALUES (11265895 ,1225468978, 57000.00,"2026-03-22",'UPI');
INSERT INTO Payments VALUES (11358946 ,1358965745, 280000.00,"2027-02-10",'Credit Card');
INSERT INTO Payments VALUES (11425689 ,1458468957, 754000.00,"2029-08-20",'NEFT');
INSERT INTO Payments VALUES (11574859 ,1568587458, 158000.00,"2030-06-01",'Debit Card');


INSERT INTO Admins VALUES (1101,'admin_Dev', 'dev123', 'SuperAdmin',"2024-05-19");
INSERT INTO Admins VALUES (1102,'manager_Raj', 'raj870', 'Manager',"2025-03-19");
INSERT INTO Admins VALUES (1103,'audit_neha', 'neha345', 'Auditor',"2025-03-21");
INSERT INTO Admins VALUES (1104,'manager_amit', 'amit456', 'Manager',"2025-04-01");
INSERT INTO Admins VALUES (1105,'audit_kiran', 'kiran789', 'Auditor',"2025-04-05");
show tables;
select * from users;
select * from Accounts; 
select * from Transactions;
select  * from loans;
select * from Investments;
select * from Payments;
select* from Admins;