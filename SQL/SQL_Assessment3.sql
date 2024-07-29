--creating Database
CREATE DATABASE SQL_ASSESSMENT3

USE SQL_ASSESSMENT3

-- Create Subject Table
CREATE TABLE Subject (
    subjectId INT PRIMARY KEY,
    subtitle VARCHAR(20) NOT NULL
)

-- Create Book Table
CREATE TABLE Book (
    bookId INT PRIMARY KEY,
    title VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    volume INT NOT NULL,
    author VARCHAR(20) NOT NULL,
    publishDate DATE NOT NULL,
    subjectId INT,
    FOREIGN KEY (subjectId) REFERENCES Subject(subjectId)
)

--1.Insert 5 diff subjects in subject table
INSERT INTO Subject (subjectId, subtitle) VALUES
(1, 'Maths'),
(2, 'Science'),
(3, 'English'),
(4, 'History'),
(5, 'Geography')

--2.Insert 15 diff books of 5 subjects in books table
INSERT INTO Book (bookId, title, price, volume, author, publishDate, subjectId) VALUES
(101, 'Algebra', 600, 1, 'John', '2020-01-01', 1),
(102, 'Geometry', 700, 1, 'Smith', '2019-05-15', 1),
(103, 'Calculus', 800, 3, 'Johnson', '2018-07-21', 1),
(104, 'Physics', 650, 2, 'Michael', '2020-08-12', 2),
(105, 'Chemistry', 750, 1, 'Peter', '2017-11-23', 2),
(106, 'Biology', 800, 1, 'Patricia Wilson', '2016-03-14', 2),
(107, 'C Programming', 500, 1, 'James', '2020-12-01', 3),
(108, 'Grammar', 550, 2, 'James', '2019-04-22', 3),
(109, 'Java', 600, 1, 'Robert', '2018-09-17', 3),
(110, 'History', 650, 1, 'Maria', '2021-02-25', 4),
(111, 'C Sharp', 700, 4, 'David', '2017-06-10', 4),
(112, 'HTML', 750, 1, 'K A Paul', '2018-12-19', 4),
(113, 'Python', 600, 2, 'Jennifer', '2019-08-29', 5),
(114, 'Geography', 650, 1, 'Elizabeth', '2020-05-04', 5),
(115, 'Environmental', 700, 1, 'Steven', '2017-03-03', 5)

select * FROM Subject
SELECT * FROM Book

--3.Write a query to retrieve the book and its subject details using inner join.
SELECT Book.bookId, Book.title, Book.price, Book.volume, Book.author, Book.publishDate, Book.subjectId
FROM Book INNER JOIN Subject ON Book.subjectId = Subject.subjectId

--4.Write a query to retrieve the books list published in a given specific date interval
SELECT * FROM Book WHERE publishDate BETWEEN '2019-01-01' AND '2020-12-31'

--5.Write a query to retrieve the number of books referred by each author
SELECT author, COUNT(*) AS NumberOfBooks FROM Book GROUP BY author

--6.Write a query to retrieve the number of books referred by each subject
SELECT Subject.subtitle, COUNT(*) AS NumberOfBooks FROM Book
INNER JOIN Subject ON Book.subjectId = Subject.subjectId
GROUP BY Subject.subtitle

--7.Write a query to retrieve the number of books published by the year 2000
SELECT COUNT(*) AS NumberOfBooks FROM Book WHERE YEAR(publishDate) = 2000

--8.Write a query to update price and volume of a book using bookId.
UPDATE Book SET price = 900, volume = 2 WHERE bookId = 103

--9.Write a query to update price of English subject books 10%
UPDATE Book SET price = price * 1.10 WHERE subjectId = (SELECT subjectId FROM Subject WHERE subtitle = 'English')

--10.Write a query to delete a book using bookId
DELETE FROM Book WHERE bookId = 101

--11.Write a query to retrieve books who’s price is >500 and subject is maths.
SELECT Book.* FROM Book INNER JOIN Subject ON Book.subjectId = Subject.subjectId
WHERE Book.price > 500 AND Subject.subtitle = 'Maths'

--12.Write a query to retrieve the book and its subject details with ascending order of subject.
SELECT Book.bookId, Book.title, Book.price, Book.volume, Book.author, Book.publishDate, Subject.subtitle FROM Book
INNER JOIN Subject ON Book.subjectId = Subject.subjectId
ORDER BY Subject.subtitle asc

--13.Write a query to retrieve the min price of book details.
SELECT MIN(price) AS Minimum_Price FROM Book;

--14.Write a query to retrieve the min price of the book details
SELECT * FROM Book WHERE price = (SELECT MIN(price) FROM Book)

--15.Write a query to count the no of books of subject maths.
SELECT COUNT(*) AS TotalMathsBooks FROM Book WHERE subjectId = (SELECT subjectId FROM Subject WHERE subtitle = 'Maths');

--16.Write a query to display books of subject english, maths and science.
SELECT Book.* FROM Book INNER JOIN Subject ON Book.subjectId = Subject.subjectId
WHERE Subject.subtitle IN ('English', 'Maths', 'Science');
