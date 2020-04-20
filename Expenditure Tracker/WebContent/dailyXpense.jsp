<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Daily Xpenditure</title>
		<link rel="stylesheet" type="text/css" href="css/dailyXpenseForm.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/fontawesome.min.css">
	    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	</head>
	
<body>
	<h3><%=request.getAttribute("result") %></h3>
	 <form action="DailyXpenseCalculate" method="get">
                <h2>Enter Item Details </h2>
                
                <hr>
        
                <input type="date" name="date" id="currentDate" placeholder="mm-dd-yyyy" value=<%=request.getAttribute("Date") %> required>
                <br> <br>	
        
                <input type="text" name="itemName"  id="itemName" placeholder="Item Name" required> 
        
                <br> <br> 
        
                <input type="number" id="cost" name="Price" placeholder="Price" required>
                <br> <br>
        
                <button type="submit" id="add">Add</button>
                <br>
                <br>
        </form>
        
        <h4>Total Amount:<%=request.getAttribute("totalAmt") %></h4>
        <a href="index.html">Go Back to Home Page</a>
</body>
</html>