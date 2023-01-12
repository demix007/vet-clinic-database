CREATE DATABASE clinic 

CREATE TABLE patients(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(20),
date_of_birth date,
PRIMARY KEY (id)
);


CREATE TABLE medical_histories(
id INT GENERATED ALWAYS AS IDENTITY,
admitted_at TIMESTAMP NOT NULL DEFAULT NOW(),
patient_id INT REFERENCES patients(id),
status VARCHAR(50),
PRIMARY KEY (id)
);


CREATE TABLE treatments(
id INT GENERATED ALWAYS AS IDENTITY,
type VARCHAR(50),
name VARCHAR(50),
PRIMARY KEY (id)
);

CREATE TABLE invoices(
id INT GENERATED ALWAYS AS IDENTITY,
total_amount DECIMAL,
generated_at TIMESTAMP NOT NULL DEFAULT NOW(),
payed_at TIMESTAMP,
medical_history_id INT UNIQUE REFERENCES medical_histories(id),
PRIMARY KEY (id)
);


