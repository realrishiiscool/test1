<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Train Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .heading {
    text-align: center;
    margin-bottom: 20px;
    background-color: #007bff;
    color: #fff;
    padding: 20px 0;
  }
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        p {
            margin: 0;
            padding: 5px 0;
        }
        form {
            margin-top: 20px;
        }
        label {
            margin-right: 10px;
        }
        input[type="radio"] {
            margin-right: 5px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="heading">
    <h1>SRV RAILWAYS</h1>
    <h2>BOOK YOUR ONLINE TICKETS HERE</h2>
</div>

<hr>
    <div class="container">
        <h2>Train Details</h2>

        <%-- Retrieve train details, class details, and date from request parameters --%>
        <% 
            // Retrieve train details
            String trainNumber = request.getParameter("trainNumber");
            String trainName = (String) session.getAttribute("trainName"); // Get train name from session

            // Retrieve class details
            String classType = request.getParameter("classType");
            String className = (String) session.getAttribute("className"); // Get class name from session

            // Retrieve selected date
            String selectedDate = request.getParameter("selectedDate");

            // Retrieve user details from session
            String username = (String) session.getAttribute("username");
            
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/railway";
            String dbUsername = "root";
            String dbPassword = "1234";

            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try {
                // Establish the database connection
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(url, dbUsername, dbPassword);

                // SQL query to retrieve user details and train information
                String query = "SELECT credit_card, debit_card, pin, train_name, departure_station, arrival_station FROM users u JOIN train t ON t.train_number = ? WHERE u.username = ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, trainNumber);
                preparedStatement.setString(2, username);
                resultSet = preparedStatement.executeQuery();

                // Display user details and train information
                if (resultSet.next()) {
                    // Retrieve credit, debit, and pin from the result set
                    int credit = resultSet.getInt("credit_card");
                    int debit = resultSet.getInt("debit_card");
                    String pin = resultSet.getString("pin");

                    // Display user details
                    out.println("<h1>User and Payment Details</h1>");
                    out.println("<p>Welcome, " + username + "!</p>");
                    out.println("<p>Credit: " + credit + "</p>");
                    out.println("<p>Debit: " + debit + "</p>");
                    out.println("<p>Pin: " + pin + "</p>");

                    // Display train details
                    out.println("<h1>Train Information</h1>");
                    out.println("<p>Train Number: " + trainNumber + "</p>");
                    out.println("<p>Train Name: " + resultSet.getString("train_name") + "</p>");
                    out.println("<p>Destination: " + resultSet.getString("departure_station") + "</p>");
                    out.println("<p>Arrival: " + resultSet.getString("arrival_station") + "</p>");

                    // Calculate amount based on class type
                    int amount = 0;
                    switch (classType) {
                        case "class_1A":
                            amount = 2000;
                            break;
                        case "class_2A":
                            amount = 1500;
                            break;
                        case "class_3A":
                            amount = 1200;
                            break;
                        case "class_sleeper":
                            amount = 700;
                            break;
                        case "class_GEN":
                            amount = 200;
                            break;
                        default:
                            amount = 0;
                            break;
                    }

                    // Display the calculated amount
                    out.println("<p>Amount: ₹" + amount + "</p>");
                    
                    // Update seat availability
                    String updateQuery = "UPDATE seat_availability SET " + classType + " = " + classType + " - 1 WHERE train_number = ? AND travel_date = ?";
                    preparedStatement = connection.prepareStatement(updateQuery);
                    preparedStatement.setString(1, trainNumber);
                    preparedStatement.setString(2, selectedDate);
                    int rowsAffected = preparedStatement.executeUpdate();
                    if (rowsAffected > 0) {
                        out.println("<p>Seat locked successfully.</p>");
                    } else {
                        out.println("<p>Failed to update seat availability.</p>");
                    }
                } else {
                    out.println("<p>User details not found.</p>");
                }
            } catch (Exception e) {
                out.println("Error: " + e);
            } finally {
                // Close resources
                try {
                    if (resultSet != null) resultSet.close();
                    if (preparedStatement != null) preparedStatement.close();
                    if (connection != null) connection.close();
                } catch (Exception e) {
                    out.println("Error closing resources: " + e);
                }
            }
        %>

        <form action="paymentdone.html" method="POST">
            <h3>Select Payment Method:</h3>
            <input type="radio" id="creditCard" name="paymentMethod" value="creditCard">
            <label for="creditCard">Credit Card</label><br>
            <input type="radio" id="debitCard" name="paymentMethod" value="debitCard">
            <label for="debitCard">Debit Card</label><br><br>
            <input type="submit" value="Make Payment">
        </form>
    </div>
</body>
</html>
