<?php
    require_once("function.php");

    pageHeader("Visit vs. Consulations Report", 'visitConsultPage');
    $form = $report = "";
    $having = 3;
    if ($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        $having = (!isset($_POST['having']))? $having: (is_numeric($_POST['having']))? (int)($_POST['having']): $having;
        $report = getVisitConsult($having);
    }
    $form = file_get_contents('../html/visitconsult.html');
    $form = format($form, array('val'=>$having, 'action'=>$_SERVER['PHP_SELF']));
    echo $form, $report;
    pageFooter();



    function getVisitConsult($having) 
    {
        $report = file_get_contents('../html/visitReport.html');
        $sql = 'SELECT patient.name as patient, patient.DOB as dob, '.
                'COALESCE( c.cnt, 0 ) AS consultations, '.
                'COALESCE( v.cnt, 0 ) AS visits '.
                'FROM patient '.
                'LEFT JOIN (SELECT count(*) as cnt, `patient$id` ' .
                   'FROM consults '.
                   'GROUP BY `patient$id`) c '.
                   'ON c.`patient$id` = patient.id '.
                'LEFT JOIN (SELECT count(*) as cnt, `patient$id` '.
                   'FROM visit '.
                   'GROUP BY `patient$id`) v '.
                   'ON v.`patient$id` = patient.id '.
                'HAVING {having} > consultations '.
                'ORDER BY visits '.
                'LIMIT 20';
        $sql = format($sql, array('having'=>$having));

        $pdo = pdo_construct();

        $result = pdo_query($pdo, $sql);

        $result->fetch();
        $rows = "";
        $template = "\t\t\t\t\t<tr><td>{patient}</td><td>{dob}</td><td>{consultations}</td><td>{visits}</td></tr>\n";
        while ($row = $result->fetch())
        {
            $rows = $rows . format($template, $row);
        }
        return format($report, array('rows'=>$rows));
    }
?>