<!DOCTYPE html>
<html>
<head>
    <title>Add Splitter</title>
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
<body style="background-image: url(FO.jpg); background-size: cover;">
<div class="topnav">
  <a class="active" href="admin_splitter.php">Data Splitter</a>
   <a href="../PSB/form_psb.php">Form PSB</a>
  <a href="../PSB/data_psb.php">Data PSB</a>
  <a href="../Pelanggan/data_pelanggan.php">Data Pelanggan</a>
  <a href="../Cabut/form_cabut.php">Form Cabut</a>
  <a href="../Cabut/data_cabut.php">Data Cabut</a>
  <a href="../User/user.php">Akun / User</a>
  <a href="../peta.html">Peta</a>
  <a style="width:300px; font-family: calibri; font-size: 10; text-align: right;">PT. Aplikanusa Lintasarta</a>
  <a style="background-color: red;" href="../logout.php" onclick="return confirm('Apakah Anda Yakin Untuk Logout ?')">LOGOUT</a>
  
</div>
<div style="height: 500px">
 <h2 style="text-align: center; color: white;">Tambah Data Splitter West Java Area</h2>
  

    <form action="tambahsplitter.php" method="post">        
        <table style="font-family: calibri; font-size: 12 ;" align="center">
           <tr>
                <td width="200px" style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Nama Splitter</td>
                <td width="300px"><input style="width: 300px" type="text" name="nama_splitter" placeholder="Masukan Nama Splitter"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Nama Node</td>
                <td><input style="width: 200px" type="text" name="nama_node" placeholder="Masukan Catuan Node Splitter"></td>
            </tr>
	     <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Latitude</td>
                <td><input style="width: 200px" type="text" name="lat" placeholder="format desimal misal -6.02010"></td>
            </tr>
             <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Longitude</td>
                <td><input style="width: 200px" type="text" name="lng" placeholder="format desimal misal 107.2351"></td>
            </tr
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Input 1</td>
                <td><input style="width: 300px" type="text" name="input1" placeholder="datek core input 1"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Input 2</td>
                <td><input style="width: 300px" type="text" name="input2" placeholder="datek core input 2"></td>
            </tr>
             <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Output 1</td>
                <td><input style="width: 300px" type="text" name="output1"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Output 2</td>
                <td><input style="width: 300px" type="text" name="output2"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Output 3</td>
                <td><input style="width: 300px" type="text" name="output3"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Output 4</td>
                <td><input style="width: 300px" type="text" name="output4"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Output 5</td>
                <td><input style="width: 300px" type="text" name="output5"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Output 6</td>
                <td><input style="width: 300px" type="text" name="output6"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Output 7</td>
                <td><input style="width: 300px" type="text" name="output7"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(255, 255, 255, 0.4);color: white; ">Output 8</td>
                <td><input style="width: 300px" type="text" name="output8"></td>
            </tr>
             <tr style="height: 50px">
                <td align="center" colspan="2" style="background-color:rgb(0, 0, 0, 0.6);"><input type="submit" value="Tambahkan"><input type="button" name="batal" value="BATAL" onclick="javascript:window.location='admin_splitter.php';"></td>
            </tr>
        </table>
    </form>
</div>
<div style="text-align: center; font-family: calibri; color: white; background-color: black">
  <h4>COPYRIGHTS FR11</h4>
</div>
   
</body>
</html>