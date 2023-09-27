<%@ page import="com.example.lab_week_tuan1.models.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.lab_week_tuan1.models.GrantAccess" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: giahy
  Date: 19/09/2023
  Time: 3:57 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./bootstrap.min.css">
    <!-- Thêm Bootstrap JS và jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <div class="d-flex text-center align-items-center flex-column justify-content-between">
        <h1>Dashboard</h1><br/>
        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Nhập thông tin</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body">
                        <input type="text" class="form-control" name="accounted" id="accountedInput">
                        <div class="form-group">
                            <select id="status" class="form-control" name="status" required>
                                <option value="1">Quyền admin</option>
                                <option value="0">Quyền user </option>

                            </select>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
<div class="w-100 d-flex justify-content-center align-content-center ">
            <div class="card">
                <div class="card-header">
                    hữu ích

                </div>
                <div class="card-body">
                    <form method="get" action="controlserlet">
                        <button class="form-control btn btn-primary" name="action" value="getlogs">Danh sách logs Account </button>
                    </form>
                </div>
            </div>


        </div>
        <!-- Logout Button -->
    </div>
    <div class="card mt-4">
        <div class="card-header text-center">List of Accounts</div>

        <div class="card-body">

                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Ma user</th>
                        <th scope="col">Full Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Status</th>
                        <th scope="col">Edit</th>
                    </tr>
                    </thead>
                <%-- Lặp qua danh sách tài khoản và hiển thị thông tin --%>
                <%
                    List<Account> listAccount = (List<Account>) request.getAttribute("listAccount");
                    if (listAccount != null && !listAccount.isEmpty()) {
                        for (Account account : listAccount) {
//                            if(!Objects.equals(account.getAccount_id())){
                %>
                        <tbody>
                        <tr>
                            <th><%= account.getAccount_id() %></th>
                            <th><%= account.getFull_name() %></th>
                            <td><%= account.getEmail() %></td>
                            <td><%= account.getPhone() %></td>
                            <td><%= account.getStatus() %></td>
                            <td class="d-flex justify-content-center align-content-center">
                                <form action="controlserlet" method="post">
                                    <input type="hidden" name="account_id" value="<%= account.getAccount_id() %>">

                                    <button type="button" class="btn btn-primary" data-toggle="modal" onclick="setvalue(account.getAccount_id())" data-target="#myModal">
                                        Mở Model
                                    </button>
                                    <button class="btn btn-info" name="action" value="editredirect">edit</button> <button class="btn btn-danger" name="action" value="delete">delete</button>
                                </form>
                              </td>
                        </tr>
                        </tbody>
                <%
                } }else {
                %>
                </table>
                <p>No accounts available.</p>
                <%
                    }
                %>

        </div>
    </div>
</div>
<script>
    function setvalue(accountid){
        var inputElement = document.getElementById("accountedInput"); // Get the input element by name
        alert(accountid)
        inputElement.value = accountid;

    }

</script>
</body>
</html>
