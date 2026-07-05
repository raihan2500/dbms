
use college;

CREATE Table student(
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age int not NULL
);

INSERT INTO student VALUES(1, "raihan", 22);

SELECT * FROM student;


CREATE DATABASE if NOT EXISTS college;

CREATE DATABASE temp1;
DROP DATABASE temp1;
show DATABASES;
show TABLEs;



drop Table student;

create Table student(
  rollno int PRIMARY KEY,
  name VARCHAR(50)
);

SELECT * FROM student;

INSERT INTO student(rollno, name)
VALUES
(101, "raihan"),
(102, "ahmed");



CREATE DATABASE xyz;
use  xyz;
CREATE Table employeeInfo(
  id int PRIMARY KEY,
  name VARCHAR(50),
  salary INT
);

INSERT INTO employeeInfo(id, name, salary)
VALUES
(1, "adam", 25000),
(2, "bob", 30000),
(3, "casey", 40000)

SELECT * FROM employeeInfo;



CREATE Table temp1(
  id int UNIQUE
);

INSERT INTO temp1 VALUES(1);
INSERT INTO temp1 VALUES(2);
SELECT * FROM temp1;


drop Table if EXISTS temp1;

CREATE Table temp1(
  id int, 
  name VARCHAR(50),
  city VARCHAR(50),
  PRIMARY key(id)
);



CREATE Table temp1(
  id int, 
  name VARCHAR(50),
  city VARCHAR(50),
  PRIMARY key(id, name)
);
SELECT * from temp1;

CREATE Table temp(
  cust_id int,
  Foreign Key (cust_id) REFERENCES temp1(id)
);


CREATE Table city(
  id int PRIMARY key,
  city varchar(50),
  age int,
  constraint age_check check(age >= 18 and city = "dhaka")
);

INSERT into city VALUES(1, "dhaka", 19);
INSERT into city VALUES(1, "rajshahi", 19);

SELECT * FROM city;










drop TABLE if EXISTS student;

CREATE Table student(
  rollno int PRIMARY key,
  name VARCHAR(50),
  marks int not NULL,
  grade VARCHAR(1),
  city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

SELECT name, marks FROM student;
SELECT DISTINCT city FROM student;

SELECT * FROM student WHERE marks > 80;
SELECT * FROM student WHERE city = "Mumbai" and marks > 90;

SELECT * FROM student WHERE marks%5 = 3;

SELECT * from student WHERE (marks > 20 and marks < 90) or city = "Mumbai";

SELECT * FROM student where marks BETWEEN 80 and 90;

SELECT * FROM student WHERE city in("Delhi", "Mumbai", "Dhaka");
SELECT * FROM student WHERE city not in("Delhi", "Mumbai");

SELECT * FROM student LIMIT 3;

SELECT * FROM student ORDER BY marks ASC;
SELECT * FROM student ORDER BY marks DESC;


SELECT marks FROM student;

--AGGREGATE FUNCTION
SELECT MAX(marks) FROM student;

select AVG(marks) FROM student;
SELECT COUNT(city) FROM student;

SELECT city, COUNT(rollno)
from student GROUP BY city;

SELECT city, AVG(marks)
from student GROUP BY city
ORDER BY AVG(marks) DESC;



UPDATE student
SET grade = 'O' WHERE grade = 'A';

UPDATE student
SET marks = 82 WHERE rollno = 105;

UPDATE student
set grade = 'A' WHERE marks BETWEEN 80 and 100;
SELECT * FROM student;

UPDATE student
SET marks = marks + 1;

UPDATE student
SET marks = 12 WHERE rollno = 105;

DELETE FROM student
WHERE marks < 33;

use college;
SELECT * FROM student;

SELECT * from student
WHERE marks > (SELECT AVG(marks) FROM student);