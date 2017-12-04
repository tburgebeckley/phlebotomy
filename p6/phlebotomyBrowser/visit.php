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
    } else if ($_SERVER['REQUEST_METHOD'] == 'POST') 
    {
        var_dump($_POST);
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