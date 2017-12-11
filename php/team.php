<?php

global $no_header;
if (!$no_header)
	header('Access-Control-Allow-Origin: *');

require_once 'classes/WebsiteData.php';

$db = new WebsiteData();
$json = json_encode($db->getTeam());
echo $json;
