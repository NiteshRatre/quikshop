<%@page import="com.mycompany.mavenproject2.entities.User"%>
<%
    User user = (User)session.getAttribute("current-user");
    if(user == null)
    {
        session.setAttribute("message", "You are  not Logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal Pannel</title>
        <%@include file="components/common_css_jsp.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>This is normal user Pannel</h1>
    </body>
</html>
