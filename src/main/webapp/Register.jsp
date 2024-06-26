<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <title>Document</title>
    <style>
      body {
        margin: 0;
        padding: 0;
        background-color: #17a2b8;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      #login-box {
        max-width: 450px;
        width: 100%;
        border: 1px solid #9C9C9C;
        background-color: #EAEAEA;
        padding: 20px;
      }
      #register-link {
        margin-top: 15px;
      }
    </style>
</head>
<body>
    <div id="login-box">
        <form id="login-form" class="form" action="register" method="post">
            <h3 class="text-center text-info">Register</h3>
            <div class="form-group">
                <label for="first-name" class="text-info">First Name:</label><br>
                <input type="text" name="fn" id="first-name" class="form-control">
            </div>
            <div class="form-group">
                <label for="last-name" class="text-info">Last Name:</label><br>
                <input type="text" name="ln" id="last-name" class="form-control">
            </div>
            <div class="form-group">
                <label for="gmail" class="text-info">E-mail:</label><br>
                <input type="email" name="gm" id="gmail" class="form-control">
            </div>
            <div class="form-group">
                <label for="password" class="text-info">Password:</label><br>
                <input type="password" name="psd" id="password" class="form-control">
            </div>
            <div class="form-group">
                <label for="confirm-password" class="text-info">Confirm Password:</label><br>
                <input type="password" name="cpsd" id="confirm-password" class="form-control">
            </div>
            <div class="form-group">
               <label for="remember-me" class="text-info"><span>Login After Reg</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
            </div>
            <div id="register-link" class="text-right">
                <a href="Login.jsp" class="text-info">Login here</a>
            </div>
            
        </form>
    </div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>