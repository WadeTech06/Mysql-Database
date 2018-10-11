<!DOCTYPE html>
<html>
<head>
 <title>Search results</title>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<?php

 if (isset($_POST['name'])){
 $query = $_POST['name'];
 echo

 $sql = mysqli_query($con, "SELECT * FROM employee
WHERE (`LName` LIKE '%".$query."%')") or die(mysqli_error($con));
 if (mysqli_num_rows($sql) > 0) {
// if one or more rows are returned do following
 echo 'Fname Lname Sex DNo </br>';
 while ($row = mysqli_fetch_array($sql, MYSQL_ASSOC)) {

echo $row['FName']. " " .$row['LName']." " .$row['Sex'] . " " .$row['DNo'] ."</br>";
 }

 }
 else{ // if there is no matching rows do following
 echo "No results";
 }
 }
 else{
 echo 'Enter search conditions';
 } 

?>
</body>
</html> 