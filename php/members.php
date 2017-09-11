<?php

$tier_query = "SELECT name, value FROM `tier`;";
if ($result = $conn->query($tier_query)) {

	while ($row = $result->fetch_object()) {
		$data[] = $row;
		var_dump($row);
		echo "<br>";
	}

	$result->close();
}

?>
