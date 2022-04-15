<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dicetutor";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
//header("Access-Control-Allow-Origin: *");
// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

  $email       = $_POST['email'];
  
       $sql = ("SELECT * FROM teacherregister WHERE Email LIKE '$email%'");
			        	$result = mysqli_query($conn, $sql);
				
						if (mysqli_num_rows($result) > 0) {
						  // output data of each row
						  while($row = mysqli_fetch_assoc($result)) {
							   $firstname =$row['FirstName'];
				               $lastname = $row['LastName'];
							   $verifyNo = $row['VerifyNo'];
							   
							   //-------------------SEND MAIL------------------------------------
				   
				   	 $_SESSION['email'] = $email;
						$email =  $_SESSION['email'];
						$subject = 'Account Verification';
						$from = 'info@dicetutors.com';
						
						if(isset($_SESSION['email']))
							   {
								 $email =  $_SESSION['email'];
								// echo $email;
							   }
				 
						// To send HTML mail, the Content-type header must be set
						$headers  = 'MIME-Version: 1.0' . "\r\n";
						$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
						 
						// Create email headers
						$headers .= 'From: '.$from ."\r\n".
							'Reply-To: '.$email."\r\n" .
							'X-Mailer: PHP/' . phpversion();
						 
						// Compose a simple HTML email message
						$message = '<html><body>';
						$message .= '';
						//$message .= '<h1 style="color:#000066; position:absolute; text-align:center;"><img src="images/Dice Tutuors mockup.jpg" height="120" width="130"></h1>';
					//	$message .= "<img src='about-image.jpg' height="120" width="130" alt='upload'/></body></html>";
						$img = "http://localhost/dicetutor/about-image.jpg";
						$message .= '<h1 style="color:#000066; position:absolute; text-align:center;">DICETUTORS</h1>';
						
						$message .= '<br><br>';
						$message .= 'Hello' . " " . $firstname . " " . $lastname;
						$message .= '<br>';
						$message .= 'Email : ' . " ". $email ;
						$message .= '<br>';
						$message .= ' <p>Thank you for taking the time to sign up with Dicetutors! To get things going we need to verify that this is valid email address. At dice tutors, we offer more than just a lesson but an opportunity for every student to grow and challenge themselves to becoming better.</p>';
						  
						$message .= '<br>';
						$message .= '<form action="Login.php" method="POST">';
						$message .= '<br><br>';
			
						//$message .= '<center><a href="DiceTutor/Login.php"  text-align:center;><button name="submit" class="form-control" style="color:#0000FF; text-align:center; height:55px; width:150px;">Procced To Login</button></a></center>';       
						$message .= '</form>';
						$message .= '<br>';
						$message .= 'Verification Code :' . $verifyNo ;
						$message .= '<br>';
				
						$message .= '<br><br><br>';
						$message .= '';
						$message .= '<h4 style="color:#9966FF;">Thanks for signing up with dicetutors!</h4>';
						$message .= '</body></html>';
						 
						// Sending email
						if(mail($email, $subject, $message, $headers)){} else{}
				   
				   //-------------------END SEND MAIL--------------------------------
							
					}
				} else {
				  echo "0 results";
				}
					