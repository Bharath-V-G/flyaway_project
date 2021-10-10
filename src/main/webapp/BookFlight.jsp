<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="web.Booking" %>
<%
try{
	 Booking.flight_booking_id = request.getParameter("flight_id");
	    Booking.ticket_price = Integer.parseInt(request.getParameter("ticket_price"));
	    Booking.flight_name = request.getParameter("name");
 }
catch(Exception e)
{
	
}
   
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Details</title>
</head>
<body>

<div>
<%
	session=request.getSession(false);
if(session.getAttribute("email")!=null)
{
//	out.println("welcome " +session.getAttribute("name"));
	
	out.println("welcome " +session.getAttribute("email"));
%>

 </div>
 <br>
 <div align="right">
<a href="logout">Logout</a>
  </div>
  
  <div align="center">
  
    <h1>Booking Details</h1> 
       
        <h2>   Enter Passenger Details
        </h2>
        </div>
 <br>
 <br>
<section >
        <section >
          
            <section >
                <div align="center">  
                <form action="${pageContext.request.contextPath}/Payment.jsp" method="post" class="form-container">
                <div style="border:3px solid black;width:95%;border-radius:20px;padding:20px" align="center">
          <table style="with: 100%">
    <tr>
     <td>Passenger Name</td>
     <td> <input type="text" name="pname" placeholder="Name of Passenger"></td>
    </tr>
    <tr>
     <td>Email address</td>
     <td><input type="email" name="email"  aria-describedby="emailHelp" placeholder="Enter email"></td>
    </tr>
 <tr>
     <td>Phone number</td>
     <td><input type="number"  name="phone" placeholder="Enter phone number"></td>
    </tr>
   </table>
      
                    <br>
                    <button type="submit" value="Submit">Submit</button>
                     </div>
                </form>
                </div>
            </section>
        </section>
    </section>
<%} else
	{%>
	<div>
	<p align="center"  style="color:red;font-size:40px;font-weight:bold">Unauthorized! please login first</p>

	</div>
<%@ include file= "ULogin.jsp" %>
<%} %>
</body>
</html>