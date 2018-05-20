/**
 * @author  Tirupachur Comerica, Sri Sravya 
 * @LastModified 04.23.2018
 * 
 *
 **/
package org.demo.test;
import org.demo.service.*;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SimpleServlet
 */
@WebServlet("/SimpleServlet")
public class SimpleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    /*Gets values from the input fields of Page.jsp page*/
		response.setContentType("text/html");
		String Name= request.getParameter("Name");
		String Institution= request.getParameter("Institution");
		String Department= request.getParameter("Department");
		String Email= request.getParameter("Email");
		String Address= request.getParameter("Address");
		String Home= request.getParameter("Home");
        Service service= new Service();
        boolean result = service.Con(Name,Institution,Department,Email,Address,Home);
		if(result)
		{
			/*Returns insertion success message to the jsp page*/
			request.setAttribute("SuccessMsg1", "Details have been entered successfully!");
			RequestDispatcher rd=request.getRequestDispatcher("/Page.jsp");  
			rd.include(request, response); 
		}
		else
		{
			/*Returns duplicate value message to the jsp page*/
			request.setAttribute("alertMsg", "The author already exists!");
			RequestDispatcher rd=request.getRequestDispatcher("/Page.jsp");  
			rd.include(request, response);
		}
		
	}

}
