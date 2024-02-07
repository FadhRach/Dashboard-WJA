<!DOCTYPE html>
<html lang="en">
    <head>
        <?php
            $url=$_SERVER['REQUEST_URI'];
            header("Refresh: 600; URL=$url");
            include "koneksi.php";
        ?>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Dashboard WJA</title>
	
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand">WEST JAVA AREA</a>
                </div>
                <ul class="nav navbar-nav navbar-left navbar-top-links">
                    <li><a href="#"><i class="fa fa-home fa-fw"></i> Lintasarta Bandung</a></li>
                </ul>

                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="index.php"><i class="fa fa-dashboard fa-fw"></i> Dashboard Gangguan</a>
                            </li>
                            <li>
                                <a href="/backupconfig/index.html"><i class="fa fa-edit fa-fw"></i> B/U Config Pelanggan KAM</a>
                            </li>
			                <li>
                                <a href="/ggnberulang/index.php"><i class="fa fa-edit fa-fw"></i> Data Gangguan Berulang</a>
                            </li>
                            <li>
                                <a href="register.php" > <i class="fa fa-edit fa-fw"></i> Register</a>    
                            </li>
                            <li>
                                <a href="logout.php" > <i class="fa fa-sign-out"></i> Logout</a>    
                            </li>    
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Dashboard Gangguan WJA</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
               </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-ticket fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        <?php
                                            $sql="select * from wja order by createdtime asc";
                                            $hasil=mysqli_query($link,$sql);
                                            $no=0;
                                            while ($row = mysqli_fetch_array($hasil)) {
                                                $no++;}
                                            echo $no;
                                        ?>
                                        </div>
                                        <div>TOTAL TICKET</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-clock-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                            <?php
                                                $sql2="SELECT * FROM `wja` WHERE `ticket_status`=' On-Hold ' AND `ticketcategories`=' Technical Complaint '";
                                                $hasil2=mysqli_query($link,$sql2);
                                                $no2=0;
                                                while ($row = mysqli_fetch_array($hasil2)) {
                                                    $no2++;}
                                                echo $no2;
                                            ?>
                                        </div>
                                        <div>Gangguan Stop Clock</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-eye fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        <?php
                                            $sql2="SELECT * FROM `wja` WHERE `ticketcategories`=' Request ' OR `ticketcategories`=' Preventive Maintenance Request '";
                                            $hasil2=mysqli_query($link,$sql2);
                                            $no2=0;
                                            while ($row = mysqli_fetch_array($hasil2)) {
                                                $no2++;}
                                            echo $no2;
                                        ?>
                                        </div>
                                        <div>Tiket PM / Request</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-exclamation-triangle fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                        <?php
                                            $sql2="SELECT * FROM `wja` WHERE (`ticket_status`=' Open ' OR `ticket_status`=' Re-Open ') AND `ticketcategories`=' Technical Complaint '";
                                            $hasil2=mysqli_query($link,$sql2);
                                            $no2=0;
                                            while ($row = mysqli_fetch_array($hasil2)) {
                                            $no2++;}
                                            echo $no2;
                                        ?>                          
                                        </div>
                                        <div>Tiket Gangguan Open</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="container-fluid">
                                <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                                    <table class="w-full text-sm text-left text-gray-500">
                                        <thead class="text-xl text-gray-700 uppercase bg-gray-50">
                                            <tr>
                                                <th scope="col" class="px-6 py-3">
                                                    No
                                                </th>
                                                <th scope="col" class="px-6 py-3">
                                                    Nomor Jaringan
                                                </th>
                                                <th scope="col" class="px-6 py-3">
                                                    Nomor Tiket
                                                </th>
                                                <th scope="col" class="px-6 py-3">
                                                    Deskripsi Gangguan
                                                </th>
                                                <th scope="col" class="px-6 py-3">
                                                    Nama Pelanggan
                                                </th>
                                                <th scope="col" class="px-6 py-3">
                                                    Status
                                                </th>
                                                <th scope="col" class="px-6 py-3">
                                                    Durasi (Case Age)
                                                </th>
                                                <th scope="col" class="px-6 py-3">
                                                    Kategori
                                                </th>
                                                <th scope="col" class="px-6 py-3">
                                                    Start Tiket
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- buat kedepannya harus kayak gimana pake width -->
                                            <tr class="bg-white border-b hover:bg-gray-50 text-2xl">
                                                <td class="px-6 py-2">
                                                    1
                                                </td>
                                                <td class="px-6 py-2">
                                                    2024301301
                                                </td>
                                                <td class="px-6 py-2">
                                                    2024-000000002
                                                </td>
                                                <td class="px-6 py-2" style="white-space: nowrap;">
                                                    2010006320 - S1DMJLA031 / S1BMJL01UC - DISKOM GANGGUAN
                                                </td>
                                                <td class="px-6 py-2" style="white-space: nowrap;">
                                                    DINAS KOMUNIKASI DAN INFORMATIKA KOTA CIMAHI
                                                </td>
                                                <td class="px-6 py-2">
                                                    Open
                                                </td>
                                                <td class="px-6 py-2">
                                                    27 jam 43 menit
                                                </td>
                                                <td class="px-6 py-2">
                                                    Technical Complaint
                                                </td>
                                                <td>
                                                    06-02-2024 07:59 AM
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/startmin.js"></script>


    </body>
</html>
