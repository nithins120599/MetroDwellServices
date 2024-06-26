<%@page import="java.util.List"%>
<%@page import="com.example.model.Services"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Worker Registration</title>
<jsp:include page="Header.jsp" />

<script>
    function checkPasswordStrength(password) {
      // Define your password strength criteria and calculations here
      // This is a simple example, you can modify it based on your requirements

      var strength = 0;

      // Check the length of the password
      if (password.length >= 8) {
        strength += 1;
      }

      // Check if the password contains both uppercase and lowercase characters
      if (/[a-z]/.test(password) && /[A-Z]/.test(password)) {
        strength += 1;
      }

      // Check if the password contains at least one number
      if (/\d/.test(password)) {
        strength += 1;
      }

      // Check if the password contains at least one special character
      if (/[$&+,:;=?@#|'<>.^*()%!-]/.test(password)) {
        strength += 1;
      }

      // Display the password strength
      var strengthText = "";
      switch (strength) {
        case 0:
        case 1:
          strengthText = "Weak";
          break;
        case 2:
          strengthText = "Moderate";
          break;
        case 3:
        case 4:
          strengthText = "Strong";
          break;
      }

      document.getElementById("password-strength").innerHTML = "Password Strength: " + strengthText;
	  if(strengthText=="Weak"){
		document.getElementById("password-strength").style.color = 'red';
    }else if(strengthText=="Moderate"){
		document.getElementById("password-strength").style.color = 'blue';
    }else if(strengthText=="Strong"){
		document.getElementById("password-strength").style.color = 'green';
    }
	}
	
	
	
	function validatePasswords(cpassword){
		var cpwd = document.getElementById("password").value;
		if(cpassword == cpwd){
		document.getElementById("cpwdLabel").innerHTML = "Passwords match";
		document.getElementById("cpwdLabel").style.color = "green";
		}else{
		document.getElementById("cpwdLabel").innerHTML = "Passwords not match";
		document.getElementById("cpwdLabel").style.color = "red";
		}
	
	}
  </script>

</head>
<body>
<jsp:include page="Menu.jsp" />


<%
				Services services = new Services();
				List<String> serviceList = services. getAllServicesByName();
				System.out.print(serviceList);
				%>

	<header class="bg-info p-3">
		<div class="container text-light">
			<i class="fa fa-wrench" style="font-size: 24px;"></i> <span><h1>Worker
					Registration</h1></span>
		</div>
	</header>
	<div class="container mt-2" style="background-color:#BDF5DE ;">
		<form method='POST' action="AddWorkerServlet" enctype="multipart/form-data">
			<div class="form-group">
				<label for="fullName">Full Name:</label> <input type="text"
					class="form-control" id="fullName" placeholder="Enter full name"
					name="fullName" required>
			</div>
			<!-- 
			<div class="form-group">
				<label for="registrationDate">Registration Date:</label> <input
					type="date" class="form-control" id="registrationDate"
					name="registrationDate" required>
			</div> -->
			
			
			
			<div class="form-group">
			<label><i class="fa-solid fa-signature"></i>Service Name</label>
				<select name="serviceName" class="form-control form-control-lg" required">Service Name:</label>
				<option>----select Services-----</option>
				 <%    
							for(String serviceName: serviceList){
								String option="<option value='"+serviceName+"'>"+serviceName+"</option>";
								out.println(option);
							}
						%>
						</select>
			</div>
			
		
			<div class="form-group">
				<label for="mobile">Mobile:</label> <input type="text"
					class="form-control" id="mobile" placeholder="Enter mobile number"
					name="mobile" required>
			</div>
			<div class="form-group">
				<label for="currentAddress">Current Address:</label> <input
					type="text" class="form-control" id="currentAddress"
					placeholder="Enter current address" name="currentAddress" required>
			</div>
			
			
			
			<div class="form-outline mb-4">
                    <label class="form-label" >Cities</label>
                    <select name="cities"  class="form-control form-control-lg" required>
                        <option value="">--Select Cities--</option>
                        <option value="">others</option>

                    <option value="Warangal">Warangal</option>
                    <option value="Hanamkonda">Hanamkonda</option>
                    <option value="Hyderabad">Hyderabad</option>
                    <option value="GunturKaram">Kazipet</option>
                    </select>
                  </div>
        
        
        
			<div class="form-group">
				<label for="workerPic">Worker Picture:</label> <input type="file"
					class="form-control" id="workerPic" name="workerPic" required>
			</div>
			<div class="form-group">
				<label for="aadhaarPic">Aadhaar Picture:</label> <input type="file"
					class="form-control" id="aadhaarPic" name="aadhaarPic" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" id="password" oninput="checkPasswordStrength(this.value)"  placeholder="Enter password"
					name="password" required>
					 <div id="password-strength"></div>
			</div>
			<div class="form-group">
				<label for="confirm password">confirm Password:</label> <input
					type="password" class="form-control" id="cpassword" oninput="validatePasswords(this.value)"
					placeholder="confirm password" name="password" required>
					<div id="cpwdLabel"></div>
			</div>
			 
		
			<button type="submit" class="btn btn-success mt-3">Register</button>
			<br> <br>
			
			
		</form>
	</div>


</body>
</html>