<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=utf-8");

mysqli_report(MYSQLI_REPORT_OFF); // ปิด exception

$conn = new mysqli();
$conn->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5); // timeout 5 วินาที
$conn->real_connect("192.168.1.76", "root", "", "WebsiteDB", 8088);

if ($conn->connect_error) {
    die(json_encode(["error" => $conn->connect_error]));
}

$result = $conn->query("SELECT * FROM `cer`");
$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
$conn->close();
?>  