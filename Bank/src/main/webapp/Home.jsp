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
String a_cno=request.getParameter("a_cno");
String pwd=request.getParameter("pwd");
String a_name="";
int balance;
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","1234");
	Statement st=con.createStatement();
	ResultSet rs = st.executeQuery("SELECT a_name,balance FROM Account WHERE a_cno = '" + a_cno + "' AND (pwd = '" + pwd + "' OR c_pwd = '" + pwd + "')");
	if (rs.next()) {
	    a_name = rs.getString("a_name");
	    balance =rs.getInt("balance");	     
	    session.setAttribute("a_name", a_name);
	    session.setAttribute("balance",balance);
	    session.setAttribute("a_cno",a_cno);	   	    	     	    
	    response.sendRedirect("services.jsp");	    
	} else {
	 
	    response.sendRedirect("Home.html");
	}
}
catch(Exception e){
out.println(e);
}
%>
</body>
</html>