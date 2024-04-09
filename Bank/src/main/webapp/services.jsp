<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
        function validateAmount(amount) {
            return amount.trim() !== "" && !isNaN(amount) && parseFloat(amount) > 0;
        }
        function validateDepositForm() {
            var depositAmount = document.forms["depositForm"]["deposit"].value;
            if (!validateAmount(depositAmount)) {
                alert("Please enter a valid deposit amount.");
                return false;
            }
            return true;
        }
        function validateWithdrawForm() {
            var withdrawAmount = document.forms["withdrawForm"]["withdraw"].value;
            if (!validateAmount(withdrawAmount)) {
                alert("Please enter a valid withdrawal amount.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
	<div align="center">
		<h1>Online Bank</h1>
    <h2>( V . I . E . T )</h2>  
	</div>
	  <hr><br>	  		
	  <div align="center">	  
	  	<p>Account Holder Name : <%=session.getAttribute("a_name") %> </p><br />
	  	<p>Account Number : <%=session.getAttribute("a_cno") %> </p><br />
	  	<p>Account Balance : <%=session.getAttribute("balance") %></p><br />	  	
	   <form name="depositForm" action="Deposit.jsp" onsubmit="return validateDepositForm()">
            <input type="text" name="deposit" placeholder="Enter Deposit Amount">
            <input type="submit" value="Deposit">
        </form>
        <br />       
        <form name="withdrawForm" action="Withdraw.jsp" onsubmit="return validateWithdrawForm()">
            <input type="text" name="withdraw" placeholder="Enter Withdraw Amount">
            <input type="submit" value="Withdraw">
        </form>     
       <br />
       <br />
       <button onclick="window.location.href='Home.html'">Done</button>
</body>
</html>