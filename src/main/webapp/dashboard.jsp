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
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('https://img.freepik.com/free-vector/black-banner-with-yellow-geometric-shapes_1017-32327.jpg');
            background-size: cover; /* This property scales the image to cover the entire element */
            background-repeat: no-repeat; /* This property prevents the image from repeating */
        }
        .container {
            max-width: 450px !important;
            height: auto;
            border: 2px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            background-color: white;
            box-shadow: 0px 1px 2px 2px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="d-flex text-center align-items-center justify-content-between">
        <h1>Dashboard</h1>
        <div class="">
            <button class="">Quản lý Log </button>
        </div>
        <!-- Logout Button -->
    </div>
                    <div class="card">
                        <div class="card-header d-flex text-center">Thông tin tài khoảng user </div>
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
</body>
</html>
