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
