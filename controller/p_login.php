<?php
session_start();
include "../config/koneksi.php";

$nipd     = $_POST['nipd'] ?? null;
$password = $_POST['password'] ?? null;

if(!$nipd || !$password){
    echo "<script>alert('Data tidak lengkap'); window.location='../view/login.php';</script>";
    exit;
}

// panggil stored procedure
$query = mysqli_query($conn, "CALL sp_login('$nipd','$password')");

// ambil hasil
$data = mysqli_fetch_assoc($query);

// bersihin sisa result (WAJIB kalau pakai SP)
mysqli_next_result($conn);

// validasi hasil
if ($data && $data['status'] == 'LOGIN_BERHASIL') {

    $_SESSION['id_user'] = $data['id_user'];
    $_SESSION['nipd']    = $data['nipd'];
    $_SESSION['role']    = $data['role'];

    // redirect berdasarkan role
    if ($data['role'] == 'admin') {
        header("Location: ../admin/dashboard.php");
    } else {
        header("Location: ../view/organisasi.php");
    }
    exit;

} elseif ($data && $data['status'] == 'PASSWORD_SALAH') {

    echo "<script>alert('Password salah'); window.location='../view/login.php';</script>";

} elseif ($data && $data['status'] == 'USER_TIDAK_DITEMUKAN') {

    echo "<script>alert('User tidak ditemukan'); window.location='../view/login.php';</script>";

} else {

    echo "<script>alert('Terjadi kesalahan'); window.location='../view/login.php';</script>";
}
?>