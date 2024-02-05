<?php
/* Database credentials. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'splitter');
define('DB_PASSWORD', 'nasional');
define('DB_NAME', 'db_splitter_wja');
 
/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
 
// Check connection
if($link === false){
    die("GAGAL UNTUK MENGONEKSIKAN KE DATABASE " . mysqli_connect_error());
}
?>