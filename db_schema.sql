-- Drop tables if they exist
-- DROP TABLE IF EXISTS transactions;
-- DROP TABLE IF EXISTS store;
-- DROP TABLE IF EXISTS items;
-- DROP TABLE IF EXISTS customer;
-- DROP TABLE IF EXISTS payment;
-- DROP TABLE IF EXISTS population;
-- DROP TABLE IF EXISTS suppliers;

-- Create tables
CREATE TABLE transactions(
    payment_id VARCHAR(5),
    customer_id VARCHAR(20),
    item_id VARCHAR(20),
    store_id VARCHAR(20),
    quantity INT,
    "date" DATE,
	"time" TIME 
);

CREATE TABLE items (
    item_id VARCHAR(10),
    item_name VARCHAR(150),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    unit_cost FLOAT,
    unit_price FLOAT,
    source_country VARCHAR(50),
    source_state VARCHAR(100),
    unit VARCHAR(20),
	supplier_id VARCHAR(10),
    delivery_cost_pu FLOAT,
    CONSTRAINT pk_item PRIMARY KEY (item_id)
);

CREATE TABLE suppliers(
	supplier_id VARCHAR(10),
	supplier_name VARCHAR(100),
	CONSTRAINT pk_supplier PRIMARY KEY (supplier_id)
);

CREATE TABLE customer (
    customer_id VARCHAR(20),
    age INT,
    sex VARCHAR(2),
    marital_status VARCHAR (2)
    employment_status VARCHAR(20)
    CONSTRAINT pk_customer PRIMARY KEY (customer_id)
);

CREATE TABLE payment (
    payment_id VARCHAR(20),
    payment_type VARCHAR(20),
    bank_name VARCHAR(100),
    CONSTRAINT pk_payment PRIMARY KEY (payment_id)
);

CREATE TABLE store (
    store_id VARCHAR(10),
    division VARCHAR(60),
    city VARCHAR(60),
    CONSTRAINT pk_store PRIMARY KEY (store_id)
);

CREATE TABLE population (
    division VARCHAR(60),
    "2020" FLOAT,
    "2021" FLOAT,
    "2022" FLOAT,
    "2023" FLOAT,
	CONSTRAINT pk_population PRIMARY KEY (division)
);

-- Add foreign key constraints
ALTER TABLE transactions ADD CONSTRAINT fk_store FOREIGN KEY (store_id)
REFERENCES store (store_id);

ALTER TABLE transactions ADD CONSTRAINT fk_items FOREIGN KEY (item_id)
REFERENCES items (item_id);

ALTER TABLE transactions ADD CONSTRAINT fk_payment FOREIGN KEY (payment_id)
REFERENCES payment (payment_id);

ALTER TABLE transactions ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id)
REFERENCES customer (customer_id);

ALTER TABLE items ADD CONSTRAINT fk_supplier FOREIGN KEY (supplier_id)
REFERENCES suppliers (supplier_id);

ALTER TABLE store ADD CONSTRAINT fk_division FOREIGN KEY (division)
REFERENCES population (division);
