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
String s_id=request.getParameter("s_id");
String s_pwd=request.getParameter("s_pwd");
String s_name="";
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","1234");
	Statement st=con.createStatement();
	ResultSet rs = st.executeQuery("SELECT s_name FROM stdt WHERE s_id = '" + s_id + "' AND (s_pwd = '" + s_pwd + "' OR s_cpwd = '" + s_pwd + "')");
	if (rs.next()) {
	    // Authentication successful    
	    s_name = rs.getString("s_name");	    
	    session.setAttribute("s_name", s_name);	    
	    response.sendRedirect("S_buy.jsp");	     	
	} else {
	    // Authentication failed
	    response.sendRedirect("S_login.html");
	}
	// Close ResultSet, Statement, and Connection
	rs.close();
	st.close();
	con.close();	
}
catch(Exception e){
out.println(e);
}

%>
</body>
</html>