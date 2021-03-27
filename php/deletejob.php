<?php 

	include 'dbconnect.php';

	$id = $_POST['id'];

	$link->query("DELETE FROM JOB WHERE ID = '".$id."'");