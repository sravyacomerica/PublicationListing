/**
 * @author  Tirupachur Comerica, Sri Sravya 
 * @LastModified 04.23.2018
 * 
 *
 **/
package org.demo.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.demo.dto.Details;
import org.demo.service.SearchService;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*Gets the search value from the search.jsp page*/
		List<Details> result = new ArrayList<Details>();
		String Key = request.getParameter("key");
		SearchService searchservice = new SearchService();
		result = searchservice.Con(Key);
		request.setAttribute("List", result);

	if(result.size()==0)
	{
		/*Sends an error message if the keyword does not exists*/
		request.setAttribute("Msg", "No such keyword exists!");
		RequestDispatcher rd = request.getRequestDispatcher("/search.jsp");
		rd.include(request, response);
	}
	else
	{
		/*Sends an List object of the search results*/
		request.setAttribute("Values", result);
		RequestDispatcher re = request.getRequestDispatcher("/search.jsp");
		re.include(request, response);

	}
	}
}
