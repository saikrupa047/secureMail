<%@page import="java.util.Base64"%>
<%@page import="java.security.PublicKey"%>
<%@page import="java.security.spec.X509EncodedKeySpec"%>
<%@page import="java.security.KeyFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="java.util.Properties"%>
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
System.setProperty("javax.net.ssl.trustStore", "C:/.keystore");
System.setProperty("javax.net.ssl.trustStorePassword", "qwerty");

String tomail,subject,message,from=null,pub="",pwd="";
PublicKey pk=null;
tomail=request.getParameter("to");
subject=request.getParameter("subject");
message=request.getParameter("message");
Cookie cookie=null;
Cookie[] cookies = null;
cookies = request.getCookies();
response.setContentType("text/html");
for (int i = 0; i < cookies.length; i++) {
      cookie = cookies[i];
      if (cookie.getName().equals("email")){
    from=cookie.getValue().toString();
      }
      if (cookie.getName().equals("password")){
      pwd=cookie.getValue().toString(); 
       }
   }
String SMTP_HOST_NAME = "smtp.gmail.com";
String SMTP_PORT = "465";
String emailMsgTxt = "Test Message Contents";
 String emailSubjectTxt = "A test from gmail";
final String emailFromAddress = from;
final String password=pwd;
System.out.println(emailFromAddress+password);

String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
System.out.println(emailFromAddress+password+1);
String   to=tomail ;
 boolean debug = true;
 Properties props = new Properties();
 //System.out.println(emailFromAddress+password+2);
 props.put("mail.smtp.host", SMTP_HOST_NAME);
 //System.out.println(emailFromAddress+password+3);
 props.put("mail.smtp.auth", "true");
 //System.out.println(emailFromAddress+password+4);
 props.put("mail.debug", "true");
 //System.out.println(emailFromAddress+password+5);
 props.put("mail.smtp.port", SMTP_PORT);
 //System.out.println(emailFromAddress+password+6);
 props.put("mail.smtp.socketFactory.port", SMTP_PORT);
 //System.out.println(emailFromAddress+password+7);
 props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
 //System.out.println(emailFromAddress+password+8);
 props.put("mail.smtp.socketFactory.fallback", "false");
 //System.out.println(emailFromAddress+password+9);
 javax.mail.Session session1 = javax.mail.Session.getInstance(props,new javax.mail.Authenticator() {
 protected PasswordAuthentication getPasswordAuthentication() {
 return new PasswordAuthentication(emailFromAddress,password);
 }
 });
 System.out.println(emailFromAddress+password+10);
 session1.setDebug(debug);
 Message msg = new MimeMessage(session1);
 InternetAddress addressFrom = new InternetAddress(emailFromAddress);
 msg.setFrom(addressFrom);
 InternetAddress addressTo =new InternetAddress(to);
 System.out.println(emailFromAddress+password+11);
 msg.setRecipient(Message.RecipientType.TO, addressTo);
 // Setting the Subject and Content Type
 msg.setSubject(subject);
 byte[] enbytes=null;
 try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/securemail","root","");
Statement s=con.createStatement();
ResultSet rs=s.executeQuery("select pubkey from mailer where mail='"+from+"'");
if (rs.next()){
pub= rs.getString(1);
}
 KeyFactory keyFactory = KeyFactory.getInstance("RSA");
 pk = keyFactory.generatePublic(new X509EncodedKeySpec(Base64.getDecoder().decode(pub)));
 Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
 cipher.init(Cipher.ENCRYPT_MODE, pk);
 enbytes=cipher.doFinal(message.getBytes());
 System.out.println(message);
 msg.setContent(Base64.getEncoder().encodeToString(enbytes), "text/plain");
 System.out.println(emailFromAddress+password+12);
 System.out.println(pub);
 Transport.send(msg);
 
 System.out.println(emailFromAddress+password+13);
 response.sendRedirect("home.jsp");
 }
 catch(Exception e){
e.printStackTrace();
 }
 
%>

</body>
</html>