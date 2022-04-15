
<!--------------------------------------------------------READ EDIT PROFILE CONDITION FOR DOUBLE INSERT NOT TO OCCOUR-----------------------------------
   
<!-- -------------------------------Add service Logic--------------------------------------------- -->
<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dicetutor";


       $conn = mysqli_connect($servername, $username, $password, $dbname);
	   $conn1 = mysqli_connect($servername, $username, $password, $dbname);
\
				$subject   = $_POST['subject'];
                $email     = $_POST['email'];
                $price     = $_POST['price'];
				
				$contract            = "active";
				$verifyNo    =  (rand(1,1000000)) . "DT";
				$verifyNos    =  (rand(1,1000000));

			
				$sql = ("SELECT * FROM editprofile WHERE code LIKE '$email%'");
				$result = mysqli_query($conn, $sql);
				
				if (mysqli_num_rows($result) > 0) {
				  // output data of each row
				  while($row = mysqli_fetch_assoc($result)) {
				  
				   $approve =$row['AdminApprove'];
				   $vicinity = $row['vicinity'];
				   $number1 = $row['number1'];
				   $email = $row['email'];
				   $state = $row['residentstate'];
				   $address = $row['address'];
				   $firstname = $row['firstname'];
				   $gender = $row['gender'];
				   $code = $row['code'];
				   $image = $row['image'];
				   $request = "Pending";
				   
				   $lastname = $row['lastname'];
				   $birth = $row['dob_day'];
				   $tutorstate = $row['state'];
				   $course = $row['course'];
				   $qualification = $row['degree'];
				   $school = $row['school'];
				   $verifyNo    =  (rand(1,1000000)) . "DT";
				   
				   
				  
				  if($approve == "Approved")
				  {
					  
				$que1=mysqli_query($conn,"SELECT * FROM `serviceadd` WHERE code = '$email' AND subject = '$subject'");
				$count1=mysqli_num_rows($que1);
			
				if($count1>0)
				 {
				 
           $sql = "UPDATE `dicetutor`.`serviceadd` SET `subject` = '$subject', `price` = '$price' WHERE `serviceadd`.`code` = '$email' AND subject = '$subject'";
						if ($conn->query($sql) === TRUE) {
							  echo json_encode('Success'); 
						} else {
							echo "Error: " . $sql . "<br>" . $conn->error;
						}
				 }else
					 {
					    
						  
						  subject    = $_POST['subject'];
						  $email     = $_POST['email'];
						  $price     = $_POST['price'];
								  
						  
						  $sql = ("SELECT * FROM editprofile WHERE code LIKE '$email%'");
						  $result = mysqli_query($conn, $sql);
						
					
						 if (mysqli_num_rows($result) > 0) {
							 // output data of each row
							 while($row = mysqli_fetch_assoc($result)) {		
								   
								   $vicinity = $row['vicinity'];
								   $number1 = $row['number1'];
								   $email = $row['email'];
								   $state = $row['residentstate'];
								   $firstname = $row['firstname'];
								   $lastname = $row['lastname'];
								   $address = $row['address'];
								   $gender = $row['gender'];
								   $image = $row['image'];
								   $code = $row['code'];
								   $request = "Pending";							   
								   $fullname = $firstname."".$lastname;
								   
								 
								   $birth = $row['dob_day'];
								   $tutorstate = $row['state'];
								   $course = $row['course'];
								   $qualification = $row['degree'];
								   $school = $row['school'];
								   $contract = "active";
											
								   
								   echo '$vicinity';
								   
		$sql = "INSERT INTO `serviceadd` ( `tutorname`, `city`, `phoneno`, `tutoremail`, `state`, `address`, `price`, `subject`, `gender`, `image`, `requestaccept`,`radNo`,`code`,`lastname`,`birth`,`tutorstate`,`course`,`qualification`,`school`,`reference` ,`code1`,`reference1`,`contract`,`residentstate` ) VALUES ('" . $fullname . "', '" . $vicinity . "', '" . $number1 . "', '" . $email . "', '" . $state. "', '" . $address . "', '" . $price . "', '" . $subject . "', '" . $gender . "', '" . $image . "', '" . $request . "', '" . $verifyNos . "', '" . $code . "', '" . $lastname . "', '" . $birth . "', '" . $tutorstate . "', '" . $course . "', '" . $qualification . "', '" . $school . "','" . $verifyNo . "','" . $code . "','" . $subject . "','" . $contract . "','" . $state . "')"; 
		 if ($conn->query($sql) === TRUE) {		
		   echo json_encode('Success');
		  
		} else {
		  echo "Error: " . $sql . "<br>" . $conn->error;
		}								   	   
							 }
						 } else {
							 echo "0 results";
						 }
					 }
					  
				  }else{header("Location:confirmXMessage.php");}

				  }
				} else {
				  echo "0 results";
				}
					 $conn->close();

?>






 