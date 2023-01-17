Create Procedure SelectSinglePatient
(
 @patId int 
)
AS
SELECT * FROM tblPATIENTS WHERE PatId = @patId 