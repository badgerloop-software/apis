<?php
require_once 'database.php';

$tier_query = "SELECT name, value FROM `tier`;";
if ($result = $conn->query($tier_query)) {
	$data = array();

	while ($row = $result->fetch_object()) {
		$data[] = $row;
	}

	$json = json_encode($data);

	echo $json;

	$result->close();
}

?>
