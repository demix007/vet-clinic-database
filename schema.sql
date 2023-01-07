/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 name VARCHAR(150),
 date_of_birth DATE,
 escape_attempts INT,
 neutered BOOLEAN,
 weight_kg DECIMAL
 );

/* ADD NEW COLUMN TO TABLE */

ALTER TABLE animals
ADD COLUMN species VARCHAR(50);

/* Multiple tables */

/* Owners table */

CREATE TABLE owners (
    id INt GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(150),
    age INTEGER
);

/* Species table */
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY  PRIMARY KEY,
    name VARCHAR(150)
);

/* Modify animals table */

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT
REFERENCES species(id)
ON DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owner_id INT
REFERENCES owners(id)
ON DELETE CASCADE;

/* Join Tables */

/* Vets Table */

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150),
    age INTEGER,
    date_of_graduation date
);

/* Specialization Table */

CREATE TABLE specialization(
    vets_id INT REFERENCES vets (id),
    species_id INT REFERENCES species (id),
    PRIMARY KEY (vets_id, species_id)
);

/* Visits Table */

CREATE TABLE visits (
    animals_id INT REFERENCES animals(id),
    vets_id INT REFERENCES vets(id),
    visit_date date,
    PRIMARY KEY (animals_id, vets_id, visit_date)
);