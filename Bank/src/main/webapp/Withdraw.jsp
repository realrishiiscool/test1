<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
		<h1 align="center">Online Bank</h1>
    <h2 align="center">( V . I . E . T )</h2>  
	</div>
	  <hr><br>	  	    
	  <div align="center">
	   <%
	   		 int w_amount=Integer.parseInt(request.getParameter("withdraw"));
	         int balance=(Integer)session.getAttribute("balance");
	         String a_cno=(String)session.getAttribute("a_cno");	         
 if(balance>1000)
 {	         
	         balance=balance-w_amount;         
	         if(balance<1000)
	         {%>
	        	<p>Account Holder Name : <%=session.getAttribute("a_name") %> </p><br />
	  	        <p>Account Number : <%=session.getAttribute("a_cno") %> </p><br />
	         	<p>Account Balance  <%=session.getAttribute("balance") %></p><br /> 	 	             
	            <p>....Withdraw Failed due to insufficient funds</p><br />    <br />	    
	            <button onclick="window.location.href='Home.html'">Done</button>        	
	          <%  
	         }
	         else{	        	         
	         try 
	         {	         	
	         Class.forName("com.mysql.jdbc.Driver");  
	         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","1234");
	         Statement st=con.createStatement();	      
	         String query = "UPDATE Account SET balance = " + balance + " WHERE a_cno = '" + a_cno + "'";         
	         int rowsUpdated = st.executeUpdate(query);
	         if (rowsUpdated > 0) {  %>	        	         	
	    <p>Account Holder Name : <%=session.getAttribute("a_name") %> </p><br />
	  	<p>Account Number : <%=session.getAttribute("a_cno") %> </p><br />
	  	<p>Account Balance Before Withdraw : <%=session.getAttribute("balance") %></p><br /> 	 	             
	    <p>Account Balance After Withdraw : <%=balance %></p><br />    <br />	    
	    <button onclick="window.location.href='Home.html'">Done</button>	      	        	 
	      <%    } else {	        	 	        	 
	             out.println("account not found");             	             
	         }	                
	         }
	         catch(Exception e)
	         {
	         	out.println("................................."+e);
	         }	         
	     }
 }	         
 else{  %>	        	 
	    <p>Account Holder Name : <%=session.getAttribute("a_name") %> </p><br />
	  	<p>Account Number : <%=session.getAttribute("a_cno") %> </p><br />
	  	<p>Account Balance  <%=session.getAttribute("balance") %></p><br /> 	 	             
	    <p>....Withdraw Failed due to insufficient funds</p><br />    <br />	    
	    <button onclick="window.location.href='Home.html'">Done</button>	        	        	       	        	 
	       <%  }	                	   
	   %>	  	
</div>
</body>
</html>