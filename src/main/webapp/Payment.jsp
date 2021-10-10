<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="web.Booking" %>
<%@ page import="web.Search" %>
<%
	session=request.getSession(false);
if(session.getAttribute("email")!=null)
{
	//out.println("welcome " +session.getAttribute("name"));
	
	out.println("welcome " +session.getAttribute("email"));
%>
<%
response.setContentType("text/html");
    Booking.passenger_name = request.getParameter("pname");
    Booking.passenger_email= request.getParameter("email");
    Booking.passenger_phone= request.getParameter("phone");

    if (Booking.passenger_name.equals("")
            || Booking.passenger_email.equals("")
            || Booking.passenger_phone.equals("")) {
    	
    	out.println("<h2><font color= red>Please enter valid passenger details</h2>");
		out.println("</font >");
      
        %>
         <%@ include file= "BookFlight.jsp" %>
       
   <%  }
    else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Details</title>
</head>
<body>

    <section >
        <section >
            <div class="row">
                <div class="col">
                    <h1 align="center" ><b>Checkout</b></h1>
                    <p align="center" ><span><strong>Enter Payment Details</strong></span></p><br>
                </div>
            </div>
           <section>
           
           
               <form action="${pageContext.request.contextPath}/ThankYou.jsp" method="post" class="form-container">
                  <div style="border:3px solid black;width:95%;border-radius:20px;padding:20px" align="center">  
                     <div align="center">  
                   
     <table style="with: 100%">
    <tr>
     <td>UPI Id</td>
     <td> <input type="text" name="name_on_card" placeholder="Enter UPI Id"></td>
    </tr>
    <tr>
     <td>Mobile Number</td>
     <td> <input type="number" name="card_details" placeholder="Enter Mobile Number"></td>
    </tr>
   </table>
                  </div> 
          <br>
                   <p align="left"><span><strong>Total Amount<br> <%=Booking.ticket_price%> X <%=Search.persons%> persons = Rs.<%=Booking.ticket_price*Search.persons%></strong></span></p>
                   <button type="submit" value="Submit">Pay Through UPI</button>
                   </div>
               </form>
          </section>
        </section>
    </section>
  

</body>
<%
    }
%>

</html>
<%} else
	{%>
	<div>
	<p align="center"  style="color:red;font-size:40px;font-weight:bold">Unauthorized! please login first</p>

	</div>
<%@ include file= "ULogin.jsp" %>
<%} %>