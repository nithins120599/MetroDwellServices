<%@page import="java.util.List"%>
<%@page import="com.example.model.Advertisement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Adv</title>
 <jsp:include page="Header.jsp" />
</head>

<body>
<jsp:include page="WorkerMenu.jsp" />

<div class="container" >

	
		
<%
Advertisement adv = new Advertisement();
	List<Advertisement> advList = adv.getAllAdvertisements();
	
	%>
	
	<% 
		for (Advertisement advObj : advList) {
			
	%>
			
	
	<div class="row mt-3" style="display-inline:block" >
	<div class="col-sm-4">
	
	 <img src='./Workeruploads/<%= advObj.getAdvertisementBanner() %>'
								style='width: 200px; height: 230px' /><br>
	<span style="color:#750505; font-weight:bold;">Advertisement Banner</span>
	</div>

	
	<div class="col-sm-7">
	
    <span style="color:#750505; font-weight:bold;">AdvertisementId:</span><%= advObj.getAdvertisementId() %>	<br>					
    
    <span style="color:#750505; font-weight:bold;">WorkerId:</span><%= advObj.getWorkerId() %>	<br>					
	<span style="color:#750505; font-weight:bold;">AdvertisementStartDate :</span><%= advObj.getAdvertisementStartDate()%>	<br>
	<span style="color:#750505; font-weight:bold;">AdvertisementStartDate :</span><%= advObj.getAdvertisementEndDate() %>	<br>	
	<span style="color:#750505; font-weight:bold;">Amount:</span></span><%= advObj.getAmount() %>	<br>

	</div>
	
				
	
	<div class="col-sm-1"></div>
	<%
		}
		 	%>
	</div>
	
	</div>
	
	</form>	
		

	
		
</body>
</html>