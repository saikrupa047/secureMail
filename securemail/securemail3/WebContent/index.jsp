<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand h1" href="#">SecureMail</a>
</nav>

<div class="container">
  <ul class="nav nav-tabs nav-justified">
    <li><a data-toggle="tab" href="#home">Register</a></li>
    <li class="active"><a data-toggle="tab" href="#menu1">Login</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade">
<form action="regAct.jsp">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">First Name*</label>
      <input type="text" class="form-control" id="inputEmail4" name="firstname" required >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Last Name*</label>
      <input type="text" class="form-control" id="inputPassword4" name="lastname" required>
    </div>
  </div>
  <div class="form-group col-md-12">
    <label for="inputAddress">E-mail Address*</label>
    <input type="email" class="form-control" id="inputAddress" placeholder="1234 Main St" name="email" required>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">enter password*</label>
      <input type="password" class="form-control" id="inputEmail4" name="password1" required >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">re-enter password*</label>
      <input type="password" class="form-control" id="inputPassword4" name="password2" required>
    </div>
  </div>
  <div class="form-group col-md-12">
    <label for="inputAddress2">Mobile No.*</label>
    <input type="number" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" name="phnno" required>
  </div>
  &nbsp &nbsp <button type="submit" class="btn btn-primary">Register</button>
</form>
    </div>
    <div id="login" class="tab-pane fade in active">
<form action="logAct.jsp">
  <div class="form-group col-md-12">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" required>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group col-md-12">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="pwd" required>
  </div>
  &nbsp &nbsp <button type="submit" class="btn btn-primary">Submit</button>
</form>
    </div>
  </div>
</div>

</body>
</html>