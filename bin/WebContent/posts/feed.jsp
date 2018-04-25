<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Minimal Navigation bar</title>



<link rel="stylesheet" href="../css/feed.css">


</head>

<body>

	<header id="header"> <logo>Photo<font color="pink">Gram</font></logo>

	<center>
		<a href="javascript:add();" style="text-decoration: none;"> <img
			src="http://iconshow.me/download.php?file=path/media/images/ui/slim-square-icons/png/128/add.png"
			alt="add" title="add" class="icon">
		</a> <a href="javascript:search();" style="text-decoration: none;"> <img
			src="http://iconshow.me/download.php?file=path/media/images/ui/slim-square-icons/png/128/search.png"
			id="action" alt="EditIcon" title="Edit Sites" class="icon">
		</a> <a href="javascript:setting();" style="text-decoration: none;"> <img
			src="http://iconshow.me/download.php?file=path/media/images/ui/ios7-icons/png/128/gear-outline.png"
			id="action" alt="EditIcon" title="Setting" class="icon">
		</a>
	</center>

	<nav id="right" style="right: 0.5em;">
	<ul>
		<li><a href="javascript:share();" style="text-decoration: none;">
				<img 
				src="http://iconshow.me/download.php?file=path/media/images/ui/iOS7-optimized-icon/png/128/44.share.png"
				alt="Lock" title="Logout" class="icon" />
		</a></li>
	</ul>
	</nav> </header>
	<div id="feed">
		<div class="post">
			<div class="user">
				<img class="profile" alt="" src="http://www.anaivanovic.com/sites/default/files/styles/flexslider_full_mobile/public/profile.jpg?itok=50Q_EqHf">
				Pepito
			</div>
			<img class="image" alt="gradient" src="http://blog.hdwallsource.com/wp-content/uploads/2014/11/gradients-26042-26727-hd-wallpapers.jpg">
			<div class="info">
			foto por mi, un gradient
			</div>
		</div>
		<div class="post">
			<div class="user">
				<img class="profile" alt="" src="http://www.anaivanovic.com/sites/default/files/styles/flexslider_full_mobile/public/profile.jpg?itok=50Q_EqHf">
				Pepito
			</div>
			<img class="image" alt="gradient" src="http://blog.hdwallsource.com/wp-content/uploads/2014/11/gradients-26042-26727-hd-wallpapers.jpg">
			<div class="info">
			foto por mi, un gradient
			</div>
		</div>
	</div>
</body>

</html>
