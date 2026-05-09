<?php
include "../config/koneksi.php";

// ================= PERIODE =================
$periode = mysqli_query($conn,
    "SELECT * FROM periode"
);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catatan</title>

    <link rel="stylesheet" href="../assets/css/arsip.css">
</head>
<body>

<!-- ================= HEADER ================= -->
<header>

    <div class="logo">
        <img src="../assets/img/logo_osemka.png">
    </div>

    <div class="admin">
        <img src="../assets/img/logo bpm.png">
        <p>Hallo , Admin</p>
    </div>

</header>

<!-- ================= SIDEBAR ================= -->
<div class="sidebar">   

    <li>
        <a href="dashboard.php">
            Dashboard
        </a>
    </li>

    <li>
        <a href="calon.php">
            Kandidat
        </a>
    </li>

    <li class="hal">
        <a href="arsip.php">
            Catatan
        </a>
    </li>

    <a href="../controller/p_logout.php">
        <button>Logout</button>
    </a>

</div>

<!-- ================= MAIN ================= -->
<div class="main">

<?php
while($p = mysqli_fetch_assoc($periode)){
?>

    <!-- BOX -->
    <div class="box"
        onclick="openPopup('popup<?= $p['id']; ?>')">

        <h2>
            <?= $p['tahun']; ?>
        </h2>

    </div>

<?php } ?>

</div>

<!-- ================= POPUP ================= -->

<?php

$periode2 = mysqli_query($conn,
    "SELECT * FROM periode"
);

while($p = mysqli_fetch_assoc($periode2)){

?>

<div class="open"
    id="popup<?= $p['id']; ?>">

    <div class="content">

        <!-- CLOSE -->
        <span class="close"
            onclick="closePopup('popup<?= $p['id']; ?>')">
            ✖
        </span>

        <!-- JUDUL -->
        <h2>
            Arsip <?= $p['tahun']; ?>
        </h2>

        <hr>

<?php

$detail = mysqli_query($conn,
    "SELECT * FROM v_detail_arsip
    WHERE id_periode = '$p[id]'"
);

while($d = mysqli_fetch_assoc($detail)){

?>

        <!-- PASLON -->
        <div class="paslon">

            <p>
                <b>Organisasi :</b>
                <?= $d['organisasi']; ?>
            </p>

            <p>
                <b>Paslon :</b>
                <?= $d['nama_ketua']; ?>
                &
                <?= $d['nama_wakil']; ?>
            </p>

            <p>
                <b>Vote :</b>

                <?= $d['total_vote']; ?>

                (<?= $d['persen']; ?>%)
            </p>

            <hr>

        </div>

<?php } ?>

    </div>

</div>

<?php } ?>

<!-- ================= SCRIPT ================= -->
<script>

function openPopup(id){

    document.getElementById(id).style.display = "flex";

}

function closePopup(id){

    document.getElementById(id).style.display = "none";

}

</script>

</body>
</html>