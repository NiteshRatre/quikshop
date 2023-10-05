<%@page import="java.util.Map"%>
<%@page import="com.mycompany.mavenproject2.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mavenproject2.entities.Category"%>
<%@page import="com.mycompany.mavenproject2.dao.CategoryDao"%>
<%@page import="com.mycompany.mavenproject2.FactoryProvider"%>
<%@page import="com.mycompany.mavenproject2.entities.User"%>
<%@include file="components/common_modals.jsp" %>
<%
    User user = (User)session.getAttribute("current-user");
    if(user == null)
    {
        session.setAttribute("message", "You are  not Logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
        
        if(user.getUserType().equals("normal")){
            
            session.setAttribute("message", "You are not Admin!! do not access this Page");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>

 <%
                    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list=cdao.getCategories();
                    
                    //getting count
                    Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());

                %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Pannel</title>
        <%@include file="components/common_css_jsp.jsp" %>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            
            <div class="container-fluid mt-3">
                
                <%@include file="components/message.jsp" %>
                
            </div>
<!--            First Row-->
            <div class="row mt-3">
                
<!--                    First Row First Column-->
                <div class="col-md-4">
                    
                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/total-user.png" alt="total_user">
                            </div>
                            
                            <h2><%=m.get("userCount")%></h2>
                            <h2 class="text-uppercase text-muted">Users</h2>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
<!--                First Row Second Column-->
                <div class="col-md-4">
                    
                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/categories.png" alt="total_user">
                            </div>
                            
                            <h2><%= list.size()%></h2>                
                         <h2 class="text-uppercase text-muted">Categories</h2>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
<!--                First Row Third Column-->
                <div class="col-md-4">
                    
                    <div class="card">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/product.png" alt="total_user">
                            </div>
                            
                            <h2><%= m.get("productCount")%></h2>                
                            <h2 class="text-uppercase text-muted">Products</h2>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
<!--            Second Row-->
            <div class="row mt-3"> 
                
<!--                Second Row First Column-->
                <div class="col-md-6">
                    
                    <div class="card" data-toggle="modal" data-target="#add-category">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/add-categories.png" alt="total_user">
                            </div>
                            
                            <p>Click here to add Categories</p>
                            <h2 class="text-uppercase text-muted">Add Categories</h2>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
<!--                Second Row Second Column-->
                <div class="col-md-6">
                    
                    <div class="card" data-toggle="modal" data-target="#add-product">
                        
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 120px" class="img-fluid rounded-circle" src="img/add-products.png" alt="total_user">
                            </div>
                            
                            <p>Click here to add Products</p>
                            <h2 class="text-uppercase text-muted">Add Products</h2>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
        </div>
        
<!--        Add Category Modal-->


<!-- Modal -->
<div class="modal fade" id="add-category" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom_bg">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
          <form action="ProductOperationServlet" method="post">
              
              <div class="form-group">
                  
                  <input type="hidden" name="operation" value="addcategory">
                  
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required>
                  
              </div>
              
              <div class="form-group">
                  
                  <textarea style="height: 150px" class="form-control" placeholder="Enter Category Description" name="catDescription" required></textarea>
                  
              </div>
              
              <div class="container text-center">
                  
                  <button class="btn btn-outline-success">Add Category</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  
              </div>
              
          </form>
          
      </div>
    </div>
  </div>
</div>


<!--            End Category Modal-->


                

<!--               Add Product Modal-->

           

  
<div class="modal fade" id="add-product" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom_bg">
        <h5 class="modal-title" id="exampleModalLabel">Fill Products Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
        
<!--          Opening Add Product Form-->
            
          <div class="modal-body">
              <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
           
              
<!--              Product Name-->

              <div class="form-group">
                   <input type="hidden" name="operation" value="addproduct">
                  <input type="text" class="form-control" name="pName" placeholder="Enter the Name of Product" required>
              </div>
              
<!--                Product Description-->

              <div class="form-group">
                  <textarea style="height: 150px" class="form-control" name="pDesc" placeholder="Enter the Description" required></textarea> 
              </div>

<!--              Product Price-->
                
                <div class="form-group">
                  <input type="number" class="form-control" name="pPrice" placeholder="Enter Price of Product" required> 
              </div>

<!--                Product Discount-->

                <div class="form-group">
                  <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required> 
              </div>
                
<!--                    Product Quantity-->

                <div class="form-group">
                  <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required> 
              </div>

              
<!--              PRODUCT CATEGORY-->

               
                <div class="form-group">
                    
                    <select name="catId" class="form-control" id="">
                        
                     <%   
                        for(Category c : list)
                        {
                      %>
                        <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                        <%
                            }
                            %>
                        
                    </select>
                </div>

<!--                Product Photo-->
            <div class="form-group">
                <label for="pPic">Select Picture of Product</label>
                <br>
                <input type="file" name="pPic" required>
    
            </div>

<!--               Submit Button-->

                <div class="container text-center">
    
                    <button class="btn btn-outline-success">Add Product</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                </div>
              
          </form>
          </div>

<!--          Closing Add Product Form-->

    </div>
  
</div>
</div>


<!--                End Product Modal-->
        
    </body>
</html>
