<?php
$sql2="select * from tiket order by createdtime asc";
$hasil2=mysqli_query($link,$sql2);
$nojar = $row["service_instance_id"];
$deskripsi = $row["ticket_title"];
$nama_pelanggan = $row["parent_id"];
$no_tiket = $row["ticket_no"];

//kelas berdasarkan durasi gangguan
date_default_timezone_set("Asia/Jakarta");
$now = date('d F Y h:i A');
$start = strtotime($row["createdtime"]);
$skrg = strtotime($now);
$detik = $skrg-$start;
$jam = floor($detik/(60*60));
$menit = $detik-$jam * 3600;
$hari = floor($detik/(24*60*60));
$sisajam = $detik-$hari*86400;
$jam2 = floor($sisajam/3600);
$sisamenit = $detik-($hari*86400+($jam2*3600));
$menits = floor($menit/60);
$token = "5330351206:AAG7cjjYHgOKWoIrhW8iGieaTC31-7XXRMU"; // token bot
 
$data = [
    'text' =>"Ticket Open 
		Nomor Tiket : $no_tiket
		Nomor Jaringan : $nojar
		Nama Pelanggan : $nama_pelanggan
		Deskripsi : $deskripsi
		Case Age : $hari hari $jam2 jam $menits menit",
    'chat_id' => '-842725654'  
];
 


  ?>