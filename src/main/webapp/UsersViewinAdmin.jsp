<%@page import="dbutil.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserView In Admin</title>
<jsp:include page="Header.jsp" />
</head>
<body>
<jsp:include page="AdminMenu.jsp" />

<%
	Users user = new Users();
	//System.out.println("products =" +product);

	List<Users> userList = user.getAllUsers();
	//System.out.println("categoryList=" + categoryList.size());
	%>

	<div class="container mt-5" >

		<div class="table-responsive">
		<table class="table table-striped table-sm" id="table_id" >
			<thead >
				<tr>
					<th>Operations</th>

					<th>SINO</th>
					<th>WorkerId</th>
					<th>FullName</th>
					<th>RegistrationDate</th>
					<th>MobileNumber</th>
					<th>WorkerPic</th>
					
					

				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Users userObj : userList) {
					slno++;
				%>
				<tr>


					<td><button class="btn btn-sm btn-danger"
							onclick="confirm_delete(<%=userObj .getUserId()%>)">Delete</button></td>



					<td><%=slno%></td>
					<td><%=userObj.getUserId()%></td>
					<td><%=Cryptography.decode(userObj.getFullName())%></td>
					<td><%=userObj.getRegistrationDate()%></td>
				
					
					<td><%=userObj.getMobile()%></td>
					
					<td><img src='Usersuploads/<%=userObj.getProfilePic()%>' style='width: 100px; height: 100px' /></td>
					
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