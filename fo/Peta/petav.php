<!DOCTYPE html>
<html>

  <head>
    <title>Data Splitter WJA</title>
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
    integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
    crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
    integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
    crossorigin=""></script>

    <script
			  src="https://code.jquery.com/jquery-3.3.1.js"
			  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
			  crossorigin="anonymous"></script>


   <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.3.0/dist/MarkerCluster.css" />
   <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.3.0/dist/MarkerCluster.Default.css" />
   <script src="https://unpkg.com/leaflet.markercluster@1.3.0/dist/leaflet.markercluster.js"></script>



   
    
    <style>
      #map {position: absolute; top: 0; right: 0; bottom: 0; left: 0;}
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
  font-family: calibri;
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: rgb(70, 130, 180);
  color: white;
}
    </style>
    </style>

  </head>
   <body>
     <? php 
  session_start();
  if($_SESSION['status'] !="login"){
  header("location:../Peta/petav.php");
}
   ?>
    <header id="header">
      <div class="header">
  <a href="../Data Splitter/view.php">Data Splitter</a>
  <a href="../PSB/form_psbv.php">Form PSB</a>
  <a href="../PSB/data_psbv.php">Data PSB</a>
  <a href="../Pelanggan/data_pelangganv.php">Data Pelanggan</a>
  <a href="../Cabut/form_cabutv.php">Form Cabut</a>
  <a href="../Cabut/data_cabutv.php">Data Cabut</a>
  <a href="../User/ganti_pass.php">Ganti Password / User</a>
  <a class="active" href="../Peta/peta.php">Peta Splitter</a>
  <a style=" font-family: calibri; font-size: 10; text-align: right;"><?php session_start(); echo "Selamat datang ". $_SESSION['username'];  ?></a>
  <a style="background-color: red;" href="../logout.php" onclick="return confirm('Apakah Anda Yakin Untuk Logout ?')">LOGOUT</a>
      </div>
    </header>
 <main>
      <div class="innertube" id="map">
         <a href="https://www.maptiler.com" style="position:absolute;left:10px;bottom:10px;z-index:999;"><img src="https://api.maptiler.com/resources/logo.svg" alt="MapTiler logo"></a>
    </div>

    <p><a href="https://www.maptiler.com/copyright/" target="_blank">ï¿½ MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">ï¿½ OpenStreetMap contributors</a></p>
    

    <script>
      var mapOptions = {
      center: [-6.9022843951263395, 107.61885152234214],
      zoom: 9
    }
      var map = new L.map('map', mapOptions);
      L.tileLayer('https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=5OQcSXh8zyYsYxn8Chl0',{
        tileSize: 512,
        zoomOffset: -1,
        minZoom: 1,
        attribution: "\u003ca href=\"https://www.maptiler.com/copyright/\" target=\"_blank\"\u003e\u0026copy; MapTiler\u003c/a\u003e \u003ca href=\"https://www.openstreetmap.org/copyright\" target=\"_blank\"\u003e\u0026copy; OpenStreetMap contributors\u003c/a\u003e",
        crossOrigin: true
      }).addTo(map);

         

      var markers = L.markerClusterGroup();   
      $.getJSON('get.php', function(data) {
      for (var i = 0; i < data.length; i++) {
      var lat = data[i].lat;
      var lng = data[i].lng;  
      var nama = data[i].nama_splitter;
      var out1 = data[i].output1;
      var out2 = data[i].output2;
      var out3 = data[i].output3;
      var out4 = data[i].output4;
      var out5 = data[i].output5;
      var out6 = data[i].output6;
      var out7 = data[i].output7;
      var out8 = data[i].output8;






                var marker = L.marker([lat, lng]);
      var message = nama+ '<br>out1: ' +out1+  '<br>out2: ' +out2+ '<br>out3: ' +out3+ '<br>out4: ' +out4+ '<br>out5: ' +out5+ '<br>out6: ' +out6+ '<br>out7: ' +out7+ '<br>out8: ' +out8;
                        
                        marker.bindPopup(message);
      markers.addLayer(marker);
          }
    });

       map.addLayer(markers);

    </script>
      </div>
  </main>
         <footer id="footer">
      <div>
        <p style="color: white; font-size: 12px;text-align: center;font-style: bold-italic;">-COPYRIGHTS FAIRY HERYANA-</p>
</div>
    </footer>
  </body>
</html>