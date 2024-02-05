<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#date" ).datepicker({
      dateFormat: "d MM yy "
    });
  } );
  </script>
    <title>Form PSB</title>
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
  font-size: 17px;
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
<body style="background-image: url(BG4.jpg);">
<? php 
  session_start();
  if($_SESSION['status'] !="login"){
  header("location:../PSB/form_psbv.php");
}
   ?>
<div class="topnav">
  <a href="../Data Splitter/view.php">Data Splitter</a>
  <a class="active" href="form_psbv.php">Form PSB</a>
  <a href="../PSB/data_psbv.php">Data PSB</a>
  <a href="../Pelanggan/data_pelangganv.php">Data Pelanggan</a>
  <a href="../Cabut/form_cabutv.php">Form Cabut</a>
  <a href="../Cabut/data_cabutv.php">Data Cabut</a>
  <a href="../Peta/petav.php">Peta Splitter</a>
  <a href="../User/ganti_pass.php">Ganti Password</a>
  <a style="font-family: calibri; font-size: 10; text-align: right;"><?php session_start(); echo "Selamat datang ". $_SESSION['username'];  ?></a>
  <a style="background-color: red;" href="../logout.php" onclick="return confirm('Apakah Anda Yakin Untuk Logout ?')">LOGOUT</a>
  
</div>
<div style="height: 500px">
  <h4 style="background-color:rgb(0, 0, 0, 0.6); color: white; text-align: center;">Input Data PSB Pelanggan GPON West Java Area</h4>
    <form action="#" method="post" name="form_psb">        
        <table style="font-family: calibri; font-size: 12" align="center" border="5px">
          <tr>
            <td colspan="2" style="background-color:rgb(0, 0, 0, 0.6); color: white; text-align: center;">Silahkan Isi Data Pada Kolom Tersedia!</td>
          </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white" width="200px" align="center" >Nomor Jaringan</td>
                <td style="width: 300px"><input type="text" name="nojar"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white" align="center">Nama Pelanggan</td>
                <td><input style="width: 300px" type="text" name="nama_pelanggan"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white" align="center">Alamat</td>
                <td><input class="wrap" style="width: 300px; height: 50px;"  type="text" name="alamat"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white" width="120" align="center">Jasa</td>
                <td><select name="jasa" >
                    <option value="Internet">Internet</option>
                    <option value="Metro-E">Metro-E</option>
                    <option value="VPN">VPN</option>
                  </select>
                </td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white" align="center">Catuan Splitter</td>
                <td><input style="width: 300px" type="text" name="nama_splitter" id="cari_splitter" class="form-control" placeholder="Temukan Splitter ..."></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white" align="center">Datek Port Splitter</td>
                <td><select name="port_splitter" >
                    <option value="output1">PORT 1</option>
                    <option value="output2">PORT 2</option>
                    <option value="output3">PORT 3</option>
                    <option value="output4">PORT 4</option>
                    <option value="output5">PORT 5</option>
                    <option value="output6">PORT 6</option>
                    <option value="output7">PORT 7</option>
                    <option value="output8">PORT 8</option>
                  </select>
                </td>
            </tr>
             <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white"align="center">MITRA Pelaksana</td>
                <td><select name="mitra" >
		    <option value="Mulia Karya">Internal LA</option>
                    <option value="Mulia Karya">Mulia Karya</option>
                    <option value="Bangun Bersama Mandiri">Bangun Bersama Mandiri</option>
                    <option value="Kisel">KISEL</option>
                    <option value="Kopkarla">KOPKARLA</option>
                    <option value="ANKI">ANKI</option>
		    <option value="TMM">TMM</option>
                  </select>
                </td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white" align="center">Panjang Tarikan FO</td>
                <td><input style="width: 100px" type="text" name="panjang_FO"> <label style="background-color: white;">Meter</label></td>
            </tr>
            <tr>
               <td style="background-color:rgb(0, 0, 0, 0.6); color: white" align="center">Tanggal Instalasi</td>  
               <td><input type="text"  id="date" name="tanggal"></td> 
            </tr>
            <tr style="height: 50px">
                <td align="center" colspan="2" style="background-color:rgb(0, 0, 0, 0.6);"><input type="submit" name="psb" value="Submit"></td>
            </tr>
            </table>
            <?php 
      include '../koneksi.php'; 
       
      if(isset($_POST['psb']))
      {
        $nojar = $_POST['nojar'];
        $nama_pelanggan = $_POST['nama_pelanggan'];
        $pelanggan = $_POST['nojar'].'-'.$_POST['nama_pelanggan'];
        $alamat = $_POST['alamat'];
        $jasa = $_POST['jasa'];
        $splitter = $_POST['nama_splitter'];
        $port = $_POST['port_splitter'];
        $mitra = $_POST['mitra'];
        $panjang = $_POST['panjang_FO'];
        $tanggal = $_POST['tanggal'];

        $psb = mysqli_query($link,"INSERT INTO tb_psb (nomor_jaringan,nama_pelanggan,alamat,jasa,splitter,port_splitter,mitra,panjang_FO,tanggal) VALUES('$nojar','$nama_pelanggan','$alamat','$jasa','$splitter','$port','$mitra','$panjang','$tanggal')");
               $node = mysqli_query($link,"select nama_node from tb_splitter where nama_splitter = '$splitter'");
               $nodename = mysqli_fetch_array($node);
               $namanode = $nodename["nama_node"];
        $insert = mysqli_query($link,"INSERT INTO tb_pelanggan (nomor_jaringan,nama_pelanggan,alamat,jasa,nama_node,status) VALUES('$nojar','$nama_pelanggan','$alamat','$jasa','$namanode','online')");
        $update = mysqli_query($link,"UPDATE tb_splitter set $port = '$pelanggan', updated = '$tanggal' where nama_splitter ='$splitter'");

        if($psb&&$update){
          echo '<script>alert("Input Data PSB Berhasil !!")</script>';
         
        }
        else
        {
          echo "Input Data GAGAL !!".mysqli_error($link);
        }
        mysqli_close($link);
      }
      ?>
    </form>
</div>
<script type="text/javascript">
  $(function() {
     $( "#cari_splitter" ).autocomplete({
       source: 'splitter_search.php',
     });
  });
</script>
</body>
</html>