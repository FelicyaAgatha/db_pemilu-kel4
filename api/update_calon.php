<?php
include '../config/koneksi.php';

header("Content-Type: application/json");

$id = $_POST['id'];
$visi = $_POST['visi'];
$misi = $_POST['misi'];

$query = mysqli_query($conn,
    "CALL sp_update_calon(
        '$id',
        '$visi',
        '$misi'
    )"
);

if($query){
    echo json_encode([
        "status" => true,
        "message" => "Data calon berhasil diupdate"
    ]);
}else{
    echo json_encode([
        "status" => false,
        "message" => "Gagal update data"
    ]);
}
?>