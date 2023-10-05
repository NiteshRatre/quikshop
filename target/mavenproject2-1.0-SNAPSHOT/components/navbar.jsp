<%@page import="com.mycompany.mavenproject2.entities.User"%>
<%
    User user1 = (User)session.getAttribute("current-user");
    
    %>
<nav class="navbar navbar-expand-lg navbar-light bg-light custom_bg">
    <div class="container" >
        <div class="mr-3"></div><a class="navbar-brand" href="#">QuikShop</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>

<!--      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>-->
      
    </ul>
      
    <ul class="navbar-nav ml-auto">  
        
        <li class="nav-item active">
            <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </svg><span id="cart_show">(0)</span></a>
            </li>
        
      <%
          
      if(user1==null)
      {
        %>
            <li class="nav-item active">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="register.jsp">Register</a>
            </li>
      
      <%
      
      
      }
      else
      {
      
      %>
      <li class="nav-item active">
          <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"index.jsp"%>">Hello <%= user1.getUserName() %></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="LogoutServlet">Logout</a>
            </li>
      
      
      <%
      
      }

      %>
    </ul>
  </div>
        
    </div>
</nav>