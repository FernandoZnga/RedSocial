        <%@page import="database.Dba"%>
<%
            if (request.getParameter("logout") != null) {
                try {
                    Dba db = new Dba();
                    String qry = "call pr_logout('" + session.getAttribute("s_userid") + "')";
                    db.conectar();
                    db.query.execute(qry);
                    db.desconectar();
                    session.setAttribute("s_userid", "");
                    session.setAttribute("s_username", "");
                    session.setAttribute("s_status", "");
                    session.setAttribute("s_tipo", "");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println(e);
                    request.getRequestDispatcher("../loginPage.jsp?message=503").forward(request, response);
                }
            }
        %>     