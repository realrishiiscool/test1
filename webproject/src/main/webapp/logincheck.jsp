<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Result</title>
</head>
<body>

<%
String username = request.getParameter("t1");
String password = request.getParameter("t2");
boolean flag=false;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "1234");
   
    Statement statement = connection.createStatement();
        
    ResultSet resultSet = statement.executeQuery("SELECT * FROM stdt");

    while (resultSet.next()) {
    	
        String studentName = resultSet.getString("username");
        
        String    cpwd     = resultSet.getString("cpwd");
       

        
        if(username.equals(studentName) && password.equals(cpwd)) {
        	flag=true;
        }
        
    }
    
}  catch (ClassNotFoundException e) {
    out.println("Error: MySQL JDBC Driver not found!");
    e.printStackTrace();
} catch (SQLException e) {
    out.println("Error: Database connection failed!");
    e.printStackTrace();
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
    e.printStackTrace();
}

if (flag){
	response.sendRedirect("home.html");
}else{
	response.sendRedirect("NewFile.html");
}

%>

</body>
</html>
