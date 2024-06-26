<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WokerLogin</title>
<jsp:include page="Header.jsp" />
<style>
body{
                background-image: url("images/workerlogin1.jpg");
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position:center ;
                background-size: cover;
                
            }
#box{
box-shadow:15px 20px 25px #00F9E9;
height:auto;
width:auto;
border-radius:4px;
background:#ff00ff;
}

</style>

</head>
<body>


<jsp:include page="Menu.jsp" />

    <form action="WorkerServletLoginValidation" method="post">
    <div class="container-fluid mt-5" >
        <div class="row justify-content-center"> <!-- Center the columns -->
            <div class="col-sm-8 col-md-6 col-lg-4"> <!-- Adjust column width based on device size -->
                <div class="card" id="box">
                    <div class="card-body" style="background-color:#04B2AA;">
                       
                            <h1 class="text-center" style="color:#03485D">Worker Login</h1> <!-- Center the heading -->
                            <div class="mb-3">
                                <label for="mobile" class="form-label">MobileNumber:</label>
                                <input type="number" id="mobile" name="mobile" class="form-control" placeholder="Enter your MobileNumber">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password">
                            </div>
                            <div class="mb-3 text-center"> <!-- Center the button and link -->
                                <input type="submit" id="signin" class="btn btn-primary" value="Signin">
                                <br><br><br>
                                <a href="WorkerRegistration.jsp" style="color: blue;">New Worker? Register Here...</a>
                            </div>
                   
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
<jsp:include page="Footer.jsp" />
</html>