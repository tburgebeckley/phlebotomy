INSERT INTO consults (`patient$id`, `doctor$name`, `doctor$practiceName`)
SELECT p.id, d.name, d.practiceName FROM patient as p, doctor as d WHERE d.name LIKE "%F%" AND p.id = FLOOR(RAND()*(2000-1)+1)

-- UPDATE insuranceCompany SET name = 'Aeetna' WHERE name = 'Aetna'

-- DELETE FROM invoice WHERE message = "waived" AND billedDate < '2000-06-01'