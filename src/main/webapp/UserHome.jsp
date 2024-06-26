<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Services"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Home</title>
<jsp:include page="Header.jsp" />

</head>
<body>
<jsp:include page="UserMenu.jsp" />


			<div class="container-fluid">
			<h2 style="color:#05878F; text-align:center;text-decoration: underline;">Our Services :</h2>

		<div class="row" >
		<% 
			Services services = new Services();
			List<Services> serviceList =new ArrayList<Services>(); 
			String search = request.getParameter("search");
			if(search==null){  //without search
			serviceList = services.getAllServices(null);
			System.out.print(serviceList);
			}
			else
			{ //with search
				System.out.println("search: " + search);
				serviceList = services.getAllServices(search);
				
			}
			
			%>
			
			<% 
			for (Services serviceObj : serviceList) {
			
			%>
			
			<div class="col-sm-3">
				<div class="card mt-4" >
					<div class="card-header text-center" >
						<div class="col-sm-6 mx-auto" >
							<img src='uploads/<%=serviceObj.getServicePic()%>'
								style='width: 160px; height: 200px' />


						</div>
					</div>
					
					<div class="card-body " >
					<h5 style='color: Orange'>ServiceId:~</h5>
						<%=serviceObj.getServiceId()%>
						<h5 style='color:#7E0404 '>ServiceName:~</h5>
						<h5 style='color: Green'><%=serviceObj.getServiceName()%></h5>
						<div style="display: flex; justify-content: center;">
						<a
							href="/MetroDwellServices/UserBookingService.jsp?serviceName=<%=serviceObj.getServiceName()%>">
   						 <button type="button" class="btn btn-primary" style="background-color:#640233" >Book Now</button>
   						 </a>
					</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
			

		</div>
	</div>

</body>
<jsp:include page="Footer.jsp" />
</html>