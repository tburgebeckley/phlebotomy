<?php

include ('function.php');


pageHeader('Modify Tables', 'modifyPage');
$form = file_get_contents('../html/modify.html');

if ($_SERVER['REQUEST_METHOD'] == 'GET')
{
    $insurance = insurance();
    $page = format($form, array('path'=>$_SERVER['PHP_SELF'], 'insurance'=>$insurance));
    echo $page;
}
else if(isset($_POST['insuranceName']))
{
    update($_POST['insuranceName'], $_POST['newInsuranceName']);
    echo "<p><a href='index.php'>Home</a></p>";
}
else if(isset($_POST['startDate']))
{
    delete($_POST['startDate']);
    echo "<p><a href='index.php'>Home</a></p>";
}

else 
{
    echo "nothing was set\n";
}

pageFooter();

function update($insuranceName, $newInsuranceName)
{
    $pdo = pdo_construct();
    $insuranceName = test_input($insuranceName);
    $newInsuranceName = test_input($newInsuranceName);
    $sql = "UPDATE insuranceCompany SET name = '$newInsuranceName' WHERE name = '$insuranceName'";
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->rowCount();

    if($result < 1)
    {
        echo "0 items updated! Make sure you did not enter the same Insurance Name.";
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
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->rowCount();
    echo $result . " item(s) deleted.";
    $pdo = null;
}

function insurance()
{
    $pdo = pdo_construct();

    $sql = "SELECT name FROM insuranceCompany ORDER BY name";
    $result = pdo_query($pdo, $sql);
    $options = "";
    while ($row = $result->fetch(PDO::FETCH_ASSOC))
    {
        $temp = "\t\t\t\t\t<option value='{}'>{}</option>\n";
        $options = $options . format($temp, array($row['name'], $row['name']));
    }

    return $options;
}

?>
