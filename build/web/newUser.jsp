<%@page import="database.Dba"%>
<%
    if (request.getParameter("btRegistro") != null) {
        try {
            Dba db = new Dba();
            String qry = "call pr_insert_user ('"
                    + request.getParameter("firstname") + "','"
                    + request.getParameter("lastname") + "','"
                    + request.getParameter("email") + "','"
                    + request.getParameter("username") + "','"
                    + request.getParameter("pass1") + "','"
                    + request.getParameter("country") +"','"
                    + request.getParameter("dob") + "')";
            db.conectar();
            db.query.execute(qry);
            db.desconectar();
            request.getRequestDispatcher("loginPage.jsp?message=200").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            request.getRequestDispatcher("loginPage.jsp?message=500").forward(request, response);
        }
    }
%>
