CREATE TABLE nodes (point1 VARCHAR(1), point2 VARCHAR(1), cost INT);

INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'b', 10);
INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'd', 20);
INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'c', 15);

INSERT INTO nodes (point1, point2, cost)
VALUES ('b', 'a', 10);
INSERT INTO nodes (point1, point2, cost)
VALUES ('b', 'd', 25);
INSERT INTO nodes (point1, point2, cost)
VALUES ('b', 'c', 35);

INSERT INTO nodes (point1, point2, cost)
VALUES ('d', 'a', 20);
INSERT INTO nodes (point1, point2, cost)
VALUES ('d', 'b', 25);
INSERT INTO nodes (point1, point2, cost)
VALUES ('d', 'c', 30);

INSERT INTO nodes (point1, point2, cost)
VALUES ('c', 'a', 15);
INSERT INTO nodes (point1, point2, cost)
VALUES ('c', 'd', 30);
INSERT INTO nodes (point1, point2, cost)
VALUES ('c', 'b', 35);
