<%@page import="dbutil.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserBooking Service</title>
<jsp:include page="Header.jsp" />
 <style>
  body {
            background-image: url("images/whitebg1.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            color: dark;
            height: 100%; /* Use min-height instead of height */
        
            
        }
        </style>
           <script>
           function getLocation() {
               if (navigator.geolocation) {
                   navigator.geolocation.getCurrentPosition(showPosition);
               } else {
                   alert("Geolocation is not supported by this browser.");
               }
           }

           function showPosition(position) {
               var latitude = position.coords.latitude;
               var longitude = position.coords.longitude;
               document.getElementById("latitude").value = latitude;
               document.getElementById("longitude").value = longitude;
           }

           // Call getLocation() when the page loads
           window.onload = function() {
               alert("The website wants to allow your location to book the services and get work done!!.");
               getLocation();
           };
           
           function bookService(workerId, serviceName){
        	   window.location="/MetroDwellServices/AddBookingsServlet?workerId="+workerId+"&serviceName="+serviceName+"&workerLatitude="+document.getElementById("latitude").value+"&workerLongitude="+document.getElementById("longitude").value;
           }
           
          
   		
   		
		   function confirm_delete(bookingId) {
			   let ans = confirm("Do you Want To Update Booking");
		       if (ans) {
		           window.location = "/MetroDwellServices/UpdateBookingStatusServlet?n=1&bookingId="+bookingId+"&status=Cancelled";
		}
		 }


           
    </script>
</head>
<body>
<jsp:include page="UserMenu.jsp" />
<!--  <form action="/MetroDwellServices/AddBookingsServlet" method="post"> -->
<div class="container" >
<br>
	<input type="hidden" name="workerLatitude" id="latitude"   />
    <br>
    <input type="hidden" name="workerLongitude" id="longitude" />
    
		
<%
	Workers workers = new Workers();
	List<Workers> workerList = workers.getAllWorkers(request.getParameter("serviceName"));
	
	%>
	
	<% 
		for (Workers workerObj : workerList) {
			
	%>
			
	
	<div class="row mt-3" style="display-inline:block" >
	<div class="col-sm-4">
	
	<img src='Workeruploads/<%=workerObj.getWorkerPic()%>'
								style='width: 200px; height: 230px' /><br>
	<span style="color:#750505; font-weight:bold;">WorkerPicture</span>
	</div>

	
	<div class="col-sm-7">
	
	<input type="hidden" name="serviceName"  value="<%= workerObj.getServiceName() %>"/>
    <input type="hidden" name="workerId" value="<%= workerObj.getWorkerId() %>" />
    
    
    					
						<span style="color:#750505; font-weight:bold;">FullName :</span><%= workerObj.getFullName() %>	<br>
						<span style="color:#750505; font-weight:bold;">WorkerId:</span><%= workerObj.getWorkerId() %>	<br>	
						<span style="color:#750505; font-weight:bold;">ServiceName:</span>
						<input type="text" value="<%= workerObj.getServiceName() %>" placeholder="<%= workerObj.getServiceName() %>" /><br>
										
						<!--<span style="color:#750505  ; font-weight:bold;">ServiceName :</span><%=workerObj.getServiceName()%><br>  -->
						<span style="color:#750505  ; font-weight:bold;">Mobile :</span>
						<%=
							Cryptography.decode(workerObj.getMobile())
							
							
							%>
							<br>
						<span style="color:#750505  ; font-weight:bold;">CurrentAddress :</span><%=workerObj.getCurrentAddress()%></h5><br>
					<span style="color:#750505  ; font-weight:bold;">AadharPic :</span><img src='Workeruploads/<%=workerObj.getAadhaarPic()%>'
								style='width: 80px; height: 80px' /><br>
						<span style="color:#750505  ; font-weight:bold;">Status :</span><%=workerObj.getStatus()%><br>
						<!--   <button type="submit" class="btn btn-primary" style="background-color:#640233 ">Book Now</button> -->
		<A  class='btn btn-sm btn-success'    onclick="bookService(<%=workerObj.getWorkerId()%>,'<%=workerObj.getServiceName()%>')">Book Now</A>
		 

	</div>
	
				
	
	<div class="col-sm-1"></div>
	<%
		}
		 	%>
	</div>
	
	</div>
	
	</form>	
		

	
		
</body>
</html>