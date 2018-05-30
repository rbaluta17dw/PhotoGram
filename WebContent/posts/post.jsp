<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post</title>
<jsp:include page="../include/css_general.html"></jsp:include>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../include/nav.html"></jsp:include>
	<jsp:include page="../include/upload.html"></jsp:include>
	<div id="feed">
		<div class="post">
			<div class="user">
				<img class="profile" alt="${post.id_usr.prf_img}"
					src="images/${post.id_usr.prf_img.url}"> <a
					href="Profile?username=${post.id_usr.username}">${post.id_usr.username}</a>
				<c:if test="${post.id_usr.id_user == user.id_user}">
					<a href="DeletePost?id_post=${post.id_post}" class="delete"></a>
				</c:if>
			</div>
			<img alt="${post.img.name }" class="image"
				src="images/${post.img.url }" />
			<div class="info">
				<c:if test="${post.id_usr.id_user == user.id_user}">
					<div class='sexy_field'>
						<input placeholder="${post.desc}" required='required'>
					</div>
				</c:if>
				${post.desc}<br> ${post.up_date}
			</div>
		</div>
	</div>
</body>
</html>