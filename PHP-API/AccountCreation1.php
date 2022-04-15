<?php
$response = array();
if($_SERVER['REQUEST_METHOD'] == 'POST'){
$db = mysqli_connect('localhost','root','','dicetutor');
//header("Access-Control-Allow-Origin: *");
if(!$db){
   echo "Database Fail to Connect";
}
  $email = $_POST['email'];
  $password = $_POST['passwords'];
  
  if($password == "" || $email == ""){
				  
                                 $response["error"] = true;
								 $response = "All Field are Required";
								 echo json_encode($response);
							 			 
				  
			  }else{
  $sql = "SELECT * FROM users WHERE email='".$email."' AND password='".$password."'";
  $result = mysqli_query($db,$sql);
  $count = mysqli_num_rows($result);
  
  if($count == 1)
  {
	$response["error"] = false;
	$response["message"] = "Login Successfully";
	echo json_encode($response);
	}else{
	$response["error"] = true;
	$response["message"] = "Incorrect Email and Password";
	echo json_encode($response);
  }
			  }
}else{}
?>
