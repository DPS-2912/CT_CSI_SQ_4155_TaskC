/*Table Creation*/
CREATE TABLE Projects (
    Task_ID INT PRIMARY KEY,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL
);

/*Inserting Values*/

INSERT INTO Projects (Task_ID, Start_Date, End_Date)
VALUES 
(1, '2015-10-01', '2015-10-02'),
(2, '2015-10-02', '2015-10-03'),
(3, '2015-10-03', '2015-10-04'),
(4, '2015-10-13', '2015-10-14'),
(5, '2015-10-14', '2015-10-15'),
(6, '2015-10-28', '2015-10-29'),
(7, '2015-10-30', '2015-10-31');

/*Query*/
SELECT 
    MIN(Start_Date) AS Project_Start,
    MAX(End_Date) AS Project_End,
    COUNT(*) AS Duration
FROM (
    SELECT *,
        SUM(CASE WHEN CAST(Start_Date AS DATE) != prev_end_date OR prev_end_date IS NULL THEN 1 ELSE 0 END)
            OVER (ORDER BY Start_Date ROWS UNBOUNDED PRECEDING) AS grp
    FROM (
        SELECT *,
            LAG(CAST(End_Date AS DATE)) OVER (ORDER BY Start_Date) AS prev_end_date
        FROM Projects
    ) AS Step1
) AS Step2
GROUP BY grp
ORDER BY Duration, Project_Start;
