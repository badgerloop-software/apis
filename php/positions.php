<?php

require_once 'classes/WebsiteData.php';

$db = new WebsiteData();
$json = json_encode($db->getPositions());
echo $json;

