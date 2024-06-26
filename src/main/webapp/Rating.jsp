<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rating</title>
<jsp:include page="Header.jsp" />
<style>
#k {
            background-image: url("images/bg4.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
            color: dark;
            height: 100%; /* Use min-height instead of height */
        
            
        }
        </style>
</head>
<body>
<jsp:include page="UserMenu.jsp" />
<form action="/MetroDwellServices/AddRatingsServlet" method="post">
		
		<div class="container mt-3 card " id="k" >
		 
			<h1 class="text-danger text-center Italic ">
			<i class='far fa-star' style='font-size:24px'></i>
			<i class='far fa-star' style='font-size:24px'></i>
			Ratings
			<i class='far fa-star' style='font-size:24px'></i>
			<i class='far fa-star' style='font-size:24px'></i>
			</h1>
			<div class="row">
			
			<%
			String workerId = request.getParameter("workerId");
			String serviceName = request.getParameter("serviceName");
			Workers workers = new Workers();
			workers= workers.getWorkerDetailsByworkerId(Integer.parseInt(workerId));
			System.out.println("workerId=" +workerId);
			System.out.println("serviceName=" +serviceName);
		
			
			
			%>
				<div class="col-sm-6">
				 <label><h6>Worker Id</h6><span><%=workers.getWorkerId() %></span></label>
               <input type='hidden'  name="workerId" value="<%=workers.getWorkerId() %>">
				</div>
				</div>
				
		<div class="row">
    	<div class="col-sm-6">
    	<label for="rating" class="mt-5"><h6>Service Name</h6> </label>
     <input type="text" name="serviceName" value='<%=workers.getServiceName()%>' readonly><br>
     
    </div>
	</div><br>
	
	<div class="row">
    <div class="col-sm-6">
        <label class="text-dark">WorkerImage</label> 
       <img src='Workeruploads/<%=workers.getWorkerPic()%>' style='width:140px;height:160px' readonly/>
    </div>
	</div>
	
	<br><br>	
	
	<div class="row">
			
			<div class="col-md-6">
                        <div class="form-group mb-2">
                            <label for="rating" class="fw-bold">Ratings</label>
                            <input type="number" name="rating" />
                        </div>
                    </div>
			
			</div>
			
			
			<div class="row">
			<div class="col-md-6">
			
			<label  for="comments" class="text-dark">Comments</label> 
					 <textarea class="form-control" rows="4" cols="10" name="comments"></textarea>

			
			</div>
			
			</div>
			<br><br>
			<div class="row">
			<div class="col-sm-6">
			
	                <button type="submit" class="btn btn-primary ">ADD RATING</button>
	       
			
			</div>
			
			</div>
			
			
			
			</div>
			</form>
			
</body>
</html>