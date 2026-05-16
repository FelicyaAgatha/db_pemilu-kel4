<?php
include '../config/koneksi.php';

header("Content-Type: application/json");

$nipd = $_POST['nipd'] ?? '';
$password = $_POST['password'] ?? '';

if (empty($nipd) || empty($password)) {
    echo json_encode([
        "status" => false,
        "message" => "NIPD dan Password wajib diisi"
    ]);
    exit;
}

// cek user berdasarkan nipd
$query = mysqli_query($conn, "SELECT * FROM user WHERE nipd='$nipd'");

if (mysqli_num_rows($query) > 0) {

    $data = mysqli_fetch_assoc($query);

    // cek password
    if ($password == $data['password']) {

        echo json_encode([
            "status" => true,
            "message" => "Login berhasil",
            "data" => [
                "id_user" => $data['id_user'],
                "username" => $data['username'],
                "nipd" => $data['nipd'],
                "role" => $data['role']
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