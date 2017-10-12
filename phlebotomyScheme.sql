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
