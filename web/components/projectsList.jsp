<%-- 
    Document   : projectsList
    Created on : Sep 1, 2018, 1:34:29 PM
    Author     : fernando
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    if (request.getParameter("projectsList") != null) {
        if (request.getParameter("friendProjectList") != null) {
%>
<div class="container">
    <h2>Proyectos de Mi Amigo</h2>
</div>
<div class="container"><br>
    <div class="row">
        <%
            try {

                Dba db = new Dba();
                String qry = "select projectId, projectName, projectDesc, "
                        + "createdAt, createdBy, updatedAt, username, firstname, lastname "
                        + "from vw_projects "
                        + "where createdBy = '" + request.getParameter("userid") + "'";
                db.conectar();
                db.query.execute(qry);
                ResultSet rsProjects = db.query.getResultSet();
                while (rsProjects.next()) {
        %>
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%=rsProjects.getString(2)%></h5>
                    <p class="card-text">Descripción: <%=rsProjects.getString(3)%></p>
                    <p class="card-text">Creado el: <%=rsProjects.getString(4)%></p>
                    <p class="card-text">Ultima modificación: <%=rsProjects.getString(6)%></p>
                    <p class="card-text">Por: <%=rsProjects.getString(7)%></p>
                    <a href="viewProject.jsp?projectId=<%=rsProjects.getString(1)%>" class="btn btn-primary">Ver Proyecto</a>
                </div>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println(e);
                request.getRequestDispatcher("home.jsp?message=501").forward(request, response);
            }
        %>
    </div>
</div>
<%
    }
//else {
%>
<br>
<div class="container">
    <h2>Mis Proyectos</h2>
</div>
<div class="container"><br>
    <div class="row">
        <%            try {

                Dba db = new Dba();
                String qry = "select projectId, projectName, projectDesc, "
                        + "createdAt, createdBy, updatedAt, username, firstname, lastname "
                        + "from vw_projects "
                        + "where createdBy = '" + session.getAttribute("s_userid") + "'";
                db.conectar();
                db.query.execute(qry);
                ResultSet rsProjects = db.query.getResultSet();
                while (rsProjects.next()) {
        %>
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%=rsProjects.getString(2)%></h5>
                    <p class="card-text">Descripción: <%=rsProjects.getString(3)%></p>
                    <p class="card-text">Creado el: <%=rsProjects.getString(4)%></p>
                    <p class="card-text">Ultima modificación: <%=rsProjects.getString(6)%></p>
                    <p class="card-text">Por: <%=rsProjects.getString(7)%></p>
                    <a href="viewProject.jsp?projectId=<%=rsProjects.getString(1)%>" class="btn btn-primary">Ver Proyecto</a>
                </div>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println(e);
                request.getRequestDispatcher("home.jsp?message=501").forward(request, response);
            }
        %>
    </div>
</div>
<%
//        }
    }
%>