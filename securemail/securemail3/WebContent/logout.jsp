<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Cookie cookie=null;
Cookie[] cookies = null;
cookies = request.getCookies();
response.setContentType("text/html");
for (int i = 0; i < cookies.length; i++) {
      cookie = cookies[i];
      if (cookie.getName().equals("email")){
    cookie.setMaxAge(0);
      }
      if (cookie.getName().equals("password")){
     cookie.setMaxAge(0);
       }
   }
response.sendRedirect("index.jsp");
%>
</body>
</html>