<%@page import="dbutil.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserProfile</title>
<jsp:include page="Header.jsp" />
<style>

</style>
</head>
<body>
<jsp:include page="UserMenu.jsp" />
  <div class="container mt-5">
  <h1 style="text-align:center">User Profile</h1>
  
  <%
	Users user = new Users();
	List<Users> userList = user.getUserById((int)session.getAttribute("userId"));
	
	%>
	<%
	for (Users userObj : userList) {
	%>
  <div class="container">
    <div class="card custom-card">
      <div class="card-body" style="background-color:#F6FD9B ;">
        <div class="row custom-row">
          <div class="col-md-3">
           <div style="position: relative; display: inline-block;">
     <td><A href='UserEditProfile.jsp?tableName=users&setColName=profilePic&whereColName=userId&conditionValue=<%=userObj.getUserId()%>&colName=profilePic'><img src="Usersuploads/<%=userObj.getProfilePic()%>" class="rounded-circle img-fluid custom-image" alt="Profile Picture" />
    <span style="position: absolute; bottom: 35px; left: 35px; background-color: rgba(255, 255, 255, 0.7); padding: 5px;">Click here to edit image</span></A></td>
 
</div>

           
          </div>
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-6">
                <h6>UserId</h6>
                      <p class="text-muted">
                        <%=userObj.getUserId()%>
                      </p>
              </div>
              <div class="col-md-6">
              <h6>FullName</h6>
                <p class="text-muted">
                        <%=Cryptography.decode(userObj.getFullName())%>
                      </p>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
              <h6>Mobile</h6>
               <p class="text-muted">
                        <%=userObj.getMobile()%>
                      </p>
              </div>
              <div class="col-md-6">
              <h6>Password</h6>
                <p class="text-muted">
                        <%=Cryptography.decode(userObj.getPassword())%>
                      </p>
              </div>
            </div>
          
        <div class="row">
         <div class=col-sm-6">
        <a href='/MetroDwellServices/EditUserDataFields.jsp?userId=<%=userObj.getUserId() %>'><button type="submit" class="btn btn-danger" >Edit</button></a>
        
        </div>
        </div>
        </div>
        
     <%  
         
	} 
           
	%>
                      
     
                    
      </div>
    </div>
  </div>
  </div>
  
  </div>
  <jsp:include page="Footer.jsp" />
</body>

</html>