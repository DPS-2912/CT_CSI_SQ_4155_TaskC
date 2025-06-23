UPDATE EMPLOYEES
SET 
  emp_id = salary,
  salary = emp_id
WHERE emp_id IS NOT NULL AND salary IS NOT NULL;
