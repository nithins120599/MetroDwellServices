<%@page import="java.util.List"%>
<%@page import="com.example.model.Bookings"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Bookings in Workerss</title>
<jsp:include page="Header.jsp" />
<script>
    function navigateToDestination(latitude, longitude) {
        var destinationUrl = "https://www.google.com/maps/dir/" + latitude + "," + longitude + "/";
        window.open(destinationUrl, '_blank');
    }

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    }

    function showPosition(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        document.getElementById("latitude").value = latitude;
        document.getElementById("longitude").value = longitude;
    }

    // Call getLocation() when the page loads
    window.onload = function() {
        alert("The website wants to allow your location and get work done!!.");
        getLocation();
    };
    
    function confirm_delete(bookingId) {
        let ans = confirm("Do you want to update the booking?");
        if (ans) {
            window.location = "/MetroDwellServices/UpdateBookingStatusServlet?n=2&bookingId=" + bookingId + "&status=OnTheWay";
        }
    }

    
</script>

</head>
<body>
<jsp:include page="WorkerMenu.jsp" />
<%
    Bookings book = new Bookings();
    List<Bookings> bookList = book.getBookingsByWorkerId((int)session.getAttribute("workerId"));
%>
<br>
<input type="hidden" name="workerLatitude" id="latitude"   />
<br>
<input type="hidden" name="workerLongitude" id="longitude" />
    
<div class="container mt-5" >

    <div class="table-responsive">
        <table class="table table-striped table-sm" id="table_id" >
            <thead >
                <tr>
                    <th>SINO</th>
                    <th>bookingId</th>
                    <th>bookingDate</th>
                    <th>userId</th>
                    <th>workerId</th>
                    <th>serviceName</th>
                    <th>Status</th>
                    <th>Operation</th>
                    <th>Operation</th>
                </tr>
            </thead>
            <tbody>
                <% int slno = 0;
                for (Bookings bookObj : bookList) {
                    slno++;
                %>
                <tr>
                    <td><%=slno%></td>
                    <td><%=bookObj.getBookingId()%></td>
                    <td><%=bookObj.getBookingDate()%></td>
                    <td><%=bookObj.getUserId()%></td>
                    <td><%=bookObj.getWorkerId()%></td>
                    <td><%=bookObj.getServiceName()%></td>
                    <td><%=bookObj.getStatus()%></td>
                   <!--  <td><button class="btn btn-sm btn-warning"
                            onclick="confirm_delete(<%=bookObj.getWorkerId()%>)">Update</button></td>
                            --> 
                        <td class="text-center">
    <%
    // Check if the booking status is "Confirmed"
    if (bookObj.getStatus().toString().equalsIgnoreCase("Confirmed")) {
    %> 
    <!-- If the status is "Confirmed", render an update button -->
    <input type="button" class="btn btn-danger text-white"
           style="background-color: green"
           onclick="confirm_delete(<%=bookObj.getBookingId()%>)"
           value="Update" /> 
    <%
    } else {
    %>
    <!-- If the status is not "Confirmed", render a disabled button -->
    <button class="btn btn-sm btn-success" disabled value="">
        <i class="bi bi-hand-thumbs-up-fill" style="font-size: 1.5rem"></i>
    </button> 
    <%
    }
    %>
</td>
                            
                            
                    <td>
                        <button class="btn btn-sm btn-success"
                                onclick="navigateToDestination('<%=bookObj.getWorkerLatitude()%>', '<%=bookObj.getWorkerLongitude()%>')">
                           GetLocation
                        </button>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <script>
        $(document).ready(function() {
            $('#table_id').DataTable();
        });
    </script>
</div>
</body>
</html>
