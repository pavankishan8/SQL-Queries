
Create Procedure DeletePatient(@id int)
AS DELETE From tblPatients WHERE PatId = @id