<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="web.Search" %>
<%@ page import="web.Booking" %>
<%
	session=request.getSession(false);
if(session.getAttribute("email")!=null)
{
	//out.println("welcome " +session.getAttribute("name"));
	
	out.println("welcome " +session.getAttribute("email"));
%>
<%
response.setContentType("text/html");
    Booking.name_on_card = request.getParameter("name_on_card");
    Booking.card_details = request.getParameter("card_details");

    if (Booking.name_on_card.equals("") || Booking.card_details.equals("")) {
    	//response.sendRedirect("Payment.jsp");
    		out.println("<h2><font color= red>Please enter valid card details</h2>");
		out.println("</font >");
  }
    else
    {
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank You</title>
</head>
<body>
<br>
<br>
 <div align="right">
<a href="logout">Logout</a>
  </div>
 <br>

<div>
        <h2 align="center"><span><strong>Thank You</strong></span></h2>
       
        <p align="center"><span><strong>Flight has booked</strong></span></p>
       
        <br>
        <h3>Ticket Details</h3>
        <h4><strong><%=Search.source%> to <%=Search.destination%> | <%=Search.date%> (<%=Search.day%>)</strong></h4>
        <p align="left"><%=Booking.flight_booking_id%> - <%=Booking.flight_name%> (Travellers <%=Search.persons%>)</p><br>
        <br>
        <h3><strong>Passenger Summary</strong></h3>
        <h3>Booking Name-<%=Booking.passenger_name%> | Email- <%=Booking.passenger_email%> | Phone- <%=Booking.passenger_phone%></h3>
        <br>
        <h3><strong>Payment Summary</strong></h3>
        <h4>Payment By-<%=Booking.name_on_card%> | Card No- <%=Booking.card_details%></h4><br>
        <h2 align="right"><strong>Total Paid- Rs.<%=Search.persons*Booking.ticket_price%></strong></h2><br><br>
        
         <p><button onclick="window.print()" >Print Ticket</button></p>
    </div>

</body>
<%} %>
</html>
<%} else
	{%>
	<div>
	<p align="center"  style="color:red;font-size:40px;font-weight:bold">Unauthorized! please login first</p>

	</div>
<%@ include file= "ULogin.jsp" %>
<%} %>