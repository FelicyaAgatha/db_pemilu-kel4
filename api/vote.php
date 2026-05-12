<?php
include '../config/koneksi.php';

header("Content-Type: application/json");

$nipd = $_POST['nipd'] ?? '';
$id_kandidat = $_POST['id_kandidat'] ?? '';

// validasi kosong
if ($nipd == '' || $id_kandidat == '') {
    echo json_encode([
        "status" => false,
        "message" => "NIPD dan ID kandidat wajib diisi"
    ]);
    exit;
}

// cek sudah vote atau belum
$cek = mysqli_query($conn, "SELECT * FROM vote WHERE nipd='$nipd'");

if (mysqli_num_rows($cek) > 0) {
    echo json_encode([
        "status" => false,
        "message" => "Kamu sudah vote"
    ]);
    exit;
}

// insert vote
$insert = mysqli_query($conn,
"INSERT INTO vote (nipd, id_kandidat) VALUES ('$nipd', '$id_kandidat')"
);

if ($insert) {
    echo json_encode([
        "status" => true,
        "message" => "Voting berhasil"
    ]);
} else {
    echo json_encode([
        "status" => false,
        "message" => "Voting gagal"
    ]);
}
?>