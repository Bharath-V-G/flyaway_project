<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration</title>
</head>
<body>
<div align="center">
    <div>
    
     <h1>Welcome to FlyAway</h1>
     
     <h2> User Registration </h2>
    
     
     <form action="UserRegistration" method="post" >
        <div style="border:3px solid black;width:50%;border-radius:20px;padding:20px" align="center">
        
         <table style="with: 100%">
    <tr>
     <td>Name</td>
     <td><input name="name"  type="text" maxlenght=50></td>
    </tr>
    <tr>
     <td>Email</td>
     <td><input name="email" type="email"  maxlength=100></td>
    </tr>
 <tr>
     <td>Password</td>
     <td><input name="password" type="password" maxlength="20"></td>
    </tr>
   </table>
        
  
        
        
        
       
  
        <button type="submit" value="Submit">Sign Up</button>
       </div>
     </form>
     
    
    </div>
 </div>

</body>
</html>