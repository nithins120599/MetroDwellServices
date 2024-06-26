<%@page import="dbutil.Cryptography"%>
<%@page import="com.example.model.Users"%>
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
 <form action="/MetroDwellServices/UpdateUserDataFields" method="post">
	
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
		
			Users user = new Users();
		user=user.getUsersDetailsById((int)session.getAttribute("userId"));
		
			System.out.println("Mobolenumber = "+user.getMobile());
			
			
			%>
                <div class="form-outline mb-4">
                    <label class="form-label" >UserId</label>
                    <input type="number" name="userId"  class="form-control form-control-lg"  value='<%=user.getUserId() %>' >
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" >FullName</label>
                    <input type="text" name="fullName" class="form-control form-control-lg"  value='<%=Cryptography.decode(user.getFullName()) %> ' >
                  </div>



                
                <div class="form-outline mb-4">
                    <label class="form-label" >Mobile Number</label>
                    <input type="text" name="mobile" id="mobile" class="form-control form-control-lg" value='<%=user.getMobile() %>'>
                  </div>

                

                <div class="form-outline mb-4">
                  <label class="form-label" >Password</label>
                  
                  <input type="text" name="password" class="form-control form-control-lg" value='<%=Cryptography.decode(user.getPassword()) %>'>
                  
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