<?php
session_start();
include "../config/koneksi.php";

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

$id_user        = $_SESSION['id_user'] ?? null;
$id_calon       = $_POST['id_calon'] ?? null;
$id_organisasi  = $_POST['id_organisasi'] ?? null;

if(!$id_user || !$id_calon || !$id_organisasi){
    echo "<script>
            alert('Data tidak lengkap atau belum login');
            window.location='../view/login.php';
          </script>";
    exit;
}

try {
    mysqli_query($conn, "CALL sp_insert_voting('$id_user','$id_calon','$id_organisasi')");
    mysqli_next_result($conn);

    header("Location: ../view/done.php");
    exit;

} catch (mysqli_sql_exception $e) {

    if (strpos($e->getMessage(), 'Anda sudah voting') !== false) {
        header("Location: ../view/done.php");
        exit;
    }

    echo "Error: " . $e->getMessage();
}
?>