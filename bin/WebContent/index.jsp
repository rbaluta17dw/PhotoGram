<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PhotoGram</title>
<jsp:include page="include/index.html"></jsp:include>
</head>

<body>
	<div id="login-button">
		<img src="http://pngimg.com/uploads/instagram/instagram_PNG3.png">
	</div>
	<div id="container">
		<h1>Log In</h1>
		<span class="close-btn"> <img
			src="https://cdn4.iconfinder.com/data/icons/miu/22/circle_close_delete_-128.png"></img>
		</span>

<<<<<<< HEAD
		<form action="users/login.jsp" method="post">
=======
		<form action="users/prueba.jsp" method="post">
>>>>>>> branch 'mauricio' of https://github.com/rbaluta17dw/PhotoGram.git
			<input type="text" name="username" placeholder="Username" value="Champinon"> <input
				type="password" name="password" placeholder="Password" value="password"> <input
				type="submit" value="Log In">
			<div id="remember-container">
				<input type="checkbox" id="checkbox-2-1" class="checkbox"
					checked="checked" /> <span id="remember">Remember me</span>
			</div>
		</form>
	</div>

	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/gsap/1.16.1/TweenMax.min.js'></script>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/index.js"></script>

</body>

</html>