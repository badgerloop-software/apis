<?php
require_once 'database.php';

$member_query = "SELECT name, level FROM `position`;";
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
