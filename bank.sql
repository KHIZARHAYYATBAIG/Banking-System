create database bank;

use bank;

-- Create Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);
INSERT INTO Customer (CustomerID, Name, Address, Phone, Email) VALUES
(1, 'John Doe', '123 Main St', '555-1234', 'john.doe@example.com'),
(2, 'Jane Smith', '456 Elm St', '555-5678', 'jane.smith@example.com');
 
-- Create Branch table
CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(255),
    BranchPhone VARCHAR(20)
);
INSERT INTO Branch (BranchID, BranchName, BranchAddress, BranchPhone) VALUES
(1, 'Downtown Branch', '789 Oak St', '555-8765'),
(2, 'Uptown Branch', '321 Pine St', '555-4321');

-- Create Account table
CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    BranchID INT,
    AccountType VARCHAR(50),
    Balance DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);
INSERT INTO Account (AccountID, CustomerID, BranchID, AccountType, Balance) VALUES
(1, 1, 1, 'Checking', 1500.00),
(2, 2, 2, 'Savings', 2500.00);

-- Create Transaction table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(10, 2),
    TransactionType VARCHAR(50),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);
INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType) VALUES
(1, 1, '2024-05-01', 500.00, 'Deposit'),
(2, 2, '2024-05-02', 200.00, 'Withdrawal');
-- Create Loan table
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(50),
    Amount DECIMAL(10, 2),
    LoanDate DATE,
    DueDate DATE,
    InterestRate DECIMAL(5, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
INSERT INTO Loan (LoanID, CustomerID, LoanType, Amount, LoanDate, DueDate, InterestRate) VALUES
(1, 1, 'Home Loan', 100000.00, '2024-01-15', '2034-01-15', 3.5),
(2, 2, 'Car Loan', 20000.00, '2024-02-20', '2029-02-20', 5.0);