CREATE DATABASE Academy

USE Academy

CREATE TABLE Groups(
Id int PRIMARY KEY IDENTITY,
GroupName nvarchar(100))

CREATE TABLE Students(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(100),
Surname nvarchar(100),
Grade int DEFAULT 0,
GroupId int REFERENCES Groups(Id))

CREATE TABLE Grades(
Id int PRIMARY KEY IDENTITY,
MinGrade int,
MaxGrade int
)

INSERT INTO Grades VALUES(50,100)

INSERT INTO Groups VALUES('P319'),
                         ('P318')

INSERT INTO Students VALUES('Monica','Geller',100,1),
                           ('Joey','Tribiani',30,2),
						   ('Rachel','Green',60,2),
						   ('Chandler','Bing',80,2)

SELECT * FROM Groups g FULL OUTER JOIN Students s ON g.Id=s.GroupId WHERE GroupName='P318'

CREATE VIEW v_StudentList
AS
SELECT s.Name,s.Surname,g.GroupName 'Group Name',s.Grade FROM Groups g FULL OUTER JOIN Students s ON g.Id = s.GroupId

SELECT COUNT(s.Id) 'Student Count',g.GroupName 
FROM Students s JOIN Groups g ON g.Id = s.GroupId
GROUP BY g.GroupName
GO

CREATE PROCEDURE SuccessStudents
AS
SELECT s.Name,s.Surname,g.GroupName,s.Grade FROM Groups g JOIN Students s ON g.Id=s.GroupId WHERE s.Grade>60
   
EXEC SuccessStudents

CREATE FUNCTION CountStudents (@GroupName nvarchar(100))
RETURNS TABLE
AS
RETURN(SELECT COUNT(s.Id) 'Students Count', g.GroupName 'Group Name' FROM Students s
JOIN Groups g ON s.GroupId = g.Id
WHERE g.GroupName = @GroupName
GROUP BY g.GroupName)


SELECT * FROM CountStudents('P319')



