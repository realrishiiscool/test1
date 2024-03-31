<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seat Availability</title>
    <style>
        summary {
            cursor: pointer;
            font-weight: bold;
        }
        details {
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 5px;
        }
        form {
            margin-top: 10px;
        }
        .heading {
    text-align: center;
    margin-bottom: 20px;
    background-color: #007bff;
    color: #fff;
    padding: 20px 0;
  }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-bottom: 10px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        p.warning {
            color: red;
            font-weight: bold;
        }
    </style>
    <script>
        function confirmPayment(trainName, classType) {
            var confirmation = confirm("Confirm payment?");
            if (confirmation) {
                // Add train name and class type to hidden fields
                document.getElementById('trainName').value = trainName;
                document.getElementById('classType').value = classType;
                return true;
            } else {
                return false;
            }
        }
    </script>
</head>
<body>
<div class="heading">
    <h1>SRV RAILWAYS</h1>
    <h2>BOOK YOUR ONLINE TICKETS HERE</h2>
</div>

<hr>
    <h2>Seat Availability</h2>
    <%
        // Retrieve the selected train number and date from URL parameters
        String trainNumber = request.getParameter("trainNumber");
        String selectedDate = request.getParameter("selectedDate");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/railway";
        String username = "root";
        String password = "1234";

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Establish the database connection
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);

            // SQL query to retrieve seat availability for the selected train and date
            String query = "SELECT s.*, t.train_name FROM seat_availability s JOIN train t ON s.train_number = t.train_number WHERE s.train_number = ? AND s.travel_date = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, trainNumber);
            preparedStatement.setString(2, selectedDate);
            resultSet = preparedStatement.executeQuery();

            // Display seat availability details and buy ticket buttons
            if (resultSet.next()) {
                // Set train name in session
                session.setAttribute("trainName", resultSet.getString("train_name"));
                
                out.println("<p>Train Number: " + trainNumber + "</p>");
                out.println("<p>Train Name: " + resultSet.getString("train_name") + "</p>");
                out.println("<p>Selected Date: " + selectedDate + "</p>");

                // Display seat availability
                // Class 1A
                out.println("<details>");
                out.println("<summary>Class 1A Available Seats: " + resultSet.getInt("class_1A") + "</summary>");
                out.println("<form action=\"buyTicket.jsp\" method=\"POST\" onsubmit=\"return confirmPayment('" + resultSet.getString("train_name") + "', 'class_1A');\">");
                out.println("<input type=\"hidden\" name=\"trainNumber\" value=\"" + trainNumber + "\">");
                out.println("<input type=\"hidden\" name=\"selectedDate\" value=\"" + selectedDate + "\">");
                out.println("<input type=\"hidden\" name=\"classType\" value=\"class_1A\">");
                out.println("<input type=\"hidden\" id=\"trainName\" name=\"trainName\">");
                out.println("<input type=\"hidden\" id=\"classType\" name=\"classType\">");
                out.println("<input type=\"submit\" value=\"Buy 1A Ticket\">");
                out.println("</form>");
                out.println("</details>");

             // Class 2A
                out.println("<details>");
                out.println("<summary>Class 2A Available Seats: " + resultSet.getInt("class_2A") + "</summary>");
                out.println("<form action=\"buyTicket.jsp\" method=\"POST\" onsubmit=\"return confirmPayment('" + resultSet.getString("train_name") + "', 'class_2A');\">");
                out.println("<input type=\"hidden\" name=\"trainNumber\" value=\"" + trainNumber + "\">");
                out.println("<input type=\"hidden\" name=\"selectedDate\" value=\"" + selectedDate + "\">");
                out.println("<input type=\"hidden\" name=\"classType\" value=\"class_2A\">");
                out.println("<input type=\"hidden\" id=\"trainName\" name=\"trainName\">");
                out.println("<input type=\"hidden\" id=\"classType\" name=\"classType\">");
                out.println("<input type=\"submit\" value=\"Buy 2A Ticket\">");
                out.println("</form>");
                out.println("</details>");

                // Class 3A
                out.println("<details>");
                out.println("<summary>Class 3A Available Seats: " + resultSet.getInt("class_3A") + "</summary>");
                out.println("<form action=\"buyTicket.jsp\" method=\"POST\" onsubmit=\"return confirmPayment('" + resultSet.getString("train_name") + "', 'class_3A');\">");
                out.println("<input type=\"hidden\" name=\"trainNumber\" value=\"" + trainNumber + "\">");
                out.println("<input type=\"hidden\" name=\"selectedDate\" value=\"" + selectedDate + "\">");
                out.println("<input type=\"hidden\" name=\"classType\" value=\"class_3A\">");
                out.println("<input type=\"hidden\" id=\"trainName\" name=\"trainName\">");
                out.println("<input type=\"hidden\" id=\"classType\" name=\"classType\">");
                out.println("<input type=\"submit\" value=\"Buy 3A Ticket\">");
                out.println("</form>");
                out.println("</details>");
				
             // Check if trainNumber is 12345
                if (trainNumber.equals("12345")) {
                    out.println("<p style=\"color: red;\">Warning: No seats available in General and Sleeper classes for train number 12345.</p>");
                } else {
                    // Sleeper
                    out.println("<details>");
                    out.println("<summary>Sleeper Available Seats: " + resultSet.getInt("class_sleeper") + "</summary>");
                    out.println("<form action=\"buyTicket.jsp\" method=\"POST\" onsubmit=\"return confirmPayment('" + resultSet.getString("train_name") + "', 'class_sleeper');\">");
                    out.println("<input type=\"hidden\" name=\"trainNumber\" value=\"" + trainNumber + "\">");
                    out.println("<input type=\"hidden\" name=\"selectedDate\" value=\"" + selectedDate + "\">");
                    out.println("<input type=\"hidden\" name=\"classType\" value=\"class_sleeper\">");
                    out.println("<input type=\"hidden\" id=\"trainName\" name=\"trainName\">");
                    out.println("<input type=\"hidden\" id=\"classType\" name=\"classType\">");
                    out.println("<input type=\"submit\" value=\"Buy Sleeper Ticket\">");
                    out.println("</form>");
                    out.println("</details>");

                    // General
                    out.println("<details>");
                    out.println("<summary>General Available Seats: " + resultSet.getInt("class_GEN") + "</summary>");
                    out.println("<form action=\"buyTicket.jsp\" method=\"POST\" onsubmit=\"return confirmPayment('" + resultSet.getString("train_name") + "', 'class_GEN');\">");
                    out.println("<input type=\"hidden\" name=\"trainNumber\" value=\"" + trainNumber + "\">");
                    out.println("<input type=\"hidden\" name=\"selectedDate\" value=\"" + selectedDate + "\">");
                    out.println("<input type=\"hidden\" name=\"classType\" value=\"class_GEN\">");
                    out.println("<input type=\"hidden\" id=\"trainName\" name=\"trainName\">");
                    out.println("<input type=\"hidden\" id=\"classType\" name=\"classType\">");
                    out.println("<input type=\"submit\" value=\"Buy General Ticket\">");
                    out.println("</form>");
                    out.println("</details>");
                }


                
                // Add similar details for other classes if available

            } else {
                // No seat availability data found for the selected train and date
                out.println("<p>No seat availability data found for the selected train and date.</p>");
            }
            
            // Close resources
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
            
        } catch (Exception e) {
            out.println("Error: " + e);
        }
    %>
</body>
</html>
