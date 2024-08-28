
package com.mycompany.mycart.servlet;



import com.mycompany.mycart.dao.CategoryDao;
import com.mycompany.mycart.dao.ProductDao;

import com.mycompany.mycart.entites.Category;
import com.mycompany.mycart.entites.Product;

import com.mycompany.mycart.helper.FactoryProvider;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

import java.io.FileOutputStream;
import java.io.InputStream;





@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
      
            
            
     String op= request.getParameter("operation");
            
            if(op.trim().equals("addcategory"))
            {
                // add category 
                
                 // Faching category data 
            
        String title= request.getParameter("catTitle");
        String description= request.getParameter("catDescription");
            
            Category category=new Category();   
             category.setCategoryTitle(title);
             category.setCategoryDescription(description);
             
                // category data base save 
                
            CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
            int catId= categoryDao.saveCategory(category);
           //  out.println("Category saved");
            HttpSession httpSession= request.getSession();
            httpSession.setAttribute("massage", "Category add successfully");
            response.sendRedirect("admin.jsp");
            return ;
            
            
            
                
                
            }else if(op.trim().equals("addproduct"))
            {
                // add product 
                // work 
                
               String pName= request.getParameter("pName");
               String pDesc= request.getParameter("pDesc");
               int pPrice = Integer.parseInt(request.getParameter("pPrice"));
               int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
               int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
               int catId = Integer.parseInt(request.getParameter("catId"));
               Part part = request.getPart("pPic");
               
                     
               Product p = new Product();
               p.setpName(pName);
               p.setpDesc(pDesc);
               p.setpPrice(pPrice);
               p.setpDiscount(pDiscount);
               p.setpQuantity(pQuantity);
               p.setpPhoto(part.getSubmittedFileName());
               
                // get category by id 
                
                CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
                Category category= cdoa.getCategoryById(catId);
                
                p.setCategory(category);
                
                // product save..
                
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                
   
                 // pic upload 
        // find out the path to upload photo
                   
                 String path = request.getRealPath("img") + File.separator+"products" + File.separator + part.getSubmittedFileName();
                 System.out.println(path);
                 
            
             // uploding code..
                try{
             
             
             FileOutputStream fos = new FileOutputStream(path);
              
             InputStream is = part.getInputStream();
             
             // Reading data
             
             byte [] data = new byte[is.available()];
                is.read(data);
                
                // writing the data 
                
                 fos.write(data);
                 fos.close();
        
                 } catch (Exception e){
                     e.printStackTrace();
                 }
            
        
        
        
                 
                 
                 

                 HttpSession httpSession= request.getSession();
                 httpSession.setAttribute("massage", "Product is add successfully");
                 response.sendRedirect("admin.jsp");
                 return ;
                
                
                
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
