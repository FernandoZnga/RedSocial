<%-- 
    Document   : adminUser
    Created on : Sep 2, 2018, 10:10:42 PM
    Author     : fernando
--%>

<%@page import="database.Dba"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<jsp:include page="components/header.jsp" />--%>
<%
    if (request.getParameter("btEditar") != null) {
        try {
            Dba db = new Dba();
            db.conectar();
            String qry;
            qry = "CALL pr_edit_user('"
                    + request.getParameter("firstname") + "','"
                    + request.getParameter("lastname") + "','"
                    + request.getParameter("email") + "','"
                    + request.getParameter("username") + "','"
                    + request.getParameter("country") + "','"
                    + request.getParameter("usertypeid") + "','"
                    + request.getParameter("userstatusid") + "','"
                    + request.getParameter("userid") + "')";
            db.query.execute(qry);
            if (request.getParameter("1password") != null) {
                qry = "CALL pr_update_userpassword('" + request.getParameter("userid") + "','" + request.getParameter("1password") + "')";
                db.query.execute(qry);
            }
            db.desconectar();
            request.getRequestDispatcher("home.jsp?usersList=1&message=205").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.print(e);
            request.getRequestDispatcher("home.jsp?usersList=1message=500").forward(request, response);
        }
    }

    if (request.getParameter("btEliminar") != null) {
        try {
            Dba db = new Dba();
            db.conectar();
            String qry;
            qry = "CALL pr_delete_user('"
                    + request.getParameter("userid") + "')";
            db.query.execute(qry);
            db.desconectar();
            request.getRequestDispatcher("home.jsp?usersList=1&message=204").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.print(e);
            request.getRequestDispatcher("home.jsp?usersList=1message=502").forward(request, response);
        }
    }
%>
