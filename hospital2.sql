USE hospital2;
GO

INSERT INTO Departments (Name) VALUES ('Cardiology'), ('Neurology'), ('Oncology');


INSERT INTO Doctors (Name, Surname, Premium, Salary) VALUES
('John', 'Smith', 2000, 6000),
('Emily', 'Johnson', 1500, 5500),
('Michael', 'Williams', 1800, 5800);


INSERT INTO Specializations (Name) VALUES ('Cardiologist'), ('Neurologist'), ('Oncologist');


INSERT INTO DoctorsSpecializations (DoctorId, SpecializationId) VALUES
(1, 1), (2, 2), (3, 3);


INSERT INTO Sponsors (Name) VALUES ('XYZ Pharmaceuticals'), ('ABC Medical Supplies');


INSERT INTO Donations (Amount, DepartmentId, SponsorId) VALUES
(5000, 1, 1), (3000, 2, 2), (4000, 3, 1);


INSERT INTO Vacations (StartDate, EndDate, DoctorId) VALUES
('2024-05-01', '2024-05-15', 1),
('2024-06-01', '2024-06-15', 2),
('2024-07-01', '2024-07-15', 3);


INSERT INTO Wards (Name, DepartmentId) VALUES
('Ward A', 1), ('Ward B', 2), ('Ward C', 3);
