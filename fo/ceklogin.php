<?php
session_start();
include 'koneksi.php';
 ?>

<?php
// menangkap data yang dikirim dari form login
$username=$_POST["username"];
$password=$_POST["password"];

// menyeleksi data user dengan username dan password yang sesuai
$login = mysqli_query($link,"select * from tb_user where username ='$username' and password ='$password'");
// menghitung jumlah data yang ditemukan
$cek = mysqli_num_rows($login);
// cek apakah username dan password di temukan pada database
if($cek > 0){
$data = mysqli_fetch_assoc($login);
$useraktif=$data['nama'];
	session_start();
	$_SESSION['username'] = $useraktif;
	$_SESSION['status'] = "login";
	// cek jika user login sebagai admin
	if($data['level']=="admin"){

		// alihkan ke halaman dashboard admin
		header("location:Data Splitter/admin_splitter.php");
		}
		elseif ($data['level']=="view") {
			header("location:Data Splitter/view.php");// alihkan ke halaman view
		}
		else {
			header("location:PSB/form_psbmitra.php");// alihkan ke halaman mitra
		}
	}else{
		echo "
        <script type='text/javascript'>
        alert('Username atau Password Anda Salah!');
        history.back(self);
        </script>";
	}
?>