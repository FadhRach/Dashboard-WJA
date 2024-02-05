<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ganti Password</title>
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
      background-image: url(pass.png);
      position: fixed;
      top: 50px; /* Set this to the height of the header */
      bottom: 0px; /* Set this to the height of the footer */
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
      background: rgb(0, 0, 0, 0.8);
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
      background-color:rgb(70, 130, 180);
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
  <header id="header">
      <div class="header">
  <a href="../Data Splitter/viewmitra.php">Data Splitter</a>
  <a href="../PSB/form_psbmitra.php">Form PSB</a>
  <a class="active" href="ganti_passmitra.php">Ganti Password</a>
  <a style="width:850px; font-family: calibri; font-size: 10; text-align: right;">PT. Aplikanusa Lintasarta</a>
  <a style="background-color: red;" href="../logout.php" onclick="return confirm('Apakah Anda Yakin Untuk Logout ?')">LOGOUT</a>
      </div>
    </header>
    <main>
           <?php
    include "../koneksi.php";
    //proses ganti password
    if (isset($_POST['Ganti'])) {
    $username        = $_POST['username'];
    $password_lama    = $_POST['password_lama'];
    $password_baru    = $_POST['password_baru'];
    $konf_password    = $_POST['konf_password'];
    //cek old password
    $query = "SELECT * FROM tb_user WHERE username ='$username' AND password ='$password_lama'";
    $sql = mysqli_query ($link,$query);
    $hasil = mysqli_num_rows ($sql);
    if (! $hasil >= 1) {
        ?>
            <script language="JavaScript">
            alert('Password lama tidak sesuai!, silahkan ulang kembali!');
            document.location='ganti_passmitra.php';
            </script>
        <?php
    }
    //validasi data data kosong
    else if (empty($_POST['password_baru']) || empty($_POST['konf_password'])) {
            echo "<script language='JavaScript'>
            alert('Gagal memperbaharui Password !, Data Tidak Boleh Kosong!');
            document.location='ganti_passmitra.php';
            </script>";    
    }
    //validasi input konfirm password
    else if (($_POST['password_baru']) != ($_POST['konf_password'])) {
            echo "<script language='JavaScript'>
            alert('Gagal memperbaharui Password !, Pastikan Password baru dan konfirmasi Password sudah sesuai !');
            document.location='ganti_passmitra.php';
            </script>";    
    }
    else {
    //update data
    $query = "UPDATE tb_user SET password='$password_baru' WHERE username='$username'";
    $sql = mysqli_query ($link,$query);
    //setelah berhasil update
    if ($sql) {
        echo "<script language='JavaScript'>
            alert('Password berhasil diperbaharui !');
            document.location='../Data Splitter/viewmitra.php';
            </script>";    
    } else {
        echo "<script language='JavaScript'>
            alert('Gagal memperbaharui Password !, silahkan ulang kembali!');
            document.location='ganti_passmitra.php';
            </script>";    
    }
    }}
?>

      <div class="innertube">
     <h1 style="color: black; text-align: center;">Ubah Password Anda</h1>
    <form action="#" method="POST" name="submit">
      <table width="500px">
<tr>
   <td style="text-align: center;">Inisial</td><td><input style="width: 300px;" type="text" name="username" placeholder="masukan username atau inisial anda"></td>
</tr>
<tr>
   <td style="text-align: center;">Password Lama</td><td><input style="width: 300px;" type="password" name="password_lama" placeholder="masukan password lama anda "></td>
</tr>
<tr>
   <td style="text-align: center;">Password Baru</td><td><input style="width: 300px;" type="password" name="password_baru" placeholder="buat password baru"></td>
</tr>
<tr>
   <td style="text-align: center;">Konfirmasi</td><td><input style="width: 300px;" type="password" name="konf_password" placeholder="ulangi password baru"></td>
</tr>
<tr>
   <td align="center" colspan="2" ><input type="submit" name="Ganti" value="SUBMIT"><input type="button" name="batal" value="BATAL" onclick="javascript:window.location='ganti_passmitra.php';"></td>
</tr>
       
</table>
    </form> 

      </div>
    </main>
    <footer id="footer">
      <div>
        <p style="color: white; font-size: 12px;text-align: center;font-style: bold-italic;">-COPYRIGHTS FR11-</p>
</div>
    </footer>  

</body>
</html>