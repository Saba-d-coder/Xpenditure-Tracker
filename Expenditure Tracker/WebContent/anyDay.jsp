<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.List"%> 
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<% 
		Gson gsonObj = new Gson();
		
		Map<Object,Object> daily = null;
		List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
		String dataPoints1 = null;
		
		try{

			double amt=0.0;
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "pompom000");
			Statement statement = con.createStatement();
			
			String d= request.getParameter("Date");
			ResultSet resultSet2 = statement.executeQuery("select * from daily_xpense WHERE date='"+d+"'");
			if(resultSet2.next()) {
				out.println("<h1>Xpenditure Report </h1>");
				out.println("<table align=\'center\'><thead><th>Item Name</th><th>Price</th></thead>");
				
				while(resultSet2.next()){			
					String item=resultSet2.getString("itemName");
					double price=resultSet2.getDouble("price");
					amt+=price;
					out.println("<tr><td>"+item+"</td><td>"+price+"</td></tr>");
				}
				out.println("<tr><td>Total:</td><td>"+amt+"</th></tr>");
				out.println("</table>");
			}else {
				out.println("No data Found");
			}	
			con.close();
		}
		catch(SQLException e){
			out.println(e);
		}
	%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Xpenditure Report</title>
		<link type="text/css" rel="stylesheet" href="css/report.css">
		
		<style type="text/css">
			table{
				text-align: left;
			    line-height: 40px;
			    border-collapse: separate;
			    border-spacing: 0;
			    border: 2px solid #ed1c40;
			    width: 500px;
			    margin: 50px auto;
			    border-radius: .25rem;
			}
			thead tr:first-child {
			  background: #ed1c40;
			  color: #fff;
			  border: none;
			  text-align:center
			}
			
			td{
			text-align:center
			}
			
			th {
			   font-weight: 500;
			}
			
			 tbody tr:last-child  td{
			  border-top: 1px solid black;
			}
			
		</style>
		
	</head>

	<body>
		
		<br>
		<a href="index.html">
			Back to home page
		</a>
		<br>
		<br>
		<a href="displayReport.jsp"> Go Back to Report</a>
		<br>
	</body>
	
	
</html>
 
 
	      