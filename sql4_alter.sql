ALTER Table student
add COLUMN age int;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE student
change COLUMN rollno roll int;

SELECT * FROM student;

ALTER Table student
RENAME to students;

SELECT * FROM students;

ALTER Table students
add COLUMN age int;


ALTER Table students
MODIFY COLUMN age VARCHAR(2);

UPDATE students
SET age = '22' WHERE roll = 101;

ALTER TABLE students
DROP COLUMN age;

ALTER Table students
RENAME student;