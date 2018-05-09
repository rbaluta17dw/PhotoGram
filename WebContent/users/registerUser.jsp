<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ModelUser userModel = new ModelUser();

	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String birthdate = request.getParameter("birthdate");
	Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthdate);

	User user = new User();
	user.setUsername(username);
	user.setPassword(password);
	user.setEmail(email);
	user.setBirthdate(date);

	userModel.insertUser(user);

	response.sendRedirect("../index.jsp");
%>