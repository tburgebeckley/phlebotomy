CREATE DATABASE IF NOT EXISTS phlebotomy;

USE phlebotomy;


CREATE TABLE IF NOT EXISTS doctor (
    name varchar(50) NOT NULL,
    practiceName varchar(50) NOT NULL,
    PRIMARY KEY (name, practiceName)
);

CREATE TABLE IF NOT EXISTS specialist (
    `doctor$name` varchar(50) NOT NULL,
    `doctor$practiceName` varchar(50) NOT NULL,
    specialty varchar(50) NOT NULL,

    PRIMARY KEY (`doctor$name`, `doctor$practiceName`),
    FOREIGN KEY (`doctor$name`, `doctor$practiceName`) REFERENCES doctor(name, practiceName)
	
);

CREATE TABLE IF NOT EXISTS phlebotomist (
    name varchar(50) NOT NULL,
    clinic varchar(50) NOT NULL,

    PRIMARY KEY(name, clinic)
);

CREATE TABLE IF NOT EXISTS address (
    id int NOT NULL AUTO_INCREMENT,
    street varchar(25) NOT NULL,
    city varchar(25) NOT NULL,
    state varchar(2) NOT NULL,
    zip varchar(9) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS insuranceCompany (
    name varchar(50) NOT NULL,
    network varchar(50) NOT NULL,
    `address$id` int NOT NULL,

    PRIMARY KEY (name, network),
    FOREIGN KEY (`address$id`) REFERENCES address(id)
);
CREATE TABLE IF NOT EXISTS practicesAt(
    `doctor$name` varchar(50) NOT NULL,
    `doctor$practiceName` varchar(50) NOT NULL,
    `address$id` int NOT NULL,
    PRIMARY KEY (`doctor$name`, `doctor$practiceName`, `address$id`),
    FOREIGN KEY (`doctor$name`, `doctor$practiceName`) REFERENCES doctor(name, practiceName),
    FOREIGN KEY (`address$id`) REFERENCES address(id)
);

CREATE TABLE IF NOT EXISTS patient(
	id int NOT NULL AUTO_INCREMENT, 
	name varchar(50), 
	DOB date, 
	bloodType varchar(3),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS livesAt(
       `patient$id` int NOT NULL,
       `address$id` int NOT NULL,
       PRIMARY KEY (`patient$id`, `address$id`),
       FOREIGN KEY (`patient$id`) REFERENCES patient(id),
       FOREIGN KEY (`address$id`) REFERENCES address(id)
);

CREATE TABLE IF NOT EXISTS visit(
	id int NOT NULL AUTO_INCREMENT,
	network varchar(50) NOT NULL,
	vistDate datetime NOT NULL,
	testType varchar(50) NOT NULL,
	`patient$id` int NOT NULL,

	PRIMARY KEY (id),

	FOREIGN KEY (`patient$id`) REFERENCES patient(id)
);

CREATE TABLE IF NOT EXISTS performs(
       `phlebotomist$name` varchar(50) NOT NULL,
       `phlebotomist$clinic` varchar(50) NOT NULL,
       `visit$id` int NOT NULL,
       PRIMARY KEY (`phlebotomist$name`, `phlebotomist$clinic`, `visit$id`),
       FOREIGN KEY (`phlebotomist$name`, `phlebotomist$clinic`) REFERENCES phlebotomist(name, clinic),
       FOREIGN KEY (`visit$id`) REFERENCES visit(id)
       );
	   
CREATE TABLE IF NOT EXISTS invoice(
	id int NOT NULL AUTO_INCREMENT, 
	`visit$id` int NOT NULL, 
	billedDate datetime, 
	billedAmt float, 
	message varchar(100), 
	mileage int,
	PRIMARY KEY (id, `visit$id`),
	FOREIGN KEY(`visit$id`) REFERENCES visit(id)
);

CREATE TABLE IF NOT EXISTS billedTo(
	`insuranceCompany$name` varchar(50) NOT NULL, 
	`invoice$id` int NOT NULL,
	FOREIGN KEY(`insuranceCompany$name`) REFERENCES insuranceCompany(name),
	FOREIGN KEY(`invoice$id`) REFERENCES invoice(id)
);

CREATE TABLE IF NOT EXISTS consults(
	id int AUTO_INCREMENT, 
	`patient$id` int NOT NULL, 
	`doctor$name` varchar(50) NOT NULL, 
	`doctor$practiceName` varchar(50) NOT NULL, 
	cDate datetime,
	PRIMARY KEY (id),
	FOREIGN KEY(`patient$id`) REFERENCES patient(id),
	FOREIGN KEY(`doctor$name`, `doctor$practiceName`) REFERENCES doctor(name, practiceName)
);

