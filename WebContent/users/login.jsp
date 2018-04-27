<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>+
<%@ page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");


	ModelUser userModel = new ModelUser();
	User user = userModel.selectUserName(username);

	if (user != null && password.equals(user.getPassword())) {
		session.setAttribute("user", user);
		response.sendRedirect("../posts/feed.jsp");
	} else {
		response.sendRedirect("../index.jsp");
	}
%>