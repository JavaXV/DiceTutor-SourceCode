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

  $email       = $_POST['email'];
  $password    = $_POST['password'];
  $cpassword   = $_POST['cpassword'];

 
			
					      //-------------------update USER---------------------
							$sqlxx = "UPDATE users SET password= '".$password."' WHERE x='".$email."'";
							if ($conn->query($sqlxx) === TRUE) {
							 // echo json_encode('Success'); 
							} else {
							 // echo json_encode('Error'); 
							}	
							 //-------------------update USERVERIFY---------------------
							$sqlx = "UPDATE userverify SET password= '".$password."' WHERE email='".$email."'";
							if ($conn->query($sqlx) === TRUE) {
							 // echo json_encode('Success'); 
							} else {
							 // echo json_encode('Error'); 
							}
							 //-------------------update USERVERIFY---------------------
							$sqlxy = "UPDATE teacherregister SET Password= '".$password."',Password1= '".$cpassword."' WHERE Email='".$email."'";
							if ($conn->query($sqlxy) === TRUE) {
							    echo json_encode('Success'); 
							} else {
							 // echo json_encode('Error'); 
							}
					 
mysqli_close($conn);
?>
