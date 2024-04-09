<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.concurrent.TimeUnit" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int rno = Integer.parseInt(request.getParameter("t1"));
String sname = request.getParameter("t2");
String pwd = request.getParameter("t3");
String cpwd = request.getParameter("t4");
String phoneno = request.getParameter("t5");
try 
{
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/college","root","1234");
Statement st=con.createStatement();
if(pwd.equals(cpwd)){
int s =st.executeUpdate("insert into stdt values("+rno+",'"+sname+"','"+cpwd+"','"+phoneno+"')");
out.println("insertion successss............");


}else{
out.println("pwd & cpwd must be same");
}
}
catch(Exception e)
{
out.println("................................."+e);
}
%>	
<br>
<a href="register.html">register page</a>
</body>
</html>