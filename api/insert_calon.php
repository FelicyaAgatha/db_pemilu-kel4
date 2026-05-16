<?php
include '../config/koneksi.php';

header("Content-Type: application/json");

// ambil data dari POST
$id_ketua = $_POST['id_ketua'];
$id_wakil = $_POST['id_wakil'];
$id_organisasi = $_POST['id_organisasi'];
$visi = $_POST['visi'];
$misi = $_POST['misi'];
$proker = $_POST['proker'];

// upload foto
$foto = $_FILES['foto']['name'];

move_uploaded_file(
    $_FILES['foto']['tmp_name'],
    "../assets/img/" . $foto
);

// query insert
$query = mysqli_query($conn,
    "CALL sp_insert_calon(
        '$id_ketua',
        '$id_wakil',
        '$id_organisasi',
        '$visi',
        '$misi',
        '$proker',
        '$foto'
    )"
);

// response JSON
if($query){
    echo json_encode([
        "status" => true,
        "message" => "Data calon berhasil ditambahkan"
    ]);
}else{
    echo json_encode([
        "status" => false,
        "message" => "Gagal tambah data"
    ]);
}
?>