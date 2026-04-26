<?php 
include "../config/koneksi.php"
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Voting Kandidat</title>
  <link rel="stylesheet" href="../assets/css/vote.css">
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

<section class="container">
  
  <!-- OSIS -->
  <div class="osis">
    <div class="card">
      <img src="../assets/img/WhatsApp Image 2026-04-25 at 15.38.10.jpeg">
      <h3>Paslon 1</h3>
      <p>Ketua & Wakil OSIS</p>
      <button data-nama="Paslon 1 OSIS">Pilih</button>
    </div>

    <div class="card">
      <img src="../assets/img/WhatsApp Image 2026-04-25 at 15.38.10.jpeg">
      <h3>Paslon 2</h3>
      <p>Ketua & Wakil OSIS</p>
      <button data-nama="Paslon 2 OSIS">Pilih</button>
    </div>

    <div class="card">
      <img src="../assets/img/WhatsApp Image 2026-04-25 at 15.38.10.jpeg">
      <h3>Paslon 3</h3>
      <p>Ketua & Wakil OSIS</p>
      <button data-nama="Paslon 3 OSIS">Pilih</button>
    </div>
  </div>

  <!-- MPK -->
  <div class="mpk">
    <div class="card">
      <img src="../assets/img/WhatsApp Image 2026-04-25 at 14.01.23.jpeg">
      <h3>Paslon 1</h3>
      <p>Ketua & Wakil MPK</p>
      <button data-nama="Paslon 1 MPK">Pilih</button>
    </div>

    <div class="card">
      <img src="../assets/img/WhatsApp Image 2026-04-25 at 14.01.23.jpeg">
      <h3>Paslon 2</h3>
      <p>Ketua & Wakil MPK</p>
      <button data-nama="Paslon 2 MPK">Pilih</button>
    </div>

    <div class="card">
      <img src="../assets/img/WhatsApp Image 2026-04-25 at 14.01.23.jpeg">
      <h3>Paslon 3</h3>
      <p>Ketua & Wakil MPK</p>
      <button data-nama="Paslon 3 MPK">Pilih</button>
    </div>
  </div>

</section>

<!-- POPUP -->
<div class="overlay"></div>

<div class="acc"> 
  <h2 id="teksPopup">Apakah anda yakin memilih?</h2>
  <button onclick="tutupPopup()">Batal</button>
  <button onclick="tutupPopup()">Saya yakin</button>
</div>

<script src="../assets/script/vote.js"></script>

</body>
</html>