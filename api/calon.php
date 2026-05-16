<?php
include '../config/koneksi.php';

header("Content-Type: application/json");

// ambil data calon
$query = mysqli_query($conn, "SELECT * FROM calon");

$data = [];

while($row = mysqli_fetch_assoc($query)){
    $data[] = $row;
}

echo json_encode([
    "status" => true,
    "message" => "Data calon berhasil diambil",
    "data" => $data
]);
?>