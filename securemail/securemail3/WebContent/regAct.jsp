<%@page import="java.security.KeyPair"%>
<%@page import="java.security.KeyPairGenerator"%>
<%@page import="java.security.spec.InvalidKeySpecException"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.security.KeyFactory"%>
<%@page import="java.util.Base64"%>
<%@page import="java.security.spec.X509EncodedKeySpec"%>
<%@page import="java.security.PublicKey"%>
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
<%String firstname,lastname,nam,phn,ml,pwd1,pwd2;
final String privkey,pubkey;
firstname=request.getParameter("firstname");
lastname=request.getParameter("lastname");
nam=firstname+lastname;
ml=request.getParameter("email");
pwd1=request.getParameter("password1");
pwd2=request.getParameter("password2");
phn=request.getParameter("phnno");

KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
        keyGen.initialize(1024);
        KeyPair pair = keyGen.generateKeyPair();
        privkey = Base64.getEncoder().encodeToString(pair.getPrivate().getEncoded());
        pubkey = Base64.getEncoder().encodeToString(pair.getPublic().getEncoded());
if(pwd1.equals(pwd2)){
try {
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/securemail","root","");
Statement st=con.createStatement();

int i=st.executeUpdate("insert into mailer values('"+nam+"','"+ml+"','"+pwd1+"','"+phn+"','"+pubkey+"','"+privkey+"')");
if(i>0) {
response.sendRedirect("index.jsp");
}
else{
out.println("something wrong");
}
} catch (Exception e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
}
else{
out.println("passwords don't match");
out.println(pwd1+pwd2);
}
%>
</body>
</html>