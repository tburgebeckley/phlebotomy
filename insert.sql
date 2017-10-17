USE phlebotomy;

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
	('274 Rose Ave', 'Chicago', 'IL', '60007'),
	('3021 N Gold Star Dr', 'Long Beach', 'CA', '90810'),
	('32 N 4th St', 'Columbus', 'OH', '43215'),
	('3901 NW 28th St', 'Miami', 'FL', '33142'),
	('550 S Tyron St', 'Charleston', 'NC', '28202'),
	('899 Oakland Ave', 'Ann Arbor', 'MI', '48104'),
	('800 Washington St', 'Boston', 'MA', '02111'),
	('1701 Trinity St', 'Austin', 'TX', '78705'),
	('900 E 11th Ave', 'Denver', 'CO', '80218'),
	('34800 Bob Wilson Dr', 'San Diego', 'CA', '92134'),
	('298 E Arikara Ave', 'Bismarck', 'ND', '58501'),
	('350 W Thomas Rd', 'Phoenix', 'AZ', '85013'),
	('269 1300 S', 'Salt Lake City', 'UT', '84115'),
	('S 42nd St', 'Omaha', 'NE', '68198'),
	('701 10th St SE', 'Cedar Rapids', 'IA', '52403'),
	('216 S Kingshighway Blvd', 'St. Louis', 'MO', '63110');

INSERT INTO phlebotomist (name, clinic)
VALUES
	('Doogie Howser', 'WellnessClinic'),
	('Bert Macklin', 'HappyClinic'),
	('Sheryl Banks', 'GetWellClinic'),
	('Allan Beck', 'WellnessClinic'),
	('Manuel Murphy', 'HappyClinic');

INSERT INTO specialist (`doctor$name`, `doctor$practiceName`, specialty)
VALUES
	('John Watson, M.D.', 'Doctors Plus', 'Cardiologist'),
	('Ronald Burns, M.D.', 'Family Medicine', 'Urologist'),
	('Steve Simons, M.D.', 'Doctors Plus', 'Neurologist'),
	('Sheryl Reames, M.D.', 'Diverse Health Care', 'Oncologist'),
	('Frank Oswaldt, M.D.', 'Family Care Group', 'Gastroenterologist');

INSERT INTO insuranceCompany (name, network, `address$id`)
VALUES
	('Aetna', 'BJC', 1),
	('Blue Cross', 'Blue Sheild', 2),
	('Green Square', 'Green Oval', 3),
	('Orange Triangle', 'Red Circle', 4),
	('Purple Heart', 'Peach Cube', 5);

