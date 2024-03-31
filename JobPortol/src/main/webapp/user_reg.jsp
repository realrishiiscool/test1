<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Job Portal (Viet)</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
  }
  
  .container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
  
  h1, h2 {
    color: #333;
    text-align: center;
  }
  
  hr {
    border: 1px solid #ccc;
  }
</style>
</head>
<body>

<div class="container">
  <div>
    <h1>Online Job Portal</h1>
    <h2>(VIET)</h2>
    <hr>
  </div>

<%

String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
String cpwd=request.getParameter("cpwd");
String gender=request.getParameter("gender");
String age=request.getParameter("age");
String contact=request.getParameter("contact");
String email=request.getParameter("email");
String address=request.getParameter("address");
String qualified=request.getParameter("qualified");
String percent=request.getParameter("percent");
String pass=request.getParameter("pass");

try {
    Class.forName("com.mysql.jdbc.Driver");  
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/job","root","1234");
    Statement st=con.createStatement();
    
    int s =st.executeUpdate("insert into user values('"+uname+"','"+pwd+"','"+cpwd+"','"+gender+"',"+age+",'"+contact+"','"+email+"','"+address+"','"+qualified+"',"+percent+",'"+pass+"')");
    response.sendRedirect("done.html");

} catch(Exception e) {
    out.println("................................."+e);
}
%>

</div>

</body>
</html>
