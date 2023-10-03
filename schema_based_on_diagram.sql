-- create database clinic
CREATE DATABASE clinic;

-- create patients table
CREATE TABLE patients (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
);

-- create treatments table
 

-- create medical_histories table


-- create invoices table


