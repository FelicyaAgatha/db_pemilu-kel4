<?php
include "../../config/koneksi.php";

$data = mysqli_query($conn, "SELECT * FROM users");
?>

<!DOCTYPE html>
<html>
<head>
    <title>Data User</title>

    <style>
        body{
            font-family: Arial;
            background: #f4f6f9;
            margin: 0;
        }

        .container{
            width: 90%;
            margin: 30px auto;
        }

        h2{
            margin-bottom: 20px;
        }

        .btn-add{
            display: inline-block;
            padding: 10px 15px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .card{
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        table{
            width: 100%;
            border-collapse: collapse;
        }

        th{
            background: #2c3e50;
            color: white;
            padding: 12px;
        }

        td{
            padding: 12px;
            border-bottom: 1px solid #eee;
        }

        tr:hover{
            background: #f1f1f1;
        }

        .edit{
            padding: 6px 10px;
            background: #3498db;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }

        .delete{
            padding: 6px 10px;
            background: #e74c3c;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }

        .badge{
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            background: #eee;
        }

    </style>
</head>

<body>

<div class="container">

    <h2>Data User</h2>

    <a class="btn-add" href="tambah.php">+ Tambah User</a>

    <div class="card">

        <table>
            <tr>
                <th>No</th>
                <th>Nama</th>
                <th>Email</th>
                <th>Aksi</th>
            </tr>

            <?php $no=1; while($d = mysqli_fetch_assoc($data)) { ?>
            <tr>
                <td><?= $no++ ?></td>
                <td><?= $d['name'] ?></td>
                <td><?= $d['email'] ?></td>
                <td>
                    <a class="edit" href="edit.php?id=<?= $d['id'] ?>">Edit</a>
                    <a class="delete" href="hapus.php?id=<?= $d['id'] ?>" onclick="return confirm('Yakin hapus?')">Hapus</a>
                </td>
            </tr>
            <?php } ?>

        </table>

    </div>

</div>

</body>
</html>