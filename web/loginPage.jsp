<%-- 
    Document   : login
    Created on : Sep 19, 2018, 6:31:13 PM
    Author     : fernando
--%>

<%@page import="database.Dba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <jsp:include page="components/logout.jsp" />
        <jsp:include page="components/messages.jsp" />


        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Login</h1>
                    <div class="account-wall">
                        <form action="login.jsp" class="form-signin" method="POST">
                            <input name="username" type="text" class="form-control text-uppercase" placeholder="Usuario" required autofocus>
                            <br>
                            <input name="password" type="password" class="form-control" placeholder="Contraseña" required>
                            <br>
                            <button class="btn btn-lg btn-primary btn-block" type="submit" name="btLogin" id="btLogin">Login</button>
                        </form>
                    </div>
                    <a href="newUserPage.jsp" class="text-center new-account">No tienes cuenta? </a>
                </div>
            </div>
        </div>
        <% //out.println(session.getAttribute("s_userid"));%>
    </body>
</html>
