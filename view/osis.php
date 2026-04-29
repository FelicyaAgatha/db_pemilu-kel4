<?php 
include "../config/koneksi.php";

// ambil dari VIEW MPK
$osis = mysqli_query($conn, "SELECT * FROM v_osis");
?>

<!DOCTYPE html>
<html>
<head>
  <title>Kandidat MPK</title>
  <link rel="stylesheet" href="../assets/css/kandidat.css">
</head>
<body>

<header>
  <div class="logo">E-Voting MPK</div>
</header>

<center>
  <h1>Daftar Kandidat MPK</h1>
</center>

<div class="container">

  <div class="osis">
    <?php while($o = mysqli_fetch_assoc($osis)) { ?>
      <div class="card">
        <img src="<?= $o['foto_path'] ?>">
        <h3><?= $o['nama_ketua'] ?> & <?= $o['nama_wakil'] ?></h3>
        <button onclick="openPopup('mpk<?= $o['id'] ?>')">
          Lihat Profil
        </button>
      </div>
    <?php } ?>
  </div>

</div>

<!-- ================= POPUP PROFIL ================= -->
<?php 
mysqli_data_seek($osis, 0);
while($o = mysqli_fetch_assoc($osis)) { ?>
<div id="osis<?= $o['id'] ?>" class="popup">
  <div class="popup-content landscape">
    <span class="close" onclick="closePopup('osis<?= $o['id'] ?>')">&times;</span>

    <img src="<?= $o['foto_path'] ?>">
    <h3><?= $o['nama_ketua'] ?> & <?= $o['nama_wakil'] ?></h3>

    <h4>Visi</h4>
    <p><?= $o['visi'] ?></p>

    <h4>Misi</h4>
    <p><?= nl2br($o['misi']) ?></p>

    <h4>Program Kerja</h4>
    <p><?= nl2br($o['proker']) ?></p>

    <button onclick="openConfirm('<?= $o['nama_ketua'] ?> & <?= $o['nama_wakil'] ?>')">
      Pilih
    </button>

  </div>
</div>
<?php } ?>

<!-- ================= POPUP KONFIRMASI ================= -->
<div id="confirmPopup" class="popup">
  <div class="popup-content">
    <span class="close" onclick="closeConfirm()">&times;</span>

    <h2 id="confirmText">Apakah anda yakin memilih?</h2>

    <button onclick="closeConfirm()">Batal</button>
    <button onclick="pilihSekarang()">Saya yakin</button>
  </div>
</div>

<!-- ================= JS EXTERNAL ================= -->
<script src="../assets/js/kandidat.js"></script>

</body>
</html>