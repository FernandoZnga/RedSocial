<%-- 
    Document   : newUserPage
    Created on : Sep 19, 2018, 6:34:19 PM
    Author     : fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>Nuevo Usuario</title>
    </head>
    <body>
        <%
            if (request.getParameter("createUser") != null) {
        %>
        <jsp:include page="components/secure.jsp" />
        <jsp:include page="components/header.jsp" />
        <%
            }
        %>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <h4>Nuevo Usuario</h4>
                                    <p>(*) Campos requeridos</p>
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <form action="newUser.jsp" method="POST">
                                        <div class="form-group row">
                                            <label for="username" class="col-4 col-form-label">Usuario*</label> 
                                            <div class="col-6">
                                                <input id="username" name="username" placeholder="Usuario" class="form-control here text-uppercase" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="email" class="col-4 col-form-label">Email*</label> 
                                            <div class="col-6">
                                                <input id="email" name="email" placeholder="Email" required="required" class="form-control here" required="required" type="email">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="name" class="col-4 col-form-label">Primer Nombre*</label> 
                                            <div class="col-6">
                                                <input id="name" name="firstname" placeholder="Nombre" class="form-control here text-capitalize" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="lastname" class="col-4 col-form-label">Apellido*</label> 
                                            <div class="col-6">
                                                <input id="lastname" name="lastname" placeholder="Apellido" class="form-control here text-capitalize" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="dob" class="col-4 col-form-label">Fecha de Nacimiento:*</label>
                                            <div class="col-md-6">
                                                <input type="date" class="form-control" name="dob" id="dob" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="country" class="col-4 col-form-label">País*</label> 
                                            <div class="col-6">
                                                <select class="form-control text-capitalize" name="country" required id="country" onkeyup='checkCountry();'>
                                                    <option selected disabled>Seleccione una opción</option>
                                                    <option value="Honduras">Honduras</option>
                                                    <option value="Guatemala">Guatemala</option>
                                                    <option value="Nicaragua">Nicaragua</option>
                                                    <option value="El Salvador">El Salvador</option>
                                                    <option value="Costa Rica">Costa Rica</option>
                                                    <option value="Panama">Panama</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="pass1" class="col-4 col-form-label">Contraseña*</label> 
                                            <div class="col-6">
                                                <input id="pass1" name="pass1" placeholder="Contraseña" class="form-control here" required="required" type="password" onkeyup='checkPass();'>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="pass2" class="col-4 col-form-label">Confirme contraseña*</label>
                                            <div class="col-6">
                                                <input id="pass2" name="pass2" placeholder="Confirme contraseña" class="form-control here" required="required" type="password" onkeyup='checkPass();'>
                                                <span id='message'></span>
                                            </div>
                                        </div>
                                        <div class="form-group row" hidden>
                                            <label for="role" class="col-4 col-form-label">Role</label> 
                                            <div class="col-8">
                                                <select id="role" name="role" class="custom-select">
                                                    <option value="administrator">Administrator</option>
                                                    <option value="author">Author</option>
                                                    <option value="editor">Editor</option>
                                                    <option value="contributor">Contributor</option>
                                                </select>
                                            </div>
                                        </div> 
                                        <%
                                            if (request.getParameter("createUser") != null) {
                                        %>
                                        <div class="form-group row">
                                            <div class="offset-4 col-2">
                                                <button id="btCrear" name="btCrear" type="submit" class="btn btn-primary">Crear!</button>
                                            </div>

                                            <div class="offset-0 col-2">
                                                <a href="home.jsp?usersList=1">Cancelar</a>
                                            </div>
                                        </div>                                        
                                        <%
                                        } else {
                                        %>
                                        <div class="form-group row">
                                            <div class="offset-4 col-2">
                                                <button id="btRegistro" name="btRegistro" type="submit" class="btn btn-primary">Registro!</button>
                                            </div>

                                            <div class="offset-0 col-2">
                                                <a href="index.jsp">Cancelar</a>
                                            </div>
                                        </div>                                
                                        <%
                                            }
                                        %>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var checkPass = function () {
                if (document.getElementById('pass1').value ===
                        document.getElementById('pass2').value) {
                    if (document.getElementById('pass1').value !== "") {
                        document.getElementById('message').style.color = 'green';
                        document.getElementById('message').innerHTML = ' Concuerda';
                        document.getElementById('btRegistro').disabled = false;
                        document.getElementById('btCrear').disabled = false;
                    }
                } else {
                    document.getElementById('message').style.color = 'red';
                    document.getElementById('message').innerHTML = ' No concuerda';
                    document.getElementById('btRegistro').disabled = true;
                    document.getElementById('btCrear').disabled = true;
                }
            }

//            var checkCountry = function () {
//                if (document.getElementById('country').length === 0) {
//                    document.getElementById('btRegistro').disabled = true;
//                    document.getElementById('btCrear').disabled = true;
//                } else {
//                    document.getElementById('btRegistro').disabled = false;
//                    document.getElementById('btCrear').disabled = false;
//                }
//            }
            $('#country').on('change', function () {
                $('#send').prop('disabled', !$(this).val());
            }).trigger('change');
            
        </script>
    </body>
</html>
