<?php
include "../config/koneksi.php";

$osis = mysqli_query($conn,
    "SELECT * FROM v_hasil_voting
    WHERE LOWER(TRIM(nama_organisasi)) = 'osis'"
);

$mpk = mysqli_query($conn,
    "SELECT * FROM v_hasil_voting
    WHERE LOWER(TRIM(nama_organisasi)) = 'mpk'"
);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calon</title>
    <link rel="stylesheet" href="../assets/css/calon.css">
</head>
<body>

<header>
    <div class="logo">
        <img src="../assets/img/logo_osemka.png">
    </div>

    <div class="admin">
        <img src="../assets/img/logo bpm.png">
        <p>Hallo , Admin</p>
    </div>
</header>

<!-- SIDEBAR -->
<div class="sidebar">   
    <li><a href="dashboard.php">Dashboard</a></li>
    <li class="hal"><a href="calon.php">Kandidat</a></li>
    <li><a href="arsip.php">Catatan</a></li>

    <a href="../controller/p_logout.php">
        <button>Logout</button>
    </a>
</div>

<!-- CALON -->
<div class="calon">

    <!-- ================= OSIS ================= -->


    <div class="osis">

<?php while($d = mysqli_fetch_assoc($osis)){ ?>

        <div class="card">

            <!-- FOTO -->
            <img src="../assets/img/<?= $d['foto']; ?>" alt="">

            <!-- NAMA -->
            <h3>
                <?= $d['nama_ketua']; ?>
                &
                <br>
                <?= $d['nama_wakil']; ?>
            </h3>

            <!-- TOTAL -->
            <div class="total">

                <!-- BAR -->
                <div class="bar"
                    style="width: <?= $d['persen']; ?>%">
                </div>

                <!-- TEXT -->
                <p><?= $d['persen']; ?>%</p>

            </div>

            <!-- TOTAL VOTE -->
            <small>
                <?= $d['total_vote']; ?> Vote
            </small>

        </div>

<?php } ?>

    </div>

    <br><br>

    <!-- ================= MPK ================= -->

    <div class="mpk">

<?php while($d = mysqli_fetch_assoc($mpk)){ ?>

        <div class="card">

            <!-- FOTO -->
            <img src="../assets/img/<?= $d['foto']; ?>" alt="">

            <!-- NAMA -->
            <h3>
                <?= $d['nama_ketua']; ?>
                &
                <br>
                <?= $d['nama_wakil']; ?>
            </h3>

            <!-- TOTAL -->
            <div class="total">

                <!-- BAR -->
                <div class="bar"
                    style="width: <?= $d['persen']; ?>%">
                </div>

                <!-- TEXT -->
                <p><?= $d['persen']; ?>%</p>

            </div>

            <!-- TOTAL VOTE -->
            <small>
                <?= $d['total_vote']; ?> Vote
            </small>

        </div>

<?php } ?>

    </div>

</div>

</body>
</html>