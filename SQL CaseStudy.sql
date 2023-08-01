-- This file includes both Health Care and Library Management System Usecases

-- Usecase Domain: Health care

-- Creating the Patient table
CREATE TABLE Patient (
  PatientID INT PRIMARY KEY,
  Name VARCHAR(100),
  Address VARCHAR(100),
  DateOfBirth DATE,
  ContactNumber VARCHAR(20)
);

-- Creating the Medical History table
CREATE TABLE MedicalHistory (
  MedicalHistoryID INT PRIMARY KEY,
  PatientID INT,
  Diagnosis VARCHAR(100),
  Treatment VARCHAR(100),
  Surgery VARCHAR(100),
  Medication VARCHAR(100),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Creating the Lab Results table
CREATE TABLE LabResults (
  LabResultID INT PRIMARY KEY,
  PatientID INT,
  TestType VARCHAR(100),
  TestResult VARCHAR(100),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Creating the Prescriptions table
CREATE TABLE Prescriptions (
  PrescriptionID INT PRIMARY KEY,
  PatientID INT,
  MedicationName VARCHAR(100),
  Dosage VARCHAR(50),
  Frequency VARCHAR(50),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Creating the Outcome table
CREATE TABLE Outcome (
  OutcomeID INT PRIMARY KEY,
  PatientID INT,
  ReadmissionRate FLOAT,
  MedicationAdherence FLOAT,
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Example queries:

-- Get all patients
SELECT * FROM Patient;

-- Get patient's medical history
SELECT * FROM MedicalHistory WHERE PatientID = 1;

-- Get patient's lab results
SELECT * FROM LabResults WHERE PatientID = 1;

-- Get patient's prescriptions
SELECT * FROM Prescriptions WHERE PatientID = 1;

-- Get patient's outcomes
SELECT * FROM Outcome WHERE PatientID = 1;

-- Creating the Prescriptions table
CREATE TABLE Prescriptions (
  PrescriptionID INT PRIMARY KEY,
  PatientID INT,
  MedicationName VARCHAR(100),
  Dosage VARCHAR(50),
  Frequency VARCHAR(50),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Creating the Outcome table
CREATE TABLE Outcome (
  OutcomeID INT PRIMARY KEY,
  PatientID INT,
  ReadmissionRate FLOAT,
  MedicationAdherence FLOAT,
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Example queries:

-- Get all patients
SELECT * FROM Patient;

-- Get patient's medical history
SELECT * FROM MedicalHistory WHERE PatientID = 1;

-- Get patient's lab results
SELECT * FROM LabResults WHERE PatientID = 1;

-- Get patient's prescriptions
SELECT * FROM Prescriptions WHERE PatientID = 1;

-- Get patient's outcomes
SELECT * FROM Outcome WHERE PatientID = 1;

-- Creating the Prescriptions table
CREATE TABLE Prescriptions (
  PrescriptionID INT PRIMARY KEY,
  PatientID INT,
  MedicationName VARCHAR(100),
  Dosage VARCHAR(50),
  Frequency VARCHAR(50),
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Creating the Outcome table
CREATE TABLE Outcome (
  OutcomeID INT PRIMARY KEY,
  PatientID INT,
  ReadmissionRate FLOAT,
  MedicationAdherence FLOAT,
  FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Example queries:

-- Get all patients
SELECT * FROM Patient;

-- Get patient's medical history
SELECT * FROM MedicalHistory WHERE PatientID = 1;

-- Get patient's lab results
SELECT * FROM LabResults WHERE PatientID = 1;

-- Get patient's prescriptions
SELECT * FROM Prescriptions WHERE PatientID = 1;

-- Get patient's outcomes
SELECT * FROM Outcome WHERE PatientID = 1;

-- UseCase Domain: Library Management System

use analysis;

-- Create the Books table
CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(255),
  Author VARCHAR(255),
  Publisher VARCHAR(255),
  PublicationYear INT,
  ISBN VARCHAR(255),
  Genre VARCHAR(255),
  Availability BOOLEAN
);

-- Create the Borrowers table
CREATE TABLE Borrowers (
  BorrowerID INT PRIMARY KEY,
  Name VARCHAR(255),
  Address VARCHAR(255),
  PhoneNumber VARCHAR(255),
  Email VARCHAR(255)
);

-- Create the Loans table
CREATE TABLE Loans (
  LoanID INT PRIMARY KEY,
  BookID INT,
  BorrowerID INT,
  DateBorrowed DATE,
  DueDate DATE,
  DateReturned DATE,
  FOREIGN KEY (BookID) REFERENCES Books (BookID),
  FOREIGN KEY (BorrowerID) REFERENCES Borrowers (BorrowerID)
);

-- Create the Reservations table
CREATE TABLE Reservations (
  ReservationID INT PRIMARY KEY,
  BookID INT,
  BorrowerID INT,
  DateReserved DATE,
  DateNeeded DATE,
  Status VARCHAR(255),
  FOREIGN KEY (BookID) REFERENCES Books (BookID),
  FOREIGN KEY (BorrowerID) REFERENCES Borrowers (BorrowerID)
);

-- Get all available books:
SELECT * FROM Books WHERE Availability = 1;

-- Get all borrowed books:
SELECT Books.Title, Books.Author, Borrowers.Name, Loans.DateBorrowed, Loans.DueDate
FROM Books
INNER JOIN Loans ON Books.BookID = Loans.BookID
INNER JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID;

-- Get all reserved books:
SELECT Books.Title, Books.Author, Borrowers.Name, Reservations.DateReserved, Reservations.DateNeeded
FROM Books
INNER JOIN Reservations ON Books.BookID = Reservations.BookID
INNER JOIN Borrowers 
ON Reservations.BorrowerID = Borrowers.BorrowerID;

-- Get all books borrowed by a specific borrower:
SELECT Books.Title, Books.Author, Loans.DateBorrowed, Loans.DueDate, Loans.DateReturned
FROM Books
INNER JOIN Loans ON Books.BookID = Loans.BookID
INNER JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID
WHERE Borrowers.BorrowerID = Loans.BorrowerID;

-- Get all reservations made by a specific borrower:
SELECT Books.Title, Books.Author, Reservations.DateReserved, Reservations.DateNeeded, Reservations.Status
FROM Books
INNER JOIN Reservations ON Books.BookID = Reservations.BookID
INNER JOIN Borrowers ON Reservations.BorrowerID = Borrowers.BorrowerID
WHERE Borrowers.BorrowerID= Reservations.BorrowerID;
