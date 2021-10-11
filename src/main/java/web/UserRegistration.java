package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		
		
	    UserRegistrationdao uregdao = new UserRegistrationdao();
		
		if(name.equals("")||email.equals("")|| pass.equals("")){
			out.println("<h2><font color= red>Please Enter The Data Correctly</h2>");
			out.println("</font >");
		//	out.println("Please Enter The Data Correctly");
			request.getRequestDispatcher("UserRegister.jsp").include(request, response);
		}
		else{
			if(uregdao.check(name, email, pass)){
				out.println("<h2><font color= green>User Registered Successfully</h2>");
				out.println("</font >");
			request.getRequestDispatcher("ULogin.jsp").include(request, response);
				// if regsitered successfully then redirect to User Login.jsp
				//response.sendRedirect("ULogin.jsp");
				
			}
			else{
				out.println("<h2><font color= red>User Not Registered</h2>");
				out.println("</font >");
			//	out.println("User Not Registered");
				request.getRequestDispatcher("UserRegister.jsp").include(request, response);
				//response.sendRedirect("ULogin.jsp");
			}
		}

			
			
			
			
			
			
			
		
		
		
	}
	

	
}
