<?php

require_once 'classes/WebsiteData.php';

$db = new WebsiteData();
$json = json_encode($db->getMembers());
echo $json;

