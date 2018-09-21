<%-- 
    Document   : friendsList
    Created on : Sep 1, 2018, 2:42:45 PM
    Author     : fernando
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    if (request.getParameter("friendsList") != null) {
        try {
            Dba db = new Dba();
            db.conectar();
            String qry = "select a.uuid, a.firstname, a.lastname, a.email, a.createdAt usuario_desde, "
                    + "a.username, a.country, a.dateofbirth, b.createdAt amigos_desde, b.requestId friendRequest "
                    + "from (select * "
                    + "from users where uuid <> '" + session.getAttribute("s_userid") + "') a "
                    + "left join (select * "
                    + "from friends where user_a = '" + session.getAttribute("s_userid") + "') b "
                    + "on a.uuid = b.user_b "
                    + "where b.user_b is not null";
            db.query.execute(qry);
            ResultSet rs = db.query.getResultSet();
%>
<br>
<div class="container">
    <div class="row">
        <div class="card-deck">
            <%
                while (rs.next()) {
            %>
            <div class="col-sm-4">
                <div class="card">
                    <img class="card-img-top" src="https://robohash.org/<%=rs.getString(6)%>" alt="<%=rs.getString(2)%> <%=rs.getString(3)%>">
                    <div class="card-body">
                        <h5 class="card-title"><%=rs.getString(2)%> <%=rs.getString(3)%></h5>
                        <p class="card-text">Email: <%=rs.getString(4)%></p>
                        <p class="card-text">Fecha Nac. <%=rs.getString(8)%></p>
                        <p class="card-text">Pais: <%=rs.getString(7)%></p>
                        <p class="card-text"><small class="text-muted">Amigos desde <%=rs.getString(9)%></small></p>
                        <a class="btn btn-success btn-sm btn-block" href="home.jsp?projectsList=1&friendProjectList=1" role="button">Ver Proyectos</a>
                        <a class="btn btn-dark btn-sm btn-block" href="home.jsp?removeFriend=1&requestid=<%=rs.getString(10)%>" role="button">Un-friend</a>
                    </div>
                </div>
            </div>
            <%
                    }
                    db.desconectar();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(e);
                    //request.getRequestDispatcher("home.jsp?friendsList=1&message=502").forward(request, response);
                }
            %>
        </div>
    </div>
</div>
<%
    }
%>