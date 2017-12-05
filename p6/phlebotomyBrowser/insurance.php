<?php
    require_once("function.php");

    pageHeader("Insurance Report", 'insurancePage');
    $form = $report = "";
    $having = 1700;
    if ($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        $having = (!isset($_POST['having']))? $having: (is_numeric($_POST['having']))? (int)($_POST['having']): $having;
        $report = getInsurance($having);
    }
    $form = file_get_contents('../html/insurance.html');
    $form = format($form, array('val'=>$having, 'action'=>$_SERVER['PHP_SELF'], 'max'=>10000));
    echo $form, $report;
    pageFooter();



    function getInsurance($having) 
    {
        $report = file_get_contents('../html/insuranceReport.html');
        $sql = 'SELECT sum(billedAmt) as amt, `insuranceCompany$name` as insurance, patient.name as patient, count(*) as visits '.
                'FROM `invoice`, `billedTo`, `visit`, `patient` '.
                'WHERE patient.id = visit.`patient$id` AND '.
                'visit.id = invoice.`visit$id` AND '.
                'invoice.id = billedTo.`invoice$id` '.
                'GROUP BY patient.name, `insuranceCompany$name` '.
                'HAVING sum(billedAmt) > {having} '.
                'ORDER BY sum(billedAmt) DESC '.
                'LIMIT 20';
        $sql = format($sql, array('having'=>$having));

        $pdo = pdo_construct();

        $result = pdo_query($pdo, $sql);

        $result->fetch();
        $rows = "";
        $template = "\t\t\t\t\t<tr><td>{amt}</td><td>{insurance}</td><td>{patient}</td><td>{visits}</td></tr>\n";
        while ($row = $result->fetch())
        {
            $row['amt'] = number_format((float)$row['amt'],2);
            $rows = $rows . format($template, $row);
        }
        return format($report, array('rows'=>$rows));
    }
?>