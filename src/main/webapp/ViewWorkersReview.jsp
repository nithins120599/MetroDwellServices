<%@page import="java.util.List"%>
<%@page import="com.example.model.Reviews"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Header.jsp" />
</head>
<body>

<jsp:include page="WorkerMenu.jsp" />
<div class="container-fluid">
		<div class="row ">


			<%
			//for vewing in the tble code 
			Reviews reviews = new Reviews();
					
				
			List<Reviews> reviewList = reviews.getReviewsByWorkerId((int) session.getAttribute("workerId") );
			%>

			


			<div class="col-sm-12">
				<h1 class="text text-center bg-dark text-white mt-3">Reviews</h1>
				<div class='table-responsive'>
					<table class="table mt-5 table-bordered table-hover" id='table_id'>
						<thead class='table table-info'>
							<tr>
								<th scope="col">SLNO</th>
								<th scope="col">Review Id</th>
								<th scope="col">UserId</th>
								<th scope="col">Review Date</th>
								<th scope="col">Service Name</th>
								<th scope="col">Rating</th>
								<th scope="col">Comments</th>
									</tr>
						</thead>
						<tbody class='table  table-secoundary'>
							<%
							int slno = 1;

							for (Reviews revOb : reviewList) {
							%>
							<tr>
								<td class="text-center"><%=slno++%></td>
								<td class="text-center"><%=revOb.getReviewId() %></td>
								<td class="text-center"><%=revOb.getUserId()%></td>
								<td class="text-center"><%=revOb.getReviewDate()%></td>
								<td class="text-center"><%=revOb.getServiceName()%></td>
								<td class="text-center"><%=revOb.getRating()%></td>
								<td class="text-center"><%=revOb.getComments()%></td>

							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="Footer.jsp" />
</body>
</html>