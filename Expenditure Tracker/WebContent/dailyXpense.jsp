<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3><%=request.getAttribute("result") %></h3>
	 <form action="DailyXpenseCalculate" method="get">
                <h2>Enter Item Details </h2>
                
                <hr>
                <br>
        
                <input type="date" name="date" id="currentDate" placeholder="mm-dd-yyyy" value=<%=request.getAttribute("Date") %>>
                <br> <br>	
        
                <input type="text" name="itemName"  id="itemName" placeholder="Item Name"> 
        
                <br> <br> 
        
                <input type="number" id="cost" name="Price" placeholder="Price">
                <br> <br>
        
                <button type="submit" name="iBtn" value="add" id="ad">Add</button>
        		<a href="index.html">Go Back to Home Page</a>
                <br>
                <br>
        </form>
        
        <h4>Total Amount:<%=request.getAttribute("totalAmt") %></h4>
</body>
</html>