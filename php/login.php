<?php
error_reporting(0);
include_once("dbconnect.php");
$email = $_POST['email'];
$password = sha1($_POST['password']);

$sqllogin = "SELECT * FROM USER WHERE EMAIL = '$email' AND PASSWORD = '$password' AND OTP = '0'";
$result = $conn->query($sqllogin);

if ($result->num_rows > 0) {
    $response["user"] = array();
    while ($row = $result ->fetch_assoc()){
        $user = array();
        $user[email] = $row["EMAIL"];
        $user[id] = $row["ID"];
        $user[phone] = $row["PHONE"];
        $user[password] = sha1($row["PASSWORD"]);
        $user[role] = $row["ROLE"];
        array_push($response["user"], $user);
    }
    echo json_encode($response);
}else{
    echo "failed";
    
}
?>