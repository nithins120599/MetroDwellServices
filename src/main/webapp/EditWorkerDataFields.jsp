<%@page import="dbutil.Cryptography"%>
<%@page import="com.example.model.Workers"%>
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
<form action="/MetroDwellServices/UpdateWorkerDataFields" method="post">
	
	<div class="container  bg-secondary p-3 mt-4">
	<h3 class="text-dark ">Edit Here to update</h3>
	
	
	<div class = "row">
	<div class="col-sm-12">
<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong>  *Updated  ..!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Account not Updated..!
		</div>
		<%
		}
		}
		%>
		
		
		<%
		String workerId = request.getParameter("workerId");
		Workers work = new Workers();
		work=work.getWorkersDetailsByworkerId(Integer.parseInt(workerId));
		
			System.out.println("Mobolenumber = "+work.getFullName());
			
		
			%>
                <div class="form-outline mb-4">
                    <label class="form-label" >WorkerId</label>
                    <input type="number" name="workerId"  class="form-control form-control-lg"  value='<%=work.getWorkerId() %>' >
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" >FullName</label>
                    <input type="text" name="fullName" class="form-control form-control-lg"  value='<%=work.getFullName() %> ' >
                  </div>

  			<div class="form-outline mb-4">
                    <label class="form-label" >ServiceName</label>
                    <input type="text" name="serviceName" class="form-control form-control-lg"  value='<%=work.getServiceName() %>'>
                  </div>

                
                <div class="form-outline mb-4">
                    <label class="form-label" >Mobile Number</label>
                    <input type="text" name="mobile" id="mobile" class="form-control form-control-lg" value='<%=Cryptography.decode(work.getMobile())  %>'>
                  </div>

                 <div class="form-outline mb-4">
                    <label class="form-label" >CurrentAddress</label>
                    <input type="text" name="currentAddress"  class="form-control form-control-lg" value='<%=work.getCurrentAddress()%>'>
                  </div>
					 <div class="form-outline mb-4">
                    <label class="form-label" >Cities</label>
                    <input type="text" name="cities"  class="form-control form-control-lg" value='<%=work.getCities() %>'>
                  </div>
                

                <div class="form-outline mb-4">
                  <label class="form-label" >Password</label>
                  
                  <input type="text" name="password" class="form-control form-control-lg" value='<%=Cryptography.decode(work.getPassword()) %>'>
                  
                </div>

               

               

                <div class="d-flex justify-content-center">
                  <button type="submit"
                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Update</button>
                </div>

                


            <</div>
			</div>
		</div>
	</form>
</body>

</html>