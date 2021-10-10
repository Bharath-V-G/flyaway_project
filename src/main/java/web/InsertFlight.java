package web;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import dao.Dao;


@WebServlet("/InsertFlight")
public class InsertFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String flightid=request.getParameter("flightid");
		String name=request.getParameter("name");
		String source=request.getParameter("source");
		String destination=request.getParameter("destination");
		String day=request.getParameter("day");
		String price=request.getParameter("price");
		PrintWriter out = response.getWriter();
		if(flightid.equals("")||name.equals("")||source.equals("")||destination.equals("")||day.equals("")||price.equals(""))
		{
			HttpSession session=request.getSession(false);
			out.print("Fields cannot be empty");
			session.setAttribute("message", "Invalid Details");
			response.sendRedirect("AdminHome.jsp");
		}
		else
		{
		HashMap<String,String> flight=new HashMap<>();
		flight.put("flightid", flightid);
		flight.put("name", name);
		flight.put("source", source);
		flight.put("destination", destination);
		flight.put("day", day);
		flight.put("price", price);
		
		try {
			Dao dao=new Dao();
			HttpSession session=request.getSession(false);
			if(dao.insertFlight(flight)) {
				
				session.setAttribute("message", "Flight Added Successfully");
			}
			else {
				session.setAttribute("message", "Invalid Details");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.print("error");
			e.printStackTrace();
		}
		response.sendRedirect("AdminHome.jsp");
		
	}
}
}
