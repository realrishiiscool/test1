<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Application Update</title>
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
        text-align: center;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    h1, h2, h3 {
        color: #333;
    }

    p {
        margin-bottom: 20px;
    }

    .btn {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        text-decoration: none;
    }

    .btn:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<% String uname = (String) session.getAttribute("uname"); %>
<div class="container">
    <h1>Job Application Update</h1>
    <p>Dear <%out.print(uname); %>,<br>
       We hope this message finds you well.<br>
       We wanted to inform you that we have received your job application for the position of Manager. We appreciate your interest in joining our team.<br>
       Our hiring team is currently reviewing applications, and we will be in touch with you soon regarding the status of your application.<br>
       If you have any questions or need further assistance, please feel free to contact us at [XXXXX XXXXX].<br>
       Thank you for considering employment opportunities with us.<br>
       Best regards,<br>
       The Hiring Team</p>
   
</div>
</body>
</html>
