<%@page import="java.util.List"%>
<%@page import="com.example.model.Services"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Services</title>
<jsp:include page="Header.jsp" />
<script>
$(document).ready(function() {
	$('#table_id').DataTable();
});


        function confirm_delete(serviceId) {
                        let ans = confirm("Do you want to delete this record?");
            if (ans) {
                       window.location = "/MetroDwellServices/DeleteServiceServlet?serviceId=" + serviceId;
            }
        }
    </script>
</head>
<body>
	<jsp:include page="AdminMenu.jsp" />
	<%
	Services service = new Services();
	List<Services> serviceList = service.getAllServices(null);
	//System.out.println("categoryList=" + categoryList.size());
	%>
	<div class="container mt-5">

		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Servicess Updated..!!!!!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Servicess not Updated..!
		</div>
		<%
		}
		}
		%>


		<div class="table-responsive">
			<table class="table table-striped table-sm" id="table_id">
				<thead>
					<tr>

						<th>Operations</th>
						<th>Operations</th>
						<th>SINO</th>
						<th>Service Name</th>
						<th>Service Id</th>
						<th>Service Pic</th>
					</tr>
				</thead>
				<tbody>
					<%
				int slno = 0;
				for (Services serviceObj : serviceList) {
					slno++;
				%>
					<tr>


						<td><button class="btn btn-sm btn-info"
								onclick="confirm_delete(<%=serviceObj.getServiceId()%>)">Delete</button></td>

						<td><a
							href="/MetroDwellServices/EditServiceText.jsp?serviceId=<%=serviceObj.getServiceId()%>"
							class="btn btn-danger">Edit</a></td>

						<td><%=slno%></td>
						<td><%=serviceObj.getServiceName()%></td>
						<td><%=serviceObj.getServiceId()%></td>
						
						<td><A href='EditServiceImage.jsp?tableName=services&setColName=servicePic&whereColName=serviceId&conditionValue=<%=serviceObj.getServiceId() %>&colName=servicePic'><img src ='uploads/<%=serviceObj.getServicePic()%>' style='width:100px;height:100px'/></td>

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
	
<jsp:include page="Footer.jsp" />
</html>