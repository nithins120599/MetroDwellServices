<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navbar</title>
<style>

.navbar {
    padding: 5px 10px; /* Adjust padding */
}

.navbar-toggler-icon {
    font-size: 0.8rem; /* Adjust icon size */
}

.navbar-nav .nav-link {
    font-size: 1.2em; /* Adjust font size */
}

.navbar-nav .dropdown-menu .dropdown-item {
    font-size: 1em; /* Adjust dropdown item font size */
}

</style>
</head>
<body>

<section>

    <nav class="navbar navbar-expand-sm " style="background-color:#EFEF04">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="About.jsp">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Contact.jsp">Contact</a>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Logins</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="AdminLogin.jsp">Admin</a></li>
                            <li><a class="dropdown-item" href="WorkerLogin.jsp">Workers</a></li>
                            <li><a class="dropdown-item" href="UserLogin.jsp">Users</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</section>

</body>
</html>
