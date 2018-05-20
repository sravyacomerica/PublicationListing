/**
 * @author  Tirupachur Comerica, Sri Sravya 
 * @LastModified 04.23.2018
 * 
 *
 **/
package org.demo.test;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.demo.service.PublicationService;

/**
 * Servlet implementation class PublicationServlet
 */
@WebServlet("/PublicationServlet")
public class PublicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		/*Gets input values from publicationlist.jsp page*/
		String Title = request.getParameter("Title");
		String Author = request.getParameter("Author");
		String Year = request.getParameter("Year");
		System.out.println(Year);
		String Newspaper = request.getParameter("Newspaper");
		String Pages = request.getParameter("Pages");
		PublicationService publicationservice = new PublicationService();
		boolean result = publicationservice.Con(Title, Author, Year, Newspaper, Pages);
		if (result) {
			/*Sends an success message if the details are entered*/
			request.setAttribute("SuccessMsg", "Details have been entered successfully!");
			RequestDispatcher rd = request.getRequestDispatcher("/publicationlist.jsp");
			rd.include(request, response);
		} else {
			/*Sends an error message if the author does not exists*/
			request.setAttribute("alertMsg", "This Author does not exist, please enter author in author listing!");
			RequestDispatcher rd = request.getRequestDispatcher("/publicationlist.jsp");
			rd.include(request, response);
		}

	}

}
