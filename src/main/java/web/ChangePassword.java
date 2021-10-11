package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
		       ChangePasswordAdmindao cdao = new ChangePasswordAdmindao();
		       
		       
		       PrintWriter out = response.getWriter();
		       
		       
		       String pass = request.getParameter("passwordEntered");
		       
		       
		       HttpSession session=request.getSession(false);
		       if(session.getAttribute("mail")==null)
		       {

		            out.println("You must login first");
		        }
		        else if (pass.equals("")){
		            out.println("Password can't be empty");
		        }
		        else if (session.getAttribute("mail")!=null && !pass.equals("")){
		             if(cdao.check(pass)){
		            
		            	 response.setContentType("text/html");
		            	 out.println();
		            	 out.println();
		            	 out.println();
		            	 out.println();
		            	 out.println();
		            	 out.println("<h2><font color= green>Password changed Successfully</h2>");
		 				out.println("</font >");
		 			request.getRequestDispatcher("AdminDashboard.jsp").include(request, response);
		             }
		            
		        }
		        else {
		            out.println("Sorry, Something went wrong");
		        }
		
		
		
	}

}
