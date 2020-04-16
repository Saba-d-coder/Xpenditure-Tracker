
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;


@WebServlet("/DailyXpenseCalculate")

public class DailyXpenseCalculate extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private String databaseUrl = "jdbc:mysql://localhost:3306/mydb";
	private String driver = "com.mysql.jdbc.Driver"; 
	private String userName = "root";
	private String password = " "; 
	  
	
	String naming = "";
	Connection conn = null;

	public DailyXpenseCalculate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//TODO: Add each values from daily expense form to daily Expense database then redirect back to daily expense form 
		//if user presses submit then display report and add link to go to homepage
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
