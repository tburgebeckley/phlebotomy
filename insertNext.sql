USE phlebotomy;

INSERT INTO `practicesAt` (`doctor$name`, `doctor$practiceName`, `address$id`)
VALUES
	('John Watson, M.D.', 'Doctors Plus', 1),
        ('Ronald Burns, M.D.', 'Family Medicine', 2),
	('Steve Simons, M.D.', 'Doctors Plus', 3),
	('Sheryl Reames, M.D.', 'Diverse Health Care', 4),
	('Frank Oswaldt, M.D.', 'Family Care Group', 5);
	
INSERT INTO `livesAt` (`patient$id`, `address$id`)
VALUES
	(1, 6),
	(2, 7),
	(3, 8),
	(4, 9),
	(5, 10);

INSERT INTO `visit` (`network`, `visitDate`, `testType`, `patient$id`)
VALUES
	('Southwest', '20140219 9:30:00 AM', 'hemoglobin', 1),
	('', '20120618 10:34:09 AM', '', ),
	('', '20120618 10:34:09 AM', '', ),
	('', '20120618 10:34:09 AM', '', ),
	('', '20120618 10:34:09 AM', '', );



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
