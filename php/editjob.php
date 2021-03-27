<?php
include_once("dbconnect.php");
$id = $_POST['id'];
$jobname = $_POST['jobname'];
$jobdes = $_POST['jobdes'];
$wagesperhour= $_POST['wagesperhour'];
$duration = $_POST['duration'];
$workhour = $_POST['workhour'];
$numberofworkers= $_POST['numberofworkers'];


$sqleditjob = ("UPDATE JOB SET JOBNAME = '".$jobname."', JOBDES = '".$jobdes."',WAGESPERHOUR = '".$wagesperhour."',DURATION = '".$duration."',WORKHOUR = '".$workhour."',NUMBEROFWORKERS = '".$numberofworkers."' WHERE ID = '".$id."'");

if ($conn->query($sqleditjob) === TRUE){
 
    echo "success";
}else{
    echo "failed";
}

?>