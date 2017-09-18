<?php
header('Access-Control-Allow-Origin: *');
require_once 'database.php';

$member_query = "select concat(m.`first_name`, \" \", m.`last_name`) as full_name , m.`email`, m.`headshot`, p.`name` as position_name, t.`name` as tier_name from `member` m, `position` p, `tier` t where m.`position` = p.`id` and p.`level` = t.`id`";
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