CREATE TABLE Hackers (
    hacker_id INT,
    name VARCHAR(100)
);

CREATE TABLE Submissions (
    submission_date DATE,
    submission_id INT,
    hacker_id INT,
    score INT
);

INSERT INTO Hackers VALUES (15758, 'Rose');
INSERT INTO Hackers VALUES (20703, 'Angela');
INSERT INTO Hackers VALUES (36396, 'Frank');
INSERT INTO Hackers VALUES (38289, 'Patrick');
INSERT INTO Hackers VALUES (44065, 'Lisa');
INSERT INTO Hackers VALUES (53473, 'Kimberly');
INSERT INTO Hackers VALUES (62529, 'Bonnie');
INSERT INTO Hackers VALUES (79722, 'Michael');

INSERT INTO Submissions VALUES ('2016-03-01', 8494, 20703, 0);
INSERT INTO Submissions VALUES ('2016-03-01', 22403, 53473, 15);
INSERT INTO Submissions VALUES ('2016-03-01', 23965, 79722, 60);
INSERT INTO Submissions VALUES ('2016-03-01', 30173, 36396, 70);
INSERT INTO Submissions VALUES ('2016-03-02', 34928, 20703, 0);
INSERT INTO Submissions VALUES ('2016-03-02', 38740, 15758, 60);
INSERT INTO Submissions VALUES ('2016-03-02', 42769, 79722, 25);
INSERT INTO Submissions VALUES ('2016-03-02', 44364, 79722, 80);
INSERT INTO Submissions VALUES ('2016-03-03', 45440, 20703, 0);
INSERT INTO Submissions VALUES ('2016-03-03', 49050, 36396, 70);
INSERT INTO Submissions VALUES ('2016-03-03', 50273, 79722, 5);
INSERT INTO Submissions VALUES ('2016-03-04', 50344, 20703, 0);
INSERT INTO Submissions VALUES ('2016-03-04', 51360, 44065, 90);
INSERT INTO Submissions VALUES ('2016-03-04', 54404, 53473, 65);
INSERT INTO Submissions VALUES ('2016-03-04', 61533, 79722, 45);
INSERT INTO Submissions VALUES ('2016-03-05', 72852, 20703, 0);
INSERT INTO Submissions VALUES ('2016-03-05', 74546, 38289, 0);
INSERT INTO Submissions VALUES ('2016-03-05', 76487, 62529, 0);
INSERT INTO Submissions VALUES ('2016-03-05', 82439, 36396, 10);
INSERT INTO Submissions VALUES ('2016-03-05', 90006, 36396, 40);
INSERT INTO Submissions VALUES ('2016-03-06', 90404, 20703, 0);

WITH daily_hacker_counts AS (
    SELECT 
        submission_date,
        COUNT(DISTINCT hacker_id) AS total_hackers
    FROM Submissions
    GROUP BY submission_date
),
top_submitters AS (
    SELECT submission_date, hacker_id
    FROM (
        SELECT 
            submission_date,
            hacker_id,
            COUNT(*) AS submission_count,
            RANK() OVER (PARTITION BY submission_date ORDER BY COUNT(*) DESC, hacker_id ASC) AS rnk
        FROM Submissions
        GROUP BY submission_date, hacker_id
    ) ranked
    WHERE rnk = 1
)
SELECT 
    d.submission_date,
    d.total_hackers,
    t.hacker_id,
    h.name
FROM daily_hacker_counts d
JOIN top_submitters t ON d.submission_date = t.submission_date
JOIN Hackers h ON t.hacker_id = h.hacker_id
ORDER BY d.submission_date;