<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Decrypt</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<form style="padding:30px 200px 0px 200px" action="DecryptAct.jsp">
 <div class="form-group">
    <label for="exampleFormControlInput1">Who Sent This to You?</label>
    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@gmail.com" name="from">
  </div>
 <div class="form-group">
    <label for="exampleFormControlTextarea1">Paste The Message Here!</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="20" name="message"></textarea>
  </div>
  <button type="submit" class="btn btn-primary">Decrypt</button>
  </form>
</body>
</html>
