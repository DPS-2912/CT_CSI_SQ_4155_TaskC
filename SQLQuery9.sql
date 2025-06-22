CREATE TABLE BST (
    N INT,   
    P INT    
);

INSERT INTO BST (N, P) VALUES
(1, 2),   
(3, 2),   
(6, 8),   
(9, 8),   
(2, 5),   
(8, 5),   
(5, NULL); 

SELECT 
    N,
    CASE 
        WHEN P IS NULL THEN 'Root'  -- Root node
        WHEN N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf'  -- Leaf node
        ELSE 'Inner'  -- Inner node
    END AS Node_Type
FROM BST
ORDER BY N;
