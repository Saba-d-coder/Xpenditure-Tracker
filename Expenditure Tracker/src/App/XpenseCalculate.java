package App;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import code.DatabaseConnection;

@WebServlet("/XpenseCalculate")
public class XpenseCalculate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSet rs = null;
	
    public XpenseCalculate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		 
		String Itemname = request.getParameter("itemName");
		double Price = Double.parseDouble(request.getParameter("price"));
		String Choice = request.getParameter("choice");
		try {
		 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "pompom000");
		   
		     if(Choice.equals("Month")) {
				 String Month = request.getParameter("date");
				 PreparedStatement pst1 = con.prepareStatement("select max(id)+1 from monthly_xpense");
		         ResultSet rs = pst1.executeQuery();
		
		         int id=0;
			     
		         while(rs.next()) {
			         id = rs.getInt(1);
			     }
				     
			     PreparedStatement st = con.prepareStatement("insert into monthly_xpense values(?, ?, ?, ?)");
			     st.setInt(1,id);
			     st.setString(2, Itemname);
			     st.setDouble(3,Price);
			     st.setString(4, Month);
			     st.executeUpdate();
			     st.close();
		     }    
		     else if(Choice.equals("Year")) {
				    String year = request.getParameter("date");
				    PreparedStatement pst1 = con.prepareStatement("select max(id)+1 from yearly_xpense");
				         ResultSet rs = pst1.executeQuery();
				         int id=0;
			             while(rs.next())
			             {
			                 id = rs.getInt(1);
			             }
		
				     PreparedStatement st = con.prepareStatement("insert into yearly_xpense values(?, ?, ?, ?)");
				     st.setInt(1,id);
				     st.setString(2, Itemname);
				     st.setDouble(3,Price);
				     st.setString(4, year);
				     st.executeUpdate();
				     st.close();
				     
		     } else if(Choice.equals("Day")){
		        String day = request.getParameter("date");
		        PreparedStatement pst1 = con.prepareStatement("select max(id)+1 from weekly_xpense");
		             ResultSet rs = pst1.executeQuery();
		             int id=0;
		             while(rs.next())
		             {
		                 id = rs.getInt(1);
		             }
		         PreparedStatement st = con.prepareStatement("insert into weekly_xpense values(?,?, ?, ?)");
		         st.setInt(1,id);
		         st.setString(2, Itemname);
		         st.setDouble(3,Price);
		         st.setString(4, day);
		         st.executeUpdate();
		         st.close();

		     } else {
		    	 out.println("<html><body><b>Please fill all the input"+
		                 "</b></body></html>");
		    	 response.sendRedirect("form.html");
		     }
		     
		     
		     out.println("<html><body align=\"center\"><b>Successfully Inserted"
		                 + "</b><br>"+
		    		 "<a href=\"index.html\"> Go to Home Page</a> <br>"+
		    		 "<a href=\"form.html\">Go back to Calculate Xpense</a>"+
		    		 "</body></html>");
		     
		     con.close();  

		} catch (Exception e) {
		     e.printStackTrace();
		  }
	
	}
}



