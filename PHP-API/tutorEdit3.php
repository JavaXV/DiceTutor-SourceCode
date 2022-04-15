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

  $school   = $_POST['school'];
  $email     = $_POST['email'];
  $degree     = $_POST['degree'];
  $course     = $_POST['course'];
  
	$sqlx = "UPDATE editprofile SET course= '".$course."',degree= '".$degree."',school= '".$school."' WHERE email='".$email."'";
	if ($conn->query($sqlx) === TRUE) {
	   echo json_encode('Success'); 
	} else {
	   //echo "Error updating record: " . $conn->error;
	   echo json_encode('Error'); 
	}
		     
mysqli_close($conn);
?>