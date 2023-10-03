-- create database clinic
CREATE DATABASE clinic;

-- create patients table
CREATE TABLE patients (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
);

-- create treatments table
 CREATE TABLE treatments (
     id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
     type VARCHAR(100) NOT NULL,
     name VARCHAR(120) NOT NULL
);

-- create medical_histories table


-- create invoices table


