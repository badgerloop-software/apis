<?php

include 'db_cred.php';

$conn = new mysqli($servername, $username, $password, $schema);
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}
echo "Connected!";

?>

