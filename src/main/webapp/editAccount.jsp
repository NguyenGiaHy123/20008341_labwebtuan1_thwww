<%@ page import="com.example.lab_week_tuan1.models.Account" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Acount Page</title>
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
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-top: 20px;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
<div class="container">
    <%
        Object accountObj = request.getAttribute("account");
        Account account = (Account) accountObj;
    %>
    <h1>User Edit account</h1>
    <form action="controlserlet" method="post">
        <div class="form-group">
            <label for="accountId">Account id:</label>
            <input type="text"  id="accountId" name="accountId" value="<%= account.getAccount_id() %>" required>
        </div>

        <div class="form-group">
            <label for="username">Full name:</label>
            <input type="text" id="username" name="fullName" value="<%= account.getFull_name() %>" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= account.getEmail() %>" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= account.getPassword() %>" required>
        </div>

        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="number" id="phone" name="phone" value="<%= account.getPhone() %>" required>
        </div>

        <div class="form-group">
            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="1" <%= account.getStatus().equals(com.example.lab_week_tuan1.models.Status.ACTIVE) ? "selected" : "" %>>Active</option>
                <option value="0" <%= account.getStatus().equals(com.example.lab_week_tuan1.models.Status.DEACTIVE) ? "selected" : "" %>>Deactive</option>
                <option value="-1" <%= account.getStatus().equals(com.example.lab_week_tuan1.models.Status.DELETE) ? "selected" : "" %>>Delete</option>
            </select>
        </div>

        <input type="submit" class="btn-primary" value="edit">
        <input type="hidden" name="action" value="edit">
    </form>
</div>

</body>
</html>
