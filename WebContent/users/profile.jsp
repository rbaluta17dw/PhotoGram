<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<title>${user.username }Profile</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/feed.js"></script>
<link rel="stylesheet" href="css/profile.css">
<link rel="stylesheet" href="css/nav.css">

</head>

<body>
	<jsp:include page="../include/nav.html"></jsp:include>
	<jsp:include page="../include/upload.html"></jsp:include>

	<div id="profile">
		<c:if test="${usrConf}">
			<img id="config"
				src="http://iconshow.me/media/images/ui/ios7-icons/png/256/gear-b.png"
				height="30px" width="30px">
		</c:if>

		<div>
			<form action="users/updateImage.jsp" method="post"
				enctype="multipart/form-data" action="../posts/upload.jsp">
				<div class="prfl">
					<input name="file" type="file" id="imgupdate" style="display: none" />
					<img src="images/${user.prf_img.url}" id="profileimg">
				</div>
				<input type='submit' value='Cambiar Imagen' class='boton hidden' />
			</form>
		</div>
		<br>
		<form action="UpdateProfile" id="ficha" name="ficha">
			<div id="profileinfo">
				<h2>${user.username }</h2>
				<div class="hidden">
					<input type="text" name="username" placeholder="Username"><br>
					<input type="password" name="password"
						placeholder="Actual Password"><br> <input
						type="password" name="repassword" placeholder="Nueva Password"><br>
					<input type="email" name="email" placeholder="new email"><br>
					<input type="date" name="birthdate"
						placeholder="Fecha de nacimiento"><br> <input
						type="submit" value="Guardar cambios" class="boton"> <input
						type="button" id="delete" value="Eliminar cuenta" class="boton">
				</div>
				<br> <b>Posts: ${numeroPosts }</b>
				<div>
					<br>
				</div>
			</div>
		</form>
	</div>
	<div id="contPost">
		<c:forEach items="${posts}" var="post">
			<div class="post">
				<a href="Post?id_post=${post.id_post}"> <img class="image"
					alt="${post.img.name}" src="images/${post.img.url}">
				</a>
			</div>
		</c:forEach>
	</div>
</body>
<script src="js/profile.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</html>