<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dicetutor";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
header("Access-Control-Allow-Origin: *");
// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

//$digitvalue = $_POST['digitvalue'];
//$digitvalue = "39125";

$queryResult =$conn->query("SELECT *FROM userverify");
$result = array();

  // output data of each row
  while($fetchData = $queryResult->fetch_assoc()) {  
   $result[] = $fetchData;     
  }
	echo json_encode($result); 
		
mysqli_close($conn);
?>