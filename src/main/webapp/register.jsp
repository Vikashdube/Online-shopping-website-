
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        
         <%@include file ="components/comman_css_js.jsp" %>
        
        
    </head>
    <body>
        
         <%@include file ="components/navbar.jsp" %>
        
         <div class ="container-fluid"
         
         
         <div class ="row mt-6">
             
             <div class="col-md-6 offset-md-3">
                 
                 
                 
                 
                 <div class="card mt-3">
                     
                     <%@include file="components/massage.jsp" %>
                     
                     
                     <div class ="card-body">
                         
                         
                     <h3 class="text-center ">Sign up Here</h3>
                 
                     <form action="RegisterServletNew" method="post">
                     
                     <div class="form-group">
                        <label for="name">User Name</label>
                        <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Here">
                      </div>
                     
                     <div class="form-group">
                        <label for="email">User Email</label>
                        <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Here">
                      </div>
                     
                     <div class="form-group">
                        <label for="password">User Password</label>
                        <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Here">
                      </div>
                     
                     <div class="form-group">
                        <label for="phone">User Phone Number</label>
                        <input  name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Here">
                      </div>
                     
                     <div class="form-group">
                        <label for="phone">User Address</label>
                        
                        <textarea  name="user_address" style ="height:70px"  class ="form-control" placeholder="Enter your address"></textarea>
     
                      </div>
                     
                     <div class="container  text-center" >
                        
                         <button btn btn-outline-success>Register</button>
                         
                         <button btn btn-outline-warning>Reset</button>
                         
                     </div>
                     
                     
                     
                     
                 </form>  
                         
                         
                         
                         
                         
                     </div>
                     
                 </div>
                 
                 
                 
             </div>
            
         </div>
         
         
    </div>
        
    </body>
</html>
