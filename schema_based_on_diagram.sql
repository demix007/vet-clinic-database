CREATE DATABASE clinic 

CREATE TABLE patients(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(20),
date_of_birth date,
PRIMARY KEY (id)
);



