<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login</title>
</head>
<body>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
boolean flag=false;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/railway", "root", "1234");
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery("SELECT * FROM users");

    while (resultSet.next()) {
        String dbUsername = resultSet.getString("username");
        String dbPassword = resultSet.getString("password");
        if(username.equals(dbUsername) && password.equals(dbPassword)) {
            flag=true;
            session.setAttribute("username", username);
            session.setAttribute("credit", resultSet.getString("credit"));
            session.setAttribute("debit", resultSet.getString("debit"));
            session.setAttribute("pin", resultSet.getString("pin"));
            
            // Set train details to session attributes
            session.setAttribute("trainName", resultSet.getString("train_name"));
            session.setAttribute("className", resultSet.getString("class_name"));
            
            break; // Exit the loop if login is successful
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
} else {
    response.sendRedirect("login.html");
}
%>
</body>
</html>
