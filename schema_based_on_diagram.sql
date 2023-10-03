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
CREATE TABLE medical_histories(
     id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
     admitted_at timestamp,
     patient_id INT REFERENCES patients (id),
     status VARCHAR(100) NOT NULL
);


-- create invoices table
CREATE TABLE invoices (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL NOT NULL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id int REFERENCES medical_histories(id)
);


-- create invocie_items table
CREATE TABLE invocie_items (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unique_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);
