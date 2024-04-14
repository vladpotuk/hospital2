
CREATE DATABASE hospital2;
GO

USE hospital2;
GO

CREATE TABLE Departments (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100) NOT NULL UNIQUE
);
GO


CREATE TABLE Doctors (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(MAX) NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL,
    Premium MONEY NOT NULL DEFAULT 0,
    Salary MONEY NOT NULL CHECK (Salary > 0),
    CONSTRAINT CHK_DoctorFullName CHECK (Name <> '' AND Surname <> '')
);
GO


CREATE TABLE DoctorsSpecializations (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    DoctorId INT NOT NULL,
    SpecializationId INT NOT NULL,
    CONSTRAINT FK_DoctorSpecialization_Doctor FOREIGN KEY (DoctorId) REFERENCES Doctors(Id),
    CONSTRAINT FK_DoctorSpecialization_Specialization FOREIGN KEY (SpecializationId) REFERENCES Specializations(Id)
);
GO

CREATE TABLE Donations (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Amount MONEY NOT NULL CHECK (Amount > 0),
    Date DATE NOT NULL DEFAULT GETDATE(),
    DepartmentId INT NOT NULL,
    SponsorId INT NOT NULL,
    CONSTRAINT FK_Donation_Department FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
    CONSTRAINT FK_Donation_Sponsor FOREIGN KEY (SponsorId) REFERENCES Sponsors(Id)
);

CREATE TABLE Specializations (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100) NOT NULL UNIQUE
);
GO


CREATE TABLE Sponsors (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100) NOT NULL UNIQUE
);
GO


CREATE TABLE Vacations (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL CHECK (EndDate > StartDate),
    DoctorId INT NOT NULL,
    CONSTRAINT FK_Vacation_Doctor FOREIGN KEY (DoctorId) REFERENCES Doctors(Id)
);
GO


CREATE TABLE Wards (
    Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(20) NOT NULL UNIQUE,
    DepartmentId INT NOT NULL,
    CONSTRAINT FK_Ward_Department FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);
GO
