CREATE DATABASE IF NOT EXISTS phlebotomy;

USING phlebotomy;

CREATE TABLE IF NOT EXISTS invoice(
	id int NOT NULL AUTO_INCREMENT, 
	visit$id int NOT NULL, 
	billedDate datetime, 
	billedAmt float, 
	message varchar(100), 
	mileage int,
	PRIMARY KEY (id),
	FOREIGN KEY(visit$id) REFERENCES visit(id)
);

CREATE TABLE IF NOT EXISTS patient(
	id int NOT NULL AUTO_INCREMENT, 
	name varchar(50), 
	DOB date, 
	bloodType varchar(3),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS billedTo(
	insuranceCompany$name:varchar(50), 
	invoice$id:int,
	FOREIGN KEY(insuranceCompany$name) REFERENCES vinsuranceCompanyisit(name),
	FOREIGN KEY(invoice$id) REFERENCES invoice(id)
);

CREATE TABLE IF NOT EXISTS consults(
	id:int AUTO_INCREMENT, 
	patient$id:int, 
	doctor$name:varchar(50), 
	doctor$practiceName:varchar(50), 
	cDate:datetime
	PRIMARY KEY (id)
	FOREIGN KEY(patient$id) REFERENCES patient(id)
	FOREIGN KEY(doctor$name) REFERENCES doctor(name)
	FOREIGN KEY(doctor$practiceName) REFERENCES doctor(practiceName)
);

CREATE TABLE IF NOT EXISTS doctor (
    name varchar(50),
    practiceName varchar(50),
    PRIMARY KEY (name, practiceName)
);

CREATE TABLE IF NOT EXISTS specialist (
    name varchar(50),
    practiceName varchar(50),
    specialty varchar(50),

    PRIMARY KEY (name, practiceName)
);

CREATE TABLE IF NOT EXISTS phlebotomist (
    name varchar(50),
    clinic varchar(50),

    PRIMARY KEY(name, clinic)
);

CREATE TABLE IF NOT EXISTS address (
    id int NOT NULL AUTO_INCREMENT,
    street varchar(25),
    city varchar(25),
    state varchar(2),
    zip varchar(9),

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS insuranceCompany (
    name varchar(50),
    network varchar(50),
    address$id int,

    PRIMARY KEY (name, network),
    FOREIGN KEY (address$id) REFERENCES (address.id)
);
CREATE TABLE IF NOT EXISTS practicesAt(
    doctor$name VARCHAR(50) NOT NULL,
    doctor$practiceName VARCHAR(50) NOT NULL,
    address$id INT NOT NULL,
    PRIMARY KEY (doctor$name, doctor$practiceName, address$id),
    FOREIGN KEY doctor$name REFERENCES doctor.name,
    FOREIGN KEY doctor$practiceName REFERENCES doctor.practiceName,
    FOREIGN KEY address$id REFERENCES address.id
);


CREATE TABLE IF NOT EXISTS livesAt(
       patient$id INT NOT NULL,
       address$id INT NOT NULL,
       PRIMARY KEY (patient$id, address$id),
       FOREIGN KEY patient$id REFERENCES patient.id,
       FOREIGN KEY address$id REFERENCES address.id
       );

CREATE TABLE IF NOT EXISTS hasA(
       patient$id INT NOT NULL,
       visit$id INT NOT NULL,
       PRIMARY KEY (patient$id, visit$id),
       FOREIGN KEY patient$id REFERENCES patient.id,
       FOREIGN KEY visit$id REFERENCES visit.id
       );

CREATE TABLE IF NOT EXISTS performs(
       phlebotomist$name VARCHAR(50) NOT NULL,
       phlebotomist$clinic VARCHAR(50) NOT NULL,
       visit$id INT NOT NULL,
       PRIMARY KEY (phelebotomist$name, phlebotomist$clinic, visit$id),
       FOREIGN KEY phlebotomist$name REFERENCES phlebotomist.name,
       FOREIGN KEY phlebotomist$clinic REFERENCES phlebotomist.clinic,
       FOREIGN KEY visit$id REFERENCES visit.id
       );
	   
CREATE TABLE IF NOT EXISTS invoice(
	id int NOT NULL AUTO_INCREMENT, 
	visit$id int NOT NULL, 
	billedDate datetime, 
	billedAmt float, 
	message varchar(100), 
	mileage int,
	PRIMARY KEY (id),
	FOREIGN KEY(visit$id) REFERENCES visit(id)
);

CREATE TABLE IF NOT EXISTS patient(
	id int NOT NULL AUTO_INCREMENT, 
	name varchar(50), 
	DOB date, 
	bloodType varchar(3),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS billedTo(
	insuranceCompany$name:varchar(50), 
	invoice$id:int,
	FOREIGN KEY(insuranceCompany$name) REFERENCES vinsuranceCompanyisit(name),
	FOREIGN KEY(invoice$id) REFERENCES invoice(id)
);

CREATE TABLE IF NOT EXISTS consults(
	id:int AUTO_INCREMENT, 
	patient$id:int, 
	doctor$name:varchar(50), 
	doctor$practiceName:varchar(50), 
	cDate:datetime
	PRIMARY KEY (id)
	FOREIGN KEY(patient$id) REFERENCES patient(id)
	FOREIGN KEY(doctor$name) REFERENCES doctor(name)
	FOREIGN KEY(doctor$practiceName) REFERENCES doctor(practiceName)
);

