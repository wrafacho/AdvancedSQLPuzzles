---------------------------------------------
USE foo;
GO

DROP PROCEDURE IF EXISTS dbo.sp_example_11;
DROP TABLE IF EXISTS tbl_example_11;
GO
---------------------------------------------
---------------------------------------------
---------------------------------------------
USE foo;
GO

CREATE TABLE dbo.tbl_example_11
(
OrderID INT,
ProductID INT,
Quantity INT,
UnitPrice MONEY
);
GO

CREATE PROCEDURE dbo.sp_example_11 AS
BEGIN
     UPDATE  alias_example_11
     SET     Quantity = 0
     FROM    dbo.tbl_example_11 AS alias_example_11;
     
     UPDATE  alias_example_11
     SET     Quantity = 0
     FROM    #temp_table AS alias_example_11;
END;
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
SELECT  'foo', '11', c.type AS referencing_object_type, c.name AS referencing_entity_name, referencing_id, referencing_minor_id, referencing_class, referencing_class_desc, is_schema_bound_reference, referenced_class, referenced_class_desc, referenced_server_name, referenced_database_name, referenced_schema_name, referenced_entity_name, b.type AS referenced_object_type, referenced_id, referenced_minor_id, is_caller_dependent, is_ambiguous
FROM    sys.sql_expression_dependencies a LEFT OUTER JOIN
        sys.objects b ON a.referenced_id = b.object_id LEFT OUTER JOIN
        sys.objects c ON a.referencing_id = c.object_id;
GO

-------------------------------------------------------
SELECT * FROM foo.dbo.sql_expression_dependencies ORDER BY example_number;
GO

---------------------------------------------
USE foo;
GO

DECLARE @vDropObjects SMALLINT = 1;
IF @vDropObjects = 1
BEGIN
     DROP PROCEDURE IF EXISTS dbo.sp_example_11;
     DROP TABLE IF EXISTS tbl_example_11;
END;
GO