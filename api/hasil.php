<?php
include '../config/koneksi.php';

header("Content-Type: application/json");

$query = mysqli_query($conn, "
    SELECT k.id, k.nama, COUNT(v.id_kandidat) AS total_vote
    FROM kandidat k
    LEFT JOIN vote v ON k.id = v.id_kandidat
    GROUP BY k.id, k.nama
");

$data = [];

while ($row = mysqli_fetch_assoc($query)) {
    $data[] = $row;
}

echo json_encode([
    "status" => true,
    "message" => "Hasil voting",
    "data" => $data
]);
?>