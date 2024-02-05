<!DOCTYPE html>
<html>
<head>
    <title>Form Cabut</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
<body style="background-image: url(form.jpg); background-size: cover">
<? php 
  session_start();
  if($_SESSION['status'] !="login"){
  header("location:../Cabut/form_cabutv.php");
}
   ?>
<div class="topnav">
  <a href="../Data Splitter/view.php">Data Splitter</a>
  <a href="../PSB/form_psbv.php">Form PSB</a>
  <a href="../PSB/data_psbv.php">Data PSB</a>
  <a href="../Pelanggan/data_pelangganv.php">Data Pelanggan</a>
  <a class="active" href="form_cabutv.php">Form Cabut</a>
  <a href="../Cabut/data_cabutv.php">Data Cabut</a>
  <a href="../Peta/petav.php">Peta Splitter</a>
  <a href="../User/ganti_pass.php">Ganti Password</a>
  <a style=" font-family: calibri; font-size: 10; text-align: right;"><?php session_start(); echo "Selamat datang ". $_SESSION['username'];  ?></a>
  <a style="background-color: red;" href="../logout.php" onclick="return confirm('Apakah Anda Yakin Untuk Logout ?')">LOGOUT</a>
  
</div>
<div style="height: 500px">
  <h4 style="background-color:rgb(0, 0, 0, 0.6); color: white; text-align: center;">Cabut Pelanggan GPON West Java Area</h4>
    <form action="#" method="post" name="form_cabut">     
        <table style="font-family: calibri; font-size: 12" align="center">
          <tr>
            <td colspan="2" style="background-color:rgb(0, 0, 0, 0.6); color: white; text-align: center;">Silahkan Isi Data Pada Kolom Tersedia!</td>
          </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white" width="200px" align="center" >Nomor Jaringan </td>
                <td style="width: 300px"><input type="text" name="nojar" id="nomor_jaringan" class="form-control" onchange='changeValue(this.value)' required>
                 <?php   
                 include "../koneksi.php";  
                          $result = mysqli_query($link, "select * from tb_pelanggan");  
                          $a          = "var nama_pelanggan = new Array();\n;";  
                          $b          = "var alamat = new Array();\n;";  
                          while ($row = mysqli_fetch_array($result)) {  
                          $a .= "nama_pelanggan['" . $row['nomor_jaringan'] . "'] = {nama_pelanggan:'" . addslashes($row['nama_pelanggan'])."'};\n";  
                          $b .= "alamat['" . $row['nomor_jaringan'] . "'] = {alamat:'" . addslashes($row['alamat'])."'};\n";  
                          }  
                          ?>  </td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white" align="center">Nama Pelanggan</td>
                <td><input style="width: 300px" type="text" name="nama_pelanggan" id="nama_pelanggan"></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white" align="center">Alamat</td>
                <td><input class="wrap" style="width: 300px; height: 50px;"  type="text" name="alamat" id="alamat"></td>
            </tr>
            <script type="text/javascript">   
                          <?php   
                          echo $a;   
                          echo $b; ?>  
                          function changeValue(id){  
                            document.getElementById('nama_pelanggan').value = nama_pelanggan[id].nama_pelanggan;  
                            document.getElementById('alamat').value = alamat[id].alamat;  
                          };  
                          </script>  
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6); color: white" width="120" align="center">PIC</td>
                <td><input style="width: 150px" type="text" name="pic"></td>
            </tr>
            <tr>
               <td style="background-color:rgb(0, 0, 0, 0.6); color: white" align="center">Tanggal Cabut</td>  
               <td><input style="width: 150px" type="text" name="tanggal" value="<?php echo(date('d F Y')); ?>" readonly=""></td> 
            </tr>
            <tr style="height: 50px">
                <td align="center" colspan="2" style="background-color:rgb(0, 0, 0, 0.6);"><input type="submit" name="cabut" value="Submit"></td>
            </tr> } ?>
            </table> 
            <?php 
            
        if(isset($_POST['cabut']))
      {
        $nojar = $_POST['nojar'];
        $nama_pelanggan = $_POST['nama_pelanggan'];
        $alamat = $_POST['alamat'];
        $pic = $_POST['pic'];
        $tanggal = $_POST['tanggal'];
        $cabut = mysqli_query($link,"INSERT INTO tb_cabut (nomor_jaringan,nama_pelanggan,alamat,pic,tanggal) VALUES('$nojar','$nama_pelanggan','$alamat','$pic','$tanggal')");
        $status = mysqli_query($link,"UPDATE `tb_pelanggan` SET `status`= 'cabut' WHERE `nomor_jaringan`= $nojar ");
        $datek = mysqli_query($link,"SELECT * FROM tb_splitter where output1 like '%".$nojar."%' or output2 like '%".$nojar."%' or output3 like '%".$nojar."%' or output4 like '%".$nojar."%' or output5 like '%".$nojar."%' or output6 like '%".$nojar."%' or output7 like '%".$nojar."%' or  output8 like '%".$nojar."%'");
        $dateksp = mysqli_fetch_array($datek);
               $splitter = $dateksp["nama_splitter"];
               $op1 = $dateksp["output1"];
               $output1 = substr($op1,0,10);
               $op2 = $dateksp["output2"];
               $output2 = substr($op2,0,10);
               $op3 = $dateksp["output3"];
               $output3 = substr($op3,0,10);
               $op4 = $dateksp["output4"];
               $output4 = substr($op4,0,10);
               $op5 = $dateksp["output5"];
               $output5 = substr($op5,0,10);
               $op6 = $dateksp["output6"];
               $output6 = substr($op6,0,10);
               $op7 = $dateksp["output7"];
               $output7 = substr($op7,0,10);
               $op8 = $dateksp["output8"];
               $output8 = substr($op8,0,10);
               if ($output1==$nojar) {
                 $update = mysqli_query($link,"UPDATE tb_splitter set output1 = 'KOSONG ex $nojar', updated = '$tanggal' where nama_splitter ='$splitter'");
               }
               elseif ($output2==$nojar) {
                 $update = mysqli_query($link,"UPDATE tb_splitter set output2 = 'KOSONG ex $nojar', updated = '$tanggal' where nama_splitter ='$splitter'");
               }
               elseif ($output3==$nojar) {
                 $update = mysqli_query($link,"UPDATE tb_splitter set output3 = 'KOSONG ex $nojar', updated = '$tanggal' where nama_splitter ='$splitter'");
               }
               elseif ($output4==$nojar) {
                 $update = mysqli_query($link,"UPDATE tb_splitter set output4 = 'KOSONG ex $nojar', updated = '$tanggal' where nama_splitter ='$splitter'");
               }
               elseif ($output5==$nojar) {
                 $update = mysqli_query($link,"UPDATE tb_splitter set output5 = 'KOSONG ex $nojar', updated = '$tanggal' where nama_splitter ='$splitter'");
               }
               elseif ($output6==$nojar) {
                 $update = mysqli_query($link,"UPDATE tb_splitter set output6 = 'KOSONG ex $nojar', updated = '$tanggal' where nama_splitter ='$splitter'");
               }
               elseif ($output7==$nojar) {
                 $update = mysqli_query($link,"UPDATE tb_splitter set output7 = 'KOSONG ex $nojar', updated = '$tanggal' where nama_splitter ='$splitter'");
               }
               elseif ($output8==$nojar) {
                 $update = mysqli_query($link,"UPDATE tb_splitter set output8 = 'KOSONG ex $nojar', updated = '$tanggal' where nama_splitter ='$splitter'");
               }
               else {
                echo '<script>alert(" GAGAL MENGUPDATE DATA SPLITTER !! Data Pelanggan Tidak Ditemukan !!")</script>';
               }

        if($update && $status){
          echo '<script>alert("UPDATE DATA SPLITTER BERHASIL !!")</script>';

        }
        else
        {
          echo "GAGAL MENGUPDATE DATA SPLITTER!!".mysqli_error($link);
        }
        mysqli_close($link);
      }
      ?>
    </form>

</div>
<div style="text-align: center; font-family: calibri; color: white; background-color: black">
  <h4 style="font-family: calibri;">COPYRIGHTS FR11</h4>
</div> 
</body>
</html>