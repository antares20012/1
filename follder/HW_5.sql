РАСШИФРОВКА ФРАЗЫ - ТЫ ВСЕ МОЖЕШЬ!
----ЗАДАНИЕ 1-----
SELECT species_name, species_id 
FROM species 
WHERE species_id = (SELECT MIN(species_id) FROM species);
---- м = малыш

SELECT species.species_name
FROM species
WHERE species.species_amount >= 1800;
---- б = роза

SELECT 	species.species_name,
		species.type_id
FROM species 
WHERE species.type_id = 5 AND species.species_name LIKE 'п%';
---- о = подсолнух

SELECT species.species_name
FROM species
WHERE species.species_amount = 5 OR species.species_name LIKE '%са';
---- в = лиса


----///ЗАДАНИЕ_2///----

SELECT species.species_name 
FROM species
WHERE to_char(date_start,'YYYY') = '2023';
---- ы = обезьяна


SELECT 	species.species_name
FROM species
INNER JOIN species_in_places AS places
ON places.species_id = species.species_id
WHERE species_status = 'absent' AND places.place_id = 3;
---- с = яблоко	

SELECT 	species.species_name, 
		species.species_amount
FROM 	species
JOIN 	species_in_places
ON 		species.species_id = species_in_places.species_id
JOIN 	places
ON 		species_in_places.place_id = places.place_id
WHERE 	place_name = 'дом' AND to_char(date_start, 'mm') = '05';
---- п = собака

SELECT species_name
FROM species
WHERE species_name LIKE '% %';
---- ! = голубая рыба

----///Задание № 3///----

SELECT species_name
FROM species
WHERE date_start = (SELECT date_start FROM species WHERE species_id = (SELECT MIN(species_id) FROM species)) 
---- ч = кошка


SELECT 	species.species_name
FROM species
JOIN species_in_places
ON species.species_id = species_in_places.species_id
JOIN places
ON species_in_places.place_id = places.place_id
WHERE places.place_name = 'дом' OR places.place_name = 'сарай' 
ORDER BY place_size DESC
LIMIT 1;

---- ж = лошадь

SELECT species.species_name
FROM species
JOIN species_in_places ON species.species_id = species_in_places.species_id
JOIN places ON species_in_places.place_id = places.place_id
WHERE places.place_name = 'дом'
GROUP BY species.species_name
ORDER BY species_in_places.count DESC
LIMIT 1 OFFSET 5;
---- ш = попугай

SELECT species.species_name
FROM species
LEFT JOIN species_in_places
ON species.species_id = species_in_places.species_id
WHERE species.species_status = 'fairy' AND species_in_places.species_id IS NULL;
---- т = единорог
