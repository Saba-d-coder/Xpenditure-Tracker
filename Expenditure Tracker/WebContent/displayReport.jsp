<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.List"%> 
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
	/* response.setHeader("Set-Cookie", "HttpOnly;Secure;SameSite=Strict"); */
	Gson gsonObj = new Gson();
	
	Map<Object,Object> daily = null;
	List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
	String dataPoints1 = null;
	
	Map<Object,Object> weekly = null;
	List<Map<Object,Object>> list2 = new ArrayList<Map<Object,Object>>();
	String dataPoints2 = null;
	
	Map<Object,Object> monthly = null;
	List<Map<Object,Object>> list3 = new ArrayList<Map<Object,Object>>();
	String dataPoints3 = null;
	
	Map<Object,Object> yearly = null;
	List<Map<Object,Object>> list4 = new ArrayList<Map<Object,Object>>();
	String dataPoints4 = null;
	 
	try{
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "pompom000");
		Statement statement = con.createStatement();
		String xVal,lVal;
		Double yVal;
		
		ResultSet resultSet = statement.executeQuery("select * from daily_xpense WHERE date >= DATE_SUB(curdate(), INTERVAL 7 DAY) group by date");
		
		while(resultSet.next()){
			xVal = resultSet.getString("date");
			yVal = resultSet.getDouble("price");
			daily = new HashMap<Object,Object>(); daily.put("label", xVal);daily.put("y", yVal); list1.add(daily);
			dataPoints1 = gsonObj.toJson(list1);
		}
		
		ResultSet resultSet2 = statement.executeQuery("select * from weekly_xpense WHERE date >= DATE_SUB(curdate(), INTERVAL 5 week) group by week(date) order by date");
		
		while(resultSet2.next()){
			xVal = resultSet2.getString("date");
			yVal = resultSet2.getDouble("price");
			weekly = new HashMap<Object,Object>();weekly.put("label", xVal); weekly.put("y", yVal); list2.add(weekly);
			dataPoints2 = gsonObj.toJson(list2); 
		}
		
		ResultSet resultSet3 = statement.executeQuery("select * from monthly_xpense WHERE date >= DATE_SUB(curdate(), INTERVAL 5 month) group by month(date) order by date");
		
		while(resultSet3.next()){
			xVal = resultSet3.getString("date");
			yVal = resultSet3.getDouble("price");
			monthly = new HashMap<Object,Object>(); monthly.put("label", xVal); monthly.put("y", yVal); list3.add(monthly);
			dataPoints3 = gsonObj.toJson(list3); 
		}
		
		ResultSet resultSet4 = statement.executeQuery("select * from yearly_xpense WHERE date >= DATE_SUB(curdate(), INTERVAL 5 year) group by year(date) order by date");
		
		while(resultSet4.next()){
			xVal = resultSet4.getString("date");
			yVal = resultSet4.getDouble("price");
			yearly = new HashMap<Object,Object>(); yearly.put("label", xVal); yearly.put("y", yVal); list4.add(yearly);
			dataPoints4 = gsonObj.toJson(list4); 
		}
		
		con.close();
	}
	catch(SQLException e){
		out.println(e);
		out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 100px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same. or you may not have any data in the database to display</div>");
		dataPoints1 = null;
		dataPoints2 = null;
		dataPoints3 = null;
		dataPoints4 = null;
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
		<h1>Your Xpenditure Report so far</h1>
		
		<h3>Check any day's expense</h3>
	
	<form action="anyDay.jsp" method="get">
		Enter a date: <input type="date" name="Date" onchange=check()>
		<button>Check</button>
	</form>
	
	<div class="Container1">
		<div id="daily" ></div>
		
		<div id="weekly" ></div>
	</div>
	
	<div class="Container2">	
		<div id="monthly" ></div>
		
		<div id="yearly" ></div>
	</div>
	

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		
<script type="text/javascript">
	
	window.onload=function () {			
			
		<% if(dataPoints1 != null) { %>
	
		var chart1 = new CanvasJS.Chart("daily", {
			animationEnabled: true,
			title:{
				text: "Daily Expenditure of past 7 days"
			},
			data: [{
				type: "column",
				indexLabel: "{y}",
				indexLabelPlacement: "inside",
				legendText: "{label}: {y}",
				toolTipContent: "<b>{label}</b>: {y}",
				dataPoints : <%out.print(dataPoints1);%>
			}]
	
		});
		chart1.render();
		
		<% } %> 
		
		<% if(dataPoints2 != null) { %>
			var chart2 = new CanvasJS.Chart("weekly", {
				animationEnabled: true,
				exportEnabled: true,
				title: {
					text: "Weekly Expenditure of past 5 weeks"
				},
				data: [{
					type: "column",
					indexLabel: "{y}",
					indexLabelPlacement: "inside",
					toolTipContent: "<b>{label}</b>: {y}",
					dataPoints : <%out.print(dataPoints2);%>
				}]
		
			});
			
			chart2.render();
		
		<% } %> 
		
		
		<% if(dataPoints3 != null) { %>
		var chart3 = new CanvasJS.Chart("monthly", {
			animationEnabled: true,
			exportEnabled: true,
			title: {
				text: "Monthly Expenditure of past 5 months"
			},
			data: [{
				type: "column",
				indexLabel: "{y}",
				indexLabelPlacement: "inside",
				toolTipContent: "<b>{label}</b>: {y}",
				dataPoints : <%out.print(dataPoints3);%>
			}]
	
		});
		chart3.render();
		
		<% } %> 
		
<% if(dataPoints4 != null) { %>
		
		var chart4 = new CanvasJS.Chart("yearly", {
			animationEnabled: true,
			exportEnabled: true,
			title: {
				text: "Yearly Expenditure of past 5 years"
			},
			data: [{
				type: "column",
				indexLabel: "{y}",
				indexLabelPlacement: "inside",
				toolTipContent: "<b>{label}</b>: {y}",
				dataPoints : <%out.print(dataPoints4);%>}]
	
		});
		chart4.render();
	<% } %> 
	
}	
</script>
	</body>
</html>
 
 
	      