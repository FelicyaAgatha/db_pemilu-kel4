<?php
include '../config/koneksi.php';

header("Content-Type: application/json");

// ambil data dari POST (x-www-form-urlencoded)
$nipd = $_POST['nipd'] ?? '';
$password = $_POST['password'] ?? '';

// validasi input kosong
if (empty($nipd) || empty($password)) {
    echo json_encode([
        "status" => false,
        "message" => "NIPD dan Password wajib diisi"
    ]);
    exit;
}

// query cek nipd
$query = mysqli_query($conn, "SELECT * FROM siswa WHERE nipd='$nipd'");

// cek data ada atau tidak
if (mysqli_num_rows($query) > 0) {

    $data = mysqli_fetch_assoc($query);

    // cek password
    if ($password == $data['password']) {

        echo json_encode([
            "status" => true,
            "message" => "Login berhasil",
            "data" => [
                "nipd" => $data['nipd'],
                "nama" => $data['nama'] ?? null
            ]
        ]);

    } else {

        echo json_encode([
            "status" => false,
            "message" => "Password salah"
        ]);
    }

} else {

    echo json_encode([
        "status" => false,
        "message" => "NIPD tidak ditemukan"
    ]);
}

?>