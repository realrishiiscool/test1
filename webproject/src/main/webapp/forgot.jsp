<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Random" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Password</title>
</head>
<body>
    <%
        // Get form parameters
        String sname = request.getParameter("t1");
        String pwd = request.getParameter("t3");
        String cpwd = request.getParameter("t4");
        String phoneno = request.getParameter("t2");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "1234");
            Statement st=con.createStatement();
            if (pwd.equals(cpwd)) {
                // Construct the SQL query string
                String updateQuery = "UPDATE stdt SET cpwd = '" + cpwd + "' WHERE username = '" + sname + "'";

                int rowsAffected = st.executeUpdate(updateQuery);

                if (rowsAffected > 0) {
                    out.println("Password updated successfully.<br>");
                    response.sendRedirect("NewFile.html");
                } else {
                    out.println("No user found with the provided username.");
                }
            } else {
                out.println("Password and confirm password must match.");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>
</body>
</html>
