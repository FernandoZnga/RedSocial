<%-- 
    Document   : usersList
    Created on : Sep 2, 2018, 1:11:48 AM
    Author     : fernando
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    if (request.getParameter("usersList") != null) {
        try {
            int row_number = 1;
            Dba db = new Dba();
            db.conectar();
            String qry;
            qry = "SELECT * FROM vw_users";
            db.query.execute(qry);
            ResultSet rs = db.query.getResultSet();
%>
<div class="container">
    <h2>Lista de Usuarios del Sistema</h2>
</div>
<div class="container-fluid">
    <div class="">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Fila</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                    <th scope="col">Usuario</th>
                    <th scope="col">Email</th>
                    <th scope="col">País</th>
                    <th scope="col">Fecha de Nacimiento</th>
                    <th scope="col">Tipo Usuario</th>
                    <th scope="col">Status Usuario</th>
                    <th scope="col">Acción</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <th scope="row"><%out.print(row_number++);%></th>
                    <td class="text-capitalize"><%=rs.getString(4)%></td>
                    <td class="text-capitalize"><%=rs.getString(5)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(8)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td><%=rs.getString(13)%></td>
                    <td><%=rs.getString(11)%></td>
                    <%
                        if (session.getAttribute("s_username").equals(rs.getString(2))) {
                    %>
                    <td><a class="btn btn-outline-info btn-sm" href="adminUserPage.jsp?unameid=<%=rs.getString(1)%>&country=<%=rs.getString(8)%>&ustatusid=<%=rs.getString(10)%>&utypeid=<%=rs.getString(12)%>" hidden role="button">Editar</a></td>
                    <%
                    } else {
                    %>
                    <!--<td><a class="btn btn-outline-info btn-sm" href="adminUserPage.jsp?unameid=<%=rs.getString(1)%>&country=<%=rs.getString(8)%>&ustatusid=<%=rs.getString(10)%>&utypeid=<%=rs.getString(12)%>" role="button">Editar</a></td>-->
                    <td><a class="btn btn-outline-info btn-sm" href="adminUserPage.jsp?unameid=<%=rs.getString(1)%>" role="button">Editar</a></td>

                    <%
                        }
                    %>
                </tr>
                <%
                    }
                    db.desconectar();
                %>
            </tbody>
        </table>
    </div>
</div>
<%
        } catch (Exception e) {
            e.printStackTrace();
            out.print(e);
            request.getRequestDispatcher("home.jsp?usersList=1&message=502").forward(request, response);
        }
    }
%>