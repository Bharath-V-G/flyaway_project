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


@WebServlet("/DeleteFlight")
public class DeleteFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String flightid=request.getParameter("flightid");
		
		PrintWriter out = response.getWriter();
		if(flightid.equals(""))
		{
			HttpSession session=request.getSession(false);
			out.print("Fields cannot be empty");
			session.setAttribute("message", "Invalid Details");
			response.sendRedirect("deleteFlight.jsp");
		}
		else
		{
		HashMap<String,String> flight=new HashMap<>();
		flight.put("flightid", flightid);
		
		
		try {
			Dao dao=new Dao();
			HttpSession session=request.getSession(false);
			if(dao.deleteFlight(flight)) {
				
				session.setAttribute("message", "Flight Deleted Successfully");
			}
			else {
				session.setAttribute("message", "Invalid Details");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.print("error");
			e.printStackTrace();
		}
		response.sendRedirect("deleteFlight.jsp");
		
	}
}
}
