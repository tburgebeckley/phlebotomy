<?php
    require_once('function.php');
    pageHeader('Phlebotomy Database', 'indexPage');

    $page = file_get_contents('../html/home.html');
    echo $page;
    pageFooter();
?>