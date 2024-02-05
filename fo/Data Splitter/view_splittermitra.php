<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DATA SPLITTER WJA</title>
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
      background-image: url(la.png);
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
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: blue;
  color: yellow;
}
    </style>
   </style>
</head>
<body>
  <header id="header">
      <div class="header">
          <a class="active" href="viewmitra.php">Data Splitter</a>
  <a href="../PSB/form_psbmitra.php">Form PSB</a>
  <a style="width:850px; font-family: calibri; font-size: 10; text-align: right; color: aqua;">PT. Aplikanusa Lintasarta</a>
  <a style="background-color: red;" href="../logout.php">LOGOUT</a>
      </div>
    </header>
    <main>
      <?php 
      include '../koneksi.php'; 
      $id = $_GET['id'];
      $query = mysqli_query($link,"select * from tb_splitter where nama_splitter ='$id'");
      $data = mysqli_fetch_array($query);
        
      if(isset($_POST['update']))
      {
        $nama_splitter = $_POST['nama_splitter'];
        $nama_node = $_POST['nama_node'];
        $Koordinat = $_POST['latlong'];
        $input1 = $_POST['input1'];
        $input2 = $_POST['input2'];
        $output1 = $_POST['output1'];
        $output2 = $_POST['output2'];
        $output3 = $_POST['output3'];
        $output4 = $_POST['output4'];
        $output5 = $_POST['output5'];
        $output6 = $_POST['output6'];
        $output7 = $_POST['output7'];
        $output8 = $_POST['output8'];
        date_default_timezone_set('Asia/Jakarta');

      }
      ?>
      <div class="innertube">
     <h1 style="color: white; text-align: center;">Lihat data Splitter</h1>
        <form name="update" method="POST">        
        <table align="center" style="color: white; font-size: 14; font-family: sans-serif;" >
            <tr>
                <td width="200px" style="background-color:rgb(0, 0, 0, 0.6); ">Nama Splitter</td>
                <td width="300px"><input style="width: 300px" type="text" name="nama_splitter" value="<?php echo $data["nama_splitter"]; ?>" readonly></td>
            </tr>
            <tr>
                <td>Nama Node</td>
                <td><input style="width: 200px" type="text" name="nama_node" value="<?php echo $data["nama_node"]; ?>" readonly></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6);">Koordinat (Latlong)</td>
                <td><input style="width: 200px" type="text" name="latlong" value="<?php echo $data["latlong"]; ?>" readonly></td>
            </tr>
            <tr>
                <td>Input 1</td>
                <td><input style="width: 300px" type="text" name="input1" value="<?php echo $data["input1"]; ?>" readonly></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6);">Input 2</td>
                <td><input style="width: 300px" type="text" name="input2" value="<?php echo $data["input2"]; ?>" readonly></td>
            </tr>
             <tr>
                <td>Output 1</td>
                <td><input style="width: 300px" type="text" name="output1" value="<?php echo $data["output1"]; ?>" readonly></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6);">Output 2</td>
                <td><input style="width: 300px" type="text" name="output2" value="<?php echo $data["output2"]; ?>" readonly></td>
            </tr>
            <tr>
                <td>Output 3</td>
                <td><input style="width: 300px" type="text" name="output3" value="<?php echo $data["output3"]; ?>" readonly></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6);">Output 4</td>
                <td><input style="width: 300px" type="text" name="output4" value="<?php echo $data["output4"]; ?>" readonly></td>
            </tr>
            <tr>
                <td>Output 5</td>
                <td><input style="width: 300px" type="text" name="output5" value="<?php echo $data["output5"]; ?>" readonly></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6);">Output 6</td>
                <td><input style="width: 300px" type="text" name="output6" value="<?php echo $data["output6"]; ?>" readonly></td>
            </tr>
            <tr>
                <td>Output 7</td>
                <td><input style="width: 300px" type="text" name="output7" value="<?php echo $data["output7"]; ?>" readonly></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6);">Output 8</td>
                <td><input style="width: 300px" type="text" name="output8" value="<?php echo $data["output8"]; ?>" readonly></td>
            </tr>
            <tr>
                <td style="background-color:rgb(0, 0, 0, 0.6);">Last Updated</td>
                <td><input style="width: 100px" type="text" name="updated" value="<?php echo $data["updated"]; ?>" readonly></td>
            </tr>
            
            <tr style="height: 50px">
                <td align="center" colspan="2" style="background-color:rgb(0, 0, 0, 0.6);"><input type="button" name="batal" value="KEMBALI" onclick="javascript:window.location='viewmitra.php';"></td>
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