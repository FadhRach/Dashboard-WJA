<!DOCTYPE html>
<html>
<head>
    <title>Add User</title>
</head>
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 15px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #0be3e3;
  color: black;
}
.wrap{
  word-wrap: break-word;
}

</style>
<body style="background-image: url(add.png); background-size: cover;">
<div class="topnav">
  <a href="../Data Splitter/admin_splitter.php">Data Splitter</a>
  <a href="../PSB/form_psb.php">Form PSB</a>
  <a href="../PSB/data_psb.php">Data PSB</a>
  <a href="../Pelanggan/data_pelanggan.php">Data Pelanggan</a>
  <a href="../Cabut/form_cabut.php">Form Cabut</a>
  <a href="../Cabut/data_cabut.php">Data Cabut</a>
  <a class="active" href="user.php">Akun / User</a>
  <a style="width:400px; font-family: calibri; font-size: 10; text-align: right;">PT. Aplikanusa Lintasarta</a>
  <a style="background-color: red;" href="../logout.php" onclick="return confirm('Apakah Anda Yakin Untuk Logout ?')">LOGOUT</a>
  
</div>
<div style="height: 500px">
 <h2 style="text-align: center; color: white;">Tambah Data User Baru</h2>
  

    <form action="tambahuser.php" method="post">        
        <table style="font-family: calibri; font-size: 12 ;" align="center">
           <tr>
                <td width="200px" style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Nama</td>
                <td width="300px"><input style="width: 300px" type="text" name="nama" placeholder="Masukan Nama Lengkap Pengguna"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Username</td>
                <td><input style="width: 200px" type="text" name="username" placeholder="Masukan Inisial Pengguna"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Password</td>
                <td><input style="width: 200px" type="password" name="password" placeholder="Buat Password"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">level</td>
                <td><select style="width: 100px" type="text" name="level" placeholder="pilih privilage pengguna baru">
                  <option value="admin">ADMIN</option>
                  <option value="view">VIEW</option>
                  <option value="mitra">MITRA</option></select></td>
            </tr>
             <tr style="height: 50px">
                <td align="center" colspan="2" style="background-color:rgb(0, 0, 0, 0.6);"><input type="submit" value="Tambahkan"><input type="button" name="batal" value="BATAL" onclick="javascript:window.location='user.php';"></td>
            </tr>
        </table>
    </form>
</div>
<div style="text-align: center; font-family: calibri; color: white; background-color: black">
  <h4>COPYRIGHTS FR11</h4>
</div>
   
</body>
</html>