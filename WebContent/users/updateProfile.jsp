<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String newpassword = request.getParameter("repassword");
	String email = request.getParameter("email");
	String birthdate = request.getParameter("birthdate");
	Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthdate);

	User user = (User) session.getAttribute("user");

	ModelUser userModel = new ModelUser();

	if (user != null && password.equals(user.getPassword())) {
		user.setUsername(username);
		user.setPassword(newpassword);
		user.setEmail(email);
		user.setBirthdate(date);
		userModel.updateUser(user);
		response.sendRedirect("../users/profile.jsp?update=1");
	} else {
		response.sendRedirect("../users/profile.jsp?update=0");
	}
%>