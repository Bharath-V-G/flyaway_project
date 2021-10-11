package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZonedDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SearchFlight")
public class SearchFlight extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    PrintWriter out = response.getWriter();
		    Search.date = request.getParameter("date");
	        Search.source = request.getParameter("source");
	        Search.destination = request.getParameter("destination");
	        Search.persons = Integer.parseInt(request.getParameter("persons"));
	        response.setContentType("text/html");
	        if (Search.date.equals("")) {
	        	out.println("<h2><font color= red>Please enter a valid date</h2>");
				out.println("</font >");
			request.getRequestDispatcher("SearchFlight.jsp").include(request, response);
	           // out.println("Please enter a valid date");
	        }
	        else {
	        	try {
	        	    String day = getDay(Search.date);
        	         Search.day = Search.date;
		        	//response.sendRedirect("SearchResult.jsp");
	        	    response.sendRedirect("SearchResult.jsp");
	        	}
	        	catch(Exception e)
	        	{
	        		out.println("<h2><font color= red>Please enter a valid date</h2>");
				out.println("</font >");
			request.getRequestDispatcher("SearchFlight.jsp").include(request, response);
	        		//out.println("Please enter a valid date");	
	        	}
	
	        } 
		
		
	}
	
	 public String getDay(String dateInp) {
		 
		   // ZonedDateTime d = ZonedDateTime.parse(dateInp);
	        LocalDate dt = LocalDate.parse(dateInp);
	        return dt.getDayOfWeek().toString();
	    }
	
	
	

}
