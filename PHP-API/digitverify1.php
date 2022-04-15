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
$pal = "67433";

$sql = "SELECT id, y, role FROM users WHERE role ='".$digitvalue."'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  // output data of each row
  while($row = mysqli_fetch_assoc($result)) {
	  
   $digit = $row["role"]; 
   $email = $row["y"];
   
		   if($digit  == $digitvalue)
		   {
				$sqlx = "UPDATE users SET email1= '".$email."' WHERE role='".$digitvalue."'";
				if ($conn->query($sqlx) === TRUE) {
				 // echo "Record updated successfully";
				  echo json_encode('Success'); 
				} else {
				  echo "Error updating record: " . $conn->error;
				  echo json_encode('Error'); 
				}
		   }  
	   // echo json_encode('Success'); 
	   //echo json_encode($email);    
    }
} else {
	  echo json_encode('Error'); 
			
}

mysqli_close($conn);
?>