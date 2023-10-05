<%
    User user = (User)session.getAttribute("current-user");
    if(user == null)
    {
        session.setAttribute("message", "You are  not Logged in!! Login first to Access Checkout Page");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/common_modals.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <%@include file="components/common_css_jsp.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            
            <div class="row mt-5">
                
                <div class="col-md-6">
<!--                    card Details-->
                <div class="card">
                    
                    <div class="card-body">
                        
                        <h3 class="text-center mb-3">Your Selected Items</h3>
                        
                        <div class="cart-body">

                        
                            
                        </div> 
                        
                    </div>
                    
                </div> 
                    
                </div>
                
                <div class="col-md-6">
<!--                    form Details-->
                
                    <div class="card">
                    
                    <div class="card-body">
                        
                        <h3 class="text-center mb-3">Your Details for order!!</h3>
                        
                        <form action="#!">
                            
                           <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                           </div>
                            
                           <div class="form-group">
                            <label for="name">Name</label>
                            <input value="<%= user.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                           </div>
                           
                           <div class="form-group">
                            <label for="phone">Contact no.</label>
                            <input value="<%= user.getUserPhone() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                           </div>
                            
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                                <textarea value="<%= user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1" placeholder="Address" rows="3"></textarea>
                            </div>
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Order Now</button>
                                <button class="btn btn-outline-primary" onclick="index.jsp">Continue Shopping</button>
                            </div>
                            
                        </form> 
                        
                    </div>
                    
                </div> 

                    
                </div>
                
            </div>
            
        </div>
    </body>
</html>
