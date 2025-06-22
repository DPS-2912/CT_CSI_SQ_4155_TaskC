CREATE TABLE Functions (
    X INT,
    Y INT
);

INSERT INTO Functions (X, Y) VALUES
(20, 20),
(20, 20),
(20, 21),
(23, 22),
(22, 23),
(21, 20);

select * from Functions;

SELECT Distinct F1.X, F1.Y
FROM Functions F1
JOIN Functions F2
ON F1.X = F2.Y AND F1.Y = F2.X
WHERE F1.X <= F1.Y  
ORDER BY F1.X;


