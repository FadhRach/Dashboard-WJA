<!DOCTYPE html>
<html>
<head>
    <title>
        Database Splitter WJA
    </title>
    <style type="text/css">
        
.background{
    background-image: url('la2.png');

}
.tulisan_login{
    text-align: center;
    /*membuat semua huruf menjadi kapital*/
    text-transform: uppercase;
}
 
.kotak_login{
    width: 350px;
    background: white;
    /*meletakkan form ke tengah*/
    margin: 80px auto;
    padding: 30px 20px;
}
 
label{
    font-size: 11pt;
}
 
.form_login{
    /*membuat lebar form penuh*/
    box-sizing : border-box;
    width: 100%;
    padding: 10px;
    font-size: 11pt;
    margin-bottom: 20px;
}
 
.tombol_login{
    background: #20B2AA;
    color: white;
    font-size: 11pt;
    width: 100%;
    border: none;
    border-radius: 3px;
    padding: 10px 20px;
}
    </style>
</head>
<body class="background">
<h1 style="text-align:center; color: #20B2AA; background: white;">WEST JAVA AREA SPLITTER DATABASE</h1>
 
    <div class="kotak_login">
        <p class="tulisan_login">Silahkan login</p>
 
        <form action="ceklogin.php" method="post">
            <label>Username</label>
            <input type="text" name="username" class="form_login" placeholder="masukan inisial anda ..">
 
            <label>Password</label>
            <input type="password" name="password" class="form_login" placeholder="Password ..">
 
            <input type="submit" class="tombol_login" value="LOGIN">
 
            <br/>
            <br/>
        </form>
        
    </div>
</body>
</html>