<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="cyan">
<h1 align="center">...........JSP CALCULATOR............</h1>
<br>
<hr color="black">
<br>
<section>
<div>
<h1 align="center">
<%
int s1,s2;
s1=Integer.parseInt(request.getParameter("t1"));
s2=Integer.parseInt(request.getParameter("t2"));
%>
Addition is :<%=(s1+s2) %> <br>
Subtraction is :<%=(s1-s2) %> <br>
Multiplication is :<%=(s1*s2) %> <br>
Division is :<%=(s1/s2) %>
</h1>
</div>
</section>
<h1>
<form action="cal.html">
<input type="submit" value="home">
</form>
</h1>
</body>
</html>