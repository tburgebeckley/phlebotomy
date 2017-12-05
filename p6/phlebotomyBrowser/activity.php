<?php
    require_once('function.php');

    pageHeader('Activity Log', 'activityPage');
    $form = $report = "";
    $fromDate = '1990-01-01';
    $toDate = date('Y-m-d');
    if ($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        $fromDate= (!isset($_POST['fromDate']))? $fromDate: (validateDate($_POST['fromDate']))? $_POST['fromDate']: $fromDate;
        $toDate= (!isset($_POST['toDate']))? $toDate: (validateDate($_POST['toDate']))? $_POST['toDate']: $toDate;
        if (strtotime($fromDate) > strtotime($toDate))
        {
            $report = "<strong>ERROR: Please pick a 'To:' date that is after the 'From:' date.</strong>\n";
        }
        else
        {
            $report = getActivity($fromDate, $toDate);
        }

    }
    echo 'WHERE AM I?';
    $form = file_get_contents('../html/activitylog.html');
    $form = format($form, array('max'=>date('Y-m-d'), 'action'=>$_SERVER['PHP_SELF'], 'fromVal'=>$fromDate, 'toVal'=>$toDate));
    echo $form, $report;
    pageFooter();



    function getActivity($fromDate, $toDate) 
    {
        $report = file_get_contents('../html/activityReport.html');
        $sql = 'SELECT count(*) as visits, `phlebotomist$name` as phleb, max(visit.visitDate) as latest, min(visit.visitDate) as earliest '.
                'FROM visit, performs '.
                'WHERE performs.`visit$id` = visit.id '.
                'AND visit.id IN (SELECT v.id '.
                        'FROM visit v '.
                        'WHERE v.visitDate < DATE "{toDate}" '.
                        'AND v.visitDATE > DATE "{fromDate}") '.
                'GROUP BY `phleb` '.
                'ORDER BY visits '.
                'LIMIT 20 ';
        $sql = format($sql, array('toDate'=>$toDate, 'fromDate'=>$fromDate));

        $pdo = pdo_construct();

        $result = pdo_query($pdo, $sql);

        $result->fetch();
        $rows = "";
        $template = "\t\t\t\t\t<tr><td>{visits}</td><td>{phleb}</td><td>{latest}</td><td>{earliest}</td></tr>\n";
        while ($row = $result->fetch())
        {
            $row['latest'] = date_format(date_create($row['latest']), 'Y-m-d');
            $row['earliest'] = date_format(date_create($row['earliest']), 'Y-m-d');
            $rows = $rows . format($template, $row);
        }
        return format($report, array('rows'=>$rows));
    }
?>