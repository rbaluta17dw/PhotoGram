<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<%
	ModelUser modelUser = new ModelUser();
	User user = (User) session.getAttribute("user");
	boolean usrConf = true;
	if (user == null) {
		response.sendRedirect("../index.jsp");
	} else if (!user.getUsername().equals(request.getParameter("username"))
			&& request.getParameter("username") != null) {
		String username = request.getParameter("username");
		user = modelUser.selectUserName(username);
		usrConf = false;
	}
%>
<title><%=user.getUsername()%> Profile</title>

<link rel="stylesheet" href="../css/profile.css">

</head>

<body>
	<jsp:include page="../include/nav.html"></jsp:include>
	<jsp:include page="../include/upload.html"></jsp:include>

	<div id="profile">
		<%
			if (usrConf) {
		%><img id="config"
			src="http://iconshow.me/media/images/ui/ios7-icons/png/256/gear-b.png"
			height="30px" width="30px">
		<%
			}
		%>

		<div>
			<form action="updateImage.jsp" method="post"
				enctype="multipart/form-data" action="../posts/upload.jsp">
				<div class="prfl">
					<input name="file" type="file" id="imgupdate" style="display: none" />
					<img src="../images/<%=user.getPrf_img().getUrl()%>"
						id="profileimg">
				</div>
				<input type='submit' value='Cambiar Imagen' class='boton hidden' />
			</form>
		</div>
		<br>
		<form action="../UpdateProfile" id="ficha" name="ficha">
			<div id="profileinfo">
				<h2><%=user.getUsername()%></h2>
				<div class="hidden">
					<input type="text" name="username" value="<%=user.getUsername()%>"
						placeholder="Username"><br> <input type="password"
						name="password" placeholder="Actual Password"><br> <input
						type="password" name="repassword" placeholder="Nueva Password"><br>
					<input type="email" name="email" value="<%=user.getEmail()%>"
						placeholder="new email"><br> <input type="date"
						name="birthdate" value="<%=user.getBirthdate()%>"
						placeholder="Fecha de nacimiento"><br> <input
						type="submit" value="Guardar cambios" class="boton"> <input
						type="button" id="delete" value="Eliminar cuenta" class="boton">
				</div>
				<br> <b>Posts: <%=modelUser.postAmount(user.getId_user())%></b>
				<div>
					<br>
				</div>
			</div>
		</form>
		<div id="contPost">
			<div class="post"></div>
		</div>
	</div>

</body>
<script src="../js/profile.js"></script>
</html>