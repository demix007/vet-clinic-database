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
