<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String s_name = request.getParameter("s_name");
String s_id = request.getParameter("s_id");
String s_pwd = request.getParameter("s_pwd");
String s_cpwd = request.getParameter("s_cpwd");
String s_dept = request.getParameter("s_dept");
String s_mail = request.getParameter("s_mail");
String s_address = request.getParameter("s_address");

try 
{
	
Class.forName("com.mysql.jdbc.Driver");  

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","1234");

Statement st=con.createStatement();

if(s_pwd.equals(s_cpwd)){
	int s =st.executeUpdate("insert into stdt values('"+s_name+"','"+s_id+"','"+s_pwd+"','"+s_cpwd+"','"+s_dept+"','"+s_mail+"','"+s_address+"')");
	
	//out.println("insertion successss............");
		
	response.sendRedirect("S_login.html");
	
}else{
	out.println("pwd & cpwd must be same");
}

}
catch(Exception e)
{
	out.println("................................."+e);
}
%>

</body>
</html>