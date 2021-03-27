<?php 

	
include 'dbconnect.php';

	$query = $link->query("SELECT * FROM JOB");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);