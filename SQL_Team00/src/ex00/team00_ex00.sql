DROP TABLE IF EXISTS tours;

CREATE TABLE tours (
    point1 VARCHAR(1) NOT NULL,
    point2 VARCHAR(1) NOT NULL,
    cost int NOT NULL
);

INSERT INTO tours (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('a', 'c', 15),
       ('a', 'd', 20),
       ('b', 'a', 10),
       ('b', 'c', 35),
       ('b', 'd', 25),
       ('c', 'b', 35),
       ('c', 'd', 30),
       ('c', 'a', 15),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('d', 'c', 30);


WITH RECURSIVE paths AS (
    SELECT
        point1 AS start_point,
        point2 AS current_point,
        ARRAY[point1::VARCHAR, point2::VARCHAR] AS visited,
        cost AS total_cost
    FROM tours
    WHERE point1 = 'a'

    UNION ALL

    SELECT
        p.start_point,
        t.point2                       AS current_point,
        p.visited || t.point2::VARCHAR AS visited,
        p.total_cost + t.cost          AS total_cost
    FROM paths p
    JOIN tours t ON p.current_point = t.point1
    WHERE NOT t.point2 = ANY(p.visited)
), final_paths AS (
    SELECT total_cost + (SELECT cost
                         FROM tours
                         WHERE point1 = current_point
                           AND point2 = start_point) AS total_cost,
           visited || start_point::VARCHAR AS tour
    FROM paths
    WHERE ARRAY_LENGTH(visited, 1) = 4
)

SELECT *
FROM final_paths
WHERE total_cost = (SELECT MIN(total_cost) FROM final_paths)
ORDER BY total_cost, tour;
