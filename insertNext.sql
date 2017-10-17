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
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);

INSERT INTO `performs` (`phlebotomist$name`, `phlebotomist$clinic`, `visit$id`)
VALUES
	('Doogie Howser', 'WellnessClinic', 1),
	('Bert Macklin', 'HappyClinic', 2),
	('Sheryl Banks', 'GetWellClinic', 3),
	('Allan Beck', 'WellnessClinic', 4),
	('Manuel Murphy', 'HappyClinic', 5);

INSERT INTO `invoice` (`visit$id`, `billedDate`, `billedAmt`, `message`, `mileage`)
VALUES
	(1, '20120618 10:34:09 AM', 125.45, '', 18),
	(2, '20120618 10:34:11 AM', 248.28, '', 12),
	(3, '20120618 10:34:13 AM', 12.25, '', 2),
	(4, '20120618 10:34:15 AM', 35.12, '', 14),
	(5, '20120618 10:34:17 AM', 18.27, '', 12);

INSERT INTO `billedTo` (`insuranceCompanyName`, `invoice$id`)
VALUES
	('Aetna', 1),
	('Blue Cross',2),
	('Green Square',3),
	('Orange Triangle',4),
	('Purple Heart',5);

INSERT INTO `consults` (`patient$id`, `doctor$name`, `doctor$practiceName`)
VALUES
	(1, 'John Watson, M.D.', 'Doctors Plus'),
	(2, 'Ronald Burns, M.D.', 'Family Medicine'),
	(3, 'Steve Simons, M.D.', 'Doctors Plus'),
	(4, 'Sheryl Reames, M.D.', 'Diverse Health Care'),
	(5, 'Frank Oswaldt, M.D.', 'Family Care Group');
