
package com.mycompany.mycart.servlet;

import com.mycompany.mycart.dao.UserDao;
import com.mycompany.mycart.entites.User;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class LoginServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
       // coding area      
          String email = request.getParameter("email");
          String password = request.getParameter("password");
          
          // authenticating user 
          UserDao userDao = new UserDao(FactoryProvider.getFactory());
          User user= userDao.getUserByEmailAndPassword(email, password);
        //  System.out.println(user);
          
        HttpSession httpSession =request.getSession();
        
        
            if(user ==null){
                out.println("<h1>Invalide details </h1>");
                httpSession.setAttribute("massage","Invalid Details !! try with another one ");
                response.sendRedirect("login.jsp");
                return ;
                
                
                
            }else{
                out.println("<h1>welcome" + user.getUserName()+"</h1>");
                
             // login 
             httpSession.setAttribute("current-user", user);
             
             if(user.getUserType().equals("admin"))
             {
                 // admine - adnin.jsp
                response.sendRedirect("admin.jsp");
             }else if(user.getUserType().equals("normal"))
             {
                 // normal normal.jsp
                 response.sendRedirect("normal.jsp");
             }else
             {
                 out.println("We hava not identified type ");
             }
             
                
                
             
              
              
              
                            
              
                
                
                
                
                
            }
            
            
            
            
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
