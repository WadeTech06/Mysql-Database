<?
session_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "
http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Search </title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="javascript.js" type="text/javascript"></script>
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/cufon-replace.js" type="text/javascript"></script>
<script src="js/Bauhaus_Md_BT_400.font.js" type="text/javascript"></script>
<!--[if lt IE 7]>
 <script type="text/javascript" src="js/ie_png.js"></script>
 <script type="text/javascript">
 ie_png.fix('.png');
 </script>
<![endif]-->
</head>
<body id="page1">
<div class="tail-cont">
<div class="tail-top-left"></div>
<div class="tail-top">
<div class="container">
<!-- header -->
<div id="header">
<div class="logo"><a href="index.html"><img src="images/logo.jpg" alt="" />
</a></div>
<ul class="site-nav">
<li><a href="search_musicapp.php">Search</a></li>
<li><a href="Allapps.php">APPS</a></li>
<li><a href="Allalbums.php">MUSIC</a></li>
<li><a href="transactions.php">View Transactions</a></li>
<li class="last"><a href="logout1.php" class="act">Logout</a></li>
</ul>
</div>
<!-- content -->
<div class="indent">
<div class="indent1">
<?php
session_start();
$custn = $_SESSION['custname'];
echo "<h2>Welcome $custn </h2>";
?>
<center>
<h3>Search </h3>
<form action="search_musicapp1.php" onsubmit=
"return check(this)" method="post">
-1-
C:\Users\Sun\Desktop\Work\ClassNotes\CIS430\LabAssignment\Lab5\search_musicapp.php Tuesday, December 04, 2012 8:09 PM
</select></br></br>
<p>Enter Name : <input type="text" name="searchname">
<br><br>
<p>Select category Type:
<input type="radio" name="type" value="MUSIC" checked> MUSIC
<input type="radio" name="type" value="APP"> APP</br></br>
<br><br>
<input type="submit" value="Search">
<input type="reset" value="Reset">
<br><br>
</form>
</center>
</div>
</div>
</div>
</div>
</div>
<div class="tail-bottom png">
<!-- footer -->
<div id="footer">
<div class="container">
<div class="indent">
<div align="center">Copyright © 2012 </div>
<div align="center">All Rights Reserved.</div>
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
