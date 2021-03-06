
<%@page import="model.Admin"%>
<%@page import="model.UserData"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý người dùng</title>
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/View/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel ="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/css/style.css"/>

        <script type ="text/javascript" src="${pageContext.request.contextPath}/View/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/View/bootstrap/js/bootstrap.min.js"> </script>

        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet"> 

    </head>
    <%
        Admin admin = (Admin) session.getAttribute("admin") ;
        if(admin == null) {
            response.sendRedirect("../index.jsp");
        }
        
        String scriptResult ="";
        if(request.getParameter("error") !=null) {
            String error = "Có lỗi: " + request.getParameter("error");
            scriptResult = "alert('"+error+"')";
       }
        
        
    %>
    <body>
        <script>
            <%=scriptResult %> ;
        </script>
        
        <jsp:include page="adminHeader.jsp"></jsp:include>
        
        <div class="container">
            <!-- Content -->
            <div class = "content">

              <div class="row">
                <div class="col-md-2 well">
                  <jsp:include page="navleft.jsp"></jsp:include>
                </div> <!-- End md-2 -->

                <!-- user review-->
                <div class="col-md-10 well">
                <h1> Quản lý Người dùng </h1>
                <hr>
                <div>
                    <h3> Danh sách người dùng</h3>
                    <div class="row">
                        <table class="table table-bordered" id="table-user">
                          <thead>
                            <tr>
                              <th>ID</th>
                              <th>Username</th>
                              <th>Tên người dùng</th>
                              <th>Email</th>
                              <th>Địa chỉ</th>
                              <th>Số điện thoại</th>
                              <th> Hành động </th>
                            </tr>
                          </thead>
                            <tbody>
                            <%
                               for(User user: UserData.getUserList()) {  
                            %>
                            <tr>
                                <td> <%= user.getUserID()%> </td>
                                <td> <%= user.getUsername()%> </td>
                                <td> <%= user.getFullName()%> </td>
                                <td> <%= user.getEmail() %> </td>
                                <td> <%= user.getAddress() %> </td>
                                <td> <%= user.getPhone() %> </td>
                                <td><a href="#delete-<%=user.getUserID() %>" data-toggle="modal" class="btn btn-danger">Xóa</a> </td>
                            </tr>
                            
                            <% } %>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div> <!-- End Prd review -->

              </div> <!-- End row -->
              
            </div>  <!-- End class content -->
            

        </div> <!-- End Container -->
        

      <div class = "footer"> 
        <p> Code by<a href="https://fb.com/deluxe.psk" target="_blank"> Linh Phan </a> </p>
      </div> <!-- End footer -->
      
      <%
        for(User user: UserData.getUserList()) {  
       %>
       <!-- modal-delete-->
        <div class="modal fade" id="delete-<%=user.getUserID() %>">
            <form action="../UserServlet" method="POST" role="form">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">Việc xóa User sẽ ảnh hưởng tới quản lý các hóa đơn của người dùng này đã mua. Chắc chắn muốn xóa người dùng "<%=user.getUsername() %>" chứ?</h4>
                   
                  </div>
                  <div class="modal-footer">
                   
                    <button type="button" class="btn btn-default" data-dismiss="modal">Không chắc lắm</button>
                    <input type="hidden" name="command" value="delete">
                    <input type="hidden" name="curentId" value="<%=user.getUserID() %>" >
                    <input type="submit" class="btn btn-primary" value="Ừ. Tao chắc" name="edit">
                  </div>
                </div>
              </div>
            </form>
        </div> <!-- End modal -->
       <% } %>
    </body>
</html>
