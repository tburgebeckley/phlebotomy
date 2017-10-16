using phlebotomy;

INSERT INTO patient (name, DOB, bloodType)
VALUES
	('Maggie Smith', DATE '1993-12-15', 'O+'),
	(),
	(),
	(),
	();

INSERT INTO doctor (name, practiceName)
VALUES
	('John Watson, M.D.', 'Doctors Plus'),
	(),
	(),
	(),
	();

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

