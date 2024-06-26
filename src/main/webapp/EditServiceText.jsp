<%@page import="com.example.model.Services"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditServiceTextfieldss</title>
<jsp:include page="Header.jsp" />
</head>
<body>
<jsp:include page="AdminMenu.jsp" />
	<div class="container mt-5">
	 <div class="card" id="c1" style="background-color:#BFF0F1 ;">
	 
	<form class="card-body" action="UpdateServiceServlet" method="post">
	
	<h2 class="mb-4 text-center" style="color:#490083 ;"><i class="fa-brands fa-servicestack" style="color: #0bf487;"></i> Update Services</h2>
		
		<%
			String serviceId = request.getParameter("serviceId");
			Services services= new Services();
			services.setServiceId(Integer.parseInt(serviceId));
			
			services = services.getServiceById();
			
			%>	
			
			<div class="row">
				<div class="col-sm-6">
					<label for="serviceId">ServiceId</label> <input type="text"
						name="serviceId" id="serviceId" value="<%=services.getServiceId() %>" readonly/>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<label for="serviceName">ServiceName</label> <input type="text"
						name="serviceName" id="serviceName" value="<%=services.getServiceName() %>" />
				</div>
			</div>

		
			<br><br>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Update Services</button>
                </div>

	

	</form>
		</div>
			</div>

</body>
<jsp:include page="Footer.jsp" />
</html>