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

String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");



try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job","root","1234");
	Statement st=con.createStatement();
	
	ResultSet rs = st.executeQuery("SELECT uname FROM user WHERE uname = '" + uname + "' AND (pwd = '" + pwd + "' OR cpwd = '" + pwd + "')");

	if (rs.next()) {
	    // Authentication successful
	    
	    uname = rs.getString("uname");
	    
	    session.setAttribute("uname", uname);
	    response.sendRedirect("getjob.jsp");
	    
	   
	} else {
	    // Authentication failed
	    response.sendRedirect("home.html");
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