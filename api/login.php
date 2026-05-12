<?php
include '../config/koneksi.php';

header("Content-Type: application/json");

$nipd = $_POST['nipd'] ?? '';
$password = $_POST['password'] ?? '';

$query = mysqli_query($conn,
"SELECT * FROM siswa WHERE nipd='$nipd'");

if(mysqli_num_rows($query) > 0){

    $data = mysqli_fetch_assoc($query);

    if($password == $data['password']){

        echo json_encode([
            "status" => true,
            "message" => "Login berhasil"
        ]);

    } else {

        echo json_encode([
            "status" => false,
            "message" => "Password salah"
        ]);
    }

}else{

    echo json_encode([
        "status" => false,
        "message" => "NIPD tidak ditemukan"
    ]);
}
?>