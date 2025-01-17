
package com.mycompany.mycart.servlet;

import com.mycompany.mycart.entites.User;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author HP
 */
public class RegisterServletNew extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            try {
            
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userPhone= request.getParameter("user_phone");
            String userAddress= request.getParameter("user_address");
            
            
            // validation 
            
                 if(userName.isEmpty())
            {
                out.println("Name is blank");
                return;
            }
               
                 // creating user object to store data 
            
        User user= new User(userName ,userEmail, userPassword , userPhone ,"defailt.jpg" ,userAddress,"normal");
        
           Session hibernateSession=  FactoryProvider.getFactory().openSession();
                
           Transaction tx = hibernateSession.beginTransaction();
           
          int userId= (int) hibernateSession.save(user);
           
          
           
           tx.commit();
           hibernateSession.close();
           
          HttpSession httpSession = request.getSession();
          httpSession.setAttribute("massage","Registration Succusseful !!");
          
          
          response.sendRedirect("register.jsp");
          
          return;
           
           
           
           
           
           
           
           
           
                
            }catch(Exception e){
                e.printStackTrace();
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
