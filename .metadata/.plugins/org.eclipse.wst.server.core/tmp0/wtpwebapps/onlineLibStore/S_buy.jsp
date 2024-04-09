<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>book 3 page</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="heading">
		<h1 align="center">Online Book store</h1>
		<h2 align="center" >V . I . E . T</h2>		
</div>
<br />
<%
String s_name=(String)session.getAttribute("s_name");
//int bId=Integer.parseInt((String)session.getAttribute("bId"));
int bId=(Integer)session.getAttribute("bId");
String bName=(String)session.getAttribute("bName");
int bStatus=(Integer)session.getAttribute("bStatus");
if(bStatus!=0)
{
	%><h2>Congratulation book allocated</h2>
	<%	}else{ 	%>
	<h2>Sorry....book not available</h2>
<%} %>

<h2>Student Name:<%=s_name %> </h2><br>
<h2>Book Name:<%=bName %></h2><br>
<h2>Cash on delivery within 2 weeks</h2>
<%
bStatus=bStatus-1;
try 
{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","1234");
Statement st=con.createStatement();
	int s = st.executeUpdate("UPDATE book SET b_status=" + bStatus + " WHERE b_id=" + bId);	
}
catch(Exception e)
{
	out.println("..........errorrr......................."+e);
}
%>
<h2>Book status:<%=bStatus %></h2><br>
<a href="home.html">Home</a>
</body>
</html>