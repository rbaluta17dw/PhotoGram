<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>+
<%@ page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String dni = request.getParameter("username").toUpperCase();
	String password = request.getParameter("pass");

	ModelUser userModel = new ModelUser();
	User user = userModel.sele;

	if (usuario != null && password.equals(usuario.getPassword())) {
		session.setAttribute("usuario", usuario);
		response.sendRedirect("../biblioteca.jsp");
	} else {
		response.sendRedirect("../index.jsp");
	}
%>