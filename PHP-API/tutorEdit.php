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

  $number1   = $_POST['number1'];
  $dob_day   = $_POST['dob_day'];
  $email     = $_POST['email'];

	$sqlx = "UPDATE editprofile  SET number1= '".$number1."',dob_day= '".$dob_day."' WHERE email='".$email."'";
	if ($conn->query($sqlx) === TRUE) {
	   echo json_encode('Success'); 
	} else {
	   //echo "Error updating record: " . $conn->error;
	   echo json_encode('Error'); 
	}
		     
mysqli_close($conn);
?>