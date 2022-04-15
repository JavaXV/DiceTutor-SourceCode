CREATE TABLE EditProfile(
        id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        name varchar(120)  NULL,
	email varchar(120)  NULL,
	gender varchar(120)  NULL,
	dob_month varchar(120)  NULL,
	dob_day varchar(120)  NULL,
	dob_year varchar(120) NULL,
	number1 varchar(120)  NULL,
	number2 varchar(120)  NULL,
	address varchar(120)  NULL,
	vicinity varchar(120)  NULL,
	state varchar(120)  NULL,
	description varchar(120)  NULL,
	school varchar(120)  NULL,
	course varchar(120)  NULL,
        degree varchar(120)  NULL,
        school1 varchar(120)  NULL,
	course1 varchar(120)  NULL,
        degree1 varchar(120)  NULL,
	workexperience varchar(120) NULL,
        role varchar(120) NULL, 
        workexperience_current_work varchar(120) NULL,
        teaching varchar(120) NULL,
        classes varchar(120) NULL,
        curriculum_used varchar(120) NULL,
        curriculum_explanation varchar(120) NULL,
        tutor_description varchar(420) NULL,
        tutor_code varchar(120) NULL,
        
        nin varchar(120)  NULL,
        idcard varchar(120)  NULL,
        image1 varchar(120)  NULL,
	image2 varchar(120)  NULL,
	image varchar(120) NULL

	);

CREATE TABLE Bank(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
payment_type VARCHAR(130) NULL,
account_id VARCHAR(130) NULL,
account_name VARCHAR(130) NULL,
bank VARCHAR(130) NULL,
salary VARCHAR(130) NULL,
price VARCHAR(130) NULL,
percentage VARCHAR(130) NULL,
deliveredservice VARCHAR(130) NULL,
confimedservice VARCHAR(130) NULL
);

CREATE TABLE ValidCard(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(130) NULL,
image1 VARCHAR(130) NULL,
image2 VARCHAR(130) NULL,
image3 VARCHAR(130) NULL,
nin VARCHAR(130) NULL,
email VARCHAR(130) NULL,
headquater VARCHAR(130) NULL,
category VARCHAR(130) NULL,
year VARCHAR(130) NULL,
cac VARCHAR(130) NULL,
branch VARCHAR(130) NULL,
designation VARCHAR(130) NULL,
phone VARCHAR(130) NULL,
idcard VARCHAR(130) NULL
);

CREATE TABLE Transaction(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(130) NULL,
amount VARCHAR(130) NULL,
email VARCHAR(130) NULL,
status VARCHAR(130) NULL,
datepaid VARCHAR(130) NULL,
reference VARCHAR(130) NULL
);

CREATE TABLE serviceadd(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(130) NULL,
city VARCHAR(130) NULL,
serviceoption VARCHAR(130) NULL,
price VARCHAR(130) NULL,
interest VARCHAR(130) NULL,
salary VARCHAR(130) NULL,
salary1 VARCHAR(130) NULL,
monthly VARCHAR(130) NULL,
balance VARCHAR(130) NULL,
attendance VARCHAR(130) NULL,
attendancedate VARCHAR(130) NULL,
confirmattendance VARCHAR(130) NULL,
count VARCHAR(130) NULL,
reference1 VARCHAR(130) NULL,
reference VARCHAR(130) NULL,
phoneno VARCHAR(130) NULL,
clientname VARCHAR(130) NULL,
clientaddress VARCHAR(130) NULL,
clientemail VARCHAR(130) NULL,
clientphoneno VARCHAR(130) NULL,
tutoremail VARCHAR(130) NULL,
requestmake VARCHAR(130) NULL,
requestaccept VARCHAR(130) NULL,
state VARCHAR(130) NULL,
subject VARCHAR(130) NULL,
address VARCHAR(130) NULL,
gender VARCHAR(130) NULL,
teachingstatus VARCHAR(130) NULL,
noofdays VARCHAR(130) NULL,
daysinweek VARCHAR(130) NULL,
dateenter VARCHAR(130) NULL,
radNo VARCHAR(130) NULL,
duration VARCHAR(130) NULL,
duration2 VARCHAR(130) NULL,
classoption VARCHAR(130) NULL,
lastname VARCHAR(130) NULL,
attendance VARCHAR(130) NULL,
code VARCHAR(130) NULL,
code1 VARCHAR(130) NULL,
image VARCHAR(130) NULL,
timing VARCHAR(130) NULL,
timing1 VARCHAR(130) NULL,
tutorstate VARCHAR(130) NULL,
birth VARCHAR(130) NULL,
course VARCHAR(130) NULL,
qualification VARCHAR(130) NULL,
no VARCHAR(130) NULL,
class VARCHAR(130) NULL,
school VARCHAR(130) NULL,
age VARCHAR(130) NULL

);
CREATE TABLE guarantor(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(130) NULL,
firstname VARCHAR(130) NULL,
lastname VARCHAR(130) NULL,
gemail VARCHAR(130) NULL,
ggender VARCHAR(130) NULL,
gaddress VARCHAR(130) NULL,
grelationship VARCHAR(130) NULL,
phoneno VARCHAR(130) NULL,
code VARCHAR(130) NULL,
image VARCHAR(130) NULL

);

CREATE TABLE attendances(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
tutorname VARCHAR(130) NULL,
date VARCHAR(130) NULL,
noofhours VARCHAR(130) NULL,
classstarttime VARCHAR(130) NULL,
classendtime VARCHAR(130) NULL,
clientname VARCHAR(130) NULL,
attendance VARCHAR(130) NULL,
attendanceconfirmed VARCHAR(130) NULL,
timeofconfirmation VARCHAR(130) NULL,
salary VARCHAR(130) NULL,
price VARCHAR(130) NULL,
interest VARCHAR(130) NULL,
bank VARCHAR(130) NULL,
accountno VARCHAR(130) NULL,
paymentdate VARCHAR(130) NULL,
daysofclass VARCHAR(130) NULL,
tutoremail VARCHAR(130) NULL,
accountname VARCHAR(130) NULL

);

CREATE TABLE attendanceDaily(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
tutorname VARCHAR(130) NULL,
attendance VARCHAR(130) NULL,
date VARCHAR(130) NULL,
confirmed VARCHAR(130) NULL

);

CREATE TABLE payment(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
accountname VARCHAR(130) NULL,
accountno VARCHAR(130) NULL,
bank VARCHAR(130) NULL,
salary VARCHAR(130) NULL,
date VARCHAR(130) NULL

);

CREATE TABLE payment1(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
accountname VARCHAR(130) NULL,
accountno VARCHAR(130) NULL,
bank VARCHAR(130) NULL,
salary VARCHAR(130) NULL,
date VARCHAR(130) NULL

);

CREATE TABLE guarantorlink(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(130) NULL,
lastname VARCHAR(130) NULL,
gemail VARCHAR(130) NULL,
ggender VARCHAR(130) NULL,
gaddress VARCHAR(130) NULL,
grelationship VARCHAR(130) NULL,
phoneno VARCHAR(130) NULL,
code VARCHAR(130) NULL,
status VARCHAR(130) NULL,
image VARCHAR(130) NULL

);

CREATE TABLE attendanceview(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
tutorname VARCHAR(130) NULL,
attendancestatus VARCHAR(130) NULL,
date VARCHAR(130) NULL,
lessonstarttime VARCHAR(130) NULL,
clientname VARCHAR(130) NULL,
radNo VARCHAR(130) NULL,
code VARCHAR(130) NULL,
monthyear VARCHAR(130) NULL

);

CREATE TABLE userverify(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(130) NULL,
password VARCHAR(130) NULL,
verifyNo1 VARCHAR(130) NULL,
verifyNo2 VARCHAR(130) NULL,
verifyNo3 VARCHAR(130) NULL,
verifyNo4 VARCHAR(130) NULL,
digit VARCHAR(130) NULL
);

CREATE TABLE users(
id INT(111) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(130) NULL,
name1 VARCHAR(130) NULL,
name2 VARCHAR(130) NULL,
email VARCHAR(130) NULL,
x VARCHAR(130) NULL,
email1 VARCHAR(130) NULL,
y VARCHAR(130) NULL,
email2 VARCHAR(130) NULL,
z VARCHAR(130) NULL,
password VARCHAR(130) NULL,
abc VARCHAR(130) NULL,
role VARCHAR(130) NULL
);
//---------------------------------------------------------------------------
 var url = 'http://169.254.80.80/dicetutormobile/digitverify.php';
      var response = await http.post(Uri.parse(url), body: {
        "digitvalue": digitvalue.text,
      });

      var data = json.decode(response.body);
      if (data == "Success") {
        debugPrint(data);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const confirmedmessage()),
        );
      } else if (data == "Error") {
        debugPrint(data);
        Fluttertoast.showToast(
            msg: "Please your 4 digitNo is Incorrect ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {}
//--------------------------------------------------------------------

		         	   <?php
				     $radNo = "";
					 $reference = "";
						
					$servername = "localhost";
					$username = "root";
					$password = "";
					$dbname = "dicetutor";
					
					// Create connection
					$conn = mysqli_connect($servername, $username, $password, $dbname);
					// Check connection
					if (!$conn) {
					  die("Connection failed: " . mysqli_connect_error());
					}
					  if(isset($_SESSION['email']))
		              {
					    
		                //echo $_SESSION['email'];
						$tutorid  = $_SESSION['email'];
					
		   
					$sql = "SELECT id, radNo, reference, email FROM transaction WHERE email = '$tutorid' ";
					$result = mysqli_query($conn, $sql);
					
					if (mysqli_num_rows($result) > 0) {
					  // output data of each row
					  while($row = mysqli_fetch_assoc($result)) {
						// echo "id: " . $row["id"]. " - Name: " . $row["FirstName"]. " " . $row["LastName"]. "<br>";
						   // $id                   =$row['id'];
							$reference            = $row["reference"];
							$radNo                = $row["radNo"];
							$email                = $row["email"];
						
					  }
					} else {
					 // echo "0 results";
					}
					}
				
					mysqli_close($conn);
				
            ?>

		   
<?php
			         $radNo = "";
					 $monthly = "";
					 $radNo = "";
					 $reference = "";
					 $salary = "";
					 $salary1 = "";
					 $email = "";
					 $radNo = "";
					 $clientemail = "";
					 $clientname  = "";				
					$servername = "localhost";
					$username = "root";
					$password = "";
					$dbname = "dicetutor";
					
					// Create connection
					$conn = mysqli_connect($servername, $username, $password, $dbname);
					// Check connection
					if (!$conn) {
					  die("Connection failed: " . mysqli_connect_error());
					}
					  if(isset($_POST['search']))
		              {
		                //echo $_SESSION['email'];
						$id = $_POST['q'];
		   
					$sql = "SELECT id, radNo, salary, salary1, monthly, clientemail, clientname, reference FROM serviceadd WHERE id = '$id' ";
					$result = mysqli_query($conn, $sql);
					
					if (mysqli_num_rows($result) > 0) {
					  // output data of each row
					  while($row = mysqli_fetch_assoc($result)) {
						// echo "id: " . $row["id"]. " - Name: " . $row["FirstName"]. " " . $row["LastName"]. "<br>";
						    $id                 =$row['id'];
							$monthly            = $row["monthly"];
							$salary             = $row["salary"];
							$reference             = $row["reference"];
							$salary1             = $row["salary1"];
							$radNo              = $row["radNo"];
							$email              = $row["clientemail"];
						    $clientname         = $row["clientname"];
					  }
					} else {
					  echo "0 results";
					}
					}
					mysqli_close($conn);
				
            ?>



23 Olorufumi Street Papa Off Police Station Olusosun Oregun Ikeja
/**
<!--------
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

if (isset($_POST['x']))
   {   
		
			$name =$_POST['name'];
			$currentdate = date("l jS \of F Y h:i:s A")
			$noofhours =$_POST['hours'];
		    $startenddate =$_POST['startenddate'];
			$clientname =$_POST['clientname'];
			$days =$_POST['days'];
			$enddate =$_POST['enddate'];
			
			
		    $conn = mysqli_connect("localhost", "root", "");
			if (!$conn) { die('Could not connect: ' . mysqli_error()); }
			$db = mysqli_select_db($conn, "dicetutor");
			$query=("UPDATE serviceadd SET tutorname='".$name."',date='".$currentdate."',requestaccept='".$accept."',classstarttime='".$startenddate."',clientname='".$clientname."',daysofclass='".$days."', paymentdate='".$enddate."'   WHERE tutuorname='".$name."' ");
			$result = mysqli_query($conn,$query);
			  if($result)
				  {
					header("Location: confirm3Message.php");
				  }
				  else
				  {
					header("Location: uploadphoto.php");
				  }
		        	mysqli_close($con);
	
	}

?>
**/

INSERT INTO `attendances` (`id`, `attendancestatus`, `count`, `radNo`, `tutorname`, `confirmservice`, `attendancedate`, `code`, `timing`, `timing1`, `phoneno`, `tutoremail`, `interest`, `salary1`, `salary2`, `clientname`, `clientemail`, `price`, `bank`, `accountno`, `accountname`) VALUES (NULL, '', '', 'm', 'm', '', NULL, 'm', 'm', 'm', 'm', 'm', NULL, NULL, NULL, 'm', 'm', 'm', NULL, NULL, NULL);
