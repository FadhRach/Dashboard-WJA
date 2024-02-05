<?php
session_start();
include 'koneksi.php';

    $query = "SELECT lat, lng, nama_splitter, output1, output2, output3, output4, output5, output6, output7, output8 FROM tb_splitter";

    $result = mysqli_query($link, $query) or die('Error querying database.');
    $myArray = array();
    while($row = mysqli_fetch_assoc($result)){
      $myArray[] = $row;
    }
    echo json_encode($myArray);
    mysqli_close($link);
?>