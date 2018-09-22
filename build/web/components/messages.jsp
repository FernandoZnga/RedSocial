<%
    if (request.getParameter("message") != null) {
//
// Seccion de mensajes exitosos
        if (request.getParameter("message").equals("200")) {
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Exito!</strong> Usuario creado exitosamente.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
        if (request.getParameter("message").equals("201")) {
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Exito!</strong> Solicitud de amistad enviada.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
        if (request.getParameter("message").equals("202")) {
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Exito!</strong> Solicitud de amistad aceptada.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
        if (request.getParameter("message").equals("203")) {
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Exito!</strong> Solicitud de amistad rechazada.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
        if (request.getParameter("message").equals("204")) {
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Exito!</strong> Amigo removido.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
        if (request.getParameter("message").equals("205")) {
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Exito!</strong> Datos de usuario actualizados.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
        if (request.getParameter("message").equals("206")) {
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Exito!</strong> Proyecto creado.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
//
// Seccion de errores
    if (request.getParameter("message").equals("500")) {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Error!</strong> Contacte a su administrador.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        }
    if (request.getParameter("message").equals("501")) {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Error!</strong> Usuario o contraseña incorrectos.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        }
    if (request.getParameter("message").equals("502")) {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Error!</strong> Usuario inactivo, contacto su administrador.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        }
    if (request.getParameter("message").equals("503")) {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Error!</strong> Al hacer logout algo ocurrió mal.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        }
    if (request.getParameter("message").equals("504")) {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Error!</strong> No tienes una sesión activa.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        }
    if (request.getParameter("message").equals("505")) {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Error!</strong> Usuario ya existe.
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        }
    }
%>