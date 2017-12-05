<?php
    require_once ("../../dbconfig.php");
    error_reporting(0);
    function format($msg, $vars)
    {
        $vars = (array)$vars;

        $msg = preg_replace_callback('#\{\}#', function($r){
            static $i = 0;
            return '{'.($i++).'}';
        }, $msg);

        return str_replace(
            array_map(function($k) {
                return '{'.$k.'}';
            }, array_keys($vars)),

            array_values($vars),

            $msg
        );
    }

    function pageHeader($pageTitle, $bodyId)
    {
        $headString = file_get_contents("../html/header.html");
        $vars = array('title'=> $pageTitle, 'bodyId'=>$bodyId);

        echo (format($headString, $vars));

    }

    function pageFooter()
    {
        $footerString = file_get_contents('../html/footer.html');
        echo $footerString;
    }

    function validateDate($date, $format = 'Y-m-d')
    {
        $d = strtotime($date);
        return ($date == date($format,$d));
    }
    /* Sanitizes the input fields of unwanted data and does HTML conversion of special characters*/
    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);

        return $data;
    }    
    /* Creates a new PDO object, sets the error reporting, and returns it.
    */
    function pdo_construct() {
        $pdo = new PDO(DB_CONNECTION_STRING, DB_USER, DB_PWD);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    }

    /* Takes the two parameters, a valid PDO object and a valid query string, and returns 
    *  an associative result array of the query.
    */
    function pdo_query($pdo, $query_string) {
        $result = $pdo->query($query_string);
        return $result;
    }

    /* Takes the two parameters, a valid PDO object and a valid executable query string 
    *  (i.e. of type INSERT, UPDATE, DELETE, etc.), executes it, and returns the rows affected.
    */
    function pdo_exec($pdo,$query_string) {
        return $pdo->exec($query_string);
    }

    /* Takes the three parameters, a valid PDO object, a valid executable query with bindings, and 
    *  an associative array of binding placeholders and values, then returns a number of records updated.
    */
    function pdo_exec_statement($pdo, $query_string, $binding_vals) {
        $statement = $pdo->prepare($query_string);
        foreach ($binding_vals as $key => $val) {
            $statement->bindValue($key, $val);
        }
        return $statement->execute();
    }

?>