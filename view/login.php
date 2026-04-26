<?php 
include "../config/koneksi.php"
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

    <header>
  <div class="logo">E-Voting OSIS & MPK</div>
  <nav>
    <a href="home.php">Home</a>
    <a href="kandidat.php">Kandidat</a>
    <a href="vote.php">Voting</a>
    <a href="login.php">Login</a>
  </nav>
</header>

  <div class="login-container">
    <div class="login-box">
      <h2>Login</h2>
      <p>Masuk untuk memberikan suara Anda</p>

      <form>
        <label>NIPD</label>
        <input type="text" placeholder="Masukkan NIPD">

        <label>Password</label>
        <input type="password" placeholder="Masukkan password">

        <button type="submit">Masuk</button>
      </form>
    </div>
  </div>

</body>
</html>