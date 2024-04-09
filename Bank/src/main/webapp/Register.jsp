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
String a_name = request.getParameter("a_name");
int age = Integer.parseInt(request.getParameter("age"));
String pwd = request.getParameter("pwd");
String c_pwd = request.getParameter("c_pwd");
String mail = request.getParameter("mail");
String address = request.getParameter("address");
String contact=request.getParameter("contact");
int balance=Integer.parseInt(request.getParameter("balance"));
String a_cno=age+"$"+contact;
try 
{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","1234");
Statement st=con.createStatement();
if((pwd.equals(c_pwd))&&(age>=18)){
		int s =st.executeUpdate("insert into Account values('"+a_name+"',"+age+",'"+pwd+"','"+c_pwd+"','"+mail+"','"+address+"',"+contact+","+balance+",'"+a_cno+"')");
		session.setAttribute("a_name",a_name);
		session.setAttribute("age",age);
		session.setAttribute("a_cno",a_cno);
		session.setAttribute("mail",mail);
		session.setAttribute("balance",balance);
		session.setAttribute("contact",contact);		
	    response.sendRedirect("details.jsp");
 }else{
	out.println("pwd & cpwd must be same  ,   age should be 18 or above 18");
 }
}
catch(Exception e)
{
	out.println("................................."+e);
}
%>
</body>
</html>