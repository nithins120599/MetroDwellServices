<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar</title>
    <style>
        .icons {
            font-size: 1em; /* Adjusted font size */
            text-align: right;
            justify-content: space-evenly;
            margin-right: 10px; /* Adjusted margin */
        }

        a.nav-link {
            font-size: 1.2em; /* Adjusted font size */
            margin-right: 10px; /* Adjusted margin */
        }

        .t1 {
            font-size: medium;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            text-decoration-color: aquamarine;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>

<section class="container-fluid"> <!-- Added container-fluid class -->
    <nav class="navbar navbar-expand-sm " style="background-color:#EEA4F3">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="WorkerHome.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="WorkerProfile.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewBookingsinWorkers.jsp">Bookings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ViewWorkersReview.jsp">Reviews</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Advertisement</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="AddAdvertisement.jsp">Add Advertisement</a></li>
                            <li><a class="dropdown-item" href="ViewAdvertisement.jsp">View Advertisement</a></li>
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

</body>
</html>
