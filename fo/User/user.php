<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DATA USER</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
<style>
  <style type="text/css">
    
    body {
      margin: 0;
      padding: 0;
      overflow: hidden;
      height: 100%; 
      max-height: 100%; 
      font-family:Sans-serif;
      line-height: 1.5em;
    }

    main {
      background-image: url(user.jpg);
      position: fixed;
      top: 50px; /* Set this to the height of the header */
      bottom: 20px; /* Set this to the height of the footer */
      left: 0; 
      right: 0;
      overflow: auto; 
    }
        
    #header {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 50px; 
      overflow: hidden; /* Disables scrollbars on the header frame. To enable scrollbars, change "hidden" to "scroll" */
      background: #333;
    }

    #footer {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      height: 30px; 
      overflow: hidden; /* Disables scrollbars on the footer frame. To enable scrollbars, change "hidden" to "scroll" */
      background: black;
    }
        
    
    .innertube {
      margin: 0px; /* Provides padding for the content */
    }
    
    p {
      color: black;
    }

        
    /*IE6 fix*/
    * html body{
      padding: 50px 0 50px; /* Set the first value to the height of the header, the third value to the height of the footer, and last value to the width of the nav */
    }
    
    * html main{ 
      height: 100%; 
      width: 100%; 
    }
    table { 
      border-collapse:collapse;
      border-spacing:0;     
      font-family: sans-serif;
      font-size:12px;
      padding-left:300px;
      margin:auto; 
      background-color:   rgb(230, 230, 250, 0.7);}
   table th {
      font-weight:bold;
      padding:10px;
      color:#e5e5e5;
      background-color:rgb(0, 0, 0, 0.8);
      border-top:1px black solid;
      border-bottom:1px black solid;}
   table td {
      padding:10px;
      border-top:1px black solid;
      border-bottom:1px black solid;
      text-align:center;}       
   tr:nth-child(even) {
     background-color: #DFEBF8;
     }

.header a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  font-family: calibri;
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: rgb(70, 130, 180);
  color: white;
}
    </style>
   </style>
</head>
<body>
    <? php 
  session_start();
  if($_SESSION['status'] !="login"){
  header("location:../User/user.php");
}
   ?>
  <header id="header">
      <div class="header">
  <a href="../Data Splitter/admin_splitter.php">Data Splitter</a>
  <a href="../PSB/form_psb.php">Form PSB</a>
  <a href="../PSB/data_psb.php">Data PSB</a>
  <a href="../Pelanggan/data_pelanggan.php">Data Pelanggan</a>
  <a href="../Cabut/form_cabut.php">Form Cabut</a>
  <a href="../Cabut/data_cabut.php">Data Cabut</a>
  <a href="../Peta/peta.php">Peta Splitter</a>
  <a class="active" href="user.php">Akun / User</a>
  <a style=" font-family: calibri; font-size: 10; text-align: right;"><?php session_start(); echo "Selamat datang ". $_SESSION['username'];  ?></a>
  <a style="background-color: red;" href="../logout.php" onclick="return confirm('Apakah Anda Yakin Untuk Logout ?')">LOGOUT</a>
      </div>
    </header>
    <main>
      <div class="innertube">
     <h1 style="color: red; text-align: center;">Data User</h1>
     <p align="center">
      <button style="background-color: red; color: white; padding-bottom: 0; padding-top: 0;" onclick="location.href='add_user.php'">+ Add User</button>
     </p>
   
<table border="1" width="800px">
<tr>
   <th style="text-align: center;">No</th>
   <th style="text-align: center;">Nama</th>
   <th style="text-align: center;">Username</th>
   <th style="text-align: center;">Password</th>
   <th style="text-align: center;">Level</th>
   <th colspan="2" style="text-align: center;">Action</th>
</tr>
        <?php

        include "../koneksi.php";
        $sql="select * from tb_user order by username asc";
        


        $hasil=mysqli_query($link,$sql);
        $no=0;
while ($row = mysqli_fetch_array($hasil)) {
            $no++;

            ?>
            <tbody>
            <tr>
                <td><?php echo $no;?></td>
                <td><?php echo $row["nama"]; ?></td>
                <td><?php echo $row["username"];   ?></td>
                <td><?php echo $row["password"];   ?></td>
                <td><?php echo $row["level"];   ?></td>
                <td><a href="updateuser.php?id=<?php echo $row["nama"]; ?>"><button>EDIT</button></a></td>
                <td><a href="hapususer.php?id=<?php echo $row["nama"]; ?>" onclick="return confirm('Hapus User <?php echo $row["nama"]; ?> ?')"><button>HAPUS</button></a></td>
            </tr>
            </tbody>
            <?php
          }
          ?>
</table>
      </div>
    </main>
    <footer id="footer">
      <div>
        <p style="color: white; font-size: 12px;text-align: center;font-style: bold-italic;">-COPYRIGHTS FR11-</p>
</div>
    </footer>  

</body>
</html>