<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entites.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.entites.User"%>
<%

    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("massage", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {

            session.setAttribute("massage", "You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
        <%@include file="components/comman_css_js.jsp" %>


    </head>
    <body>

        <%@include file ="components/navbar.jsp" %>

        <div class="container admin">
              
            <div class="container-fluid mt-1">
                <%@include file="components/massage.jsp" %>
            </div>
            
            
            <div class="row mt-3">

                <!-- First co -->
                <div class="col -md-4">

                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 110px;" class="img-fluid" src="img/man.png" alt="user_icon">
                            </div>

                            <h1>9</h1>
                            <h1>User</h1>
                        </div>
                    </div>


                </div>

                <!-- Second col-->   
                <div class="col -md-4">

                    <div class="card">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 110px;" class="img-fluid" src="img/category.png" alt="user_icon">
                            </div>

                            <h1>8</h1>
                            <h1>Categories</h1>
                        </div>
                    </div>


                </div>

                <!<!-- Third col -->
                <div class="col -md-4">

                    <div class="card ">
                        <div class="card-body text-center ">

                            <div class="container">
                                <img style="max-width: 110px;" class="img-fluid" src="img/completed.png" alt="user_icon">
                            </div>

                            <h1>16</h1>
                            <h1>Products</h1>
                        </div>
                    </div>    

                </div>




            </div>     

            <!<!-- Second row -->

            <div class="row mt-3">
                <!<!-- First col -->
                <div class="col-md-6">

                    <div class="card " data-toggle="modal" data-target="#add-category-model">
                        <div class="card-body text-center ">

                            <div class="container">
                                <img style="max-width: 110px;" class="img-fluid" src="img/product.png" alt="user_icon">
                            </div>

                            <p class="mt-2">Click here to add new category</p>
                            <h1>Add Category</h1>
                        </div>
                    </div>    

                </div>

                <!<!-- Second col -->

                <div class="col-md-6">

                    <div class="card " data-toggle="modal" data-target="#add-product-model" >
                        <div class="card-body text-center ">

                            <div class="container">
                                <img style="max-width: 110px;" class="img-fluid" src="img/add-to-cart.png" alt="user_icon">
                            </div>

                            <p class="mt-2">Click here to add new products </p>
                            <h1>Add Product</h1>
                        </div>
                    </div>    

                </div>
            </div>


        </div>

        <!--add category model-->

       

        <!-- Modal -->
        <div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog model-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header btn-primary">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form action="ProductOperationServlet" method="post">
                            
                            <input type="hidden" name="operation" value="addcategory">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required /> 
                            </div>
                            
                            <div class="form-group">
                                <textarea style="height: 200px" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
                            </div>
                            
                            <div class="cotnainer text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                            
                            
                        </form>
                        
                        
                        
                        
                        
                    </div>
                    
                </div>
            </div>
        </div>


        <!--End add category model-->
   <!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
         <!--Product model-->
         
         
       

<!-- Modal -->
<div class="modal fade" id="add-product-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog model-lg" role="document">
    <div class="modal-content">
      <div class="modal-header btn-primary">
        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
               <!--form-->
          
               <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                   <input type="hidden" name="operation" value="addproduct"/>
                   
                   <!--product title-->
                   
                   <div class="form-group">
                       <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required />
                   </div>
                   
                   <!--product description-->
                   
                   <div class="form-group">
                       <textarea style="height: 100px" class="form-control" placeholder="Enter product description " name="pDesc" ></textarea>
                   </div>
                   
                   <!--product price-->
                     
                    <div class="form-group">
                       <input type="number" class="form-control" placeholder="Enter price of the product" name="pPrice" required />
                    </div>
                   
                   <!--product discount-->
                    
                      <div class="form-group">
                       <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required />
                      </div>
                   
                   <!--product quantity-->
                      
                      <div class="form-group">
                       <input type="number" class="form-control" placeholder="Enter product Quantity" name="pQuantity" required />
                      </div>
                     
                   <!--product category-->
                   
                   <% 
                    CategoryDao cdao=  new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list = cdao.getCategories();
                   
                   %>
                
                     <div class="form-group">
                         <select name="catId" class="form-control" id="">
                           
                             <%
                                 for(Category c:list) {
                             %>
                             
                             <option value="<%= c.getCategoryId() %>"> <%= c.getCategoryTitle() %> </option>
                            
                             <% 
                                 }
                             %>
                             
                         </select>
                         
                     </div>
                   
                   <!--product File-->
                   
                       <div class="form-group">
                           <label for="pPic">Select Picture of Product</label>
                           <br>
                           <input type="file" id="pPic" name="pPic" required />
                       
                       </div>
                   
                   
                   <!--submit button-->
                   
                   <div class="container text-center">
                       
                       <button class="btn btn-outline-success">Add product</button> 
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
                   </div>
                   
              
                   
               </form>
               
          
          
             <!--End form-->
      </div>
      
    </div>
  </div>
</div>
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         <!--End Product model-->
         
         
        
        
    </body>
</html>
