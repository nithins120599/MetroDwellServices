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
            background-image: url("images/card4.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
            color: dark;
            height: 100%; /* Use min-height instead of height */
        
            
        }
button {
    height: auto;
    width: auto;
    border-radius: 4px;
    background: #ff00ff;
    border: none;
    outline: none;
    position: relative;
    animation: glow 5s infinite alternate; /* Applying glow animation */
}

/* Defining the glow animation */
@keyframes glow {
    0% {
        box-shadow: 0 0 10px #ff00ff, 0 0 20px #ff00ff, 0 0 30px #ff00ff; /* Adjust glow intensity */
    }
    100% {
        box-shadow: 0 0 20px #ff00ff, 0 0 30px #ff00ff, 0 0 40px #ff00ff; /* Adjust glow intensity */
    }
}

</style>
</head>
<body>


	<%
	session.invalidate();
	%>
	<div class="container" id="m">
				<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6 mt-5" >
	
				<h1 style="black: green;text=bold;">You have been successfully logged out</h1>
				<span>Thank you for choosing us.....</span><br><br><br>

				<button type="button" style="color:black"
				onclick="window.location.href='Index.jsp'">Back to Index
				page</button>
				
				
				</div>
				<div class="col-sm-3"></div>
			
			</div>
			</div>

</body>

</html>