CREATE PROCEDURE INSERTEMPLOYEE
(
	@empName varchar(50),
	@empAddress varchar(MAX),
	@empSalary int,
	@deptId int,
	@empId int OUTPUT
)

AS
INSERT INTO tblEmployee values(@empName,@empAddress,@empSalary,@deptId)
SET @empId = @@IDENTITY

---------------------------------------Calling the Stored Proc---------------------------------------

DECLARE @empId int

EXEC InsertEmployee
		
	@empName = 'Pavan R',
	@empAddress = 'Udupi',
	@empSalary = 56000,
	@deptId = 1,
	@empId = @empId OUTPUT

SELECT @empId as N'@empId'

GO

---------------------------------------Select Employee Proc---------------------------------------

CREATE PROCEDURE SelectEmployee
(
	
	@empId int
)

AS

SELECT * FROM tblEmployee WHERE EmpId = @empId

---------------------------------------Delete Employee Proc---------------------------------------

CREATE PROCEDURE DELETEEMPLOYEE(@id int)
AS DELETE from tblEmployee WHERE EmpId = @id

---------------------------------------Alter Employee Proc---------------------------------------

ALTER PROCEDURE DELETEEMPLOYEE
@id int, @depId int
AS 
DELETE from tblEmployee WHERE EmpId = @id AND DeptId = @depId

SELECT * FROM tblEmployee

