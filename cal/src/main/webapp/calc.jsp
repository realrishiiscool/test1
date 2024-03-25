<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String s1,s2;
	s1=request.getParameter("t1");
	s2=request.getParameter("t2");
	int a,b;
	a=Integer.parseInt(s1);
	b=Integer.parseInt(s2);
	
%>

addition:<%=a+b %>
</body>
</html>