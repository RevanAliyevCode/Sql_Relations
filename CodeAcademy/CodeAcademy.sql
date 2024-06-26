CREATE DATABASE CodeAcademy;

USE CodeAcademy;

DROP DATABASE CodeAcademy;

CREATE TABLE GroupType(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
);

CREATE TABLE Groups(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
	BeginDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
	LessonsHour INT NOT NULL,
	GroupTypeId INT FOREIGN KEY REFERENCES GroupType(Id),
	CHECK(EndDate > BeginDate)
);

CREATE TABLE Students(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
	Surname NVARCHAR(50) NOT NULL,
	BirthDate DATETIME CHECK(DATEDIFF(YEAR, BirthDate, GETDATE()) >= 15),
	RegestrationDate DATETIME DEFAULT(GETDATE()) CHECK(GETDATE() >= RegestrationDate),
	PhoneNumber NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) UNIQUE,
	GroupId INT FOREIGN KEY REFERENCES Groups(Id)
);

CREATE TABLE Topics(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
	LessonHour INT NOT NULL,
	GroupTypeId INT FOREIGN KEY REFERENCES GroupType(Id)
);

CREATE TABLE ExerciseType(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
);

CREATE TABLE Exercise(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
	Grade DECIMAL(5, 2) NOT NULL,
	TopicId INT FOREIGN KEY REFERENCES Topics(Id),
	ExerciseTypeId INT FOREIGN KEY REFERENCES ExerciseType(Id),
	StudentId INT FOREIGN KEY REFERENCES Students(Id)
);

INSERT INTO GroupType (Name)
VALUES 
('Programming'),
('Design');

INSERT INTO Groups (Name, BeginDate, EndDate, LessonsHour, GroupTypeId)
VALUES 
('Group A', '2024-01-01', '2024-06-01', 100, 1),
('Group B', '2024-02-01', '2024-07-01', 120, 2);

INSERT INTO Students (Name, Surname, BirthDate, PhoneNumber, Email, GroupId)
VALUES 
('John', 'Doe', '2000-01-01', '1234567890', 'john.doe@example.com', 1),
('Jane', 'Smith', '2002-02-02', '0987654321', 'jane.smith@example.com', 2);

INSERT INTO Topics (Name, LessonHour, GroupTypeId)
VALUES 
('C#', 50, 1),
('SQL', 50, 1),
('Adobe', 70, 2);

INSERT INTO ExerciseType (Name)
VALUES 
('Homework'),
('Test'),
('Project');

INSERT INTO Exercise (Name, Grade, TopicId, ExerciseTypeId, StudentId)
VALUES 
('Homework 1', 85.50, 1, 1, 1),
('Test 1', 90.00, 2, 2, 2);
