<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Post Feed</title>


<jsp:include page="../include/css_general.html"></jsp:include>
</head>

<body>
	<jsp:include page="../include/nav.html"></jsp:include>
	<jsp:include page="../include/upload.html"></jsp:include>
	<div id="feed">
		<c:forEach items="${posts}" var="post">

			<div class="post">
				<div class="user">
					<img class="profile" alt="${post.id_usr.prf_img}"
						src="images/${post.id_usr.prf_img.url}"> <a
						href="Profile?username=${post.id_usr.username}">${post.id_usr.username}</a>
				</div>
				<a href="Post?id_post=${post.id_post}"> <img class="image"
					alt="${post.img.url}" src="images/${post.img.url}"></a>
				<div class="info">
					${post.desc}<br> ${post.up_date}
				</div>
			</div>
		</c:forEach>


	</div>
</body>

</html>
