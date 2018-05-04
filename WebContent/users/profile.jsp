<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Minimal Navigation bar</title>
<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("../index.jsp");
	}

	ModelUser modelUser = new ModelUser();
%>
<link rel="stylesheet" href="../css/profile.css">
<link rel="stylesheet" href="../css/nav.css">


</head>

<body>
	<jsp:include page="../include/nav.html"></jsp:include>
	
	<div id="profile">
		<img id="config"
			src="http://iconshow.me/media/images/ui/ios7-icons/png/256/gear-b.png"
			height="7%" width="7%">
		<div id="profileimg">
			<img src="../images/<%=user.getPrf_img().getUrl()%>" height="80%"
				width="70%" id="profile_image">
		</div>
		<br>
		<div id="profileinfo">
			<h2><%=user.getUsername()%></h2>
			<br> <b>Posts: 0</b>
			<div>
				<br>
			</div>
		</div>

	</div>
</body>

</html>