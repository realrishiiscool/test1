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
String s1=request.getParameter("a");
String s2=request.getParameter("b");
int a=Integer.parseInt(s1);
int b=Integer.parseInt(s2);

out.println("addtion=\n"+(a+b)+"<br>");
out.println("subtraction=\n"+(a-b)+"<br>");
out.println("mul=\n"+(a*b)+"<br>");
out.println("div=\n"+(a/b)+"<br>");


%>
</body>
</html>