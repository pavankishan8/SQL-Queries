ALTER TABLE tblPATIENTS
ADD DocId int 
REFERENCES tblDoctor(DocId);