<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
	ModelUser us = new ModelUser();
	ArrayList<User> users = us.selectAll();

	Iterator<User> i = users.iterator();
	User user;
	while (i.hasNext()) {
		user = i.next();
		out.print(user.getUsername());
	}
%>