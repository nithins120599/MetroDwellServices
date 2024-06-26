<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddServices</title>
<jsp:include page="Header.jsp" />

<style>
#c1{
box-shadow:15px 20px 25px #73CFE1 ;
height:auto;
width:auto;
border-radius:4px;
background:#ff00ff;
}

       #c1{
                background-image: url("images/whitebg.jpg");
                background-repeat: no-repeat;
              
                background-position:center ;
                background-size: cover;
              
            }
        
</style>
</head>
<body>
<jsp:include page="AdminMenu.jsp" />
	<div class="container mt-5">
	 <div class="card" id="c1" style="background-color:#87928C;">
	<form class="card-body" action="AddServiceServlet" method="post" enctype="multipart/form-data">
	<h2 class="mb-4 text-center" style="color:#490083 ;"><i class="fa-brands fa-servicestack" style="color: #0bf487;"></i> Add Services</h2>

			<div class="row">
				<div class="col-sm-6">
					<label for="serviceName">ServiceName</label> <input type="text"
						name="serviceName" id="serviceName" />
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6">
					<label>ServicePic:</label> 
					<input type="file" class="form-control" name="servicePic" />	
<br><br>
					<%
					String res = request.getParameter("res");
					if (res != null) {
						if (res.equals("0")) {
							out.println("<h4 style='color:red'>Services not added</h4>");
						} else {
							out.println("<h4 style='color:green'>Services Added Successfully..</h4>");
						}
					}
					%>

				</div>
			</div>
			<br><br>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Add Services</button>
                </div>

	

	</form>
		</div>
			</div>
</body>
<jsp:include page="Footer.jsp" />
</html>