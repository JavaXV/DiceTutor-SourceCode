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

  $city   = $_POST['city'];
  $email     = $_POST['email'];
  $price     = $_POST['price'];
  
	$sql = "INSERT INTO `serviceadd` ( `tutorname`, `city`, `phoneno`, `tutoremail`, `state`, `address`, `serviceoption`, `price`, `subject`, `gender`, `image`, `requestaccept`,`radNo`,`classoption`,`code`,`lastname`,`birth`,`tutorstate`,`course`,`qualification`,`school`,`reference` ,`code1`,`reference1`,`contract`,`residentstate` ) VALUES ('" . $fullname . "', '" . $vicinity . "', '" . $number1 . "', '" . $email . "', '" . $state. "', '" . $address . "', '" . $serviceoption. "', '" . $price . "', '" . $subject . "', '" . $gender . "', '" . $image . "', '" . $request . "', '" . $verifyNos . "', '" . $class . "', '" . $code . "', '" . $lastname . "', '" . $birth . "', '" . $tutorstate . "', '" . $course . "', '" . $qualification . "', '" . $school . "','" . $verifyNo . "','" . $code . "','" . $subject . "','" . $contract . "','" . $state . "')"; 
		 if ($conn->query($sql) === TRUE) {		
		  echo json_encode('Success'); 
	} else {
	      echo json_encode('Error'); 
	}
		     
mysqli_close($conn);
?>