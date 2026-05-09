<?php
include "../config/koneksi.php";

$aksi = $_GET['aksi'];

if($aksi == 'insert'){

    mysqli_query($conn,
        "CALL sp_insert_guru(
            '$_POST[nama]',
            '$_POST[no_telepon]',
            '$_POST[jenis_kelamin]'
        )"
    );

    mysqli_next_result($conn);
}

elseif($aksi == 'update'){

    mysqli_query($conn,
        "CALL sp_update_guru(
            '$_POST[id_guru]',
            '$_POST[nama]'
        )"
    );

    mysqli_next_result($conn);
}

elseif($aksi == 'delete'){

    mysqli_query($conn,
        "CALL sp_delete_guru('$_GET[id]')"
    );

    mysqli_next_result($conn);
}

header("Location: ../admin/dashboard.php?page=guru");
?>