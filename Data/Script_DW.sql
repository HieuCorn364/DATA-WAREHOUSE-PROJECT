/****** Object:  Database Hopepital_DW    Script Date: 20/05/2025 1:40:27 SA ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 4

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/
/*
DROP DATABASE Hopepital_DW
GO
CREATE DATABASE Hopepital_DW
GO
ALTER DATABASE Hopepital_DW
SET RECOVERY SIMPLE
GO
*/
USE Hopepital_DW
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;





/* Drop table dbo.DimTime */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimTime') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimTime 
;

/* Create table dbo.DimTime */
CREATE TABLE dbo.DimTime (
   [Time_key]  int   NOT NULL
,  [Bill_year]  int   NULL
,  [Bill_quarter]  int   NULL
,  [Bill_month]  int   NULL
,  [Bill_day]  int   NULL
,  [Bill_dayname]  nvarchar(50)   NULL
, CONSTRAINT [PK_dbo.DimTime] PRIMARY KEY CLUSTERED 
( [Time_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimTime
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimTime', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimTime
;

INSERT INTO dbo.DimTime (Time_key, Bill_year, Bill_quarter, Bill_month, Bill_day, Bill_dayname)
VALUES (-1, 2016, 1, 1, 1, 'Monday')
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Time Dim Surrogate Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Time_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BILL YEAR', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_year'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BILL QUARTER', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_quarter'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BILL MONTH', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_month'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BILL DAY', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_day'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BILL DAY NAME', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_dayname'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Time_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Year of bill', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_year'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Quarter of bill', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_quarter'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Mobth of bill', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_month'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Day of bill', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_day'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of day in week', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_dayname'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Time_key'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Time_key'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_year'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_quarter'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_month'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_day'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_dayname'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Time_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_year'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_quarter'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_month'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_day'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BILL_DATE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_year'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BILL_DATE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_quarter'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BILL_DATE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_month'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BILL_DATE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_day'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_year'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_quarter'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_month'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimTime', @level2type=N'COLUMN', @level2name=N'Bill_day'; 
;





/* Drop table dbo.DimDoctor */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimDoctor') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimDoctor 
;

/* Create table dbo.DimDoctor */
CREATE TABLE dbo.DimDoctor (
   [Doctor_ID]  int   NOT NULL
,  [Doctor_name]  nvarchar(255)   NULL
,  [Department_ID]  int   NOT NULL
,  [RowIsCurrent]  nchar(1)   NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime   NULL
, CONSTRAINT [PK_dbo.DimDoctor] PRIMARY KEY CLUSTERED 
( [Doctor_ID] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDoctor
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimDoctor', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDoctor
;

INSERT INTO dbo.DimDoctor (Doctor_ID, Doctor_name, Department_ID, RowIsCurrent, RowStartDate, RowEndDate)
VALUES (-1, '', -1, 'Y', '', '')
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Doctor ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Doctor name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Department_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Department_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tên của bác sĩ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_ID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Department_ID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Department_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DOCTOR_ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DOCTOR', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(255)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDoctor', @level2type=N'COLUMN', @level2name=N'Doctor_name'; 
;





/* Drop table dbo.DimDepartment */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimDepartment') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimDepartment 
;

/* Create table dbo.DimDepartment */
CREATE TABLE dbo.DimDepartment (
   [Department_ID]  int   NOT NULL
,  [Department_name]  nvarchar(255)   NULL
, CONSTRAINT [PK_dbo.DimDepartment] PRIMARY KEY CLUSTERED 
( [Department_ID] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDepartment
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimDepartment', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDepartment
;

INSERT INTO dbo.DimDepartment (Department_ID, Department_name)
VALUES (-1, '')
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Department Dim ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Department name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tên phòng ban', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2,3,…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_ID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_ID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DEPARTMENT_ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DEPARTMENT', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(255)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDepartment', @level2type=N'COLUMN', @level2name=N'Department_name'; 
;





/* Drop table dbo.DimPatient */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimPatient') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimPatient 
;

/* Create table dbo.DimPatient */
CREATE TABLE dbo.DimPatient (
   [Patient_ID]  int   NOT NULL
,  [Patient_name]  nvarchar(255)   NULL
,  [Patient_age]  tinyint   NULL
,  [Patient_dob]  datetime   NULL
,  [Patient_sex]  nvarchar(255)   NULL
,  [Patient_address]  nvarchar(255)   NULL
,  [Patient_province]  nvarchar(255)   NULL
,  [Patient_creation_date]  datetime   NULL
,  [RowIsCurrent]  nchar(1)   NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime   NULL
, CONSTRAINT [PK_dbo.DimPatient] PRIMARY KEY CLUSTERED 
( [Patient_ID] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimPatient
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimPatient', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimPatient
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Thông tin bệnh nhân', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimPatient
;

INSERT INTO dbo.DimPatient (Patient_ID, Patient_name, Patient_age, Patient_dob, Patient_sex, Patient_address, Patient_province, Patient_creation_date, RowIsCurrent, RowStartDate, RowEndDate)
VALUES (-1, '', NULL, '', '', '', '', '', 'Y', '', '')
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Blank Dim ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Patient name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Patient age', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_age'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Patient dob', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_dob'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Patient sex', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_sex'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Patient address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_address'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Patient province', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_province'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Patient creation date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_creation_date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tên bệnh nhân', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tuổi', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_age'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Ngày sinh', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_dob'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Giới tính', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_sex'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Địa chỉ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_address'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tỉnh', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_province'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Ngày tạo tài khoản', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_creation_date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_ID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_age'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_dob'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_sex'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_address'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_province'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_creation_date'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_age'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_dob'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_sex'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_address'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_province'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_creation_date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'PATIENT_ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'NAME_UPPER', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'AGE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_age'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DOB', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_dob'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SEX', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_sex'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ADDRESS', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_address'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'PROVINCE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_province'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'PATIENT_CREATION_DATE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_creation_date'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_ID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(255)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_age'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_dob'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(255)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_sex'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(255)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_address'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(255)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_province'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPatient', @level2type=N'COLUMN', @level2name=N'Patient_creation_date'; 
;





/* Drop table dbo.DimItem */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimItem') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimItem 
;

/* Create table dbo.DimItem */
CREATE TABLE dbo.DimItem (
   [Item_Code]  nvarchar(255)   NOT NULL
,  [Item_name]  nvarchar(255)   NULL
,  [Item_price]  float   NULL
,  [Item_type]  nvarchar(255)   NULL
,  [RowIsCurrent]  nchar(1)   NULL
,  [RowStartDate]  datetime   NULL
,  [RowEndDate]  datetime   NULL
, CONSTRAINT [PK_dbo.DimItem] PRIMARY KEY CLUSTERED 
( [Item_Code] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimItem
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimItem', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimItem
;

INSERT INTO dbo.DimItem (Item_Code, Item_name, Item_price, Item_type, RowIsCurrent, RowStartDate, RowEndDate)
VALUES ('-1', '', NULL, '', 'Y', '', '')
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Item Dim ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_Code'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Item name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Item price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_price'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Item type key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_type'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Is Current', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row Start Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Row End Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_Code'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tên sản phẩm, dịch vụ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Giá', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_price'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Loại', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_type'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_Code'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_price'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_type'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'n/a', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Exclude from cube', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_Code'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_price'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_type'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ITEM_CODE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_Code'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ITEM', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ITEM_TYPE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_type'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(255)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_Code'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(255)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(255)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimItem', @level2type=N'COLUMN', @level2name=N'Item_type'; 
;





/* Drop table dbo.FactBill */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactBill') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactBill 
;

/* Create table dbo.FactBill */
CREATE TABLE dbo.FactBill (
   [Bill_ID]  int   NOT NULL
,  [Quantity]  int   NULL
,  [List_price]  int   NULL
,  [Vat_amount]  int   NULL
,  [Waiver_amount]  int   NULL
,  [Surcharge]  int   NULL
,  [Net_sale]  int   NULL
,  [Gross_sale]  int   NULL
,  [Time_key]  int   NOT NULL
,  [Patient_ID]  int   NOT NULL
,  [Doctor_ID]  int   NOT NULL
,  [Item_code]  nvarchar(255)   NOT NULL
,  [Vat_Rate]  int   NULL
,  [Discount]  int   NULL
, CONSTRAINT [PK_dbo.FactBill] PRIMARY KEY NONCLUSTERED 
( [Bill_ID] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBill
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactBill', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBill
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Bill_ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Bill_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'List_price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'List_price'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Vat_amount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Vat_amount'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Waiver_amount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Waiver_amount'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Surcharge', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Surcharge'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Net_sale', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Net_sale'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Gross_sale', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Gross_sale'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Time_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Time_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Patient_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Patient_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Doctor_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Doctor_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Item_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Item_code'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Vat_Rate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Vat_Rate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Discount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Discount'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Phí phải trả sau BHYT', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Waiver_amount'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Phụ phí', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Surcharge'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Doanh thu thuần', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Net_sale'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Doanh thu gộp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Gross_sale'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Time_key'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Patient_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Doctor_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Item_code'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Bill_ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'List_price'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Vat_amount'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Waiver_amount'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Surcharge'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Net_sale'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Gross_sale'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Excel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Discount'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BILL_ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Bill_ID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'QUANTITY', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Quantity'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'LIST_PRICE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'List_price'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'VAT_AMOUNT', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Vat_amount'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'WAIVER_AMOUNT', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Waiver_amount'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SURCHARGE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Surcharge'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'NET_SALE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Net_sale'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'GROSS_SALE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Gross_sale'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'VAT_RATE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBill', @level2type=N'COLUMN', @level2name=N'Discount'; 
;
ALTER TABLE dbo.DimDoctor ADD CONSTRAINT
   FK_dbo_DimDoctor_Department_ID FOREIGN KEY
   (
   Department_ID
   ) REFERENCES DimDepartment
   ( Department_ID )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBill ADD CONSTRAINT
   FK_dbo_FactBill_Time_key FOREIGN KEY
   (
   Time_key
   ) REFERENCES DimTime
   ( Time_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBill ADD CONSTRAINT
   FK_dbo_FactBill_Patient_ID FOREIGN KEY
   (
   Patient_ID
   ) REFERENCES DimPatient
   ( Patient_ID )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBill ADD CONSTRAINT
   FK_dbo_FactBill_Doctor_ID FOREIGN KEY
   (
   Doctor_ID
   ) REFERENCES DimDoctor
   ( Doctor_ID )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBill ADD CONSTRAINT
   FK_dbo_FactBill_Item_code FOREIGN KEY
   (
   Item_code
   ) REFERENCES DimItem
   ( Item_Code )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
