
SELECT 
    D.Name + ' ' + D.Surname AS DoctorName,
    S.Name AS Specialization
FROM 
    Doctors D
INNER JOIN 
    DoctorsSpecializations DS ON D.Id = DS.DoctorId
INNER JOIN 
    Specializations S ON DS.SpecializationId = S.Id;

SELECT 
    D.Surname AS DoctorSurname,
    D.Salary + D.Premium AS TotalEarnings
FROM 
    Doctors D
LEFT JOIN 
    Vacations V ON D.Id = V.DoctorId
WHERE 
    V.Id IS NULL;


SELECT 
    W.Name AS WardName
FROM 
    Wards W
INNER JOIN 
    Departments D ON W.DepartmentId = D.Id
WHERE 
    D.Name = 'Cardiology';


SELECT DISTINCT
    D.Name AS DepartmentName
FROM 
    Departments D
INNER JOIN 
    Donations DN ON D.Id = DN.DepartmentId
INNER JOIN 
    Sponsors S ON DN.SponsorId = S.Id
WHERE 
    S.Name = 'XYZ Pharmaceuticals';


SELECT 
    D.Name AS Department,
    S.Name AS Sponsor,
    DN.Amount AS DonationAmount,
    DN.Date AS DonationDate
FROM 
    Donations DN
INNER JOIN 
    Departments D ON DN.DepartmentId = D.Id
INNER JOIN 
    Sponsors S ON DN.SponsorId = S.Id
WHERE 
    DN.Date >= DATEADD(MONTH, -1, GETDATE());
