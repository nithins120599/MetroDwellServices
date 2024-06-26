<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Header.jsp" />
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
  height: 100%; /* Set a fixed height to ensure all cards are the same height */
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}

.container {
  padding: 0 16px;
  height: 100%; /* Ensure the container takes full height of the card */
}

.container p {
  margin: 10px 0; /* Add some margin to the paragraphs */
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
</style>
</head>
<body>
<jsp:include page="Menu.jsp" />
<div class="about-section">
  <h1>About Us Page</h1>
  <p>Welcome to METRO DWELL SERVICES, where innovation meets excellence.</p>
  <p>At METRO DWELL SERVICES, we're passionate about to solve any problem within short time.</p>
  <p>Our journey began with a simple idea: to make work smart, easy and efficient...</p>
</div>

<h2 style="text-align:center">Our Team</h2>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="images/ceo1.jpeg" alt="Jane" style="width:100%">
      <div class="container">
        <h2>Sundar Pichai</h2>
        <p class="title">CEO & Founder</p>
        <p>Welcome to Metro Dwell Services, where innovation transforms living spaces. Meet our esteemed CEO, Sundar Pichai, a visionary leader with a passion for revolutionizing the way we experience urban living.</p>
        <p>sundar@google.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="images/timcook.jpeg" alt="Mike" style="width:100%">
      <div class="container">
        <h2>Tim Cook</h2>
        <p class="title">Art Director</p>
        <p>Nairobi brings a wealth of experience and a passion for innovation to Metro Dwell Services. With a steadfast dedication to quality and a keen understanding of market dynamics,
         he has propelled our company to the forefront of the real estate industry</p>
        <p>Timcook@google.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <img src="images/n1.jpeg" alt="John" style="width:100%">
      <div class="container">
        <h2>Nairobi</h2>
        <p class="title">Designer</p>
        <p>Nairobi brings a unique blend of expertise and creativity to Metro Dwell Services.
         With a keen eye for detail and a deep understanding of architectural principles, they have played a pivotal role in bringing our projects to life.</p>
        <p>Nairobi@google.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>
</div>
</body>
</html>
