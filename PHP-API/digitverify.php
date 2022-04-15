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

$digitvalue = $_POST['digitvalue'];

$sql = "SELECT id, x, role FROM users WHERE role ='".$digitvalue."'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  // output data of each row
  while($row = mysqli_fetch_assoc($result)) {
	  
   $digit = $row["role"]; 
   $email = $row["x"];
   
		   if($digit  == $digitvalue)
		   {
				$sqlx = "UPDATE users SET email= '".$email."' WHERE role='".$digitvalue."'";
				if ($conn->query($sqlx) === TRUE) {
					$response["error"] = false;
					$response["message"] = "Verification Successfull";
					echo json_encode($response);
				    }else{
					$response["error"] = true;
					$response["message"] = "Wrong Digit Number";
					echo json_encode($response);
				}
		   }  
    }
} else {
	  $response["error"] = true;
	  $response["message"] = "Wrong Digit Number";
	  echo json_encode($response);
}

mysqli_close($conn);
?>