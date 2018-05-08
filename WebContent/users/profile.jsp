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
	if (user == null) {
		response.sendRedirect("../index.jsp");
	} else if (!user.getUsername().equals(request.getParameter("username"))
			&& request.getParameter("username") != null) {
		String username = request.getParameter("username");
		user = modelUser.selectUserName(username);
	}
%>
<link rel="stylesheet" href="../css/profile.css">

</head>

<body>
	<jsp:include page="../include/nav.html"></jsp:include>

	<div id="profile">
		<img id="config"
			src="http://iconshow.me/media/images/ui/ios7-icons/png/256/gear-b.png"
			height="7%" width="7%">
		<div>
			<img src="../images/<%=user.getPrf_img().getUrl()%>" id="profileimg">
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