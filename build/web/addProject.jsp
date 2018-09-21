<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    if (request.getParameter("btAgregarProject") != null) {
        try {
            Dba db = new Dba();
            String qry = "call pr_insert_project('"
                    + session.getAttribute("s_userid") + "','"
                    + request.getParameter("projectName") + "','"
                    + request.getParameter("description") + "')";
            db.conectar();
            db.query.execute(qry);
            db.desconectar();
            request.getRequestDispatcher("home.jsp?projectsList=1&message=201").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            request.getRequestDispatcher("home.jsp?projectsList=1&message=500").forward(request, response);
        }
    }
%>