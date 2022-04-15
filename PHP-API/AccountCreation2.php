<?php

$db = mysqli_connect('localhost','root','','dicetutor');
header("Access-Control-Allow-Origin: *");
if(!$db){
   echo "Database Fail to Connect";
}
  $username = $_POST['username'];
  $password = $_POST['password'];
  
  $sql = "SELECT * FROM users WHERE email2='".$username."' AND password='".$password."'";
  $result = mysqli_query($db,$sql);
  $count = mysqli_num_rows($result);
  
  if($count == 1)
  {
   echo json_encode("Success");
  }else{
   echo json_encode("Error");
  }
?>
