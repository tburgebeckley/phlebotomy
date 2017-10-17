using phlebotomy;

INSERT INTO patient (name, DOB, bloodType)
VALUES
	('Maggie Smith', DATE '1993-12-15', 'O+'),
	('Jon Stone', DATE '1987-04-16', 'A+'),
	('Josie Rifter', DATE '1972-02-13', 'AB+'),
	('Edgar Knowles', DATE '1989-05-30', 'A-'),
	('Susan Colburn', DATE '1958-02-28', 'B+');

INSERT INTO doctor (name, practiceName)
VALUES
	('John Watson, M.D.', 'Doctors Plus'),
	('Ronald Burns, M.D.', 'Family Medicine'),
	('Steve Simons, M.D.', 'Doctors Plus'),
	('Sheryl Reames, M.D.', 'Diverse Health Care'),
	('Frank Oswaldt, M.D.', 'Family Care Group');

INSERT INTO address (`street`, `city`, `state`, `zip`)
VALUES
	('25 Posey Ln', 'Schenectady', 'NY', '12309'),
	(),
	(),
	(),
	(),
	(),
	(),
	(),
	(),
	(),
	(),
	(),
	(),
	(),
	(),
	(),
	();

INSERT INTO phlebotomist (name, clinicName)
VALUES
	('Doogie Howser', 'WellnessClinic'),
	(),
	(),
	(),
	();

INSERT INTO specialist (name, practiceName, specialty)
VALUES
	('Gordon Clark', 'Doctors RUS', 'Eurology'),
	(),
	(),
	(),
	();

INSERT INTO insuranceCompany (name, network, address$id)
VALUES
	('Aetna', 'BJC', 1),
	(),
	(),
	(),
	();

