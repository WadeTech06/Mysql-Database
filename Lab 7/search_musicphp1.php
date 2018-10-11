<?
session_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "
http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Search</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="javascript.js"></script>
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
<center>
<?php
$con = mysql_connect("localhost","root","");
if($con)
{
mysql_select_db("appstore",$con);
$type = $_POST['type'];
if( $type == 'MUSIC'){
$query="select * from music where Albumname='$_POST[searchname]' ";
$result=mysql_query($query);
-1-
C:\Users\Sun\Desktop\Work\ClassNotes\CIS430\LabAssignment\Lab5\search_musicapp1.php Tuesday, December 04, 2012 8:09 PM
$count=mysql_num_rows($result);
if($count==0)
{
echo "<h2>Music Album Not Found Try One more time</h2>";
}
else
{
echo "<h2>Congrats Music Album Found!! </h2>";
while ($myrow = mysql_fetch_array($result))
{
$Albumname = $myrow['Albumname'];
$Price = $myrow['price'];
$Count =$myrow['count'];
echo "Albumname: ".$myrow['Albumname']."<br><br>";
echo "Price: ".$myrow['price']."<br><br><br><br>";
echo "Language: ".$myrow['Language']."<br><br><br><br>";
echo "Size: ".$myrow['size']."<br><br><br><br>";
echo "Count: ".$myrow['count']."<br><br><br><br>";
$_SESSION['Type'] = 'Music';
echo " <form action='addcart.php' onsubmit='return check(this)' method='post'>
 <input type='hidden' name='productname' value='$Albumname'>
 <input type='hidden' name='Price' value='$Price'>
 <input type='hidden' name='Count' value='$Count'>
 <input type='submit' value='Add cart'> </form> <br><br> ";
}
}
}else if($type == 'APP')
{
$query="select * from app where Appname='$_POST[searchname]' ";
$result=mysql_query($query);
$count=mysql_num_rows($result);
if($count==0)
{
echo "<h2>Application Not Found Try One more time</h2>";
}
else
{
echo "<h2>Congrats Application Found!! </h2>";
while ($myrow = mysql_fetch_array($result))
{
$Appname = $myrow['Appname'];
$Price = $myrow['Price'];
echo "Applicaitonname: ".$myrow['Appname'].
"<br><br>";
echo "Description: ".$myrow['Description'].
"<br><br><br><br>";
echo "Category: ".$myrow['category'].
"<br><br><br><br>";
echo "Size: ".$myrow['size']."<br><br><br><br>";
echo "Version: ".$myrow['Version'].
"<br><br><br><br>";
-2-
C:\Users\Sun\Desktop\Work\ClassNotes\CIS430\LabAssignment\Lab5\search_musicapp1.php Tuesday, December 04, 2012 8:09 PM
echo "Price: ".$myrow['Price'].
"<br><br><br><br>";
$_SESSION['Type'] = 'App';
echo " <form action='addcart1.php'
method='post'>
 <input type='hidden' name='productname'
value='$Appname'>
 <input type='hidden' name='Price' value='$Price'>
 <input type='submit' value='Add cart'>
</form> <br><br> ";
}
}
}
else {
echo"<h3> Please enter the correct choice</h3>";
}
}
else
{
echo "<h3>sorry connection failed</h3>";
}
?>
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