/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES
    ('Agumon', date '2020-02-03', 0, true, 10.23),
    ('Gabumon', date '2018-11-15', 2, true, 8),
    ('Pikachu', date '2021-01-07', 1, false, 15.04),
    ('Devimon', date '2017-05-12', 5, true, 11);

/* Insert new set of data into animals table */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    ('Charmander', date '2020-02-08', 0, false, -11),
    ('Plantmon', date '2021-11-15', 2, true, -5.7),
    ('Squirtle', date '1993-04-02', 3, false, -12.13),
    ('Angemon', date '2005-06-12', 1, true, -45),
    ('Boarmon', date '2005-06-07', 7, true, 20.4),
    ('Blossom', date '1998-10-13', 3, true, 17),
    ('Ditto', date '2022-05-14', 4, true, 22);

/* Insert data into owners table */
INSERT INTO owners(full_name, age)
VALUES 
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester',14 ),
    ('Jodie Whittaker', 38);

/* Insert data into species table */
INSERT INTO species (name)
VALUES
    ('Pokemon'),
    ('Digimon');

/* Modify animals' species_id column */
UPDATE animals 
SET species_id = 2 
WHERE name LIKE '%mon';

UPDATE animals 
SET species_id = 1  
WHERE species_id IS NULL;

/* Modify animals' owners_id column */

UPDATE animals 
SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
WHERE name='Agumon';

UPDATE animals 
SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell') 
WHERE name='Gabumon';

UPDATE animals 
SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell') 
WHERE name='Pikachu';

UPDATE animals 
SET owner_id = (SELECT id from owners WHERE full_name = 'Bob') 
WHERE name='Devimon';

UPDATE animals 
SET owner_id = (SELECT id from owners WHERE full_name = 'Bob')  
WHERE name='Plantmon';

UPDATE animals 
SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond')  
WHERE name='Charmander';

UPDATE animals 
SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond') 
WHERE name='Squirtle';

UPDATE animals 
SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond') 
WHERE name='Blossom';

UPDATE animals 
SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')   
WHERE name='Angemon';

UPDATE animals 
SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')  
WHERE name='Boarmon';

/* Join Tables */

/* Insert Data Into Vets Table */

INSERT INTO vets (name, age, date_of_graduation) 
VALUES 
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

/* Insert Data Into Specialization Table */
INSERT INTO specialization(vets_id, species_id)  
VALUES
    (1,1),
    (3,2),
    (3,1),
    (4,2);