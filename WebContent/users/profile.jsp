<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Minimal Navigation bar</title>



<link rel="stylesheet" href="../css/profile.css">
<link rel="stylesheet" href="../css/nav.css">


</head>

<body>

	<header id="header"> <logo>iCloud <font color="orange">PhotoGram</font></logo>

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
	</nav> <!-- Enter Content below. The header will follow the page down --> </header>


	<div id="profile">
		<a href="edit_profile.jsp"><img id="config" src="http://iconshow.me/media/images/ui/ios7-icons/png/256/gear-b.png" height="100"
			width="100"></a>
		<div id="profileimg">
			<img src="../images/pinguino.png" height="80%" width="70%"
				id="profile_image">
		</div>
		<br>
		<div id="profileinfo">
			<h2>nazivince</h2>
			<br>
			<b>Posts: 0</b>
			<div>
				<br>
			</div>
		</div>

	</div>
</body>

</html>