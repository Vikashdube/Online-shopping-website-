<%-- 
    Document   : index
    Created on : 04-Jan-2024, 3:29:41 pm
    Author     : HP
--%>


<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entites.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.entites.Product"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@ page import="java.util.*"%>
<%@page import = "com.mycompany.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mycart-Home page</title>
        
        <%@include file ="components/comman_css_js.jsp" %>
        
        
    </head>
    <body>
        
        <%@include file ="components/navbar.jsp" %>
        
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            
            
            <% 
                
                
            String cat= request.getParameter("category");
        //    out.println(cat);
            
               
            ProductDao dao = new ProductDao(FactoryProvider.getFactory());
             List<Product> list =null;
             
             if(cat==null){
             
                list = dao.getAllProducts();
                }
             
             
         else if( cat.trim().equals("all"))
            {
            
                list = dao.getAllProducts();
            
                }else{
                
               int cid=Integer.parseInt(cat.trim());
               list = dao.getAllProductsById(cid);
                
            }
            
           
           CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
           List<Category> clist= cdao.getCategories();
            
            
            
            
            %>
            
            
            
            
            
      <!<!-- show category -->   
            <div class="col-md-2">
               
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                      All Products
                    </a>
                    
                   
                    
                
                
                
                
                
                <%
                   for(Category c:clist)
                   {
                   %>
                   
                   
                <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
                        
                   
                   <%
                       }
                %>
                
                 </div>
            </div>
            
      <!<!-- show products -->
             <div class="col-md-10">
                
                 <!-- row -->
                 <div class="row mt-4">
                     
                     <!-- col:12 -->
                     <div class="col-md-12">
                         
                         <div class="card-columns">
                             
                            <!-- Traversing products -->

                            <%
                              for(Product p:list){
                            
                            %>
                            
              <!-- product card -->
                            
                            
                            <div class="card">
                                
                                <div class="container text-center mt-2">
                                     <img src="img/products/<%=p.getpPhoto()%>" style="max-height: 180px;max-width: 100%; width: auto;" class="card-img-top " alt="...">
                                
                                </div>
                                
                               
                                <div class="card-body">
                                    
                                    <h5 class="card-title"><%= p.getpName() %></h5> 
                                    
                                    <p class="card-text">
                                        
                                        <%= Helper.get10Words(p.getpDesc())%>
                                     
                                    </p>
                                  
                                </div>
                                        
                                        <div class="card-footer">
                                            
                                            <button class=" btn btn-success text-white" onclick="add_to_cart(<%= p.getpId() %> ,'<%= p.getpName()  %>' ,<%= p.getPriceAfterApplyingDiscount()  %> )">Add To Card</button>
                                            <button class=" btn btn-danger text-white">&#8377;<%= p.getPriceAfterApplyingDiscount()%>/- <span class=" discount-lebel" style="font-size: 10px;">&#8377; <%= p.getpPrice() %> <%= p.getpDiscount() %>%off </span> </button>
                                            
                                            
                                        </div>  
                                        
                                        
                                        
                                        
                              
                            </div>
                            
                           
                            
                            <%
                                }
                              if(list.size()==0){
                              out.println("<h3>No item in this category</h3>");
                           }


                            %>
                             
                         </div>
                         
                         
                     </div>
                     
                     
                 </div>
                 
                 
                 
                 
                 
                 
                 
            </div>
            
        </div>
        
        </div>
        
        
        
        
        
         <%@include file="components/common_models.jsp" %>
                            
        
        
        
        
    </body>
</html>
