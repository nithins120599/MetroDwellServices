<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navbar</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>

.navbar {
    padding: 5px 10px; /* Adjust padding */
}

.navbar-toggler-icon {
    font-size: 0.8rem; /* Adjust icon size */
}

.navbar-nav .nav-link {
    font-size: 1.2em; /* Adjust font size */
    margin-right: 10px; /* Adjust space between links */
}

.navbar-nav .dropdown-menu .dropdown-item {
    font-size: 1em; /* Adjust dropdown item font size */
}

</style>
</head>
<body>

<section class="container-fluid">
    <nav class="navbar navbar-expand-sm navbar-light" style="background-color:#09EDDC">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="AdminHome.jsp">Home</a>
                    </li>
                   <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown">Services</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="AddServices.jsp">Add Services</a></li>
                            <li><a class="dropdown-item" href="ViewServices.jsp">View Services</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown">Review</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">View</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown">Workers</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="WorkersViewinAdmin.jsp">View</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown">Users</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="UsersViewinAdmin.jsp">View</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</section>

<!-- Bootstrap JS and jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
