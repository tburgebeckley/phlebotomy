CREATE TABLE doctor (
    name varchar(50),
    practiceName varchar(50),
    PRIMARY KEY (name, practiceName)
);

CREATE TABLE specialist (
    name varchar(50),
    practiceName varchar(50),
    specialty varchar(50),

    PRIMARY KEY (name, practiceName)
);

CREATE TABLE phlebotomist (
    name varchar(50),
    clinic varchar(50),

    PRIMARY KEY(name, clinic)
);

CREATE TABLE address (
    id int NOT NULL AUTO_INCREMENT,
    street varchar(25),
    city varchar(25),
    state varchar(2),
    zip varchar(9),

    PRIMARY KEY (id)
);

CREATE TABLE insuranceCompany (
    name varchar(50),
    network varchar(50),
    address$id int,

    PRIMARY KEY (name, network),
    FOREIGN KEY (address$id) REFERENCES (address.id)
);