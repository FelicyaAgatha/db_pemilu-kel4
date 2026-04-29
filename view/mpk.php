<?php 
include "../config/koneksi.php";

// ambil dari VIEW MPK
$mpk = mysqli_query($conn, "SELECT * FROM v_mpk");
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

  <div class="mpk">
    <?php while($m = mysqli_fetch_assoc($mpk)) { ?>
      <div class="card">
        <img src="<?= $m['foto_path'] ?>">
        <h3><?= $m['nama_ketua'] ?> & <?= $m['nama_wakil'] ?></h3>
        <button onclick="openPopup('mpk<?= $m['id'] ?>')">
          Lihat Profil
        </button>
      </div>
    <?php } ?>
  </div>

</div>

<!-- ================= POPUP PROFIL ================= -->
<?php 
mysqli_data_seek($mpk, 0);
while($m = mysqli_fetch_assoc($mpk)) { ?>
<div id="mpk<?= $m['id'] ?>" class="popup">
  <div class="popup-content landscape">
    <span class="close" onclick="closePopup('mpk<?= $m['id'] ?>')">&times;</span>

    <img src="<?= $m['foto_path'] ?>">
    <h3><?= $m['nama_ketua'] ?> & <?= $m['nama_wakil'] ?></h3>

    <h4>Visi</h4>
    <p><?= $m['visi'] ?></p>

    <h4>Misi</h4>
    <p><?= nl2br($m['misi']) ?></p>

    <h4>Program Kerja</h4>
    <p><?= nl2br($m['proker']) ?></p>

    <button onclick="openConfirm('<?= $m['nama_ketua'] ?> & <?= $m['nama_wakil'] ?>')">
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
<script src="../assets/script/kandidat.js"></script>

</body>
</html>