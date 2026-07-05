
CREATE TABLE customer (
    custn INT PRIMARY KEY,
    cname VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE item (
    itemn INT PRIMARY KEY,
    unitprice INT
);

CREATE TABLE warehouse (
    warehousen INT PRIMARY KEY,
    city VARCHAR(50)
);

CREATE TABLE orders (
    ordern INT PRIMARY KEY,
    odate DATE,
    custn INT,
    order_amt INT,
    FOREIGN KEY (custn) REFERENCES customer(custn)
);

CREATE TABLE order_item (
    ordern INT,
    itemn INT,
    qty INT,
    PRIMARY KEY (ordern, itemn),
    FOREIGN KEY (ordern) REFERENCES orders(ordern) ON DELETE CASCADE,
    FOREIGN KEY (itemn) REFERENCES item(itemn)
);

CREATE TABLE shipment (
    ordern INT,
    warehousen INT,
    ship_date DATE,
    PRIMARY KEY (ordern, warehousen),
    FOREIGN KEY (ordern) REFERENCES orders(ordern) ON DELETE CASCADE,
    FOREIGN KEY (warehousen) REFERENCES warehouse(warehousen)
);

INSERT INTO customer (custn, cname, city) VALUES
(1, 'Customer 1', 'Mysuru'),
(2, 'Customer 2', 'Bengaluru'),
(3, 'Kumar', 'Mumbai'),
(4, 'Customer 4', 'Delhi'),
(5, 'Customer 5', 'Bengaluru');

INSERT INTO item (itemn, unitprice) VALUES
(1, 400),
(2, 200),
(3, 1000),
(4, 100),
(5, 500);

INSERT INTO warehouse (warehousen, city) VALUES
(1, 'Mysuru'),
(2, 'Bengaluru'),
(3, 'Mumbai'),
(4, 'Delhi'),
(5, 'Chennai');

INSERT INTO orders (ordern, odate, custn, order_amt) VALUES
(1, '2020-01-14', 1, 2000),
(2, '2021-04-13', 2, 500),
(3, '2019-10-02', 3, 2500),
(4, '2019-05-12', 5, 1000),
(5, '2020-12-23', 3, 1200);

INSERT INTO order_item (ordern, itemn, qty) VALUES
(1, 1, 5),
(2, 5, 1),
(3, 5, 5),
(4, 3, 1),
(5, 4, 12);

INSERT INTO shipment (ordern, warehousen, ship_date) VALUES
(1, 2, '2020-01-16'),
(2, 1, '2021-04-14'),
(3, 4, '2019-10-07'),
(4, 3, '2019-05-16'),
(5, 5, '2020-12-23');


SELECT ordern, ship_date
FROM shipment
WHERE warehousen = 2;



SELECT DISTINCT w.warehousen, w.city
FROM customer c
JOIN orders o
ON c.custn = o.custn
JOIN shipment s
ON o.ordern = s.ordern
JOIN warehouse w
ON s.warehousen = w.warehousen
WHERE c.cname = 'Kumar';



SELECT ordern, warehousen
FROM shipment;



SELECT 
    c.cname,
    COUNT(o.ordern) AS number_of_orders,
    AVG(o.order_amt) AS avg_order_amt
FROM customer c
LEFT JOIN orders o
ON c.custn = o.custn
GROUP BY c.custn, c.cname;



DELETE FROM orders
WHERE custn = (
    SELECT custn
    FROM customer
    WHERE cname = 'Kumar'
);




SELECT itemn, unitprice
FROM item
WHERE unitprice = (
    SELECT MAX(unitprice)
    FROM item
);









-- 2 solutioin
CREATE TABLE customer_bak (
    custn INT,
    cname VARCHAR(50),
    city VARCHAR(50),
    operation_date DATETIME,
    operation_type VARCHAR(20)
);

DELIMITER //

CREATE TRIGGER customer_trigg_update
AFTER UPDATE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_bak
    (custn, cname, city, operation_date, operation_type)
    VALUES
    (OLD.custn, OLD.cname, OLD.city, NOW(), 'UPDATE');
END //

CREATE TRIGGER customer_trigg_delete
AFTER DELETE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_bak
    (custn, cname, city, operation_date, operation_type)
    VALUES
    (OLD.custn, OLD.cname, OLD.city, NOW(), 'DELETE');
END //

DELIMITER ;