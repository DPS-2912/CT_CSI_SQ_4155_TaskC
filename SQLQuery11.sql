CREATE TABLE Students_11 (
    ID INT,
    Name VARCHAR(50)
);

CREATE TABLE Friends_11 (
    ID INT,
    Friend_ID INT
);

CREATE TABLE Packages_11 (
    ID INT,
    Salary FLOAT
);

INSERT INTO Students_11 (ID, Name) VALUES
(1, 'Ashley'),
(2, 'Samantha'),
(3, 'Julie'),
(4, 'Scarlet');

INSERT INTO Friends_11 (ID, Friend_ID) VALUES
(1, 2),  
(2, 3),  
(3, 4),  
(4, 1);  

INSERT INTO Packages_11 (ID, Salary) VALUES
(1, 15.20),  
(2, 10.06),  
(3, 11.55),  
(4, 12.12);  

SELECT S.Name
FROM Students_11 S
JOIN Friends_11 F ON S.ID = F.ID
JOIN Packages_11 P1 ON S.ID = P1.ID  
JOIN Packages_11 P2 ON F.Friend_ID = P2.ID  
WHERE P2.Salary > P1.Salary  
ORDER BY P2.Salary;  
