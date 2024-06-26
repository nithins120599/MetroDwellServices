<%@page import="com.example.model.Workers"%>
<%@page import="com.example.model.Reviews"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Bookings"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserViewBookings</title>
<jsp:include page="Header.jsp" />
<script>
$(document).ready(function() {
	$('#table_id').DataTable();
});


        function confirm_delete(bookingId) {
                        let ans = confirm("Do you want to  cancell the bookingg?");
            if (ans) {
            	window.location = "/MetroDwellServices/UpdateBookingStatusServlet?bookingId="+bookingId+"&status=Cancelled";
            }
        }
    </script>
</head>
<body>
<jsp:include page="UserMenu.jsp" />
<%
	Bookings bookings = new Bookings();
	List<Bookings> bookingsList = bookings.getAllBookings();
	System.out.println("bookingsList=" + bookingsList.size());
	%>
	<div class="container mt-5">

		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Rating Updated..!!!!!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Rating not Updated..!
		</div>
		<%
		}
		}
		%>


		<div class="table-responsive">
			<table class="table table-striped table-sm" id="table_id">
				<thead>
					<tr>
						
						
						<th>SINO</th>
						<th>BookingId</th>
						<th>BookingDate</th>
						<th>UserId</th>
						<th>WorkerId</th>
						<th>ServiceName</th>
						<th>WorkerLatitude</th>
						<th>WorkerLongitude</th>
						<th>Status</th>
						<th>Operations</th>
						<th>Operations</th>
						
						
					</tr>
				</thead>
				<tbody>
					<%
				int slno = 0;
					Workers workers = new Workers();
				for (Bookings bookingsObj : bookingsList) {
					slno++;
				%>
					<tr>


						

						<td><%=slno%></td>
						<td><%=bookingsObj.getBookingId()%></td>
						<td><%=bookingsObj.getBookingDate()%></td>
						<td><%=bookingsObj.getUserId()%></td>
						<td><%=bookingsObj.getWorkerId()%></td>
						<td><%=bookingsObj.getServiceName()%></td>
						<td><%=bookingsObj.getWorkerLatitude()%></td>
						<td><%=bookingsObj.getWorkerLongitude()%></td>
						<td><%=bookingsObj.getStatus()%></td>
						
					<!-- 
						<td>
						<%
						System.out.println("status= " +bookingsObj.getStatus().toString());
						
						if (bookingsObj.getStatus().toString().equalsIgnoreCase("confirmed")) {
						%>
						<button class="btn btn-sm btn-info"
								onclick="confirm_delete(<%=bookingsObj.getBookingId()%>)">Cancel</button>
								
					<%					
					}
					else 
					{
					%>
					<button type="button" class="btn btn-sm btn-secondary" disabled>Cancelled</button>
					
					</td>
								
						
					<%
					}
					%>	
					 -->	
					 
					  	<td class="text-center">
									<%
									//System.out.println("status= " + workerOb.getStatus().toString());
									if (bookingsObj.getStatus().toString().equalsIgnoreCase("Confirmed")) {
									%> <input type="button" class="btn btn-danger text-white"
									style="background-color: red"
									onclick="confirm_delete(<%=bookingsObj.getBookingId()%>)"
									value="Cancel" /> <%
 } else if (bookingsObj.getStatus().toString().equalsIgnoreCase("cancelled")) {
 %>

									<button class="btn btn-sm btn-success" disabled value="">
										<h6>
											<i class="bi bi-x-octagon-fill"></i>
										</h6>
									</button> <%
 } else {
 %> <i class="bi bi-person-walking" style="font-size: 1.5rem"></i><i
									class="bi bi-person-walking" style="font-size: 1.8rem"></i><i
									class="bi bi-person-walking" style="font-size: 2rem"></i> <%
 }
 %>


								</td>	


						<td>
						<%
						Reviews rev = new Reviews();
						boolean found = rev.isRatingGiven(bookingsObj.getWorkerId());
						if(found== false)
						{
						%>
						<a
							href="/MetroDwellServices/Rating.jsp?workerId=<%=bookingsObj.getWorkerId()%>"
							class="btn btn-danger">Rating
							</a>
							
						<% 	
						}
						else
						{
						%>  
	
						<button type="button" class="btn btn-sm btn-secondary" disabled>Rated</button>
	
					<%
					}
					%>		
					</td>
						
					</tr>
					<%
					}
					%>

				</tbody>

			</table>

		</div>
		
		<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
		});
		</script>
		</div>
</body>
</html>