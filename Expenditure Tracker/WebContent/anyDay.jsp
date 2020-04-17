<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.List"%> 
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<% Gson gsonObj = new Gson();
		
		Map<Object,Object> daily = null;
		List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
		String dataPoints = null;
		 
		try{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "pompom000");
			Statement statement = con.createStatement();
			String xVal;
			Double yVal;
			
			String d= request.getParameter("Date");
			ResultSet resultSet = statement.executeQuery("select * from daily_xpense WHERE date='"+d+"' group by date");
			
			while(resultSet.next()){
				xVal = resultSet.getString("date");
				yVal = resultSet.getDouble("price");
				daily = new HashMap<Object,Object>(); daily.put("label", xVal);daily.put("y", yVal); list1.add(daily);
				dataPoints = gsonObj.toJson(list1);
			}
			
			con.close();
		}
		catch(SQLException e){
			out.println(e);
			out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 100px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
			dataPoints = null;
		}
	%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Xpenditure Report</title>
		<link rel="stylesheet" href="css/report.css">

	</head>

	
	<body>
		<h1>Xpenditure Report </h1>
		<a href="index.html">
			Back to home page
		</a>
		<br>
		
		<div id="chart"></div>
		
		
		
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		
<script type="text/javascript">
	
	window.onload=function() {			
		
		<% if(dataPoints != null) { %>
	
		var chart = new CanvasJS.Chart("chart", {
			animationEnabled: true,
			title:{
				text: "Daily Expenditure"
			},
			data: [{
				type: "column",
				indexLabel: "{y}",
				indexLabelPlacement: "inside",
				legendText: "{label}: {y}",
				toolTipContent: "<b>{label}</b>: {y}",
				dataPoints : <%out.print(dataPoints);%>
			}]
	
		});
		chart.render();
		
		<% } %> 

}
			
</script>
	</body>
</html>
 
 
	      