
package com.mycompany.mavenproject2.servlets;


import com.mycompany.mavenproject2.FactoryProvider;
import com.mycompany.mavenproject2.dao.UserDao;
import com.mycompany.mavenproject2.entities.User;
import com.mycompany.mavenproject2.entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            //Validations
            // Authenticating User
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailandPassword(email,password);
            //System.out.println(user);
            HttpSession httpSession = request.getSession();
            if(user == null)
            {
                httpSession.setAttribute("message", "Invalid Details Try with another one !!");
                response.sendRedirect("login.jsp");
                return;
            }
            else{
                out.println("<h1>Welcome "+user.getUserName()+" </h1>");
                
                httpSession.setAttribute("current-user",user);
                
                
                if(user.getUserType().equals("admin"))
                {
                    response.sendRedirect("admin.jsp");
                }
                else if(user.getUserType().equals("normal"))
                {
                    response.sendRedirect("index.jsp");
                }
                else
                {
                    out.println("We have not identified user type !!");
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
