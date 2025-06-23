CREATE TABLE EMPLOYEES (
    emp_id INT,
    name VARCHAR(100),
    salary INT,
    band VARCHAR(10),
    sub_band VARCHAR(10),
    BU VARCHAR(50),
    job_family VARCHAR(50),
    country VARCHAR(50),
    join_date DATE
);

INSERT INTO EMPLOYEES VALUES 
(101, 'Alice', 50000, 'B1', 'SB1', 'BU1', 'HR', 'India', '2023-01-10'),
(102, 'Bob', 60000, 'B2', 'SB2', 'BU1', 'Finance', 'India', '2023-02-15'),
(103, 'Charlie', 0, 'B2', 'SB1', 'BU2', 'IT', 'USA', '2022-12-01'),
(104, 'David', 45000, 'B1', 'SB2', 'BU1', 'IT', 'India', '2023-01-25'),
(105, 'Eve', 75000, 'B3', 'SB3', 'BU2', 'Sales', 'USA', '2023-03-05'),
(106, 'Frank', 50000, 'B1', 'SB1', 'BU1', 'HR', 'India', '2023-01-11');


CREATE TABLE COSTS (
    BU VARCHAR(50),
    cost_month DATE,
    cost_amount FLOAT
);

INSERT INTO COSTS VALUES
('BU1', '2023-01-01', 100000),
('BU1', '2023-02-01', 120000),
('BU2', '2023-01-01', 80000),
('BU2', '2023-02-01', 95000);


CREATE TABLE REVENUE (
    BU VARCHAR(50),
    revenue_month DATE,
    revenue_amount FLOAT
);

INSERT INTO REVENUE VALUES
('BU1', '2023-01-01', 200000),
('BU1', '2023-02-01', 180000),
('BU2', '2023-01-01', 150000),
('BU2', '2023-02-01', 160000);

CREATE TABLE HEADCOUNT (
    sub_band VARCHAR(10),
    headcount INT,
    as_of_date DATE
);

INSERT INTO HEADCOUNT VALUES
('SB1', 5, '2023-01-01'),
('SB2', 3, '2023-01-01'),
('SB3', 2, '2023-01-01');

CREATE TABLE JOBS (
    job_family VARCHAR(50),
    job_title VARCHAR(100),
    cost FLOAT,
    country VARCHAR(50)
);

INSERT INTO JOBS VALUES
('HR', 'HR Manager', 5000, 'India'),
('Finance', 'Financial Analyst', 6000, 'India'),
('IT', 'Developer', 5500, 'USA'),
('Sales', 'Sales Manager', 7000, 'USA');


SELECT 
  job_family,
  country,
  SUM(cost) * 100.0 / (SELECT SUM(cost) FROM JOBS) AS cost_percentage
FROM JOBS
GROUP BY job_family, country;





