    <?php
        
        $nama_splitter = $_POST['nama_splitter'];
        $nama_node = $_POST['nama_node'];
	$latlong = "0";
	$lat = $_POST['lat'];
	$lng = $_POST['lng'];
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
        $tanggal = date('d F Y');
        //validasi data data kosong
        if (empty($_POST['nama_splitter'])||empty($_POST['nama_node'])||empty($_POST['lat'])) {
            echo "<script>window.alert(' Cek Kembali Data yang tidak boleh kosong ..! ');
  window.location=('add_splitter.php')</script>";
        }
        else {
        include "../koneksi.php";

        //Masukan data ke Table
        $input = "INSERT INTO tb_splitter (nama_splitter,nama_node,latlong,lat,lng,input1,input2,output1,output2,output3,output4,output5,output6,output7,output8,updated) VALUES ('$nama_splitter','$nama_node','$Koordinat','$lat','$lng','$input1','$input2','$output1','$output2','$output3','$output4','$output5','$output6','$output7','$output8','$tanggal')";
        $query_input = mysqli_query($link, $input);
        if ($query_input) {
        //Jika Sukses
           echo "<script>window.alert('Terima Kasih... Data Splitter Berhasil Ditambahkan..! ');
  window.location=('admin_splitter.php')</script>";
        }
        else {
        //Jika Gagal
        echo "Input Data Splitter Gagal!, Silahkan diulangi!";
        }
    //Tutup koneksi engine MySQL
        mysql_close($Open);
        }
    ?>