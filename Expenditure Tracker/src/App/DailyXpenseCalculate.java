package App;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.Iterator;

import javax.servlet.annotation.WebServlet;

@WebServlet("/DailyXpenseCalculate")

public class DailyXpenseCalculate extends HttpServlet {

	private static final long serialVersionUID = 1L;

	double total=0.0;
	public DailyXpenseCalculate() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {

				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "pompom000");
				ResultSet rs = null;
				
				String item = req.getParameter("itemName");
				String iprice = req.getParameter("Price");
				String date=req.getParameter("date"); 
				
				double p = Double.parseDouble(iprice);
				
				total+=p;
				
			    Statement stmt = con.createStatement(); rs =stmt.executeQuery("SELECT count(*) FROM daily_xpense");
			    rs.next();
			    int cnt = rs.getInt(1)+1;
					
				PreparedStatement ps = con.prepareStatement("insert into daily_xpense values(?,?,?,?)");

				ps.setInt(1, cnt);
				ps.setString(2, item);
				ps.setDouble(3, p);
				ps.setString(4, date);
				ps.executeUpdate();

				ps.close();
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("dailyXpense.jsp");
				req.setAttribute("totalAmt",total); 
				req.setAttribute("Date",date); 
				req.setAttribute("result","Successfully added to the Database"); 
				// set your String value in the attribute
				dispatcher.forward( req, res );
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

}
