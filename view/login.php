<?php
session_start();
include "../config/koneksi.php";
?>

<!DOCTYPE html>
<html lang="id">
<head>
  
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login E-Voting</title>
  <link rel="stylesheet" href="../assets/css/login.css">
</head>
<body>
  <nav>
    <img src="../assets/img/logo bpm.png" alt="">
    <img src="../assets/img/logo_osemka.png" alt="">
    <h2>E-Voting OSIS & MPK</h2>
  </nav>

  <div class="right">
    <h1>Pemilihan</h1>
    <h2>Ketua & Wakil</h2>
    <h3>OSIS & MPK</h3>
    <p>Gunakan hak pilihmu untuk <br>
      memilih pemimpin terbaik yang <br>
      akan membawa perubahan <br>   
      positif bagi SMK Bina Putra <br> 
      Mandiri
    </p>
  </div>

  <div class="login-container">
    <div class="login-box">
      <img src="../assets/img/logo bpm.png" alt="">
      <h2>Selamat Datang</h2>
      <p>Silakan masuk untuk melanjutkan</p>

      <form action="../controller/p_login.php" method="POST">
        <label>NIPD</label>
        <input type="text" name="nipd" placeholder="Masukkan NIPD" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Masukkan password" required>

        <button type="submit">Masuk</button>
      </form>
    </div>
  </div>
  <div class="box">

  </div>

</body>
</html>