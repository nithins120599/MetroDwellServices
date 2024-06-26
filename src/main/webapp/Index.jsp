
<%@page import="dbutil.Cryptography"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>

<jsp:include page="Header.jsp" />

<style>
.icons {
	font-size: 1.2em;
	text-align: right;
	justify-content: space-evenly;
	margin-right: 20px; /* Adjusted margin */
}

a.nav-link {
	font-size: 1.5em; /* Make the font size bigger */
	margin-right: 20px; /* Add space between the links */
}

.t1 {
	font-size: medium;
	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS',
		sans-serif;
	text-decoration-color: aquamarine;
	font-weight: bold;
	text-align: center;
}
 body{
                background-image: url("images/bg3.jpg");
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position:center ;
                background-size: cover;
               
            }
</style>
</head>
<body>

<jsp:include page="Menu.jsp" />

<%
String text = "12345";

String encode = Cryptography.encode(text);
System.out.println("encode = " +encode);

String decode = Cryptography.decode(encode);
System.out.println("decode = " +decode);
%>

	<section>
		<div class="row mt-4" style="margin-left: 25px;">

			<div class="col-sm-6 mt-4">

				<h2 style="font-style: oblique; color: blueviolet;">
					MetroDwellServices....<i class="fas fa-tools"
						style="color: #3a2237;"></i>
				</h2>
				<br>
				<p style="font-style: italic; text-shadow: #050505;">Where
					Services done Efficiently!!!</p>
				<span class="t1"> An Online Service that provides a variety
					of services like plumbers, movers and packers, repair persons,
					cleaners, electricians, painters, taxi service laundry and many
					more, and to make it comfortable for all the users the system also
					provides a mobile environment which offers ease in accessing the
					authors' services </span>
			</div>
			<div class="col-sm-6">
				<img src="images/workers1.jpg" style="height: 350px; border-radius: 20%;" />
			</div>
		</div>

		<div class="row mt-5" style="margin-left: 25px;">
			<h1 style="color:purple;">Our Services Include...</h1>
			<div class="col-sm-3">
			<span style="color: red ;"><u>WashingMachine repair</u></span>
				<img src="images/worker1.jpg"
					style="height: 220px; border-radius: 60px 70px 40px 140px;" />
			</div>
			<div class="col-sm-3">
			<span style="color:  red ;"><u>Plumber</u></span>
				<img src="images/plumber2.jpg"
					style="height: 220px; border-radius: 50%;" />
			</div>
			<div class="col-sm-3">
			<span style="color:  red ;"><u>House Cleaning</u></span>
				<img src="images/worker5.jpg"
					style="height: 220px; border-radius: 30%;" />
			</div>
			<div class="col-sm-3">
			<span style="color: red ;"><u>Furniture&Interior Design</u></span>
				<img src="images/carpenter1.jpg"
					style="height: 220px; border-radius: 140px 40px 70px 60px;" />
			</div>
		</div>
		<div class="row mt-5" style="margin-left: 25px;">
			
			<div class="col-sm-3">
			<span style="color: red  ;"><u>ArchitectureDesign</u></span>
				<img src="images/worker3.jpg"
					style="height: 220px; border-radius: 60px 70px 40px 140px;" />
			</div>
			<div class="col-sm-3">
			<span style="color:  red ;"><u>Electrical Workss</u></span>
				<img src="images/services2.jpg"
					style="height: 220px; border-radius: 50%;" />
			</div>
			<div class="col-sm-3">
			<span style="color: red  ;"><u>Painting</u></span>
				<img src="images/carpenter3.jpg"
					style="height: 220px; border-radius: 30%;" />
			</div>
			<div class="col-sm-3">
			<span style="color:  red ;"><u>Design Plan to your home</u></span>
				<img src="images/carpenter2.jpg"
					style="height: 220px; border-radius: 140px 40px 70px 60px;" />
			</div>
		</div>

	</section>
	
	<div class="footer">
	<jsp:include page="Footer.jsp" />
	</div>
</body>

</html>