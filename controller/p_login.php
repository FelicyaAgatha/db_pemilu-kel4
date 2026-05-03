<?php
session_start();
include "../config/koneksi.php";

$nipd     = $_POST['nipd'] ?? null;
$password = $_POST['password'] ?? null;

if(!$nipd || !$password){
    echo "<script>alert('Data tidak lengkap'); window.location='../view/login.php';</script>";
    exit;
}

// panggil SP
$query = mysqli_query($conn, "CALL sp_login('$nipd','$password')");
$data  = mysqli_fetch_assoc($query);

mysqli_next_result($conn);

// validasi hasil SP
if ($data['status'] == 'LOGIN_BERHASIL') {

    $_SESSION['id_user'] = $data['id_user'];
    $_SESSION['nipd']    = $data['nipd'];

    header("Location: ../view/organisasi.php");
    exit;

} elseif ($data['status'] == 'PASSWORD_SALAH') {

    echo "<script>alert('Password salah'); window.location='../view/login.php';</script>";

} elseif ($data['status'] == 'USER_TIDAK_DITEMUKAN') {

    echo "<script>alert('User tidak ditemukan'); window.location='../view/login.php';</script>";

} else {

    echo "<script>alert('Terjadi kesalahan'); window.location='../view/login.php';</script>";
}
?>