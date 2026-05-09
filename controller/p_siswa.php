<?php
include "../config/koneksi.php";

$aksi = $_GET['aksi'];

// INSERT
if($aksi == 'insert'){

    mysqli_query($conn,
        "CALL sp_insert_siswa(
            '$_POST[nipd]',
            '$_POST[nama]',
            '$_POST[jenis_kelamin]',
            '$_POST[tempat_lahir]',
            '$_POST[tanggal_lahir]',
            '$_POST[telepon]'
        )"
    );

    mysqli_next_result($conn);
}

// UPDATE
elseif($aksi == 'update'){

    mysqli_query($conn,
        "CALL sp_update_siswa(
            '$_POST[id_siswa]',
            '$_POST[nama]',
            '$_POST[telepon]'
        )"
    );

    mysqli_next_result($conn);
}

// DELETE
elseif($aksi == 'delete'){

    mysqli_query($conn,
        "CALL sp_delete_siswa('$_GET[id]')"
    );

    mysqli_next_result($conn);
}

header("Location: ../admin/dashboard.php?page=siswa");
?>