use xyz;
CREATE table student(
  id int PRIMARY KEY,
  name VARCHAR(50)
);

insert INTO student(id, name)
VALUES 
(101, "adam"),
(102, "bob"),
(103, "casey");

SELECT * FROM student;


CREATE Table course(
  id int PRIMARY KEY,
  course VARCHAR(50)
);

INSERT into course
VALUES
(102, "english"),
(105, "math"),
(103, "science"),
(107, "cse");

SELECT * FROM student as s
INNER JOIN course as c
on s.id = c.id;


SELECT * FROM student
LEFT JOIN course
on student.id = course.id;

SELECT * from student
RIGHT JOIN course
on student.id = course.id;

SELECT * from student
RIGHT JOIN course
on student.id = course.id
UNION
SELECT * FROM student
LEFT JOIN course
on student.id = course.id;
;

SELECT * FROM student
LEFT JOIN course
on student.id = course.id
WHERE course.id is NULL

UNION
SELECT * from student
RIGHT JOIN course
on student.id = course.id
WHERE student.id is NULL
;





CREATE Table employee(
  id int PRIMARY key,
  name VARCHAR(50),
  manager_id int 
);

INSERT into employee(id, name, manager_id)
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

SELECT * FROM employee;

-- self join
SELECT  a.name, b.name FROM employee as a
join employee b 
on a.id = b.manager_id;