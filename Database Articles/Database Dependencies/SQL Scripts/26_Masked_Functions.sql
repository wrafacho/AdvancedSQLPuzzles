---------------------------------------------
USE foo;
GO

DROP TABLE IF EXISTS dbo.tbl_example_26;
GO

---------------------------------------------
---------------------------------------------
---------------------------------------------
USE foo;
GO

CREATE TABLE dbo.tbl_example_26 
(
EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(50) MASKED WITH (FUNCTION = 'default()'),            -- Default mask: masks the entire value based on the data type
LastName VARCHAR(50) MASKED WITH (FUNCTION = 'partial(1,"XXXXXX",1)'), -- Partial mask: shows first and last character only
Email VARCHAR(255) MASKED WITH (FUNCTION = 'email()'),                 -- Email mask: hides part of the email
PhoneNumber VARCHAR(15) MASKED WITH (FUNCTION = 'partial(0, "XXX-XXX-", 4)'), -- Partial mask for phone number
Salary INT MASKED WITH (FUNCTION = 'random(1000, 5000)')               -- Random mask: generates a random number in the specified range
);
GO

-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
USE foo;
GO

DECLARE @vTruncate SMALLINT = 1;
IF @vTruncate = 1
BEGIN
     TRUNCATE TABLE foo.dbo.sql_expression_dependencies;
END;
GO

-------------------------------------------------------
USE foo;
GO

INSERT INTO foo.dbo.sql_expression_dependencies
(database_name, example_number, referencing_object_type, referencing_entity_name, referencing_id, referencing_minor_id, referencing_class, referencing_class_desc, is_schema_bound_reference, referenced_class, referenced_class_desc, referenced_server_name, referenced_database_name, referenced_schema_name, referenced_entity_name, referenced_object_type, referenced_id, referenced_minor_id, is_caller_dependent, is_ambiguous)
SELECT  'foo', '26', c.type AS referencing_object_type, c.name AS referencing_entity_name, referencing_id, referencing_minor_id, referencing_class, referencing_class_desc, is_schema_bound_reference, referenced_class, referenced_class_desc, referenced_server_name, referenced_database_name, referenced_schema_name, referenced_entity_name, b.type AS referenced_object_type, referenced_id, referenced_minor_id, is_caller_dependent, is_ambiguous
FROM    sys.sql_expression_dependencies a LEFT OUTER JOIN
        sys.objects b ON a.referenced_id = b.object_id LEFT OUTER JOIN
        sys.objects c ON a.referencing_id = c.object_id;
GO

-------------------------------------------------------
SELECT * FROM foo.dbo.sql_expression_dependencies ORDER BY example_number;
GO

-------------------------------------------------------
USE foo;
GO

DECLARE @vDropObjects SMALLINT = 1;
IF @vDropObjects = 1
BEGIN
     DROP TABLE IF EXISTS dbo.tbl_example_26;
END;
GO
