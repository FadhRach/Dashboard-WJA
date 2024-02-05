<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <?php
        $url=$_SERVER['REQUEST_URI'];
        header("Refresh: 600; URL=$url");
	
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
                                <a href="index.php"><i class="fa fa-dashboard fa-fw"></i> Dashboard Gangguan</a>
                            </li>
                            
                                                        <li>
                                <a href="/backupconfig/index.html"><i class="fa fa-edit fa-fw"></i> Back Up Config Pelanggan KAM</a>
                            </li>
							<li>
                                <a href="/ggnberulang/index.php"><i class="fa fa-edit fa-fw"></i> Data Gangguan Berulang</a>
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
                            <h1 class="page-header">    
				<?php 
      					include 'koneksi.php'; 
      					$id = $_GET['id'];
						$query = mysqli_query($link,"select * from tiket where service_instance_id ='$id'");
						$data = mysqli_fetch_array($query);
      					echo $id.' - '.$data['parent_id'];
    				?>

			    </h1>
                        </div>

                        <!-- /.col-lg-12 -->
                    </div>
                </div>
                    <!-- /.row -->
<div class="row">
<div class="col-lg-8 col-md-6">
<table border="1" width="800px" class="table table-striped table-bordered table-hover table-responsive">
                        <tr>
                           <th style="text-align: center;">No</th>
                           <th style="text-align: center;">Nomor Tiket</th>
                           <th style="text-align: center;">Deskripsi Gangguan</th>
                           <th style="text-align: center;">Tanggal</th>
                        </tr>
        <?php
        $no=0;
		$query = mysqli_query($link,"select * from tiket where service_instance_id ='$id'");
		while ($data = mysqli_fetch_array($query)) {
            $no++;
            ?>
        <tbody>
            <tr>
                <td><?php echo $no;?></td>
                <td><?php echo $data["ticket_no"];   ?></td>
                <td><?php echo $data["ticket_title"];   ?></td>
                <td><?php echo $data["createdtime"];   ?></td>
            </tr>
        </tbody>
    <?php
        }
        ?>		
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
