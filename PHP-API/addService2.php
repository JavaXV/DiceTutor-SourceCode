
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
				$city                = $_POST['city'];
                $email               = $_POST['email'];
                $serviceoption       =  ($_POST['serviceoption']);
				$dates               = $_POST['dates'];
				
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
					  
			    $sqls = ("SELECT * FROM serviceadd WHERE code LIKE '$email%'");
				$resultt = mysqli_query($conn, $sqls);
				
				if (mysqli_num_rows($resultt) > 0) {
				  // output data of each row
				  while($row = mysqli_fetch_assoc($resultt)) {
					  
					  $subjectt = $row['subject'];
					  
			    $que1=mysqli_query($conn,"SELECT * FROM `serviceadd` WHERE code = '$email' AND subject = '$subjectt'");
				$count1=mysqli_num_rows($que1);
			
				if($count1>0)
				 {
				 
           $sql = "UPDATE `dicetutor`.`serviceadd` SET `serviceoption` = '$serviceoption', `city` = '$city' WHERE `serviceadd`.`code` = '$email' AND subject = '$subjectt'";
						if ($conn->query($sql) === TRUE) {
							  echo json_encode('Success'); 
						} else {
							echo "Error: " . $sql . "<br>" . $conn->error;
						}
				 }else
					 {
					    
						  
						  
				$city                = $_POST['city'];
                $email               = $_POST['email'];
                $serviceoption       =  ($_POST['serviceoption']);
				$dates               = $_POST['dates'];
								  
						  
						  $sql = ("SELECT * FROM editprofile WHERE code LIKE '$email%'");
						  $result = mysqli_query($conn, $sql);
						
					
						 if (mysqli_num_rows($result) > 0) {
							 // output data of each row
							 while($row = mysqli_fetch_assoc($result)) {		
								   
								   $vicinity = $row['vicinity'];

								   
		$ $sql = "UPDATE `dicetutor`.`serviceadd` SET `serviceoption` = '$serviceoption', `city` = '$city', `dates` = '$dates' WHERE `serviceadd`.`code` = '$email' AND subject = '$subjectt'";
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
				  
				   }
					 } else {
						 echo "0 results";
					 }
				  
					  
				  }else{ echo json_encode('Error'); ;}

				  }
				} else {
				  echo "0 results";
				}
					 $conn->close();

?>






 