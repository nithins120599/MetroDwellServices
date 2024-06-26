<%@page import="dbutil.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Workers"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Worker Profile</title>
<jsp:include page="Header.jsp" />
<style>
        #r1{
                background-image: url("images/bg1.jpg");
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position:center ;
                background-size: cover;
                
            }



</style>


</head>
<body>
        <jsp:include page="WorkerMenu.jsp" />
<section>
        <%
	Workers worker = new Workers();
	List<Workers> workerList = worker.getWorkerById((int)session.getAttribute("workerId"));
	
	%>
	<%
	for (Workers workerObj : workerList) {
	%>

         <h2 class="h1" style="color: blue; text-align: center;">Worker Profile</h2>


              <div class="container mt-5">
  <div class="card" style="background-color:#ACFFA0  ;">
  <div class="card-body">
    <div class="row">


      <div class="col-sm-4">
                           <h6>WorkerId</h6>
                      <p class="text-muted">
                        <%=workerObj.getWorkerId()%>
                      </p>
                      <h6>FullName</h6>
                      <p class="text-muted">
                        <%=workerObj.getFullName()%>
                      </p>
                        <h6>ServiceName</h6>
						<p class="text-muted">
							<%=workerObj.getServiceName()%>
						</p>
						<h6>MobileNumber</h6>
						<p class="text-muted">
							<%=
							Cryptography.decode(workerObj.getMobile())
							
							
							%>
						</p>
                      
      </div>

      <div class="col-sm-4">
						 <td><A href='WorkerEditProfile.jsp?tableName=workers&setColName=workerPic&whereColName=workerId&conditionValue=<%=workerObj.getWorkerId() %>&colName=workerPic'><img src='Workeruploads/<%=workerObj.getWorkerPic()%>' 
                            class="rounded-circle img-fluid" style="width: 160px; height: 200px;" /></A></td>
                            
  
                       
      </div>


      <div class="col-sm-4">
					
						<h6>Current Address</h6>
						<p class="text-muted">
							<%=workerObj.getCurrentAddress()%>
						</p>
						<h6>Cities</h6>
						<p class="text-muted">
							<%=workerObj.getCities()%>
						</p>
						 <h6>Password</h6>
						<p class="text-muted">
							<%=
									Cryptography.decode(workerObj.getPassword())
							
							%>
						</p>
						<a href='/MetroDwellServices/EditWorkerDataFields.jsp?workerId=<%=workerObj.getWorkerId() %>'><button type="submit" class="btn btn-danger" >Edit</button></a>
          
        
      </div>

						
                      
                      <% 
                      } 
                      %>
                    

    </div>
  </div>
</div>
</div>
                      
              
              </div>
             </div>
            
</div>
</section>
<jsp:include page="Footer.jsp" />
      </body>
 
</html>