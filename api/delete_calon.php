<?php
include '../config/koneksi.php';

header("Content-Type: application/json");

$id = $_GET['id'];

$query = mysqli_query($conn,
    "CALL sp_delete_calon('$id')"
);

if($query){
    echo json_encode([
        "status" => true,
        "message" => "Data calon berhasil dihapus"
    ]);
}else{
    echo json_encode([
        "status" => false,
        "message" => "Gagal hapus data"
    ]);
}
?>