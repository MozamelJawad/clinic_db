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
    unit_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);


-- create the join table(medical_history_treatment) for medical_histories and treatment tables
CREATE TABLE medical_history_treatment(
    medical_history_id INT REFERENCES medical_histories(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY(medical_history_id, treatment_id)
);

-- FK indexes
CREATE INDEX patient_id_index_medical_histories ON medical_histories(patient_id ASC);
CREATE INDEX medical_history_id_index_invoices ON invoices(medical_history_id ASC);
CREATE INDEX invoice_id_index_invoice_items ON invocie_items(invoice_id ASC);
CREATE INDEX treatment_id_index_invoice_items ON invocie_items(treatment_id ASC);
CREATE INDEX medical_history_id_index ON medical_history_treatment(medical_history_id ASC);
CREATE INDEX treatment_id_index ON medical_history_treatment(treatment_id ASC);