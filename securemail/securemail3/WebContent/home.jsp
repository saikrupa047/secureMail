<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://kit.fontawesome.com/776efd84a0.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<title>Home</title>
</head>
<body style="background-color:#fff; font-family: 'Lobster', cursive;">
<nav class="navbar navbar-expand-lg navbar-light" style="background-color:#E9ECEF;">
   <a class="navbar-brand" style="padding:10px; "><i class="fas fa-paper-plane">&nbsp SecureMail</i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
    </ul>
  </div>
  <a class="btn btn-outline-dark" href="compose.jsp">Compose</a>&nbsp
  <a class="btn btn-outline-dark" href="decrypt.jsp">Decrypt</a>&nbsp
  <a class="btn btn-outline-dark" href="logout.jsp">Logout</a>
</nav>
<br>
<br>
<div class="jumbotron">
  <h2 class="display-4">Feel the comfy of Mailing.</h2>
  <p class="lead">send your mail in a more secure way of encrypting it.it's as smart as you are! </p>
  <hr class="my-4">
  <p>it's easy and more Secure now!</p>
  <a class="btn btn-dark btn-lg" href="compose.jsp" role="button">Compose Your Mail</a>
</div>

<div class="jumbotron">
  <h1 class="display-4">Unfold it Here.</h1>
  <p class="lead">uncover the message you want to,as fast as you do!</p>
  <hr class="my-4">
  <p>it's fast and accurate!</p>
  <a class="btn btn-dark btn-lg" href="decrypt.jsp" role="button">Decrypt it Here</a>
</div>

</body>
</html>