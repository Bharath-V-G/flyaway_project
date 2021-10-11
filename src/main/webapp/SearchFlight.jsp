<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Flight</title>
</head>
<body>

<div>
<%
	session=request.getSession(false);
if(session.getAttribute("email")!=null)
{
	//out.println("welcome " +session.getAttribute("name"));
	
	out.println("welcome " +session.getAttribute("email"));
%>



</div>
<div align="right">
<br>
<a href="logout">Logout</a>
 <br>
</div>

 <br>
<div align="center">
 
    <div>
        
       <h1>Welcome to FlyAway</h1> 
       
        <h2>   Ticket Booking
        </h2>
      <br>
        
       <br>
    
    </div>
    
    
   <form action="SearchFlight" method="post">
     <div style="border:3px solid black;width:50%;border-radius:20px;padding:20px" align="center">
        <div>
          
          
            <label for="date">Date</label>
          <input type="date"   id="date" name="date" placeholder="yyyy-mm-dd..">
        
        
        </div>
        
        <div>
          <label for="source">Source</label>
                    <select  id="source" name="source">
                        <option value="India">India</option>
                         <option value="Canada">Canada</option>
                         <option value="Japan">Japan</option>
                         <option value="Germany">Germany</option>
                         <option value="Switzerland">Switzerland</option>
                           <option value="USA">USA</option>
                        <option value="UK">UK</option>
                         <option value="Ireland">Ireland</option>
                        <option value="China">China</option>
                        <option value="Australia">Australia</option>
                        <option value="Dubai">Dubai</option>
                        <option value="Russia">Russia</option>
                        <option value="Thailand">Thialand</option>
                        <option value="Singapore">Singapore</option>
                        <option value="Ukraine">Ukraine</option>
                        <option value="Iran">Iran</option>
                        <option value="Israel">Israel</option>
           
                    </select>
        
        
        </div>
        
        
        <div>
        
           <label for="destination">Destination</label>
                    <select  id="destination" name="destination">
                    
                            <option value="USA">USA</option>
                     <option value="India">India</option>
                         <option value="Canada">Canada</option>
                         <option value="Japan">Japan</option>
                         <option value="Germany">Germany</option>
                         <option value="Switzerland">Switzerland</option>
                   
                        <option value="UK">UK</option>
                         <option value="Ireland">Ireland</option>
                        <option value="China">China</option>
                        <option value="Australia">Australia</option>
                        <option value="Dubai">Dubai</option>
                        <option value="Russia">Russia</option>
                        <option value="Thailand">Thialand</option>
                        <option value="Singapore">Singapore</option>
                        <option value="Ukraine">Ukraine</option>
                        <option value="Iran">Iran</option>
                        <option value="Israel">Israel</option>
                        <option value="Pakistan">Pakistan</option>
       
                        
                    </select>
        
        </div>
        
        
        <div>
        
          <label for="persons">No of Persons</label>
                    <select id="persons" name="persons">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
        
        
        </div>
        
         <button type="submit"  value="Submit">Search Flights</button>
    
    </div>
    
    </form>
</div>
<%} else
	{%>
	<div>
	<p align="center"  style="color:red;font-size:40px;font-weight:bold">Unauthorized! please login first</p>

	</div>
<%@ include file= "ULogin.jsp" %>
<%} %>
</body>
</html>