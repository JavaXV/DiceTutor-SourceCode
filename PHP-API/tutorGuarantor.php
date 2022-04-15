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
  
	$sqlx = "UPDATE editprofile SET course1= '".$course."',degree1= '".$degree."',school1= '".$school."' WHERE email='".$email."'";
	if ($conn->query($sqlx) === TRUE) {
	   echo json_encode('Success'); 
	} else {
	   //echo "Error updating record: " . $conn->error;
	   echo json_encode('Error'); 
	}
		     
mysqli_close($conn);
?>

	<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dicetutor";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
  
	$email                          =($_POST['email']);
	$gemail                         =($_POST['gemail']);
	$phoneno                        =($_POST['phoneno']);
    $grelationship                  =($_POST['grelationship']);


	$sqlx = "UPDATE guarantor SET gemail= '".$gemail."',phoneno= '".$phoneno."',grelationship= '".$grelationship."' WHERE name='".$email."'";
	if ($conn->query($sqlx) === TRUE) {
		         $subject = 'Guarantor Form';
				 $from = 'info@dicetutors.com';
					 
				// To send HTML mail, the Content-type header must be set
				$headers  = 'MIME-Version: 1.0' . "\r\n";
				$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
				 
				// Create email headers
				$headers .= 'From: '.$from ."\r\n".
					'Reply-To: '.$gemail."\r\n" .
					'X-Mailer: PHP/' . phpversion();
				 
				// Compose a simple HTML email message
				$message = '<html><body>';
				$message .= '<h1 style="color:#000066; position:absolute; text-align:center;">DICETUTORS</h1>';
				
				$message .= '<br><br>';
		     	$message .= ' <p style="color:#000066; font-size:15px; ">Welcome!  we want you to fill the form as a guarantor for' . " " . $firstname . "  " . $lastname . "</p>";
				$message .= ' <p style="color:#000066; font-size:15px; ">Guarantor PhoneNo:' . $phoneno . "</p>";
			
				$message .= '<br><br>';
				$message .= '<br>';
				$message .= '<form action="guarantorlink.php" method="POST">';
				$message .= '<center><a href="DiceTutor/guarantorlink.php"  text-align:center;><button name="submit" class="form-control" style="color:#FFFF00; background-color:#3399FF; text-align:center; height:55px; width:150px;">Procced</button></a></center>';       
				$message .= '</form>';
			    $message .= '<br><br><br>';
				$message .= '';
				$message .= '<h4 style="color:#9966FF;">Thanks!</h4>';
				$message .= '</body></html>';
				 
				// Sending email
				if(mail($gemail, $subject, $message, $headers)){
					echo json_encode('Success'); 
				} else{
					echo 'Unable to send email. Please try again.';
				}
	 
	} else {
	   //echo "Error updating record: " . $conn->error;
	   echo json_encode('Error'); 
	}
		 
$conn->close();
?>