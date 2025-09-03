CREATE TABLE nodes (
    point1 CHAR(1),
    point2 CHAR(1),
    cost INTEGER
);

INSERT INTO nodes (point1, point2, cost) VALUES
('a', 'b', 10),
('b', 'a', 10),
('a', 'c', 15),
('c', 'a', 15),
('a', 'd', 20),
('d', 'a', 20),
('b', 'c', 35),
('c', 'b', 35),
('b', 'd', 25),
('d', 'b', 25),
('c', 'd', 30),
('d', 'c', 30);

SELECT * FROM nodes ORDER BY point1, point2;