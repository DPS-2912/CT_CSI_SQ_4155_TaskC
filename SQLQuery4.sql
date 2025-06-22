CREATE TABLE Contests (
    contest_id VARCHAR(10),
    hacker_id VARCHAR(10),
    name VARCHAR(50)
);

CREATE TABLE Colleges (
    college_id INT,
    contest_id VARCHAR(10)
);

CREATE TABLE Challenges (
    challenge_id INT,
    college_id INT
);

CREATE TABLE View_Stats (
    challenge_id INT,
    total_views INT,
    total_unique_views INT
);

CREATE TABLE Submission_Stats (
    challenge_id INT,
    total_submissions INT,
    total_accepted_submissions INT
);

INSERT INTO Contests (contest_id, hacker_id, name) VALUES
('66406', '17973', 'Rose'),
('66556', '79153', 'Angela'),
('94828', '80275', 'Frank');

-- Insert data into Colleges table
INSERT INTO Colleges (college_id, contest_id) VALUES
(11219, '66406'),
(32473, '66556'),
(56685, '94828');

-- Insert data into Challenges table
INSERT INTO Challenges (challenge_id, college_id) VALUES
(18765, 11219),
(47127, 11219),
(60292, 32473),
(72974, 56685);

-- Insert data into View_Stats table
INSERT INTO View_Stats (challenge_id, total_views, total_unique_views) VALUES
(47127, 26, 19),
(47127, 15, 14),
(18765, 43, 10),
(18765, 72, 13),
(75516, 35, 17),
(60292, 11, 10),
(72974, 41, 15),
(75516, 75, 11);

-- Insert data into Submission_Stats table
INSERT INTO Submission_Stats (challenge_id, total_submissions, total_accepted_submissions) VALUES
(75516, 34, 12),
(47127, 27, 10),
(47127, 56, 18),
(75516, 74, 12),
(75516, 83, 8),
(72974, 68, 24),
(72974, 82, 14),
(47127, 28, 11);

SELECT 
    c.contest_id,
    c.hacker_id,
    c.name,
    COALESCE(SUM(DISTINCT ss.total_submissions), 0) AS total_submissions,
    COALESCE(SUM(DISTINCT ss.total_accepted_submissions), 0) AS total_accepted_submissions,
    COALESCE(SUM(DISTINCT vs.total_views),0) AS total_views,
    COALESCE(SUM(DISTINCT vs.total_unique_views), 0) AS total_unique_views
FROM 
    Contests c
JOIN 
    Colleges col ON c.contest_id = col.contest_id
JOIN 
    Challenges ch ON col.college_id = ch.college_id
LEFT JOIN 
    Submission_Stats ss ON ch.challenge_id = ss.challenge_id
LEFT JOIN 
    View_Stats vs ON ch.challenge_id = vs.challenge_id
GROUP BY 
    c.contest_id, c.hacker_id, c.name
ORDER BY 
    c.contest_id;


