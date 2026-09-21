<?php
$servername = "localhost";
$database = "horariosgauss";
$username = "root";
$password = "";
// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);
// Check connection
if (!$conn) {
      die("Connection failed: " . mysqli_connect_error());
}
 
echo "Connected successfully";
 
$sql = "INSERT INTO profesores (nombreprof, apaternoprof, amaternoprof, domicilioprof, telefonoprof, mailprof) VALUES ('.$_POST[nombreprof]', '.$_POST[apaternoprof]', '.$_POST[amaternoprof]', '.$_POST[domicilioprof]', '.$_POST[telefonoprof]', '.$_POST[mailprof]')";
if (mysqli_query($conn, $sql)) {
      echo "New record created successfully";
      header("location:../formulariosreg/profesores.php"); 
} else {
      echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
mysqli_close($conn);
?>