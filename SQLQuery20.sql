-- A. Create backup table if not exists
IF NOT EXISTS (
    SELECT * FROM sysobjects 
    WHERE name = 'EMPLOYEES_BACKUP' AND xtype = 'U'
)
BEGIN
    SELECT * INTO EMPLOYEES_BACKUP FROM EMPLOYEES;
END

-- B. Copy only new data from EMPLOYEES to EMPLOYEES_BACKUP
INSERT INTO EMPLOYEES_BACKUP
SELECT * FROM EMPLOYEES E
WHERE NOT EXISTS (
    SELECT 1 FROM EMPLOYEES_BACKUP B
    WHERE B.emp_id = E.emp_id AND B.name = E.name
);
