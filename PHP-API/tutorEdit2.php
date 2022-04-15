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

  $vicinity   = $_POST['vicinity'];
  $email     = $_POST['email'];
  $address     = $_POST['address'];
  
	$sqlx = "UPDATE editprofile SET vicinity= '".$vicinity."',address= '".$address."' WHERE email='".$email."'";
	if ($conn->query($sqlx) === TRUE) {
	   echo json_encode('Success'); 
	} else {
	   //echo "Error updating record: " . $conn->error;
	   echo json_encode('Error'); 
	}
		     
mysqli_close($conn);
?>