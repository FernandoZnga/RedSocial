<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    if (request.getParameter("addFriend") != null) {
        try {
            Dba db = new Dba();
            String qry;
            out.println("0");
            qry = "call pr_send_friendRequest ('"
                    + session.getAttribute("s_userid") + "','"
                    + request.getParameter("userid") + "')";
            out.println(qry);
            db.conectar();
            out.println("1");
            db.query.execute(qry);
            out.println("2");
            db.desconectar();
            out.println("3");
            out.println(request.getContextPath());
            request.getRequestDispatcher("home.jsp?projectsList=1&message=201").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            request.getRequestDispatcher("home.jsp?projectsList=1&message=500").forward(request, response);
        }
    }

    if (request.getParameter("acceptFriend") != null) {
        try {
            Dba db = new Dba();
            String qry;
            qry = "call pr_accept_friendRequest ('"
                    + request.getParameter("requestid") + "')";
            out.println(qry);
            db.conectar();
            db.query.execute(qry);
            db.desconectar();
            request.getRequestDispatcher("home.jsp?projectsList=1&message=202").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            request.getRequestDispatcher("home.jsp?projectsList=1&message=500").forward(request, response);
        }
    }
    if (request.getParameter("rejectFriend") != null) {
        try {
            Dba db = new Dba();
            String qry;
            qry = "call pr_reject_friendRequest ('"
                    + request.getParameter("requestid") + "')";
            out.println(qry);
            db.conectar();
            db.query.execute(qry);
            db.desconectar();
            request.getRequestDispatcher("home.jsp?projectsList=1&message=203").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            request.getRequestDispatcher("home.jsp?projectsList=1&message=500").forward(request, response);
        }
    }

    if (request.getParameter("removeFriend") != null) {
        try {
            Dba db = new Dba();
            String qry;
            qry = "call pr_remove_friend ('"
                    + request.getParameter("requestid") + "')";
            out.println(qry);
            db.conectar();
            db.query.execute(qry);
            db.desconectar();
            request.getRequestDispatcher("home.jsp?projectsList=1&message=204").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            request.getRequestDispatcher("home.jsp?projectsList=1&message=500").forward(request, response);
        }
    }
%>