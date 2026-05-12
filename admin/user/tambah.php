<?php
include "../../config/koneksi.php";

if (isset($_POST['simpan'])) {
    $username = $_POST['username'];
    $password = md5($_POST['password']);
    $role = $_POST['role'];

    mysqli_query($conn, "INSERT INTO user VALUES('', '$username', '$password', '$role')");

    header("Location: index.php");
}
?>

<form method="POST">
    Username: <input type="text" name="username"><br>
    Password: <input type="password" name="password"><br>
    Role:
    <select name="role">
        <option value="admin">Admin</option>
        <option value="petugas">Petugas</option>
    </select><br>

    <button name="simpan">Simpan</button>
</form>