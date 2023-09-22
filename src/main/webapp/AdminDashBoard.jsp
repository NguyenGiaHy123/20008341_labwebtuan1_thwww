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
</head>
<body>

<div class="container">
    <div class="d-flex text-center align-items-center justify-content-between">
        <h1>Dashboard</h1>
        <!-- Logout Button -->
    </div>
    <div class="card">
        <div class="card-header d-flex text-center">Information Admin user </div>
        <div class="card-body">
            <%
                Object grantAccess = request.getAttribute("grantAccess");
                if(grantAccess != null ){
                GrantAccess grantAccess1 = (GrantAccess) grantAccess;
            %>
            <p><strong>Ma user:</strong> <span class="badge"><%= grantAccess1.getAccount().getAccount_id() %></span></p>
            <p><strong>Full Name:</strong> <%= grantAccess1.getAccount().getFull_name() %></p>
            <p><strong>Email:</strong> <%=grantAccess1.getAccount().getEmail() %></p>
            <p><strong>Phone:</strong> <%= grantAccess1.getAccount().getPhone() %></p>
            <p><strong>Status:</strong> <span class="badge"><%= grantAccess1.getAccount().getStatus() %></span></p>

        </div>
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
                            if(!Objects.equals(account.getAccount_id(), grantAccess1.getAccount().getAccount_id())){
                %>
                        <tbody>
                        <tr>
                            <th><%= account.getAccount_id() %></th>
                            <th><%= account.getFull_name() %></th>
                            <td><%= account.getEmail() %></td>
                            <td><%= account.getPhone() %></td>
                            <td><%= account.getStatus() %></td>
                            <td class="d-flex justify-content-center align-content-center">
                                <form action="loginserlet" method="post">
                                    <input type="hidden" name="account_id" value="<%= account.getAccount_id() %>">
                                    <button class="btn btn-info" name="action" value="editredirect">edit</button> <button class="btn btn-danger" name="action" value="delete">delete</button>
                                </form>
                              </td>
                        </tr>
                        </tbody>

                <%
                    }}
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
</body>
</html>
