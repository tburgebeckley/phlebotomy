SELECT sum(billedAmt), `insuranceCompany$name`, patient.name, count(*)
FROM invoice, billedTo, visit, patient
WHERE patient.id = visit.`patient$id` AND
      visit.id = invoice.`visit$id` AND
      invoice.id = billedTo.`invoice$id`
GROUP BY patient.name, `insuranceCompany$name`
HAVING sum(billedAmt) > 1700
ORDER BY sum(billedAmt) DESC
LIMIT 20

SELECT patient.name, patient.DOB,
COALESCE( c.cnt, 0 ) AS consultations, 
COALESCE( v.cnt, 0 ) AS visits
FROM patient
LEFT JOIN (SELECT count(*) as cnt, `patient$id`
           FROM consults
           GROUP BY `patient$id`) c
           ON c.`patient$id` = patient.id
LEFT JOIN (SELECT count(*) as cnt, `patient$id`
           FROM visit
           GROUP BY `patient$id`) v
           ON v.`patient$id` = patient.id
HAVING 4 > consultations
ORDER BY visits
LIMIT 20

SELECT count(*) as Q42009Visits, `phlebotomist$name` as PhlebName, max(visit.visitDate) as LatestVisit, min(visit.visitDate) as EarliestVisit
FROM visit, performs 
WHERE performs.`visit$id` = visit.id 
AND visit.id IN (SELECT v.id 
                 FROM visit v 
                 WHERE v.visitDate < DATE '2010-01-01' 
                 AND v.visitDATE > DATE '2009-08-31') 
GROUP BY `phlebotomist$name` 
ORDER BY LatestVisit
LIMIT 20

ALTER TABLE `visit` ADD INDEX(`visitDate`)

CREATE VIEW phlebotomistVisitInvoicePatient AS
SELECT p.name as patientName, p.DOB as patientBirthDate, p.bloodType as bloodType, 
       pf.`phlebotomist$name` as phlebotomist, pf.`phlebotomist$clinic` as clinicName,
       v.visitDate as date, v.testType as bloodTest,
       i.billedDate as billedDate, i.billedAmt as billedAmt, i.message as note, i.mileage as milesTravelled
FROM visit v, invoice i, patient p, performs pf
WHERE v.id = i.`visit$id`
AND   p.id = v.`patient$id`
AND   p.`visit$id` = v.id

CREATE OR REPLACE VIEW phlebotomistVisitInvoicePatient AS 
SELECT p.name as patientName, p.DOB as patientBirthDate, p.bloodType as bloodType, 
       a.street as streetNumber, a.city as city, a.state as state, a.zip as zipcode,
       pf.`phlebotomist$name` as phlebotomist, pf.`phlebotomist$clinic` as clinicName,
       v.visitDate as date, v.testType as bloodTest,
       i.billedDate as billedDate, i.billedAmt as billedAmt, i.message as note, i.mileage as milesTravelled
FROM visit v, invoice i, patient p, performs pf, address a, livesAt l
WHERE v.id = i.`visit$id`
AND   p.id = v.`patient$id`
AND   pf.`visit$id` = v.id
AND   a.id = l.`address$id` 
AND   p.id = l.`patient$id`