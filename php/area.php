<?php
require_once 'database.php';

$member_query = "SELECT a.name as `area_name`, t.name, t.description FROM `area` a, `team` t where a.id = t.area and a.name = '" . $_GET['area'] . "'";
if ($result = $conn->query($member_query)) {

	$data = array();

	while ($row = $result->fetch_object()) {
		$data[] = $row;
	}

	$json = json_encode($data);

	echo $json;

	$result->close();
}
?>