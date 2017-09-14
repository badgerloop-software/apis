<?php
require_once 'database.php';

$member_query = "SELECT name, level position FROM `member`;";
if ($result = $conn->query($member_query)) {

//    $data = array();

    while ($row = $result->fetch_object()) {
        $data[] = $row;
//        var_dump($row);
//        echo "<br>";
    }

    $json = json_encode($data);

    echo $json;

    $result->close();
}

?>
