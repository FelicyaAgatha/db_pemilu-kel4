<?php
session_start();
include "../config/koneksi.php";

$id_user = $_SESSION['id_user'] ?? 0;

// CEK OSIS (id = 1)
$query_osis = mysqli_query($conn, "
    SELECT 1 FROM voting 
    WHERE id_user = '$id_user' AND id_organisasi = 1
");
$sudah_osis = mysqli_num_rows($query_osis) > 0;

// CEK MPK (id = 2)
$query_mpk = mysqli_query($conn, "
    SELECT 1 FROM voting 
    WHERE id_user = '$id_user' AND id_organisasi = 2
");
$sudah_mpk = mysqli_num_rows($query_mpk) > 0;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pilih Voting</title>
    <link rel="stylesheet" href="../assets/css/organisasi.css">

    <style>
        .card.disabled {
            opacity: 0.5;
            pointer-events: none;
            filter: grayscale(100%);
        }
    </style>
</head>
<body>

<nav>
    <img src="../assets/img/logo bpm.png" alt="">
    <img src="../assets/img/logo_osemka.png" alt="">
    <h2>E-Voting OSIS & MPK</h2>
    <a href="../controller/p_logout.php">
        <button>Logout</button>
    </a>
</nav>

<div class="body">
    <div class="judul">
        <h2>Pilih jenis voting</h2>
        <p>Pilih Pemimpin terbaik</p>
    </div>

    <div class="pocket"> 

        <!-- OSIS -->
        <div class="osis">
            <div class="card <?= $sudah_osis ? 'disabled' : '' ?>">
                <img src="../assets/img/osis.png" alt="">
                <h2>OSIS</h2>
                <p>Pilih Ketua & Wakil</p>

                <?php if(!$sudah_osis): ?>
                    <a href="osis.php">
                        <button>Voting OSIS</button>
                    </a>
                <?php else: ?>
                    <button disabled>Sudah Voting</button>
                <?php endif; ?>
            </div>
        </div>

        <!-- MPK -->
        <div class="mpk">
            <div class="card <?= $sudah_mpk ? 'disabled' : '' ?>">
                <img src="../assets/img/mpk.png" alt="">
                <h2>MPK</h2>
                <p>Pilih Ketua & Wakil</p>

                <?php if(!$sudah_mpk): ?>
                    <a href="mpk.php">
                        <button>Voting MPK</button>
                    </a>
                <?php else: ?>
                    <button disabled>Sudah Voting</button>
                <?php endif; ?>
            </div>
        </div>

    </div>
</div>

</body>
</html>