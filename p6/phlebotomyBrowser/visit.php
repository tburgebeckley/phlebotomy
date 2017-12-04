<?php
    require_once('function.php');
    if ($_SERVER['REQUEST_METHOD'] == 'GET')
    {
        $form = file_get_contents('../visit.html');

        $patients = ['Adrian', 'Lala'];
        pageHeader('Log New Visit', 'visit');

        pageFooter();
    }








    function patients()
    {
        $pdo = pdo_construct();
        $query = 'SELECT `name` FROM patient';
        $options = "";

        $result = pdo_query($pdo,$query);

        foreach ($result->fetch() as $row)
        {
            $temp = "\t\t\t";
        }
    }