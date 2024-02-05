<?php
 session_start();
 session_destroy();
 echo "<script>window.alert(' Anda berhasil untuk Logout..!  Terima Kasih Telah Mengupdate Data ..! ');
  window.location=('login.php')</script>";
?>