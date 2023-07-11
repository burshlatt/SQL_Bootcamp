WITH RECURSIVE paths (finish, cost, path) AS (
	SELECT point2, cost, ARRAY[point1, point2]::character varying[]
	FROM nodes
	WHERE point1 = 'a'
	UNION
	SELECT nodes.point2, paths.cost + nodes.cost, paths.path || nodes.point2
	FROM paths, nodes
	WHERE nodes.point1 = paths.finish
	AND nodes.point2 NOT IN (SELECT * FROM unnest(paths.path))
), longpaths(total_cost, tour) AS (
	SELECT paths.cost + nodes.cost, path || point2
	FROM nodes, paths
	WHERE nodes.point1 = paths.path[4] AND nodes.point2 = 'a'
)
SELECT total_cost, tour
FROM longpaths
WHERE total_cost = (SELECT MIN(total_cost) FROM longpaths LIMIT 1)
ORDER BY 1, 2;