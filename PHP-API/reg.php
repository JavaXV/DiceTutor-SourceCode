<?php 
$response = array();
if($_SERVER["REQUEST_METHOD"] == "POST"){
	
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
  
  $firstname   = $_POST['firstname'];
  $lastname    = $_POST['lastname'];
  $email       = $_POST['email'];
  $verifyNo    = (rand(1,100000));
  
 if($firstname == ""|| $lastname == "" || $email == ""){
				  
                             
								 $response = "All Field are Required";
								 echo json_encode($response);
							 			 
				  
			  }else{
	
		    //-----------------------------email--------------------
			$que1=mysqli_query($conn,"SELECT * FROM `users` WHERE email = '$email'");
			$count1=mysqli_num_rows($que1);
		
			if($count1>0)
			{
           $response["error"] = true;
           $response["message"] = "Account Already Exist";
	       echo json_encode($response);
        	   
				 	}else{ 
					$sql = "INSERT INTO teacherregister(FirstName, LastName, Email, VerifyNo) VALUES ('" . $firstname . "','" . $lastname . "', '" . $email . "', '" . $verifyNo . "')";
                    if (mysqli_query($conn, $sql)) {
						$sqlpassword = "INSERT INTO users (name, x, role) VALUES ('" . $firstname . "', '" . $email . "', '" . $verifyNo . "') ";
			                 if ($conn->query($sqlpassword) === TRUE) 
				                {
									$response["error"] = false;
								    $response["message"] = "Data-Recieved";
								    echo json_encode($response);
								}else{
									$response["error"] = true;
								    $response["message"] = "Data Not-Recieved";
								    echo json_encode($response);
							      }	  
						   } else{}  
						}

}
					 	   
}else{}

?>