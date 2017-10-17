USE phlebotomy;

INSERT INTO `practicesAt` (`doctor$name`, `doctor$practiceName`, `address$id`)
VALUES
	('', '', ),
	('', '', ),
	('', '', ),
	('', '', ),
	('', '', );

INSERT INTO `livesAt` (`patient$id`, `address$id`)
VALUES
	(, ),
	(, ),
	(, ),
	(, ),
	(, );

INSERT INTO `visit` (`network`, `visitDate`, `testType`, `patient$id`, `phlebotomist$name`)
VALUES
	('', '20120618 10:34:09 AM', '', , ''),
	('', '20120618 10:34:09 AM', '', , ''),
	('', '20120618 10:34:09 AM', '', , ''),
	('', '20120618 10:34:09 AM', '', , ''),
	('', '20120618 10:34:09 AM', '', , '');

INSERT INTO `hasA` (`patient$id`, `visit$id`)
VALUES
	(),
	(),
	(),
	(),
	();

INSERT INTO `performs` (`phlebotomist$name`, `phlebotomist$clinic`, `visit$id`)
VALUES
	('', '', ),
	('', '', ),
	('', '', ),
	('', '', ),
	('', '', );

INSERT INTO `invoice` (`visit$id`, `billedDate`, `billedAmt`, `message`, `mileage`)
VALUES
	(, '20120618 10:34:09 AM', 125.45, '', 18),
	(),
	(),
	(),
	();

INSERT INTO `billedTo` (`insuranceCompanyName`, `invoice$id`)
VALUES
	('', ),
	(),
	(),
	(),
	();

INSERT INTO `consults` (`patient$id`, `doctor$name`, `doctor$practiceName`)
VALUES
	(, '', ''),
	(),
	(),
	(),
	();
