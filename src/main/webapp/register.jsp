<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_jsp.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            
            <div class="row mt-3 justify-content-center">
            <div class="col-5 offset-mid-4">
                <div class="card">
                    
                    <%@include file="components/message.jsp" %>
                    
                    <div class="card-body px-5">
                        
                        <div class="container text-center">
                            <img src="img/register_icon.png" style="max-width:100px;" alt="register_icon">
                        </div>
                        <h3 class="text-center">Sign up Here!!</h3>
                        <form action="RegisterServlet" method="post">
                    
                    <div class="form-group">                       
                        <label for="name">User Name</label>
                        <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter User_Name">
                    </div>
                    
                    <div class="form-group">                       
                        <label for="email">Email Id</label>
                        <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                    </div>  
                    
                    <div class="form-group">                       
                        <label for="password">Password</label>
                        <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Password">
                    </div> 
                    
                    <div class="form-group">                       
                        <label for="phone">Mobile No.</label>
                        <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Password">
                    </div> 
                            
                    <div class="form-group">                       
                        <label for="address">Address</label><br>
                        <textarea name="user_address" style="height: 100px; width: 400px;" class="form_control" placeholder="Enter your Address"></textarea>
                    </div> 
                    
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Register Here</button>
                        <button class="btn btn-outline-warning">Reset</button>
                    </div>
                </form>
                    </div>
                </div>
            </div>
        </div>
            
        </div>
        <br>
        <br>
    </body>
</html>
