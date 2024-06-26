<%@page import="dbutil.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkersView in Admin</title>
<jsp:include page="Header.jsp" />

<script>
	

        function confirm_delete(workerId) {
                        let ans = confirm("Do you want to make active this record?");
            if (ans) {
                       window.location = "/MetroDwellServices/UpdateWorkersServlet?workerId="+workerId+"&status=Active";
            }
        }
    </script>

</head>
<body style="background-color: #E8FFFA;">
	<jsp:include page="AdminMenu.jsp" />

	<%
	Workers workers = new Workers();
	//System.out.println("products =" +product);

	List<Workers> workersList = workers.getAllWorkers();
	//System.out.println("categoryList=" + categoryList.size());
	%>

	<div class="container mt-5">

		<div class="table-responsive">
			<table class="table table-striped table-sm" id="table_id">
				<thead>
					<tr>


						<th>SINO</th>
						<th>WorkerId</th>
						<th>FullName</th>
						<th>RegistrationDate</th>
						<th>Service Name</th>
						<th>MobileNumber</th>
						<th>Current Address</th>
						<th>Cities</th>
						<th>WorkerPic</th>
						<th>Aadhaar Pic</th>
						<th>Status</th>
						<th>Operations</th>



					</tr>
				</thead>
				<tbody>
					<%
					int slno = 0;
					for (Workers workerObj : workersList) {
						slno++;
					%>
					<tr>

						<td><%=slno%></td>
						<td><%=workerObj.getWorkerId()%></td>
						<td><%=workerObj.getFullName()%></td>
						<td><%=workerObj.getRegistrationDate()%></td>
						<td><%=workerObj.getServiceName()%></td>
						<td><%=Cryptography.decode(workerObj.getMobile())%></td>
						<td><%=workerObj.getCurrentAddress()%></td>
						<td><%=workerObj.getCities()%></td>
						<td><img src='Workeruploads/<%=workerObj.getWorkerPic()%>'
							style='width: 100px; height: 100px' /></td>
						<td><img src='Workeruploads/<%=workerObj.getAadhaarPic()%>'
							style='width: 100px; height: 100px' /></td>

						<td><%=workerObj.getStatus()%></td>

								<td>
						<%
						System.out.println("status= " + workerObj.getStatus().toString());
						
						if (workerObj.getStatus().toString().equalsIgnoreCase("inactive")) {
						%>

						<button class="btn btn-sm btn-success"
								onclick="confirm_delete(<%=workerObj.getWorkerId()%>)">Active</button>


				

					<%
					} 
					else 
					{
					%>

					<a
						href="/MetroDwellServices/UpdateWorkersServlet?n=1&workerId=<%=workerObj.getWorkerId()%>&status=Inactive"
						class="btn btn-sm btn-danger">Inactive </a>



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