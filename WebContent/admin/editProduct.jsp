

<%@page import="model.Admin"%>
<%@page import="model.Products"%>
<%@page import="model.ProductData"%>
<%@page import="model.SupplierData"%>
<%@page import="model.Supplier"%>
<%@page import="model.CategoryData"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Chỉnh sửa thông tin sản phẩm</title>
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/View/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel ="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/css/style.css"/>

        <script type ="text/javascript" src="${pageContext.request.contextPath}/View/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/View/bootstrap/js/bootstrap.min.js"> </script>

        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet"> 
        <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
    </head>

    <%
        Admin admin = (Admin) session.getAttribute("admin") ;
        if(admin == null) {
            response.sendRedirect("../index.jsp");
        }
        
        Products p = new Products();
        String productId ="lalala" ;
        if(request.getParameter("productId") ==null) {
            response.sendRedirect("managerProduct.jsp?error=Chua nhap san pham de sua!");
        }
        else {
            productId = request.getParameter("productId");
            p = ProductData.getProductByID(productId);
            
        }
    %>
    <body>
        
        <jsp:include page="adminHeader.jsp"></jsp:include>
        <div class="container">
            <!-- Content -->
            <div class = "content">

              <div class="row">
                <div class="col-md-2 well">
                  <jsp:include page="navleft.jsp"></jsp:include>
                </div> <!-- End md-2 -->

                <!-- Product review-->
                <div class="col-md-10 well">
                    <h1> Quản lý Sản Phẩm </h1>
                    <hr>
                    <h3> <b> Chỉnh sửa thông tin sản phẩm </b> </h3>
                    <br> <br>
                  <div class="box box-primary" style="margin: 0 auto; width:70%">
                       
                        <!-- form start -->
                        <form role="form" method="post" action="../ProductServlet?command=edit" enctype="multipart/form-data">
                            <div class="box-body">
                               
                                <div class="form-group">
                                    <label>Mã sản phẩm mới</label>
                                    <input type="text" class="form-control" id="" name="productId" value="<%=p.getPID() %>" required="required">
                                </div>
                                <div class="form-group">
                                    <label>Tên sản phẩm mới</label>
                                    <input type="text" class="form-control" id="" name="productName" value="<%=p.getPName() %>" required="required">
                                </div>
                                
                                <div class="form-group">
                                    <label>Giá nhập</label>
                                    <input type="number" class="form-control" name="inputPrice" value="<%=p.getInputPrice() %>" required="required">
                                </div>
                                    
                                <div class="form-group">
                                    <label>Giá bán</label>
                                    <input type="number" class="form-control" name="PPrice" value="<%=p.getPPirce() %>" required="required">
                                </div>
                                
                                <div class="form-group">
                                    <label>Loại sản phẩm</label>
                                    <select name="categoryId">
                                        <%
                                            for(Category c: CategoryData.getCategoryList()) {  
                                        %>
                                            <option value="<%=c.getCategoryID() %>"><%=c.getCategoryName() %></option>
                                        <% } %>
                                    </select>
                                </div>
                                    
                                <div class="form-group">
                                    <label>Hãng sản xuất</label>
                                    <select name="supplierId">
                                        <%
                                            for(Supplier s: SupplierData.getSupplierList()) {  
                                        %>
                                            <option value="<%=s.getsId() %>"><%=s.getsName() %></option>
                                        <% } %>
                                    </select>
                                </div>
                                    
                                <div class="form-group">
                                    <label>Thông số kĩ thuật</label>
                                    <textarea class="summernote" name="description" placeholder="Nhập mô tả..." required="required"></textarea>
                                </div>
                                    
                                <div class="form-group">
                                    <label>Ảnh</label>
                                    <input type="file" id="exampleInputFile" name="Img" value="<%=p.getImg() %>" required="required"> 
                                </div>
                                
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <!--<input type="hidden" name="command" value="edit">-->
                                <input type="hidden" name="oldId" value="<%=p.getPID() %>">
                                <button type="submit" class="btn btn-primary">Hoàn tất</button>
                            </div>
                        </form>
                    </div>
                </div> <!-- End Prd review -->
              </div> <!-- End conntent -->
            
            </div> <!-- End container -->
       
        </div>
       <jsp:include page="../footer.jsp"></jsp:include>

    </body>
    <script>
        $(document).ready(function(){
            $(function() {
                $('.summernote').summernote();
                var markupStr = '<%=p.getPDescription() %>';
                $('.summernote').summernote('editor.pasteHTML', markupStr);
            }); 
        }) ;
        
    </script>
</html>
