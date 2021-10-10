package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import Logindao;

/**
 * Servlet implementation class ULogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		PrintWriter out = response.getWriter();
		
		//out.println(email+" "+pass);
		
		
		Logindao logindao = new Logindao();
		
		
		
		
		if(logindao.check(password,email)){
			
			
			
		HttpSession session = request.getSession();
			
		session.setAttribute("email",email);
	//	session.setAttribute("name",name);
		
		out.println("<h2><font color= green>User Logged In Successfully</h2>");
		out.println("</font >");
	//	out.println("User Not Registered");
		request.getRequestDispatcher("SearchFlight.jsp").include(request, response);
		out.println("User Logged In Successfully");
	
			//response.sendRedirect("SearchFlight.jsp");
			
			
		}
		else{
			out.println("<h2><font color= red>Incorrect username and password</h2>");
			out.println("</font >");
		//	out.println("User Not Registered");
			request.getRequestDispatcher("ULogin.jsp").include(request, response);
		//	out.println("<h1>Incorrect username and password</h1>");
			
		}
		 
		 
		
		
	}

}
