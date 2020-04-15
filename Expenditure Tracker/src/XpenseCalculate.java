

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/XpenseCalculate")
public class XpenseCalculate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public XpenseCalculate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//TODO: here u need to check first if checkbox is for weekly monthly or yearly and add to respective database each time usser enters it
		// then calculate total cost in resp db and when user presses submit print the total expense nd add link to to index page
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
