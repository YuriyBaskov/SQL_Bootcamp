WITH RECURSIVE paths AS (
    SELECT 
        point1 AS start,
        point2 AS next,
        cost,
        ARRAY[point1, point2]::text[] AS path
    FROM nodes
    WHERE point1 = 'a' AND point2 != 'a'
    
    UNION ALL
    
    SELECT 
        paths.start,
        nodes.point2,
        paths.cost + nodes.cost,
        paths.path || nodes.point2::text
    FROM paths
    JOIN nodes ON paths.next = nodes.point1
    WHERE NOT nodes.point2 = ANY(paths.path)
),
complete_tours AS (
    SELECT 
        cost + (SELECT cost FROM nodes WHERE point1 = next AND point2 = start) AS total_cost,
        path || start AS tour
    FROM paths
    WHERE array_length(path, 1) = 4
)
SELECT 
    total_cost,
    tour
FROM complete_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM complete_tours)
ORDER BY total_cost, tour;