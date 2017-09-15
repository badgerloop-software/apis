<?php
require_once 'database.php';

$member_query = "SELECT uid, eppn, position FROM `member`;";
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
