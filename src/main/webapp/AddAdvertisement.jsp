<%@page import="com.example.model.Advertisement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Advertisement</title>
    <jsp:include page="Header.jsp" />

    <style>
        #c1 {
            box-shadow: 15px 20px 25px #73CFE1;
            height: auto;
            width: auto;
            border-radius: 4px;
            background: #ff00ff;
        }

        #c1 {
            background-image: url("images/bg16.jpeg");
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
    </style>
</head>
<body>
    <jsp:include page="WorkerMenu.jsp" />

    <div class="container mt-5">
        <div class="card" id="c1" style="background-color:#87928C;">
            <form class="card-body" action="AddAdvertisementServlet" method="post" enctype="multipart/form-data">
                <h2 class="mb-4 text-center" style="color:#490083 ;"><i class="fa-brands fa-servicestack" style="color: #0bf487;"></i> Add Advertisement</h2>

                <div class="row">
                    <div class="col-sm-6">
                        <label for="workerId">WorkerId</label>
                        <!-- Display workerId from session, readonly to prevent modification -->
                        <input type="text" name="workerId" id="workerId" value="<%= session.getAttribute("workerId") %>" readonly />
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <label for="advertisementStartDate">Advertisement Start Date</label>
                        <input type="date" name="advertisementStartDate" id="advertisementStartDate" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <label for="advertisementEndDate">Advertisement End Date</label>
                        <input type="date" name="advertisementEndDate" id="advertisementEndDate" />
                    </div>
                </div>
                

                <div class="row">
                    <div class="col-sm-6">
                        <label>Advertisement Banner:</label>
                        <input type="file" class="form-control" name="advertisementBanner" /><br><br>
                        
                        
                       

                    </div>
                </div>
                
                <div class="row">
    <div class="col-sm-6">
        <label for="amount">Amount</label>
        <input type="text" name="amount" id="amount" />
    </div>
</div>

 <%
 String res = request.getParameter("res");
         if (res != null) {
 		if (res.equals("0")) {
 	out.println("<h4 style='color:red'>Advertisement not added</h4>");
 		} else {
 	out.println("<h4 style='color:green'>Advertisement Added Successfully..</h4>");
 		}
 	}
 %>
                
                
                <br><br>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Add Advertisement</button>
                </div>
            </form>
        </div>
    </div>
</body>
<jsp:include page="Footer.jsp" />
</html>
