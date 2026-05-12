<?php
include "../../config/koneksi.php";

$id = $_GET['id'] ?? null;

if (!$id) {
    die("ID tidak ditemukan");
}

$query = mysqli_query($conn, "SELECT * FROM users WHERE id='$id'");
$data = mysqli_fetch_assoc($query);

if (!$data) {
    die("Data tidak ditemukan");
}

if (isset($_POST['update'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];

    mysqli_query($conn, "
        UPDATE users 
        SET name='$name', email='$email'
        WHERE id='$id'
    ");

    header("Location: index.php");
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>

    <style>
        body{
            margin:0;
            font-family: Arial;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            height: 100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .card{
            background:white;
            padding:30px;
            width:400px;
            border-radius:15px;
            box-shadow:0 10px 25px rgba(0,0,0,0.2);
        }

        h2{
            text-align:center;
            margin-bottom:20px;
            color:#333;
        }

        input{
            width:100%;
            padding:10px;
            margin-top:8px;
            margin-bottom:15px;
            border:1px solid #ddd;
            border-radius:8px;
            outline:none;
        }

        input:focus{
            border-color:#4CAF50;
        }

        .btn{
            width:100%;
            padding:10px;
            background:#4CAF50;
            color:white;
            border:none;
            border-radius:8px;
            cursor:pointer;
            font-size:16px;
        }

        .btn:hover{
            background:#45a049;
        }

        .back{
            display:block;
            text-align:center;
            margin-top:15px;
            text-decoration:none;
            color:#555;
        }

        .back:hover{
            color:#000;
        }

        label{
            font-size:14px;
            color:#444;
        }
    </style>
</head>

<body>

<div class="card">

    <h2>Edit User</h2>

    <form method="POST">

        <label>Nama</label>
        <input type="text" name="name" value="<?= $data['name'] ?>" required>

        <label>Email</label>
        <input type="email" name="email" value="<?= $data['email'] ?>" required>

        <button class="btn" type="submit" name="update">Update Data</button>

    </form>

    <a class="back" href="index.php">← Kembali</a>

</div>

</body>
</html>