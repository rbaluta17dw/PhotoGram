<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Minimal Navigation bar</title>
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
			height="7%" width="7%">
		<%
			}
		%>

		<div>
			<div class="prfl">
				<input name="file" type="file" id="imgupload" style="display: none" />
				<img src="../images/<%=user.getPrf_img().getUrl()%>" id="profileimg">
			</div>
		</div>
		<br>
		<form action="updateProfile.jsp" method="post" id="ficha" name="ficha">
			<div id="profileinfo">
				<h2><%=user.getUsername()%></h2>
				<div class="hidden">
					<input type="text" name="username" placeholder="Username"><br>
					<input type="password" name="password"
						placeholder="Actual Password"><br> <input
						type="password" name="repassword" placeholder="Nueva Password"><br>
					<input type="email" name="email" placeholder="new email"><br>
					<input type="date" name="birthdate"
						placeholder="Fecha de nacimiento"><br> <input
						type="submit" value="guardar" class="boton"> <input
						type="button" id="delete" value="eliminar" class="boton">
				</div>
				<br> <b>Posts: 0</b>
				<div>
					<br>
				</div>
			</div>
		</form>

	</div>

</body>
<script src="../js/profile.js"></script>
</html>