SELECT "first_name", "last_name", ("height" / (1.0 * "weight")) AS 'Height to weight ratio' FROM "players"
WHERE "debut" > '2020-01-01'
AND "final_game" > '2020-01-01'
ORDER BY "Height to weight ratio", "first_name", "last_name";
