﻿CREATE TABLE Blood
(
	BloodID INT IDENTITY PRIMARY KEY,
	BloodGroup NVARCHAR(20) NOT NULL
)
GO
CREATE TABLE Donors
(
	DonorID INT IDENTITY PRIMARY KEY,
	DonorName NVARCHAR(50) NOT NULL,
	DonorAddress NVARCHAR(100) NOT NULL,
	Picture NVARCHAR(150) NOT NULL,
	Available BIT,
	BloodID INT NOT NULL REFERENCES Blood(BloodID)
)
GO
CREATE TABLE Hospitals
(
	HospitalID INT IDENTITY PRIMARY KEY,
	HospitalName NVARCHAR(50) NOT NULL,
	Address NVARCHAR(100) NOT NULL,
	Location NVARCHAR(100) NOT NULL
)
GO
CREATE TABLE Patients
(
	PatiantID INT IDENTITY PRIMARY KEY,
	PatiantName NVARCHAR(50) NOT NULL,
	PatiantAddress NVARCHAR(100) NOT NULL,
	Payment MONEY NOT NULL,
	BloodID INT NOT NULL REFERENCES Blood(BloodID),
	HospitalID INT NOT NULL REFERENCES Hospitals(HospitalID)
)
GO
CREATE TABLE PatiantDonors
(
	DonationID INT IDENTITY PRIMARY KEY,
	DonorID INT NOT NULL REFERENCES Donors(DonorID),
	PatiantID INT NOT NULL REFERENCES Patients(PatiantID),
	TimeOfDonation DATE NOT NULL
)
GO