<?php

include ('function.php');

if(isset($_POST['insuranceName']))
{
    update($_POST['insuranceName'], $_POST['newInsuranceName']);
}
else if(isset($_POST['startDate']))
{
    delete($_POST['startDate']);
}
else
{
    echo "nothing was set";
}

function update($insuranceName, $newInsuranceName)
{
    $pdo = pdo_construct();
    $insuranceName = test_input($insuranceName);
    $newInsuranceName = test_input($newInsuranceName);
    $sql = "UPDATE insuranceCompany SET name = '$newInsuranceName' WHERE name = '$insuranceName'";

    $result = pdo_exec($pdo, $sql);

    if($result < 1)
    {
        echo "0 items updated! Make sure you entered a valid Insurance Name!";
    }
    else
    {
        echo $result . " item(s) updated and changes were cascaded.";
    }
    
    $pdo = null;
}

function delete($startDate)
{
    $pdo = pdo_construct();
    $startDate = test_input($startDate);
    $sql = "DELETE FROM invoice WHERE message = 'waived' AND billedDate < '$startDate'";

    $result = pdo_exec($pdo, $sql);
    echo $startDate;
    echo $result . " item(s) deleted.";
    $pdo = null;
}


?>
