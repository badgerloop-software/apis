<?php
header("Access-Control-Allow-Origin: *");
require_once 'classes/WebsiteData.php';

$db = new WebsiteData();
$json = json_encode($db->getMemberTier());
echo $json;

