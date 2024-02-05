<?php
include '../koneksi.php';
// menyimpan data id kedalam variabel
$id  = $_GET['id'];
// query SQL untuk insert data
$query="DELETE from tb_splitter where nama_splitter='$id'";
mysqli_query($link, $query);
// mengalihkan ke halaman index.php
header("location:admin_splitter.php");
?>