/**
 * @author  Tirupachur Comerica, Sri Sravya 
 * @LastModified 04.23.2018
 * 
 *
 **/
package org.demo.test;
import org.demo.dto.PublicationDetails;
import org.demo.service.PublicationSearchService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PublicationSearchServlet
 */
@WebServlet("/PublicationSearchServlet")
public class PublicationSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<PublicationDetails> result = new ArrayList<PublicationDetails>();
		/*Gets the input value from publicationsearch.jsp page*/
		String Key = request.getParameter("key");
		PublicationSearchService service = new PublicationSearchService();
		result = service.Search(Key);
	if(result.size()==0)
	{
		/*Sends an error message if the keyword does not exists*/
		request.setAttribute("Msg1", "No such keyword exists!");
		RequestDispatcher rd = request.getRequestDispatcher("/publicationsearch.jsp");
		rd.include(request, response);
		
	}
	else
	{
		/*Sends an List object of the search results*/
		for(PublicationDetails element : result) {
			  System.out.println(element.getPublication_id());
			  System.out.println(element.getTitle());
			  System.out.println(element.getAuthor());
			  System.out.println(element.getYear());
			  System.out.println(element.getNewspaper());
			  System.out.println(element.getPages());
			}
		request.setAttribute("Values1", result);
		RequestDispatcher re = request.getRequestDispatcher("/publicationsearch.jsp");
		re.include(request, response);

		}
	}
}
