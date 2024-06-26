<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar</title>
    <style>
        .icons {
            font-size: 1.2em;
            text-align: right;
            justify-content: space-evenly;
            margin-right: 10px; /* Adjusted margin */
        }

        a.nav-link {
            font-size: 1.2em; /* Reduced font size */
            margin-right: 10px; /* Adjusted margin */
        }

        .t1 {
            font-size: medium;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            text-decoration-color: aquamarine;
            font-weight: bold;
            text-align: center;
        }

        /* Responsive Search Bar */
        .search-container {
            display: flex;
            margin-left: auto;
            margin-right: 10px; /* Adjusted margin */
        }

        .search-container input[type="text"] {
            padding: 8px; /* Reduced padding */
            margin-top: 8px;
            margin-bottom: 8px;
            font-size: 14px; /* Reduced font size */
            border: none;
            border-radius: 5px;
        }

        .search-container button {
            padding: 8px; /* Reduced padding */
            margin-top: 8px;
            margin-bottom: 8px;
            background: #ddd;
            font-size: 14px; /* Reduced font size */
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        @media screen and (max-width: 600px) {
            .search-container {
                flex-direction: column;
                align-items: center;
            }

            .search-container input[type="text"],
            .search-container button {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<section class="container-fluid"> <!-- Added container-fluid class -->
    <nav class="navbar navbar-expand-sm " style="background-color:#FAC7CE">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="UserHome.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UserProfile.jsp">Profile</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Bookings</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="ViewBookings.jsp">View Bookings</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Reviews</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="ViewReviews.jsp">View </a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logout.jsp">Logout</a>
                    </li>
                </ul>
                <div class="search-container">
                    <form action="#">
                        <input type="text" placeholder="Search.." name="search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </nav>
</section>

</body>
</html>
