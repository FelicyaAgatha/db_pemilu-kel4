<?php
include "../config/koneksi.php";

$tahun      = $_POST['tahun'];
$is_active  = $_POST['is_active'];

mysqli_query($conn,
"CALL sp_insert_periode(
    '$tahun',
    '$is_active'
)");

header("Location: ../admin/dashboard.php?page=periode");
exit;
?>

elseif($aksi == 'update'){

    mysqli_query($conn,
        "CALL sp_update_periode(
            '$_POST[id]',
            '$_POST[tahun]'
        )"
    );

    mysqli_next_result($conn);
}

elseif($aksi == 'delete'){

    mysqli_query($conn,
        "CALL sp_delete_periode('$_GET[id]')"
    );

    mysqli_next_result($conn);
}

header("Location: ../admin/dashboard.php?page=periode");
?>