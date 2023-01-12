/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01/01/2016' AND '12/31/2019';
SELECT name FROM animals WHERE neutered=true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 ;

/* Update Table With Transactions */

BEGIN;
    UPDATE animals
    SET species = 'unspecified'; 
rollback; 

BEGIN;
    UPDATE animals
    SET species = 'digimon'
WHERE name LIKE 'mon%';

UPDATE animals 
    SET species = 'pokemon'
    WHERE species IS NULL;
COMMIT;

BEGIN;
    DELETE FROM animals;
ROLLBACK; 

BEGIN;
    DELETE FROM animals 
    WHERE date_of_birth > '2022-01-01';
    SAVEPOINT one;

UPDATE animals
    SET weight_kg = weight_kg * (-1);
    ROLLBACK TO SAVEPOINT one;  

UPDATE animals 
    SET weight_kg = weight_kg * (-1)
    WHERE weight_kg < 0;
    COMMIT;

SELECT COUNT(name) 
    AS total_animals 
    FROM animals; 

SELECT name, 
    SUM(escape_attempts)
    FROM animals 
    GROUP BY name having MIN(escape_attempts) < 1;

SELECT AVG(weight_kg)
    FROM animals;

SELECT neutered, 
    MAX(escape_attempts) 
    FROM animals
    GROUP BY neutered;

SELECT species,
    MIN(weight_kg),
    MAX(weight_kg)
    FROM animals GROUP BY species;

SELECT species,
    AVG(escape_attempts)
    FROM animals 
    WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' 
    GROUP BY species;

/* Multiple tables queries */
SELECT name AS animal_names, full_name AS owner_name FROM animals 
JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name AS animal_names, species.name AS animal_species FROM animals 
JOIN species ON  animals.species_id = species.id 
WHERE species.id = 1;

SELECT full_name, name AS animal_names
FROM animals 
RIGHT JOIN owners ON animals.owner_id = owners.id;

SELECT species.name AS species_name, count(*) As species_count
FROM species 
JOIN animals ON species.id = animals.species_id 
GROUP BY species.name;

SELECT animals.* FROM animals
LEFT JOIN owners
ON animals.owner_id = owners.id
LEFT JOIN species
ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell'
AND species.name = 'Digimon';

SELECT name FROM animals 
JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name AS full_name , COUNT(*) AS count 
FROM animals JOIN owners ON animals.owner_id = owners.id 
GROUP BY owners.full_name 
ORDER BY count DESC LIMIT 1;

/* Join Table */

SELECT animals.name AS last_animal_seen_by_William_Tatcher
FROM animals 
JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON visits.vets_id = vets.id 
WHERE vets.name='William Tatcher' 
ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(*) AS no_of_different_animals_seen_by_Stephanie_Mendez  
FROM (SELECT DISTINCT animals.name FROM animals 
JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id 
WHERE vets.name='Stephanie Mendez') AS foo;

SELECT vets.name AS vet_names, species.name AS vet_specialities
FROM vets 
FULL JOIN specialization ON vets.id = specialization.vets_id FULL 
JOIN species ON specialization.species_id = species.id;

SELECT animals.name AS animals_that_visited_Stephanie_Mendez
FROM animals 
JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON visits.vets_id = vets.id 
WHERE vets.name='Stephanie Mendez' 
AND visits.visit_date > '2020-04-01' 
AND visits.visit_date <'2020-08-30';

SELECT animals.name AS animal_with_most_visit_to_vets, COUNT(*)
FROM animals 
JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON visits.vets_id = vets.id 
GROUP BY animals.name 
ORDER BY count DESC LIMIT 1;

SELECT animals.name AS Maisy_Smith_first_visit
FROM animals 
JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON visits.vets_id = vets.id 
WHERE vets.name='Maisy Smith' 
ORDER BY visits.visit_date ASC LIMIT 1;

SELECT animals.*, vets.*, visits.visit_date 
FROM animals 
JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON visits.vets_id = vets.id 
ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(*) 
FROM specialization 
RIGHT JOIN vets ON specialization.vets_id = vets.id 
JOIN visits ON vets.id = visits.vets_id  
JOIN animals ON animals.id = visits.animals_id 
JOIN species ON animals.species_id = species.id 
WHERE specialization.species_id <> species.id OR specialization.species_id IS NULL;

SELECT species.name, COUNT(*) 
FROM vets 
JOIN visits ON vets.id = visits.vets_id 
JOIN animals ON animals.id = visits.animals_id 
JOIN species ON animals.species_id = species.id 
WHERE vets.name='Maisy Smith' 
GROUP BY species.name 
ORDER BY count DESC LIMIT 1;

/*  Database performance audit */

SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';