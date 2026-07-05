CREATE TABLE dept(
  id int PRIMARY KEY,
  name VARCHAR(50)
);

DROP Table teacher;

CREATE Table teacher(
  id int PRIMARY KEY,
  name VARCHAR (50),
  dept_id INT,
  Foreign Key (dept_id) REFERENCES dept(id)
  on delete CASCADE
  on update CASCADE
);

INSERT into dept VALUES
(101, "english"),
(102, "cse");

SELECT * FROM dept;

INSERT into teacher VALUES
(101, "adam", 101),
(102, "eve", 102);


SELECT * FROM teacher;

UPDATE dept
set id = 103 WHERE id = 102;

DELETE FROM dept
WHERE id = 103;