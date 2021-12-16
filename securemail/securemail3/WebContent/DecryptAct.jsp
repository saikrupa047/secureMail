<%@page import="java.security.spec.InvalidKeySpecException"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="javax.crypto.NoSuchPaddingException"%>
<%@page import="java.security.InvalidKeyException"%>
<%@page import="javax.crypto.IllegalBlockSizeException"%>
<%@page import="javax.crypto.BadPaddingException"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.util.Base64"%>
<%@page import="java.security.spec.PKCS8EncodedKeySpec"%>
<%@page import="java.security.KeyFactory"%>
<%@page import="java.security.PrivateKey"%>
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
<%! String decryptedString="krupa";
public static PrivateKey getPrivateKey(String base64PrivateKey){
    PrivateKey privateKey = null;
    PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(Base64.getDecoder().decode(base64PrivateKey.getBytes()));
    KeyFactory keyFactory = null;
    try {
        keyFactory = KeyFactory.getInstance("RSA");
    } catch (NoSuchAlgorithmException e) {
        e.printStackTrace();
    }
    try {
        privateKey = keyFactory.generatePrivate(keySpec);
    } catch (InvalidKeySpecException e) {
        e.printStackTrace();
    }
    return privateKey;
}
public static String decrypt(String data, String base64PrivateKey) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
    Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
    cipher.init(Cipher.DECRYPT_MODE, getPrivateKey(base64PrivateKey));
    return new String(cipher.doFinal(Base64.getDecoder().decode(data.trim().toString().getBytes())));
}

%>


<%
String from,message,priv="";
PrivateKey privateKey = null;
byte[] debytes=null,bytes=null;
PKCS8EncodedKeySpec keySpec=null;
KeyFactory keyFactory = null;
from=request.getParameter("from");
message=request.getParameter("message");

try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/securemail","root","");
Statement s=con.createStatement();
ResultSet rs=s.executeQuery("select privkey from mailer where mail='"+from+"'");
if (rs.next()){
priv= rs.getString(1);
}
decryptedString = decrypt(message,priv);
}
catch(Exception e){
e.printStackTrace();
}

%>
<div style="line-height: 200px;">
<p style="margin:auto; width: 50%;">Your Message is...<a href="home.jsp" >Close</a></p>
<p style="margin: auto;width: 50%;border: 3px solid black;padding: 10px;text-align:center;display: flex;justify-content: center;align-items: center;"><%= decryptedString %></p>
</div>
</body>
</html>