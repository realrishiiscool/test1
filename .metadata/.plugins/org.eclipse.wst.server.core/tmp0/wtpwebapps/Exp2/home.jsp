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

	String s1=request.getParameter("t1");
	String s2=request.getParameter("t2");
	if(s1.equals("Rishi")&&s2.equals("1234")){
		out.println("welcome to jsppppppp");
	}
	else{
		out.println("login failed");
		response.sendRedirect("Login.html");
	}

%>

</body>
</html>