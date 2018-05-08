<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%
	//Ver si esta loggeado
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("../index.jsp");
	}

	ModelUser modelUser = new ModelUser();
	ModelPost modelPost = new ModelPost();

	ArrayList<Post> posts = modelPost.selectAll();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Minimal Navigation bar</title>
<script src="../js/feed.js"></script>
</head>

<body>
	<jsp:include page="../include/nav.html"></jsp:include>
	<jsp:include page="../include/upload.html"></jsp:include>
	<div id="feed">
		<%
			Iterator<Post> i = posts.iterator();
			Post post;
			while (i.hasNext()) {
				post = i.next();
		%>
		<div class="post">
			<div class="user">
				<img class="profile" alt="<%=post.getId_usr().getPrf_img()%>"
					src="../images/<%=post.getId_usr().getPrf_img().getUrl()%>">
				<a
					href="../users/profile.jsp?username=<%=post.getId_usr().getUsername()%>"><%=post.getId_usr().getUsername()%></a>
			</div>
			<img class="image" alt="<%=post.getImg().getName()%>"
				src="../images/<%=post.getImg().getUrl()%>">
			<div class="info">
				<%=post.getDesc()%><br>
				<%=post.getUp_date()%>
			</div>
		</div>
		<%
			}
		%>
	</div>
</body>

</html>
