<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Dashboard WJA</title>
       <?php
        $url=$_SERVER['REQUEST_URI'];
        header("Refresh: 600; URL=$url");
	    include "../koneksi.php";
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
    <div>
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
                                <a href="/backupconfig/index.php"><i class="fa fa-edit fa-fw"></i> B/U Config Pelanggan KAM</a>
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
                            <div class="text-left">
                                <h1 class="page-header">Data Gangguan Berulang</h1>
                            </div>
                        </div>
                    </div>
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
                                                <?php
                                                    $sqla="select * from tiket order by ticket_no asc";
                                                    $hasila=mysqli_query($link,$sqla);
                                                    $noa=0;
                                                        while ($rowa = mysqli_fetch_array($hasila)) {
                                                    $noa++;}       
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
                                                <?php echo $noa++;?>
                                            </div>
                                            <div>CASE BERULANG DALAM PERIODE TERTENTU</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6"></div>
                                    <div class="col-md-6"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div><!-- /#wrapper -->
        

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
