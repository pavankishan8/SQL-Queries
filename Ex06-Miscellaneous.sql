---------------------------------------Distinct clause is used to remove the duplicates from the recordset---------------------------------------

Select Distinct EmpAddress from tblEmployee

Select * from tblEmployee where EmpAddress IN ('Bangalore', 'Hassan', 'Udupi')
Select * from tblEmployee where EmpAddress NOT IN ('Bangalore', 'Hassan', 'Udupi')

---------------------------------------Create a table called Contacts that has Name and Address in it---------------------------------------

create table tblContacts
(
contactId int primary key identity(1,1),
contactName varchar(50) NOT NULL,
contactCity varchar(100) NOT NULL
)

Insert into tblContacts(contactName, contactCity)
SELECT EmpName, EmpAddress from tblEmployee where EmpId < 1050 

---------------------------------------Delete using top number of percent---------------------------------------

DELETE TOP(25) percent from tblEmployee where EmpAddress = 'Tenali'

DELETE t1 from tblemployee t1 
inner join tblEmployee t2 on t1.empid = t2.empid
where t2.empaddress in (select top(3) empaddress from tblemployee where empaddress='mysore' order by EmpAddress desc)

---------------------------------------Select on Union Statement---------------------------------------

Select EmpName from tblEmployee UNION select tblContacts.contactName from tblContacts

---------------------------------------Pivot table in SQL---------------------------------------

SELECT 'TotalSalary' AS TotalSalariesByDept, [4], [5]
FROM (SELECT deptID, EmpSalary from tblEmployee) AS SourceTable
PIVOT
(
	SUM(EmpSalary) For DeptId in ([4], [5])
)AS PivotTable

---------------------------------------SQL Window Functions---------------------------------------

SELECT EmpName, EmpSalary, SUM(EmpSalary) OVER()TotalSalaries
FROM tblEmployee
Where DeptId = 4
