<?php
include "../config/koneksi.php";

$aksi = $_GET['aksi'];

if($aksi == 'insert'){

    mysqli_query($conn,
        "CALL sp_insert_calon(
            '$_POST[id_ketua]',
            '$_POST[id_wakil]',
            '$_POST[id_organisasi]',
            '$_POST[visi]',
            '$_POST[misi]',
            '$_POST[proker]',
            '$_FILES[foto][name]'
        )"
    );

    move_uploaded_file(
        $_FILES['foto']['tmp_name'],
        "../assets/img/" . $_FILES['foto']['name']
    );

    mysqli_next_result($conn);
}

elseif($aksi == 'update'){

    mysqli_query($conn,
        "CALL sp_update_calon(
            '$_POST[id_calon]',
            '$_POST[visi]',
            '$_POST[misi]'
        )"
    );

    mysqli_next_result($conn);
}

elseif($aksi == 'delete'){

    mysqli_query($conn,
        "CALL sp_delete_calon('$_GET[id]')"
    );

    mysqli_next_result($conn);
}

header("Location: ../admin/dashboard.php?page=calon");
?>