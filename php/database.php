<?php

include 'db_cred.php';

//global $conn;
$conn = new mysqli($servername, $username, $password, $schema);
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

?>

