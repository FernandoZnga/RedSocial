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
            qry = "SELECT * FROM vw_user_info order by 3, 2";
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
                    <th scope="col">Apellido</th>
                    <th scope="col">Nombre</th>
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
                    <td class="text-capitalize"><%=rs.getString(3)%></td>
                    <td class="text-capitalize"><%=rs.getString(2)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(11)%></td>
                    <td><%=rs.getString(12)%></td>
                    <td><%=rs.getString(9)%></td>
                    <td><%=rs.getString(7)%></td>
                    <%
                        if (session.getAttribute("s_userid").equals(rs.getString(1))) {
                    %>
                    <td><a class="btn btn-outline-info btn-sm" href="adminUserPage.jsp?editUser=1&userid=<%=rs.getString(1)%>" hidden role="button">Editar</a></td>
                    <%
                    } else {
                    %>
                    <td><a class="btn btn-outline-info btn-sm" href="adminUserPage.jsp?editUser=1&userid=<%=rs.getString(1)%>" role="button">Editar</a></td>

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
            request.getRequestDispatcher("home.jsp?projectsList=1&message=500").forward(request, response);
        }
    }
%>