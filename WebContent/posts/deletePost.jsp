<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%
ModelPost modelPost = new ModelPost();
int id_post =  Integer.parseInt(request.getParameter("id_post"));

modelPost.deletePostID(id_post);


response.sendRedirect("feed.jsp");
%>
<title>Insert title here</title>
</head>
<body>

</body>
</html>