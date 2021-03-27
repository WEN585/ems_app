<?php
include_once("dbconnect.php");
$email = $_POST['email'];
$password = sha1($_POST['password']);

$sql = "SELECT * FROM USER WHERE EMAIL = '$email'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $sqlupdate = "UPDATE USER SET PASSWORD = '$password' WHERE EMAIL = '$email'";
    if ($conn->query($sqlupdate) === TRUE){
            echo 'success';
    }else{
        echo 'failed';
    }
} else {
    echo "failed";
}
// "UPDATE USER SET OTP = '0' WHERE EMAIL = '$email' AND OTP = '$otp'"
?>