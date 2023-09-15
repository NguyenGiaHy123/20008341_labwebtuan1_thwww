<%@ page import="com.example.lab_week_tuan1.models.Account" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="./bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            font-size: 24px;
        }

        .btn-danger {
            background-color: red;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            margin-left: 10px;
        }

        .row {
            display: flex;
        }

        .col-md-3 {
            flex: 0 0 25%;
            max-width: 25%;
            padding-right: 15px;
        }

        .col-md-9 {
            flex: 0 0 75%;
            max-width: 75%;
            padding-left: 15px;
        }

        ul.list-group {
            list-style: none;
            padding: 0;
        }

        li.list-group-item {
            background-color: #fff;
            border: 1px solid #ccc;
            margin-bottom: 5px;
        }

        li.list-group-item a {
            display: block;
            padding: 10px;
            text-decoration: none;
        }

        .card {
            background-color: #fff;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }

        .card-header {
            background-color: #f0f0f0;
            padding: 10px;
        }

        .card-body {
            padding: 20px;
        }

        .badge {
            background-color: #007bff;
            color: #fff;
            padding: 5px 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="d-flex align-items-center justify-content-between">
        <h1>Dashboard</h1>
        <!-- Logout Button -->
        <a href="index.jsp" class="btn btn-danger">Logout</a>
    </div>
    <div class="row">
        <div class="col-md-3">
            <!-- Menu bên trái -->
            <ul class="list-group">
                <li class="list-group-item"><a href="">Account</a></li>
                <li class="list-group-item"><a href="">Role</a></li>
                <li class="list-group-item"><a href="">Log</a></li>
            </ul>
        </div>
        <div class="col-md-9">
            <div class="row">
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header">Information Account</div>
                        <div class="card-body">
                            <%
                                Object accountObj = request.getAttribute("account");
                                Account account = (Account) accountObj;
                            %>
                            <p><strong>Full Name:</strong> <%= account.getFull_name() %></p>
                            <p><strong>Email:</strong> <%= account.getEmail() %></p>
                            <p><strong>Phone:</strong> <%= account.getPhone() %></p>
                            <p><strong>Status:</strong> <span class="badge"><%= account.getStatus() %></span></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Information Role</div>
                        <div class="card-body">
                            <p><strong>Test 1:</strong></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
