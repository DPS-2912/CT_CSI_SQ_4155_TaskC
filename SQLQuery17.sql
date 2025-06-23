CREATE LOGIN user_sam WITH PASSWORD = 'StrongPass123!';
CREATE USER user_sam FOR LOGIN user_sam;
ALTER ROLE db_owner ADD MEMBER user_sam;