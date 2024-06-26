<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Worker Home</title>
<jsp:include page="Header.jsp" />
</head>
<body>
    <jsp:include page="WorkerMenu.jsp" />

    <!-- Carousel -->
    <div id="demo" class="carousel slide" data-bs-ride="carousel" style="margin-bottom: 0;">
        <!-- Indicators/dots -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
        </div>

        <!-- The slideshow/carousel -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/wh.jpg" alt="Los Angeles" class="d-block" style="width: 100%">
            </div>
            <div class="carousel-item">
                <img src="images/workers1.jpg" alt="Chicago" class="d-block" style="width: 100%">
            </div>
            <div class="carousel-item">
                <img src="images/w1.jpeg" alt="New York" class="d-block" style="width: 100%">
            </div>
        </div>

        <!-- Left and right controls/icons -->
        <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>

    <jsp:include page="Footer.jsp" />
    <!-- Moved the include tag here to ensure it's placed directly after the carousel -->
</body>
</html>
