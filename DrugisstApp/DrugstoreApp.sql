CREATE DATABASE DrugstoreApp;

CREATE TABLE Owners(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
	Surname NVARCHAR(50) NOT NULL,
);

CREATE TABLE Drugstore(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
	Address NVARCHAR(50),
	ContactNumber NVARCHAR(50) NOT NULL,
	CreationDate DATETIME DEFAULT(GETDATE()) CHECK(CreationDate < GETDATE()),
	OwnerId INT FOREIGN KEY REFERENCES Owners(Id)
)

CREATE TABLE Druggist(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
	Surname NVARCHAR(50) NOT NULL,
	BirthDate DATETIME CHECK(DATEDIFF(YEAR, BirthDate, GETDATE()) >= 18),
	Experience INT,
	DrugStoreId INT FOREIGN KEY REFERENCES Drugstore(Id),
)

CREATE TABLE Drugs(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
	Price DECIMAL(10, 2) NOT NULL,
	Count INT DEFAULT(0) NOT NULL,
	DrugStoreId INT FOREIGN KEY REFERENCES Drugstore(Id),
)

INSERT INTO Owners (Name, Surname)
VALUES ('John', 'Doe'),
       ('Jane', 'Smith'),
       ('Michael', 'Brown');

INSERT INTO Drugstore (Name, Address, ContactNumber, OwnerId)
VALUES ('Healthy Pharmacy', '123 Main St', '555-1234', 1);

INSERT INTO Druggist (Name, Surname, BirthDate, Experience, DrugStoreId)
VALUES ('Emily', 'Johnson', '1990-03-15', 8, 1);

INSERT INTO Drugs (Name, Price, Count, DrugStoreId)
VALUES ('Paracetamol', 12.99, 100, 1),
       ('Aspirin', 9.99, 50, 1),
       ('Ibuprofen', 15.50, 75, 1);