<!DOCTYPE html>
<html>
<head>
    <title>JSP - Login</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
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

        .btn-danger {
            background-color: red;
            border: none;
            border-radius: 10px;
            width: 100px;
            height: 30px;
            color: white;
            text-align: center;
            line-height: 30px;
            cursor: pointer;
        }

        .btn-danger:hover {
            background-color: darkred;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
        }
        #email{
            width: 100%;

        }

        /*input[type="text"],*/
        /*input[type="password"] {*/
        /*    width: 100%;*/
        /*    padding: 8px;*/
        /*    border: 1px solid #ccc;*/
        /*    border-radius: 5px;*/
        /*}*/

        /*input[type="text"],*/
        /*input[type="email"] {*/
        /*    width: 100%;*/
        /*    padding: 8px;*/
        /*    border: 1px solid #ccc;*/
        /*    border-radius: 5px;*/
        /*}*/

        .d-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        @media (min-width: 1200px)
        .container {
            max-width: 400px;
        }

        .colorbutton{
            background: linear-gradient(to right, yellow, black);
            color: white; /* Set text color to white for better visibility */
            padding: 10px 20px; /* Adjust padding as needed */
            border: none; /* Remove border if desired */
            cursor: pointer;
            border-radius: 10px;
        }

        /* You can add more styling for hover and active states if needed */
        .colorbutton:hover {
            background: linear-gradient(to left, black, yellow);
        }
    </style>
    <script>
        function validateForm() {
            var emailLogin = document.getElementById("email").value;
            var passwordLogin = document.getElementById("password").value;
            if (emailLogin === "" || passwordLogin === "") {
                alert("Please fill in all fields.");
                return false;
            }
            return true;
        }
    </script>
</head>
<link rel="stylesheet" href="./bootstrap.min.css">
<body>
<div class="container">
    <h4>Login 20008341 Nguyen Gia Hy</h4>
    <p>Login addmin with :giahynguyen33@gmail.com ,pw:123</p>
    <p>Login User with :123@saf ,pw:1</p>
    <form action="loginserlet" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="email">email:</label>
            <input type="email" id="email"  class="form-control" name="email">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password">
        </div>
        <div class="d-flex">
            <button type="submit" class="colorbutton ">Login</button>
            <a href="register.jsp">Register</a>
        </div>
        <input type="hidden" name="action" value="logon">
    </form>
</div>
</body>
</html>
