<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EDIT DATA USER</title>
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
      background-image: url('../Data Splitter/la.png');
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
  color: yellow;
}
    </style>
   </style>
</head>
<body>
  <header id="header">
      <div class="header">
  <a  href="../Data Splitter/admin_splitter.php">Data Splitter</a>
  <a href="../PSB/form_psb.php">Form PSB</a>
  <a href="../PSB/data_psb.php">Data PSB</a>
  <a href="../Pelanggan/data_pelanggan.php">Data Pelanggan</a>
  <a href="../Cabut/form_cabut.php">Form Cabut</a>
  <a href="../Cabut/data_cabut.php">Data Cabut</a>
  <a class="active" href="user.php">Akun / User</a>
  <a style="width:400px; font-family: calibri; font-size: 10; text-align: right;">PT. Aplikanusa Lintasarta</a>
  <a style="background-color: red;" href="../logout.php" onclick="return confirm('Apakah Anda Yakin Untuk Logout ?')">LOGOUT</a>
      </div>
    </header>
    <main>
      <?php 
      include '../koneksi.php'; 
      $id = $_GET['id'];
      $query = mysqli_query($link,"select * from tb_user where nama ='$id'");
      $data = mysqli_fetch_array($query);
        
      if(isset($_POST['update']))
      {
        $nama = $_POST['nama'];
        $username = $_POST['username'];
        $password = $_POST['password'];
        $level = $_POST['level'];


        $edit = mysqli_query($link,"update tb_user set nama = '$nama', password = '$password', level = '$level' where username ='$username';");

        if($edit){
          echo '<script>alert("Update Data User Berhasil !!")</script>';
          header("location:user.php");
        }
        else
        {
          echo "Update Data GAGAL !!".mysqli_error($link);
        }
        mysqli_close($link);
      }
      ?>
      <div class="innertube">
     <h1 style="color: white; text-align: center;">Edit data User</h1>
        <form name="update" method="POST">        
        <table align="center" style="color: white; font-size: 14; font-family: sans-serif;" >
            <tr>
                <td width="200px" style="background-color:rgb(0, 0, 0, 0.6); ">Nama Lengkap</td>
                <td width="300px"><input style="width: 300px" type="text" name="nama" value="<?php echo $data["nama"]; ?>"></td>
            </tr>
            <tr>
                <td>Username</td>
                <td><input style="width: 200px" type="text" name="username" value="<?php echo $data["username"]; ?>"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6);">password</td>
                <td><input style="width: 200px" type="text" name="password" value="<?php echo $data["password"]; ?>"></td>
            </tr>
            <tr>
                <td>Level</td>
                <td><select style="width: 100px" type="text" name="level" placeholder="pilih privilage pengguna baru">
                  <option value="admin">ADMIN</option>
                  <option value="view">VIEW</option>
                  <option value="mitra">MITRA</option></select></td>
            </tr>
          
            
            <tr style="height: 50px">
                <td align="center" colspan="2" style="background-color:rgb(0, 0, 0, 0.6);"><input type="submit" name="update" value="UPDATE"><input type="button" name="batal" value="BATAL" onclick="javascript:window.location='user.php';"></td>
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