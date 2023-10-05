<%-- 
    Document   : index
    Created on : 14-Mar-2023, 8:18:36 pm
    Author     : HP
--%>

<%@page import="com.mycompany.mavenproject2.Helper"%>
<%@page import="com.mycompany.mavenproject2.entities.Category"%>
<%@page import="com.mycompany.mavenproject2.dao.CategoryDao"%>
<%@page import="com.mycompany.mavenproject2.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mavenproject2.dao.ProductDao"%>
<%@page import="com.mycompany.mavenproject2.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/common_modals.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QuikShop</title>
        <%@include file="components/common_css_jsp.jsp" %>
    </head>
    <body>
         
        <%@include file="components/navbar.jsp" %>
        
        <div class="container-fluid">
        
        <div class="row mt-3 mx-2">
            
            <%
                String cat = request.getParameter("category");
                //out.println(cat);
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                
                List<Product> list = null;
                if(cat == null || cat.trim().equals("All")){
                    list = dao.getAllProducts();
                }
                else{
                    int cid = Integer.parseInt(cat.trim());
                    list = dao.getAllProductsById(cid);
                }
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();
                %>
            
            <!--Show Categories-->
            <div class="col-md-2">
                
                
                <div class="list-group mt-4">
                    
                    <a href="index.jsp?category=All" class="list-group-item list-group-item-action active">
                    All Products
                    </a>
                     <%
                    for(Category c : clist)
                    {
                    %>
                    <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                    <% } %>
                </div>
                
                
            </div>
            
<!--                Show Products-->
            <div class="col-md-10">
                
                <div class="row mt-4">
                    
                    <div class="col-md-12">
                        
                        <div class="card-columns">
                            
<!--                            Traversing Products-->
                                <%
                                    for(Product p : list){
                                %>
                                
<!--                                Product Card-->
                                <div class="card">
                                    
                                    <div class="container text-center">
                                        
                                        <img class="card-img-top m-2 product-card" src="img/products/<%=p.getpPhoto()%>" style="max-height: 150px; max-width:100%; width: auto;" alt="Card image cap">

                                    </div>
                                    
                                    <div class="card-body">
                                        
                                        <h6 class="card-title"><%= p.getpName() %></h6>
                                        
                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDesc()) %>
                                        </p>
                                        
                                    </div>
                                        
                                        <div class="card-footer text-center">
                                            
                                            <button class="btn custom_bg text-white" onclick="add_to_cart( <%= p.getpId()%> , '<%= p.getpName()%>' , <%= p.getPriceAfterApplyingDiscount() %> )">Add to Cart</button>
                                            <button class="btn btn-outline-success "> &#8377; <%= p.getPriceAfterApplyingDiscount()%>/-<span class="text-secondary discount-label"> &#8377;<%= p.getpPrice()+","+ p.getpDiscount()%>%</span></button>
                                            
                                        </div>
                                    
                                </div>
                                
                                
                                <%  }
                                
                                    if(list.size() == 0)
                                    {
                                       out.println("<h3>No Item in this Category</h3>");
                                    }
                                %>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>
            
        </div>
    </body>
</html>
