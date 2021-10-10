package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.URegistration.dao.AdminLogindao;
//import com.URegistration.dao.Logindao;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	public static boolean isLoggedIn = false;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		PrintWriter out = response.getWriter();
		
		//out.println(email+" "+pass);
		
		
		AdminLogindao logindao = new AdminLogindao();
		
		
		
		
		if(logindao.check(email,pass)){
			
//			HttpSession session = request.getSession();
//			
//			session.setAttribute("username", uname);
		//	out.println("User Logged In Successfully");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("mail",email);
			//session.setAttribute("name",name);
			out.println("Admin Logged In Successfully");
				
	        response.sendRedirect("AdminDashboard.jsp");
			
		}
		else{
			  
	            out.println("Login Failed : Incorrect email or Password");
	            
	            

		}
		 
		 
		
		
	}
	

}
