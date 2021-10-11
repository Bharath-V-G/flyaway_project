<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login</title>
</head>
<body>
<div align="center">

      
    
   <h1>Welcome to FlyAway</h1>  
     <h2>
      User  Login
     </h2>
     
     
     <form action="UserLogin" method="post">
         <div style="border:3px solid black;width:50%;border-radius:20px;padding:20px" align="center">
       <table style="with: 100%">
    <tr>
     <td>Email</td>
     <td><input name="email" type="text"></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input name="password" type="password"></td>
    </tr>

   </table>
       
       
          
   
        <button type="submit" value="Submit">LogIn</button>
     </div>  
     </form>
     
    
    </div>



</body>
</html>