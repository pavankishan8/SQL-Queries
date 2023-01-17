Create table tblCustomer
(
CstId int primary key, CstName varchar(50) NOT NULL, CstAddress varchar(200) NOT NULL, 
BillDate date DEFAULT GetDate(), BillAmount money
)

Create table Customer_Audit
(
id int primary key identity(1, 1),
details varchar(200) NOT NULL
)

---------------------------------------Creating the Trigger that triggers on INSERT---------------------------------------

CREATE TRIGGER OnInsertCustomer
ON tblCustomer
FOR INSERT
AS 
BEGIN
DECLARE @id int
select @id = CstId from inserted
Insert into Customer_Audit values('Customer with ID' + (CAST(@id as varchar)) + 'is inserted inta Database on ' + Cast(GETDATE() as varchar(50)))
END

Insert into tblCustomer values(111, 'TestName', 'Bangalore', '12/12/2022', 5600)

SELECT * FROM Customer_Audit

---------------------------------------Deleting the Trigger---------------------------------------

CREATE TRIGGER onDeleteCustomer
on tblCustomer
AFTER DELETE
AS BEGIN
DECLARE @id int
SELECT @id = cstId from deleted
insert into  Customer_Audit values('customer of the id '+(cast(@id as  varchar)) +'is deleted into the database at ' +(cast(GETDATE() as varchar(50))));
END

DELETE FROM tblCustomer where CstId = 111

---------------------------------------Updating the Trigger---------------------------------------

CREATE TRIGGER onUpdateTrigger
on tblCustomer
AFTER UPDATE
AS 
BEGIN
DECLARE @id int
DECLARE @oldName varchar(50)
DECLARE @newName varchar(50)
SELECT @id=cstId from inserted
SELECT @oldName=CstName from deleted
SELECT @newName=CstName from inserted 
insert into  Customer_Audit values('Customer of the ID' + (CAST(@id as  varchar)) + 'is updated with' + @newName + 'replaying with' + @oldName + 'on' + (CAST(GETDATE() as varchar(50))));
END

SELECT * FROM tblCustomer

UPDATE tblCustomer Set CstName = 'Gopal' where CstId = 111