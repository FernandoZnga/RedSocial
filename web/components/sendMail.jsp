<%-- 
    Document   : index
    Created on : Sep 22, 2018, 8:09:35 AM
    Author     : fernando
--%>

<%@page import="java.util.Properties" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>-->
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sending and eMail</title>
    </head>
    <body onload="displayResult()">-->
<!--<h1>Sending An eMail</h1>-->
<%!
    public static class SMTPAuthenticator extends Authenticator {

        public PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication("fernando.ceutec", "ceutecceutec");
        }
    }
%>
<%
    int result = 0;
    if (request.getParameter("send") != null) {
        try {
            String d_uname = "fernando.ceutec";
            String d_password = "ceutecceutec";
            String d_host = "smtp.gmail.com";
            int d_port = 465;

            String m_to = new String();
            String m_from = "fernando.ceutec@gmail.com";
            String m_subject = new String();
            String m_text = new String();

            m_to = request.getParameter("email");
            m_subject = "Red Social - Proyecto App Web";
            m_text = "<h1>Bienvenido a la Aplicacion Web - Red Social -</h1><br/><br />";
            m_text = m_text.concat("Hola ");
            m_text = m_text.concat(request.getParameter("username"));
            m_text = m_text.concat("<br /><h2>Tu cuenta ha sido creada exitosamente!</h2>");

//                    if (request.getParameter("to") != null) {
//                        m_to = request.getParameter("to");
//                    }
//                    if (request.getParameter("subject") != null) {
//                        m_subject = request.getParameter("subject");
//                    }
//                    if (request.getParameter("message") != null) {
//                        m_text = "<h1>Bienvenido a la Aplicacion Web Red Social</h1><br/><br />";
//                        m_text = m_text.concat(request.getParameter("message"));
//                        m_text = m_text.concat("<br /><h2>Tu cuenta ha sido creada exitosamente!</h2>");
//                    }
//                    Properties object
            Properties props = new Properties();

//                    SMTP Authinticator object
            SMTPAuthenticator auth = new SMTPAuthenticator();

//                    Mail Session object
            Session ses = Session.getInstance(props, auth);

//                    MIME Style email message object
            MimeMessage msg = new MimeMessage(ses);
            msg.setContent(m_text, "text/html");
            msg.setSubject(m_subject);
            msg.setFrom(new InternetAddress(m_from));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(m_to));

            Transport transport = ses.getTransport("smtps");
            transport.connect(d_host, d_port, d_uname, d_password);
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();

            result = 1;

        } catch (Exception e) {
            out.println(e);
        }
    }
%>
<!--        <form name="myForm" action="index.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>To : </td>
                        <td><input type="email" name="to" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Subject : </td>
                        <td><input type="text" name="subject" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Message : </td>
                        <td><textarea name="message" rows="4" cols="50"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
            //<input type="hidden" name="hidden" value="<%= result%>" />
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Send" name="send" />
        </form>-->
<!--
        <script language="javascript">
            function displayResult() {
                if (document.myForm.hidden.value === "1") {
                    alert("Email enviado exitosmente!");
                }
            }
        </script>
    </body>
</html>-->
