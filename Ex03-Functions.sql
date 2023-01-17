CREATE FUNCTION GetDept(@id int)
RETURNS varchar(50)
AS
BEGIN
DECLARE @deptName varchar(50)
SET @deptName = (SELECT tblDept.DeptName from tblDept WHERE DeptId = @id)
RETURN @deptName
END

---------------------------------------Call the Function---------------------------------------

PRINT dbo.GetDept(3)
SELECT dbo.GetDept(3)

---------------------------------------Date Function---------------------------------------

SELECT 
  GETDATE() as 'GETDATE()',  
  SYSDATETIME() as 'SYSDATETIME()';

CREATE FUNCTION CreateDate(@date Date)
RETURNS varchar(50)
AS
BEGIN
DECLARE @retVal varchar(20)
Set @retVal = '' + CAST(DAY(@Date) AS VARCHAR(5)) + '/' + CAST(MONTH(@Date) AS VARCHAR(4)) + '/' + CAST(YEAR(@Date) AS VARCHAR(4))
RETURN @retVal
END

ALTER FUNCTION CreateDate(@date Date)
RETURNS varchar(20)
AS
BEGIN
DECLARE @retVal varchar(20)
Set @retVal = '' + DATENAME(day, @Date) + '' + DATENAME(month, @Date) + '' + DATENAME(year, @Date)
RETURN @retVal
END

PRINT dbo.CreateDate(GETDATE())

---------------------------------------Age Function---------------------------------------

CREATE FUNCTION GetAge(@dob Date)
RETURNS int
AS
BEGIN
DECLARE @age int = 0
Set @age = DATEDIFF(YEAR, @dob, GETDATE());
RETURN @age
END

PRINT dbo.GetAge('2000/02/22')
PRINT dbo.CreateDate(GETDATE())

---------------------------------------Table Value Function---------------------------------------

CREATE FUNCTION GetAllEmployees()
RETURNS TABLE
AS
RETURN(SELECT * FROM tblEmployee)

SELECT EmpName, EmpAddress from dbo.GetAllEmployees()