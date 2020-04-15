
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
// 
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import javax.servlet.ServletConfig;
//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;

//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

@WebServlet("/DailyXpenseCalculate")

public class DailyXpenseCalculate extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private String databaseUrl = "jdbc:mysql://localhost:3306/myDB";
	private String driver = "com.mysql.jdbc.Driver"; 
	private String userName = "root";
	private String password = "whatever"; 
	  
	
	String naming = "";
	Connection conn = null;

	public DailyXpenseCalculate() {

		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//TODO: Add each values from daily expense form to daily Expense database then redirect back to daily expense form 
		//if user presses submit then redirect to a displayXpense page displaying total cost of daily expense and also link to go to index page
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
