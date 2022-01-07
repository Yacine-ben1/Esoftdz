USE [eSoftdz]
GO
-- Create table (mark_Yacine)
drop table mark_Yacine
CREATE TABLE dbo.mark_yacine
  (
     [pkmarks]         INT NOT NULL,
     [studentid]       INT,
     [courseid]        INT,
     [teacherid]       INT,
     [mark]            INT,
     [semester]        VARCHAR(50),
     [year]            INT,
     [createddatetime] DATETIME,
     [updatedatetime]  DATETIME,
     PRIMARY KEY CLUSTERED ( pkmarks )
  )
ON [PRIMARY] 
-----------------------------------

truncate table mark_Yacine -- Clear data from table (mark_Yacine )

INSERT INTO mark_Yacine ([PKmarks], [StudentID] , [CourseID] , [TeacherID] , [Mark] , [semester]     , [Year] , [CreatedDateTime] , [UpdateDateTime]) -- add information to table (mark_Yacine)
       VALUES           (  1      ,     '11'    ,   '14'     ,   '10'      ,  18    ,'First_Semester',  2022  ,     getdate()     ,     getdate()   )
GO
  --Create view  --------
IF OBJECT_ID('dbo.[Exam]', 'V') IS NOT NULL 
DROP VIEW dbo.[Exam]
GO
CREATE VIEW [Exam] AS
SELECT stdn.StudentCode,
       stdn.Name,
       mrk.Mark,
       crs.Title,
       mrk.semester,
       mrk.Year,
       tchr.Name AS Teacher
FROM mark_Yacine AS mrk
LEFT JOIN Teacher AS tchr ON mrk.TeacherID = tchr.TeacherID
LEFT JOIN Courses AS crs ON mrk.CourseID = crs.CourseID
LEFT JOIN Student AS stdn ON mrk.StudentID = stdn.StudentID



