<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String nm=request.getParameter("email");
String pw=request.getParameter("pwd");

Cookie ml = new Cookie("email", nm);
ml.setMaxAge(60*60*24);
response.addCookie(ml);

Cookie ps = new Cookie("password", pw);
ml.setMaxAge(60*60*24);
response.addCookie(ps);

response.setContentType("text/html");
try {
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/securemail","root","");
Statement s=con.createStatement();
ResultSet rs=s.executeQuery("select * from mailer where mail='"+nm+"' and password='"+pw+"'");
   
   if(rs.next())
     {
out.print("im in logact");
    response.sendRedirect("home.jsp");
    }
   else{
    out.println("please register");
   }
}
catch (Exception e) {
e.printStackTrace();
}

%>
</body>
</html>
