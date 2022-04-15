<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\User;
use App\TeacherRegister;
use DB;
//use App\Mail;
use Mail;


class UserController extends Controller
{
    function register(Request $request){
  
      $firstname   = $request->input('firstname'); 
      $lastname    = $request->input('lastname'); 
      $email       = $request->input('email'); 
      $password    = $request->input('password'); 
      $cpassword   = $request->input('cpassword'); 
      $verifyNo    = (rand(1,100000)); 
      $verifyNo1   = (rand(1,9)); 
      $verifyNo2   = (rand(1,9)); 
      $verifyNo3   = (rand(1,9)); 
      $verifyNo4   = (rand(1,9)); 
       
      $sql = DB::insert("insert into teacherregister(FirstName, LastName, Email, Password, Password1, VerifyNo)value(?,?,?,?,?,?)",[$firstname,$lastname,$email,$password,$cpassword,$verifyNo]);
      if($sql){
        $EnterUser = DB::insert("insert into users(name, x, password, role, abc)value(?,?,?,?,?)",[$firstname,$email,$password,$verifyNo,$verifyNo4]);
        if($EnterUser){ 
            $sqlpassword2 = DB::insert("insert into userverify(email, password, digit, verifyNo1, verifyNo2, verifyNo3, verifyNo4)value(?,?,?,?,?,?,?)",[$email,$password,$verifyNo,$verifyNo1,$verifyNo2,$verifyNo3,$verifyNo4]);
            if($sqlpassword2){ 
                $updateprofile = DB::insert("insert into editprofile(firstname, lastname, email, code)value(?,?,?,?)",[$firstname,$lastname,$email,$verifyNo]);
                if($updateprofile){     //---------------sendMail-----------------

                    $to_name = 'Devosta Solution';
                    $to_email = $request->input('email');
                    $data = array('name'=>'Dicetutors', 'body' => $verifyNo, 'body3' => $verifyNo1,'body4' => $verifyNo2,'body5' => $verifyNo3,'body6' => $verifyNo4,'body1' => $firstname, 'body2' => $lastname);
                    Mail::send('email.invitation-email', $data, function($message) use ($to_name, $to_email) {
                    $message->to($to_email, $to_name)
                    ->subject('Account Verification');
                    $message->from('tdevosta@gmail.com','Dicetutor');
                   
                    });
                    return response()->json([
                        'Success'=>true,
                    ]);
                  
                }else{}
                //-------------endMail--------------------
            }else{
                return response()->json([
                    'Success'=>false,
                 ]);
            }    
        }else{}      
      }else{echo"Error";}
    }
    function login(Request $request){

        $username       = $request->input('username'); 
        $password       = $request->input('password'); 

        $login = DB::select("select * from users WHERE email = ? AND password = ? ", [$username, $password]);
        if($login){
            return response()->json([
                'Success'=>true,
            ]);
        }else{
            return response()->json([
                'Success'=>false,
            ]);
        }
    }
    function fetchdata(Request $request){
        $email       = $request->input('email'); 

        $fetch = DB::select("select * from teacherregister WHERE Email = ? ", [$email]);
        if($fetch){

            foreach ($fetch as $item) {
                echo json_encode($item->FirstName);
                echo json_encode($item->LastName);
            }
        }
           
    }
	function emailverify(Request $request){
		$digitvalue       = $request->input('digitvalue'); 

		$verify = DB::select("select id, email, verifyNo4 from userverify WHERE verifyNo4 = ? ", [$digitvalue]);
            if($verify){ 
             
            foreach ($verify as $itemadd) {
                // echo json_encode($itemadd->abc);
                
                 $xmail = ($itemadd->email);
                 $xvalue = ($itemadd->verifyNo4);
 
                 if($xvalue == $digitvalue){
                 $tutorupdate = DB::update("update users set email = '$xmail' WHERE abc = ? ", [$xvalue]);
                 if($tutorupdate){
                    return response()->json([
                        'Success'=>true,
                    ]);
                 }else{
                    return response()->json([
                        'Success'=>false,
                    ]);
                   }                  
                 }else{ 
                    
               }
             }
        }else{
             return response()->json([
            'Error'=>false,
            ]);
         }
         
     	
	}
    function updateprofile(Request $request){
        $email       = $request->input('email');
        $address       = $request->input('address'); 
        $birth       = $request->input('birth');
        $state       = $request->input('state');

        $tutorprofile = DB::update("update editprofile set email = '$email',address = '$address',dob_day = '$birth',state = '$state' WHERE email = ? ", [$email]);
        if($tutorprofile){

            return response()->json([
                'Success'=>true,
            ]);

        }else{
             return response()->json([
            'Success'=>false,
        ]);}
    }
    function updateprofileacademic(Request $request){
        $email       = $request->input('email');
        $address       = $request->input('address'); 
        $birth       = $request->input('birth');
        $state       = $request->input('state');

        $tutorprofile = DB::update("update editprofile set email = '$email',address = '$address',dob_day = '$birth',state = '$state' WHERE email = ? ", [$email]);
        if($tutorprofile){

            return response()->json([
                'Success'=>true,
            ]);

        }else{
             return response()->json([
            'Success'=>false,
        ]);}
    }
    function guarantor(Request $request){

        $gemail       = $request->input('gemail');
        $phoneno       = $request->input('phoneno'); 
        $grelationship       = $request->input('grelationship');
        

        $updateguarantor= DB::insert("insert into  guarantor (gemail, phoneno, grelationship)value(?,?,?)",[$gemail,$phoneno,$grelationship]);
        if($updateguarantor){     //---------------sendMail-----------------

        
            $to_name = 'Devosta Solution';
            $to_email = $request->input('gemail');
            $data = array('name'=>'Dicetutors', 'body' => $gemail, 'body1' => $phoneno);
            Mail::send('email.guarantor-email', $data, function($message) use ($to_name, $to_email) {
            $message->to($to_email, $to_name)
            ->subject('Guarantor Form');
            $message->from('tdevosta@gmail.com','Dicetutor');
           
            });
            return response()->json([
                'Success'=>true,
            ]);
            
        }else{}
    }
}
