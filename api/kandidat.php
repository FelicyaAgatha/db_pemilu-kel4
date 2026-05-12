<?php
include '../config/koneksi.php';

header("Content-Type: application/json");

$query = mysqli_query($conn, "SELECT * FROM kandidat");

$data = [];

while ($row = mysqli_fetch_assoc($query)) {
    $data[] = $row;
}

echo json_encode([
    "status" => true,
    "message" => "Data kandidat",
    "data" => $data
]);
?>