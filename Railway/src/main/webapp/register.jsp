<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    // Database connection parameters
   

    // Get form data
    String username = request.getParameter("t1");
    String debitCard = request.getParameter("t2");
    String creditCard = request.getParameter("t3");
    String phoneNumber = request.getParameter("t4");
    String email = request.getParameter("t6");
    int age = Integer.parseInt(request.getParameter("t7"));
    String pin = request.getParameter("t5");
    String pwd = request.getParameter("t8");
    String cpwd = request.getParameter("t9");
    // Initialize the connection and prepared statement
    
    try {
        // Load the MySQL driver
        Class.forName("com.mysql.jdbc.Driver");

        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/railway","root","1234");

        Statement st=con.createStatement();

        if(pwd.equals(cpwd)){
        	int s = st.executeUpdate("INSERT INTO users VALUES ('" + username + "','" + debitCard + "','" + creditCard + "','" + phoneNumber + "','" + email + "'," + age + ",'" + pin + "','" + pwd + "')");

        	//out.println("insertion successss............");
        		
        	response.sendRedirect("home.html");
        	
        }else{
        	out.println("pwd & cpwd must be same");
        }

        
       
       
    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>
</body>
</html>