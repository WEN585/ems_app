<?php
include_once("dbconnect.php");
$id = $_POST['id'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$password = sha1($_POST['password']);
$otp = rand(1000,9999);

$sqlregister = "INSERT INTO USER(ID,EMAIL,PHONE,PASSWORD,OTP, ROLE) VALUES('$id','$email','$phone','$password','$otp', 'worker')";

if ($conn->query($sqlregister) === TRUE){
    sendEmail($otp,$email);
    echo "success";
}else{
    echo "failed";
}

function sendEmail($otp,$email){
    $from = "noreply@EMS.com";
    $to = $email;
    $subject = "From EMS. Verify your account";
    $message = "Use the following link to verify your account :"."\n http://http://icebeary.com/EMS/verify_account.php?email=".$email."&key=".$otp;
    $headers = "From:" . $from;
    mail($email,$subject,$message, $headers);
}
?>