<?php
session_start();
include "../config/koneksi.php";

if($_SESSION['role'] != 'admin'){
    header("Location: ../view/login.php");
    exit;
}

$page = $_GET['page'] ?? 'siswa';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="../assets/css/dashboard.css">
</head>
<body>


<header>
    <div class="logo">
        <img src="../assets/img/logo_osemka.png">
    </div>

    <div class="admin">
        <img src="../assets/img/logo bpm.png">
        <p>Hallo, <?= $_SESSION['nipd']; ?></p>
    </div>
</header>

<!-- SIDEBAR -->
<div class="sidebar">   
    <li class="hal"><a href="dashboard.php">Dashboard</a></li>
    <li><a href="calon.php">Kandidat</a></li>
    <li><a href="arsip.php">Catatan</a></li>

    <a href="../controller/p_logout.php">
        <button>Logout</button>
    </a>
</div>

<!-- MAIN -->
<div class="main">

    <!-- SWITCH -->
    <div class="swicth">
        <a href="?page=siswa">Siswa</a>
        <a href="?page=guru">Guru</a>
        <a href="?page=periode">Periode</a>
        <a href="?page=calon">Kandidat</a>
    </div>

    <br>

    <!-- BUTTON -->
    <button onclick="openPopup()">Tambah Data</button>

    <!-- POPUP -->
    <div class="popup" id="popup">

        <div class="popup-content">

            <span class="close" onclick="closePopup()">&times;</span>

<?php
// ================= FORM SISWA =================
if($page == 'siswa'){
?>
<form action="../controller/p_siswa.php" method="POST">

    <h2>Tambah Siswa</h2>

    <input type="text" name="nipd" placeholder="NIPD" required>

    <input type="text" name="nama" placeholder="Nama" required>

    <select name="jenis_kelamin" required>
        <option value="">Pilih Jenis Kelamin</option>
        <option value="L">Laki-Laki</option>
        <option value="P">Perempuan</option>
    </select>

    <input type="text"
        name="tempat_lahir"
        placeholder="Tempat Lahir"
        required>

    <input type="date"
        name="tanggal_lahir"
        required>

    <input type="text"
        name="telepon"
        placeholder="No Telepon"
        required>

    <select name="is_active">
        <option value="Y">Aktif</option>
        <option value="N">Nonaktif</option>
    </select>

    <input type="number"
        name="id_jurusan"
        placeholder="ID Jurusan"
        required>

    <button type="submit">
        Tambah
    </button>

</form>

<?php
}

// ================= FORM GURU =================
elseif($page == 'guru'){
?>

<form action="../controller/p_guru.php" method="POST">

    <h2>Tambah Guru</h2>

    <input type="text"
        name="nama"
        placeholder="Nama Guru"
        required>

    <input type="text"
        name="no_telepon"
        placeholder="No Telepon"
        required>

    <select name="jenis_kelamin" required>
        <option value="">Pilih Jenis Kelamin</option>
        <option value="L">Laki-Laki</option>
        <option value="P">Perempuan</option>
    </select>

    <select name="is_active">
        <option value="Y">Aktif</option>
        <option value="N">Nonaktif</option>
    </select>

    <button type="submit">
        Tambah
    </button>

</form>

<?php
}

// ================= FORM PERIODE =================
elseif($page == 'periode'){
?>

<form action="../controller/p_periode.php" method="POST">

    <h2>Tambah Periode</h2>

    <input type="text"
        name="tahun"
        placeholder="Contoh : 2025-2026"
        required>

    <select name="is_active">
        <option value="Y">Aktif</option>
        <option value="N">Nonaktif</option>
    </select>

    <button type="submit">
        Tambah
    </button>

</form>

<?php
}

// ================= FORM KANDIDAT =================
elseif($page == 'calon'){
?>

<form action="../controller/p_calon.php"
    method="POST"
    enctype="multipart/form-data">

    <h2>Tambah Kandidat</h2>

    <input type="number"
        name="id_ketua"
        placeholder="ID Ketua"
        required>

    <input type="number"
        name="id_wakil"
        placeholder="ID Wakil"
        required>

    <input type="number"
        name="id_organisasi"
        placeholder="ID Organisasi"
        required>

    <input type="number"
        name="id_periode"
        placeholder="ID Periode"
        required>

    <textarea
        name="visi"
        placeholder="Visi"></textarea>

    <textarea
        name="misi"
        placeholder="Misi"></textarea>

    <textarea
        name="proker"
        placeholder="Program Kerja"></textarea>

    <input type="file"
        name="foto"
        required>

    <button type="submit">
        Tambah
    </button>

</form> 

<?php } ?>

        </div>
    </div>

    <br><br>

<?php
// ================= TAMPIL DATA =================

$data = mysqli_query($conn, "SELECT * FROM v_$page");

echo "<div class='table-box'>";
echo "<table border='1'>";  

// HEADER
$fields = mysqli_fetch_fields($data);

echo "<tr>";

foreach($fields as $field){
    echo "<th>".$field->name."</th>";
}

echo "</tr>";

// ISI
while($row = mysqli_fetch_assoc($data)){

    echo "<tr>";

    foreach($row as $val){
        echo "<td>$val</td>";
    }

    echo "</tr>";
}

echo "</table>";
echo "</div>";
?>

</div>
    </div>
</div>
<div class="bg"></div>

<script src="../assets/script/dashboard.js"></script>
</body>
</html>