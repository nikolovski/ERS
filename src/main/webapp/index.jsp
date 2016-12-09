<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ERS - Login</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
          integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/css/tether.min.css"/>
    <link href='https://fonts.googleapis.com/css?family=Oswald:700' rel='stylesheet' type='text/css'>
    <link href="css/loginStyle.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
            integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK"
            crossorigin="anonymous"></script>

    <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>-->
    <style>
        * {
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            background: #333;
            font: 100%/1 "Helvetica Neue", Arial, sans-serif;
        }

        .login {
            height: 20rem;
            background: #fff;
            border-radius: 5px;
            margin-bottom: 5%;
            overflow: hidden;
        }

        .login:hover > .login-header, .login.focused > .login-header {
            width: 2rem;
        }

        .login:hover > .login-header > .text, .login.focused > .login-header > .text {
            font-size: 1rem;
            transform: rotate(-90deg);
        }

        .login.loading > .login-header {
            width: 100%;
        }

        .login.loading > .login-header > .text {
            display: none;
        }

        .login.loading > .login-header > .loader {
            display: block;
        }

        .login-header {
            position: absolute;
            left: 0;
            top: 0;
            z-index: 1;
            width: 100%;
            height: 20rem;
            background: #f06932;
            transition: width 0.5s ease-in-out;
        }

        .login-header > .text {
            display: block;
            width: 100%;
            height: 100%;
            font-size: 50px;
            font-family: Futura;
            text-align: center;
            line-height: 20rem;
            color: #fff;
            transition: all 0.5s ease-in-out;
        }

        .login-header > .loader {
            display: none;
            position: absolute;
            left: 30%;
            top: 5rem;
            width: 10rem;
            height: 10rem;
            border: 2px solid #fff;
            border-radius: 50%;
            animation: loading 2s linear infinite;
        }

        .login-header > .loader:after {
            content: "";
            position: absolute;
            left: 4.5rem;
            top: -0.5rem;
            width: 1rem;
            height: 1rem;
            background: #fff;
            border-radius: 50%;
            border-right: 2px solid #f06932;
        }

        .login-header > .loader:before {
            content: "";
            position: absolute;
            left: 4rem;
            top: -0.5rem;
            width: 0;
            height: 0;
            border-right: 1rem solid #fff;
            border-top: 0.5rem solid transparent;
            border-bottom: 0.5rem solid transparent;
        }

        @keyframes loading {
            50% {
                opacity: 0.5;
            }
            100% {
                transform: rotate(360deg);
            }
        }

        .login-form {
            margin: 0 0 0 2rem;
            padding: 0.5rem;
        }

        .login-input {
            display: block;
            width: 100%;
            font-size: 2rem;
            padding: 0.5rem 1rem;
            box-shadow: none;
            border-color: #ccc;
            border-width: 0 0 2px 0;
        }

        .login-input.register {
            font-size: 1rem;
        }

        .login-input + .login-input {
            margin: 10px 0 0;
        }

        .login-input:focus {
            outline: none;
            border-bottom-color: #f06932;
        }

        .login-btn {
            position: absolute;
            right: 1rem;
            bottom: 1rem;
            width: 5rem;
            height: 5rem;
            border: none;
            background: #f06932;
            border-radius: 50%;
            font-size: 0;
            border: 0.6rem solid transparent;
            transition: all 0.3s ease-in-out;
        }

        .login-btn:after {
            content: "";
            position: absolute;
            left: 1rem;
            top: 0.8rem;
            width: 0;
            height: 0;
            border-left: 2.4rem solid #fff;
            border-top: 1.2rem solid transparent;
            border-bottom: 1.2rem solid transparent;
            transition: border 0.3s ease-in-out 0s;
        }

        .login-btn:hover, .login-btn:focus, .login-btn:active {
            background: #fff;
            border-color: #f06932;
            outline: none;
        }

        .login-btn:hover:after, .login-btn:focus:after, .login-btn:active:after {
            border-left-color: #f06932;
        }

        #title {
            padding-top: 3%;
            padding-bottom: 3%;
            margin-bottom: 3%;
            font-size: 3rem;
            font-family: Futura;
            background-color: darkgray;
            color: #fcfff6;
            text-align: center;
        }

        footer {
            background-color: white;
            padding-top: 2%;
            padding-bottom: 2%;
            font-family: 'Oswald', sans-serif;
            font-size: 3em;
        }
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="row" id="title">Expense Reimbursement System</div>
    <div class="row" style="padding-left: 3%;padding-right: 3%; padding-top: 2%">
        <span class="col-xs-12 col-sm-5 col-md-5 col-lg-5 login">
            <header class="login-header"><span class="text">LOGIN</span><span class="loader"></span></header>
            <form id="login" class="login-form" action="login.do" method="post">
                <input type="text" placeholder="Username" name="username" class="login-input" required/>
                <input type="password" placeholder="Password" name="password" class="login-input" required/>
                <button type="submit" class="login-btn" form="login">login</button>
            </form>
        </span>
        <span class=" col-xs-12 col-sm-2 col-md-2 col-lg-2"></span>
        <span class=" col-xs-12 col-sm-5 col-md-5 col-lg-5 login">
            <header class="login-header"><span class="text">REGISTER</span><span class="loader"></span></header>
            <form id="register" class="login-form" action="register.do" method="post">
                <input type="text" placeholder="First Name" name="first_name" class="login-input register" required/>
                <input type="text" placeholder="Last Name" name="last_name" class="login-input register" required/>
                <input type="email" placeholder="Email" name="email" class="login-input register" required/>
                <input type="text" placeholder="Username" name="new_username" class="login-input register" required/>
                <input type="password" placeholder="Password" name="new_password" class="login-input register"
                       required/>
                <select name="role_id">
                    <option value="1">Admin</option>
                    <option value="2">DBA</option>
                </select>
                <button type="submit" class="login-btn" form="register">register</button>
            </form>
        </span>
    </div>
</div>
<footer class="row">
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" align="center" style="text-align: center; margin-bottom: 3%">
        <img src="https://revature.com/imgs/logo.png" alt="Revature logo">
    </div>
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" align="center" style="margin-top: 3%">
        <span>nikolovski.io</span>
    </div>
</footer>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script
        src="https://code.jquery.com/jquery-3.1.1.slim.js"
        integrity="sha256-5i/mQ300M779N2OVDrl16lbohwXNUdzL/R2aVUXyXWA="
        crossorigin="anonymous"></script>
<script src="js/index.js"></script>


</body>
</html>
