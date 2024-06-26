<%@page import="com.example.model.Workers"%>
<%@page import="com.example.model.Reviews"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Reviews</title>
<jsp:include page="Header.jsp" />
</head>
<body>
<jsp:include page="UserMenu.jsp" />
<form action="/MetroDwellServices/UpdateReviewServlet" method="post">
		<div class="container mt-3 card " style='background-color:#87D9B5 ' >
		 
			<h1 class="text-danger text-center Italic ">
			<i class='far fa-star' style='font-size:24px'></i>
			<i class='far fa-star' style='font-size:24px'></i>
			Update Reviews
			<i class='far fa-star' style='font-size:24px'></i>
			<i class='far fa-star' style='font-size:24px'></i>
			</h1>
			<div class="row">
			
			<%
			
			//for vewing in the table code 
			Reviews rev = new Reviews();
			String reviewId = request.getParameter("reviewId");
			
			System.out.println("reviewId="+reviewId);
            
			rev =rev. getReviewsById(Integer.parseInt(reviewId));
	
			

			%>
			
			<%
			Workers workers = new Workers();
			workers=workers.getWorkerDetailsByworkerId(rev.getWorkerId());
			String workerId= request.getParameter("workerId");
			
		/*String productCode= request.getParameter("productCode");
			Product product = new Product();
			product= product.getProductByProductCode(rating.getProductCode());
		*/
			
			%>
			
			<div class=col-sm-6>
			
			
					<label	for="workerId" class="mt-5">
						<h6>WorkerId</h6>
			</label> 
			<span><%=workers.getWorkerId()%></span> 
			
			<input type='hidden'
						name="workerId" value="<%=workers.getWorkerId()%>">
						
			

				</div>
					</div>			
				
				
				<div class="row">
    	<div class="col-sm-6">
        <label class="text-dark">ServiceName :</label><span><%=workers.getServiceName()%> </span>
       
    	</div>
	</div>
				
				
				
				
					<div class="row">
    <div class="col-sm-6">
        <label class="text-dark">Worker image</label> 
        <img src='Workeruploads/<%=workers.getWorkerPic()%>'  style='width:100px;height:100px' readonly/>
    </div>
	</div>
				
			
			<div class="row">
			
			<div class="col-md-6">
                        <div class="form-group mb-2">
                        <input type="hidden" name="ratingId" value="<%= reviewId %>">
                            <label for="rating" class="fw-bold">ReviewId</label>
                            <span><%=rev.getReviewId()%></span> 
                        <input type='hidden'
						name="reviewId" value="<%=rev.getReviewId()%>">
						
                        </div>
                    </div>
			
			</div>
			
	
	
			
				
				
				
			
			<div class="row">
			
			<div class="col-md-6">
                        <div class="form-group mb-2">
                            <label for="rating" class="fw-bold">Ratings</label>
                            <input type="number" name="rating" value='<%=rev.getRating() %>' />
                        </div>
                    </div>
			
			</div>
			
			
			<div class="row">
			<div class="col-md-6">
			
			<label  for="comments" class="text-dark">Comments</label> 
		<textarea class="form-control" rows="4" cols="10" name="comments"><%=rev.getComments() %></textarea>

			
			</div>
			
			</div>
			<br><br>
			<div class="row">
			<div class="col-sm-6">
			
	                <button type="submit" class="btn btn-primary ">UPDATE RATING</button>
	       
			
			</div>
			
			</div>
			
			
			
			</div>

	</form>
</body>
</html>