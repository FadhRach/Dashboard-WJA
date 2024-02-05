<?php
include '../koneksi.php';
// menyimpan data id kedalam variabel
$id  = $_GET['id'];
// query SQL untuk insert data
$query="DELETE from tb_user where nama='$id'";
mysqli_query($link, $query);
// mengalihkan ke halaman index.php
header("location:user.php");
?>