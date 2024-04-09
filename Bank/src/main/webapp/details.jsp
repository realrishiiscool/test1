<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Details page</title>
 </head>
<body>
    <div class="header">
        <h1 align="center">Online Bank</h1>
        <h2 align="center">( V . I . E . T )</h2>
    </div>
    <hr> 
    <div class="container" align="center">
        <h2 >Congratulations...<%=session.getAttribute("a_name") %> </h2>
        <br />
        <p>Account Number is <h1><%=session.getAttribute("a_cno") %></h1></p>
            <form  action="Home.html" >
                 <input type="submit" value="Login">
            </form>
    </div>
</body>
</html>
    