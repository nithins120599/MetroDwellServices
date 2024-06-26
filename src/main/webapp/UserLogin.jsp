<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Header.jsp" />

<style>
        body{
                background-image: url("images/user3.jpg");
                background-repeat: no-repeat;
              
                background-position:center ;
                background-size: cover;
              
            }
        
        .card {
            border: 1px solid #dee2e6; /* Add border */
            border-radius: 10px; /* Add border radius */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add box shadow */
        }
        
        .card-body {
            padding: 2rem; /* Add padding to the card body */
        }
        
        #box1{
box-shadow:-15px -20px 25px #0AFCE3;
height:auto;
width:auto;
border-radius:4px;
background:#ff00ff;
}
        
    </style>
    </head>
<body>

<jsp:include page="Menu.jsp" />

  <form action="UserServletValidation" method="post">
<div class="container-fluid  mt-5" >
        <div class="row justify-content-center" > <!-- Center the columns -->
            <div class="col-sm-8 col-md-6 col-lg-4"> <!-- Adjust column width based on device size -->
                <div class="card" id="box1">
                    <div class="card-body" style="background-color:#DCF238;"> 
                        
                            <h1 class="text-center">User Login</h1> <!-- Center the heading -->
                            <div class="mb-3">
                                <label for="fullName" class="form-label">UserName:</label>
                                <input type="text" id="fullName" name="fullName" class="form-control" placeholder="Enter your Fullname">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password">
                            </div>
                            <div class="mb-3 text-center"> <!-- Center the button and link -->
                                <input type="submit" id="signin" class="btn btn-primary" value="Signin">
                                <br><br><br>
                                <a href="UserRegistration.jsp" style="color: blue;">New User? Register Here...</a>
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