<%@page import="java.util.List"%>
<%@page import="com.example.model.Reviews"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Reviews</title>
<jsp:include page="Header.jsp" />
<script>
	$(document).ready(function() {
		$('#table_id').DataTable();
	});

        function confirm_delete(reviewId) {
                        let ans = confirm("Do you want to delete this record?");
            if (ans) {
                       window.location = "/MetroDwellServices/DeleteReviewServlet?reviewId=" + reviewId;
            }
        }
    </script>
</head>
<body>
<jsp:include page="UserMenu.jsp" />
<%
	Reviews rev = new Reviews();
	List<Reviews> revList = rev.getAllReviews((int)session.getAttribute("userId"));
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
			<strong>Success!</strong> Rating Added Successfully..!!!!!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Rating not Added..!
		</div>
		<%
		}
		}
		%>
		
		
			<div class="table-responsive">
		<table class="table table-striped table-sm" id="table_id">
			<thead>
				<tr>
					<!--  <th>Operations</th>-->
					<th>Operations</th>
					<th>Operations</th>
					<th>SINO</th>
					<th>ReviewId</th>
					<th>UserId</th>
					<th>WorkerId</th>
					<th>ReviewDate</th>
					<th>ServiceName</th>
					<th>Rating</th>
					<th>Comments </th>
					
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Reviews revObj : revList) {
					slno++;
				%>
				<tr>
					<!--  <td><a
						href="/MetroDwellServices/DeleteReviewServlet?reviewId=<%=revObj.getReviewId()%>"
						class="btn btn-danger">Delete</a></td>
						-->

					<td><button class="btn btn-sm btn-info"
							onclick="confirm_delete(<%=revObj.getReviewId()%>)">Delete</button></td>

					<td><a
						href="/MetroDwellServices/EditReviews.jsp?reviewId=<%=revObj.getReviewId()%>"
						class="btn btn-danger">Edit</a></td>

					<td><%=slno%></td>
					<td><%=revObj.getReviewId()%></td>
					<td><%=revObj.getUserId()%></td>
					<td><%=revObj.getWorkerId()%></td>
					<td><%=revObj.getReviewDate()%></td>
					<td><%=revObj.getServiceName() %></td>
					<td><%=revObj.getRating() %></td>
					<td><%=revObj.getComments() %></td>
					
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