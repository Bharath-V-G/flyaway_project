package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	public static boolean isLoggedIn = false;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/html");
		
		AdminLogindao logindao = new AdminLogindao();
		
		
		
		
		if(logindao.check(email,pass)){

			
			HttpSession session = request.getSession();
			
			session.setAttribute("mail",email);
		
			out.println("Admin Logged In Successfully");
				
	        response.sendRedirect("AdminDashboard.jsp");
			
		}
		else{
			out.println("<h2><font color= red>Incorrect username and password</h2>");
			out.println("</font >");
		//	out.println("User Not Registered");
			request.getRequestDispatcher("AdminLogin.jsp").include(request, response);
	           
	            
	            

		}
		 
		 
		
		
	}
	

}
