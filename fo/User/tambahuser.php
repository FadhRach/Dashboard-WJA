    <?php
        
        $nama = $_POST['nama'];
        $username = $_POST['username'];
        $password = $_POST['password'];
        $level = $_POST['level'];

        //validasi data data kosong
        if (empty($_POST['nama'])||empty($_POST['username'])||empty($_POST['password'])) {
            echo "<script>window.alert(' Cek Kembali Data yang tidak boleh kosong ..! ');
  window.location=('user.php')</script>";
        }
        else {
        include "../koneksi.php";

        //Masukan data ke Table
        $input = "INSERT INTO tb_user (nama,username,password,level) VALUES ('$nama','$username','$password','$level')";
        $query_input = mysqli_query($link, $input);
        if ($query_input) {
        //Jika Sukses
           echo "<script>window.alert('Username dan Password pengguna baru telah ditambahkan ');
  window.location=('user.php')</script>";
        }
        else {
        //Jika Gagal
        echo "Gagal menambah user, Silahkan diulangi!";
        }
    //Tutup koneksi engine MySQL
        mysql_close($Open);
        }
    ?>