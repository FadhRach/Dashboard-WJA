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
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
                                <a href="../index.php"><i class="fa fa-dashboard fa-fw"></i> Dashboard Gangguan</a>
                            </li>
                            
                            <li>
                                <a href="/fo/login.php"><i class="fa fa-table fa-fw"></i> Data Splitter WJA</a>
                            </li>
                            <li>
                                <a href="/backupconfig/index.html"><i class="fa fa-edit fa-fw"></i> Back Up Config Pelanggan KAM</a>
                            </li>
							<li>
                                <a href="/ggnberulang/index.html"><i class="fa fa-edit fa-fw"></i> Data Gangguan Berulang</a>
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
                            <h1 class="page-header">Data Gangguan Berulang</h1>
                        </div>

                        <!-- /.col-lg-12 -->
                    </div>
                                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-refresh fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
    <?php
        $sql="select * from berulang order by tickets asc";
        $hasil=mysqli_query($link,$sql);
        $no=0;
while ($row = mysqli_fetch_array($hasil)) {
            $no++;}
            echo $no;
            ?>
                                            </div>
                                            <div>CASE BERULANG DALAM 1 BULAN</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-refresh fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
Comming Soon
                                            </div>
                                            <div>CASE BERULANG DALAM 1 MINGGU</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
			<div class="row">
                        <div class="col-lg-6 col-md-6">

<table border="1" width="800px" class="table table-striped table-bordered table-hover table-responsive">
                        <tr>
                           <th style="text-align: center;">No</th>
                           <th style="text-align: center;">Nomor Jaringan</th>
                           <th style="text-align: center;">Nama Pelanggan</th>
                           <th colspan="2" style="text-align: center;"style="text-align: center;">Jumlah Tiket</th>
                        </tr>
        <?php
        $sql="select * from berulang order by tickets desc";
        $hasil=mysqli_query($link,$sql);
        $no=0;
while ($row = mysqli_fetch_array($hasil)) {
            $no++;
            ?>
        <tbody>
            <tr class= <?php include "class.php" ?>>
                <td><?php echo $no;?></td>
                <td><?php echo $row["service_instance_id"]; ?></td>
                <td><?php echo $row["parent_id"];   ?></td>
                <td><?php echo $row["tickets"];   ?></td>
	       <td><a href="detail_tickets.php?id=<?php echo $row["service_instance_id"]; ?>"><i class="fa fa-eye fa-fw"</a></td>
            </tr>
        </tbody>
    <?php
        }
        ?>		
			</div>
                    </div>
                </div>
                    </div>
                </div>

            <!-- /#page-wrapper -->
            

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="../js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../js/startmin.js"></script>


    </body>
</html>
