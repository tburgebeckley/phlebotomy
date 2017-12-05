<?php
    require_once('function.php');
    if ($_SERVER['REQUEST_METHOD'] == 'GET')
    {
        $form = file_get_contents('../html/visit.html');

        $patients = ['Adrian', 'Lala'];
        pageHeader('Log New Visit', 'visit');
        $phlebs = phlebs();
        $patients = patients();
        $page = format($form, array('path'=>$_SERVER['PHP_SELF'], 'patients'=>$patients, 'phlebotomists'=>$phlebs));
        echo ($page);
        pageFooter();
    } 
    else if ($_SERVER['REQUEST_METHOD'] == 'POST') 
    {
        $patient = $phleb = $test = $network = $date = $amt = $billDate = $msg = $miles = "";
        $patient = test_input($_POST['patient']);
        $phleb = test_input($_POST['phleb']);
        $test = test_input($_POST['test']);
        $network = test_input($_POST['network']);
        $date = test_input($_POST['date']);
        $amt = test_input($_POST['amt']);
        $billDate = test_input($_POST['billDate']);
        $msg = test_input($_POST['msg']);
        $miles = test_input($_POST['miles']);

        $pdo = pdo_construct();

        $amt = (float)amt;

        $visit_query = 'INSERT INTO visit (`network`,`visitDate`, `testType`, `patient$id`) VALUES ("{network}",DATE "{visitDate}", "{testType}",{id})';
        $idresult = pdo_query($pdo, 'SELECT `id` FROM patient WHERE `name` = "' . $patient .'"');
        $row = $idresult->fetch();
        $id = $row['id'];

        $visit_query = format($visit_query, array('network'=>$network, 'testType'=>$test, 'visitDate'=>$date, 'id'=>$id));
        
        $result = pdo_exec($pdo, $visit_query);

        $visitId = $pdo->lastInsertId();
        $phlebQuery = 'SELECT clinic FROM phlebotomist WHERE name="'.$phleb.'"';
        $performsQuery = 'INSERT INTO performs (`phlebotomist$name`,`phlebotomist$clinic`, `visit$id`) VALUES ("{name}", "{clinic}", "{visit}")';
        $invoiceQuery = 'INSERT INTO invoice (`visit$id`, billedDate, billedAmt, message, mileage) VALUES ({visit}, DATE "{date}", {amt}, "{message}", {mileage})';

        $result = pdo_query($pdo, $phlebQuery);
        $clinic = $result->fetch();
        $performsQuery = format($performsQuery , array('name'=>$phleb, 'clinic'=>$clinic['clinic'], 'visit'=>$visitId));
        $invoiceQuery = format($invoiceQuery, array('visit'=>$visitId, 'date' =>$billDate, 'amt'=>$amt, 'message'=>$msg, 'mileage'=>$miles));

        pdo_exec($pdo, $performsQuery);
        pdo_exec($pdo, $invoiceQuery);

        $body = "\t<h2>Your visit was logged!</h2>\n" .
                "\t<a href='index.php'>Home</a>\n";
        pageHeader('VisitLogged!', 'visitLogged');
        echo $body;
        pageFooter();
    }

    function patients()
    {
        $pdo = pdo_construct();
        $query = 'SELECT `name` FROM patient ORDER BY name';
        $options = "";

        $result = pdo_query($pdo,$query);
        
        while ($row = $result->fetch(PDO::FETCH_ASSOC))
        {
            $temp = "\t\t\t\t\t<option value='{}'>{}</option>\n";
            $options = $options . format($temp, array($row['name'], $row['name']));
        }

        return $options;
    }

    function phlebs() {
        $pdo = pdo_construct();
        $query = 'SELECT `name` FROM phlebotomist';
        $options = "";

        $result = pdo_query($pdo,$query);
        
        while ($row = $result->fetch(PDO::FETCH_ASSOC))
        {
            $temp = "\t\t\t\t\t<option value='{}'>{}</option>\n";
            $options = $options . format($temp, array($row['name'], $row['name']));
        }

        return $options;
    }