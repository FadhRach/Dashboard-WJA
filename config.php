<?php 
 
$server = "localhost";
$user = "crm";
$pass = "lintasarta";
$database = "crm";
 
$conn = mysqli_connect($server, $user, $pass, $database);
 
if (!$conn) {
    die("<script>alert('Gagal tersambung dengan database.')</script>");
}
 
?>