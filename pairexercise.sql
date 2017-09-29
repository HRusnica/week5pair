BEGIN TRANSACTION;

CREATE TABLE customer (
        customer_id serial,
        first_name varchar(255) NOT NULL,
        last_name varchar(255) NOT NULL,
        address1 varchar(255),
        address2 varchar(255),
        city varchar(255),
        province varchar(255),
        postal_code varchar(255),
        CONSTRAINT pk_customer_id PRIMARY KEY (customer_id)
);        

CREATE TABLE pet_type (
        pet_type serial, 
        type_name varchar(255),
        CONSTRAINT pk_pet_type PRIMARY KEY (pet_type)
);      

CREATE TABLE pet (
        pet_id serial, 
        pet_name varchar(255) NOT NULL,
        pet_type int, 
        pet_age int, 
        CONSTRAINT pk_pet_id PRIMARY KEY (pet_id), 
        CONSTRAINT fk_pet_type FOREIGN KEY (pet_type) REFERENCES pet_type(pet_type) 
); 

CREATE TABLE pet_owner (
        pet_id int,
        customer_id int,
        CONSTRAINT fk_pet_id FOREIGN KEY (pet_id) REFERENCES pet(pet_id),
        CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE procedure (
        procedure_num serial, 
        procedure_name varchar(255), 
        CONSTRAINT pk_procedure_num PRIMARY KEY (procedure_num)
 );
 
 CREATE TABLE visit (
        visit_id serial,
        pet_id int,
        visit_date date,
        CONSTRAINT pk_visit_id PRIMARY KEY (visit_id),
        CONSTRAINT pet_id FOREIGN KEY (pet_id) REFERENCES pet(pet_id)
);

CREATE TABLE procedure_visit (
        procedure_num int,
        visit_id int, 
        CONSTRAINT fk_procedure_num FOREIGN KEY (procedure_num) REFERENCES procedure(procedure_num), 
        CONSTRAINT fk_visit_id FOREIGN KEY (visit_id) REFERENCES visit(visit_id)
); 

CREATE TABLE price (
        price_id serial,
        procedure_num int,
        pet_type int,
        price decimal(7, 2),
        CONSTRAINT pk_price_id PRIMARY KEY (price_id),
        CONSTRAINT fk_procedure_num FOREIGN KEY (procedure_num) REFERENCES procedure(procedure_num),
        CONSTRAINT fk_pet_type FOREIGN KEY (pet_type) REFERENCES pet_type(pet_type) 
);   

CREATE TABLE invoice (
        invoice_num serial, 
        tax_rate decimal (5,3),
        visit_id int, 
        CONSTRAINT pk_invoice_num PRIMARY KEY (invoice_num), 
        CONSTRAINT fk_visit_id FOREIGN KEY (visit_id) REFERENCES visit(visit_id)
);        
            
COMMIT; 
     
ROLLBACK;           
