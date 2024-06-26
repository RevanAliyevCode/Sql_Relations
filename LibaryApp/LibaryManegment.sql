CREATE DATABASE LibaryManegment;

USE LibaryManegment;


CREATE TABLE Libraries (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Name VARCHAR(50),
    Address VARCHAR(50)
);

CREATE TABLE LibraryBook (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    LibraryId INT,
    BookId INT,
    FOREIGN KEY (LibraryId) REFERENCES Libraries(Id),
    FOREIGN KEY (BookId) REFERENCES Books(Id)
);

CREATE TABLE Authors (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Name VARCHAR(50),
    Surname VARCHAR(50)
);

CREATE TABLE AuthorBook (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    AuthorId INT,
    BookId INT,
    FOREIGN KEY (AuthorId) REFERENCES Authors(Id),
    FOREIGN KEY (BookId) REFERENCES Books(Id)
);

CREATE TABLE Genre (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Name VARCHAR(50)
);

CREATE TABLE BookGenre (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    BookId INT,
    GenreId INT,
    FOREIGN KEY (BookId) REFERENCES Books(Id),
    FOREIGN KEY (GenreId) REFERENCES Genre(Id)
);

CREATE TABLE Books (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Name VARCHAR(50),
    Count INT
);


INSERT INTO Libraries (Name, Address) VALUES ('Central Library', '123 Library St');
INSERT INTO Libraries (Name, Address) VALUES ('Eastside Library', '456 East St');

INSERT INTO Authors (Name, Surname) VALUES ('George', 'Orwell');
INSERT INTO Authors (Name, Surname) VALUES ('Jane', 'Austen');

INSERT INTO Books (Name, Count) VALUES ('1984', 10);
INSERT INTO Books (Name, Count) VALUES ('Pride and Prejudice', 5);

INSERT INTO Genre (Name) VALUES ('Dystopian');
INSERT INTO Genre (Name) VALUES ('Romance');

INSERT INTO BookGenre (BookId, GenreId) VALUES (1, 1);
INSERT INTO BookGenre (BookId, GenreId) VALUES (2, 2); 

-- LibraryBook
INSERT INTO LibraryBook (LibraryId, BookId) VALUES (1, 1);
INSERT INTO LibraryBook (LibraryId, BookId) VALUES (2, 2);

-- AuthorBook
INSERT INTO AuthorBook (AuthorId, BookId) VALUES (1, 1);
INSERT INTO AuthorBook (AuthorId, BookId) VALUES (2, 2);
