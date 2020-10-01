# Expenditure-Tracker
This web app allows you to keep track of your xpenses... The app provides report of your xpenses over past few days/weeks/months/years.
This app is build using HTML, CSS, JSP and Servlet.

## Instructions for opening the project
### Please run the project on the browser for css to work properly
### Update the database connection details wherever necessary in the code
### Either add the mysql database configuration to your workbench provided in 'mysql databases' folder or create the following database and update the name of the created database in code wherever required 
create table daily_xpense( id INT primary key AUTO_INCREMENT, itemname VarChar(20), price
double, currDate Date);  
create table weekly_xpense( id INT primary key AUTO_INCREMENT, itemname VarChar(20), price
double, currDay Date);  
create table monthly_xpense( id INT primary key AUTO_INCREMENT, itemname VarChar(20),
price double, currMonth Date);  
create table yearly_xpense( id INT primary key AUTO_INCREMENT, itemname VarChar(20), price
double, currYear Date);  
insert into dailyXpense (itemname,price,currDate) values (&quot;paper&quot;,&quot;50&quot;,&quot;2019-07-03&quot;);  
insert into weeklyXpense (itemname,price,currDay) values (&quot;fuel&quot;,&quot;400&quot;,&quot;2019-07-20&quot;);  
insert into monthlyXpense (itemname,price,currMonth) values (&quot;Electricity&quot;,&quot;700&quot;,&quot;2019-07-
01&quot;);  
insert into weeklyXpense (itemname,price,currYear) values (&quot;Rent&quot;,&quot;40000&quot;,&quot;2020-01-03&quot;);
### Add at least 8 to 10 rows in the created tables for better results (if not present)
### Download Google gson.jar file from the following link and also other necessary jar files
https://jar-download.com/artifacts/com.google.code.gson/gson/2.8.2/source-code 

