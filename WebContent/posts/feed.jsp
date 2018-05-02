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

</head>

<body>
	<jsp:include page="../include/feed.html"></jsp:include>
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
					src="<%=post.getId_usr().getPrf_img()%>">
				<%=post.getId_usr().getUsername()%>
			</div>
			<img class="image" alt="<%=post.getId_img().getName()%>"
				src="<%=post.getId_img().getData()%>">
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
