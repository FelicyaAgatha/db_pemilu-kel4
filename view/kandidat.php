<?php 
include "../config/koneksi.php";

// OSIS
$osis = mysqli_query($conn, "
  SELECT c.*, 
         CONCAT('../assets/img/', c.foto) AS foto_path,
         ketua.nama AS nama_ketua,
         wakil.nama AS nama_wakil
  FROM calon c
  JOIN siswa ketua ON c.id_ketua = ketua.id_siswa
  JOIN siswa wakil ON c.id_wakil = wakil.id_siswa
  WHERE c.id_organisasi = 1
");

// MPK
$mpk = mysqli_query($conn, "
  SELECT c.*, 
         CONCAT('../assets/img/', c.foto) AS foto_path,
         ketua.nama AS nama_ketua,
         wakil.nama AS nama_wakil
  FROM calon c
  JOIN siswa ketua ON c.id_ketua = ketua.id_siswa
  JOIN siswa wakil ON c.id_wakil = wakil.id_siswa
  WHERE c.id_organisasi = 2
");
?>

<!DOCTYPE html>
<html>
<head>
  <title>Kandidat</title>
  <link rel="stylesheet" href="../assets/css/kandidat.css">
</head>
<body>

<header>
  <div class="logo">E-Voting OSIS & MPK</div>
  <nav>
    <a href="home.php">Home</a>
    <a href="kandidat.php">Kandidat</a>
    <a href="vote.php">Voting</a>
    <a href="login.php">Login</a>
  </nav>
</header>

<center>
  <h1>Daftar Kandidat</h1>
  <h3>Pilih pemimpin terbaik!</h3>
</center>

<div class="container">

  <!-- OSIS -->
  <h2>OSIS</h2>
  <div class="osis">
    <?php while($o = mysqli_fetch_assoc($osis)) { ?>
      <div class="card">
        <img src="<?= $o['foto_path'] ?>">
        <h3><?= $o['nama_ketua'] ?> & <?= $o['nama_wakil'] ?></h3>
        <button onclick="openPopup('osis<?= $o['id'] ?>')">Lihat Profil</button>
      </div>
    <?php } ?>
  </div>

  <!-- MPK -->
  <h2>MPK</h2>
  <div class="mpk">
    <?php while($m = mysqli_fetch_assoc($mpk)) { ?>
      <div class="card">
        <img src="<?= $m['foto_path'] ?>">
        <h3><?= $m['nama_ketua'] ?> & <?= $m['nama_wakil'] ?></h3>
        <button onclick="openPopup('mpk<?= $m['id'] ?>')">Lihat Profil</button>
      </div>
    <?php } ?>
  </div>

</div>

<!-- ================= POPUP OSIS ================= -->
<?php 
mysqli_data_seek($osis, 0);
while($o = mysqli_fetch_assoc($osis)) { ?>
<div id="osis<?= $o['id'] ?>" class="popup">
  <div class="popup-content landscape">
    <span class="close" onclick="closePopup('osis<?= $o['id'] ?>')">&times;</span>
    <div class="popup-body">
      <div class="left">
        <img src="<?= $o['foto_path'] ?>">
        <h3><?= $o['nama_ketua'] ?> & <?= $o['nama_wakil'] ?></h3>
      </div>
      <div class="right">
        <h4>Visi</h4>
        <p><?= $o['visi'] ?></p>
        <h4>Misi</h4>
        <p><?= nl2br($o['misi']) ?></p>
        <h4>Program Kerja</h4>
        <p><?= nl2br($o['proker']) ?></p>
      </div>
    </div>
  </div>
</div>
<?php } ?>

<!-- ================= POPUP MPK ================= -->
<?php 
mysqli_data_seek($mpk, 0);
while($m = mysqli_fetch_assoc($mpk)) { ?>
<div id="mpk<?= $m['id'] ?>" class="popup">
  <div class="popup-content landscape">
    <span class="close" onclick="closePopup('mpk<?= $m['id'] ?>')">&times;</span>
    <div class="popup-body">
      <div class="left">
        <img src="<?= $m['foto_path'] ?>">
        <h3><?= $m['nama_ketua'] ?> & <?= $m['nama_wakil'] ?></h3>
      </div>
      <div class="right">
        <h4>Visi</h4>
        <p><?= $m['visi'] ?></p>
        <h4>Misi</h4>
        <p><?= nl2br($m['misi']) ?></p>
        <h4>Program Kerja</h4>
        <p><?= nl2br($m['proker']) ?></p>
      </div>
    </div>
  </div>
</div>
<?php } ?>

<script src="../assets/script/kandidat.js"></script>

</body>
</html>