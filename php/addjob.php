<?php
include_once("dbconnect.php");
$jobname = $_POST['jobname'];
$jobdes = $_POST['jobdes'];
$wagesperhour= $_POST['wagesperhour'];
$duration = $_POST['duration'];
$workhour = $_POST['workhour'];
$numberofworkers= $_POST['numberofworkers'];


$sqladdjob = "INSERT INTO JOB(JOBNAME,JOBDES,WAGESPERHOUR,DURATION,WORKHOUR,NUMBEROFWORKERS) VALUES('".$jobname."','".$jobdes."','".$wagesperhour."','".$duration."','".$workhour."','".$numberofworkers."')";

if ($conn->query($sqladdjob) === TRUE){
 
    echo "success";
}else{
    echo "failed";
}

?>