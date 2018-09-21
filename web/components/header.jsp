<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="home.jsp?projectsList=1">Red Social</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active" hidden>
                <a class="nav-link" href="home.jsp?projectsList=1">Home <span class="sr-only">(current)</span></a>
            </li>

            <%
                if (session.getAttribute("s_tipo").equals("ADMIN")) {
            %>
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Administracion
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="home.jsp?usersList=1">Listar Cuentas de Usuarios</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="newUserPage.jsp?createUser=1">Crear Usuario</a>
                </div>
            </li>
            <%
                }
            %>

            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Proyectos
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="home.jsp?projectsList=1">Mis Proyectos</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="addProjectPage.jsp">Agregar Nuevo</a>
                </div>
            </li>
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Amigos
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="home.jsp?friendsList=1">Mis Amigos</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="home.jsp?friendsToSearch=1">Buscar Amigo</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="home.jsp?friendsRequests=1">Solicitudes de Amistad</a>
                </div>
            </li>
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Mensajes
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Mis Mensajes</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Enviar Mensaje</a>
                </div>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="adminUserPage.jsp?unameid=<%=session.getAttribute("s_userid")%>&myAccount=1">Mi Cuenta [<%=session.getAttribute("s_username")%>]<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="loginPage.jsp?logout=1">Salir <span class="sr-only">(current)</span></a>
            </li>
        </ul>
    </div>
</nav>



<div class="container" hidden>
    <br> 
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</div>
<!-- .//container -->

