<?php
$servername = "localhost";
$username   = "icebeary_user";
$password   = "Wen230757";
$dbname     = "icebeary_EMS";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
}
?>