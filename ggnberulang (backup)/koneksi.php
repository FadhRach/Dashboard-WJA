<?php
/* Database credentials. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'crm');
define('DB_PASSWORD', 'lintasarta');
define('DB_NAME', 'crm');
 
/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
 
// Check connection
if($link === false){
    die("GAGAL UNTUK MENGONEKSIKAN KE DATABASE " . mysqli_connect_error());
}
?>