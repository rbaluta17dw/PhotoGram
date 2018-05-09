<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
ModelUser userModel = new ModelUser();

String username = request.getParameter("username");
String password = request.getParameter("password");
String email = request.getParameter("email");
String birthdate = request.getParameter("birthdate");
Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthdate);

User user = userModel.selectUserName(username);
%>
