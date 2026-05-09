<?php 
session_start();
include "../config/koneksi.php";

// proteksi login
if(!isset($_SESSION['id_user'])){
    header("Location: login.php");
    exit;
}

$mpk = mysqli_query($conn, "SELECT * FROM v_mpk");
?>

<!DOCTYPE html>
<html>
<head>
  <title>Kandidat MPK</title>
  <link rel="stylesheet" href="../assets/css/kandidat.css">
</head>
<body>

<nav>
  <img src="../assets/img/logo bpm.png" alt="">
  <img src="../assets/img/logo_osemka.png" alt="">
  <h2>E-Voting OSIS & MPK</h2>
</nav>

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

<!-- POPUP PROFILE -->
<?php mysqli_data_seek($mpk, 0); while($m = mysqli_fetch_assoc($mpk)) { ?>
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

        <!-- tombol pilih -->
        <button onclick="openConfirm('<?= $m['id'] ?>')">
          Pilih
        </button>
      </div>
    </div>

  </div>
</div>
<?php } ?>

<!-- POPUP CONFIRM -->
<div class="acc" id="confirmBox">
  <div class="box">
    <h2 id="confirmText">Apakah anda yakin memilih kandidat ini?</h2>

    <form action="../controller/p_voting.php" method="POST">
      <input type="hidden" name="id_calon" id="id_calon">
      <input type="hidden" name="id_organisasi" value="2"> <!-- 🔥 WAJIB -->

      <button type="button" onclick="closeConfirm()">Batal</button>
      <button type="submit">Saya yakin</button>
    </form>

  </div>
</div>

<!-- JS -->
<script src="../assets/script/kandidat.js"></script>

</body>
</html>