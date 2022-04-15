<?php
$response = array();
if($_SERVER['REQUEST_METHOD'] == 'POST'){
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
  $password    = $_POST['passwords'];
  $cpassword   = $_POST['cpassword'];

   
		      //-------------------update USER---------------------
			  if($password == ""|| $cpassword == ""){
				  
                              $response = "All field are required";
							  echo json_encode($response);				 
				  
			  }else{	  
							include 'mail.php';
				  			$sqlxx = "UPDATE users SET password= '".$cpassword."' WHERE x='".$email."'";
							if ($conn->query($sqlxx) === TRUE) {
							 // echo json_encode('Success'); 
							} else {
							 // echo json_encode('Error'); 
							}	
							 //-------------------update USERVERIFY---------------------
							$sqlx = "UPDATE userverify SET password= '".$cpassword."' WHERE email='".$email."'";
							if ($conn->query($sqlx) === TRUE) {
							 // echo json_encode('Success'); 
							} else {
							 // echo json_encode('Error'); 
							}
							 //-------------------update USERVERIFY---------------------
							$sqlxy = "UPDATE teacherregister SET Password= '".$cpassword."',Password1= '".$cpassword."' WHERE Email='".$email."'";
							if ($conn->query($sqlxy) === TRUE) {
							 
							            $response['message'] = "Inserted Successfully";
							            echo json_encode($response);				 
						  
						      } else{
					 		  
							            $response['message'] = "Fail Successfully";
							            echo json_encode($response);
								  
						}
						
						
			  }
		
}else{
    $response['error'] = true;
    $response['message'] = "InValid Request";
}
		     
?>