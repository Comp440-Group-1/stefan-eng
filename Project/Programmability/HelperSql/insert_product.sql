-- Remove all the old produce
DELETE FROM Product
-- Insert sample data
INSERT INTO Product ([ProductID], [Name], [Platform], [Description]) VALUES (1, 'EHR System','Windows','health records system for the patients')
INSERT INTO Product ([ProductID], [Name], [Platform], [Description]) VALUES (2, 'EHR System','Linux','health records system for the patients')

