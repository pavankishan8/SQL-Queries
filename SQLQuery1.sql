USE [3342]
GO
/****** Object:  StoredProcedure [dbo].[SelectSinglePatient]    Script Date: 17-01-2023 13:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[SelectSinglePatient]
(
 @patId int 
)
AS
SELECT * FROM tblPATIENTS WHERE PatId = @patId 