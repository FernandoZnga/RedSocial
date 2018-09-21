<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
    if (request.getParameter("addFriend") != null) {
        try {
            Dba db = new Dba();
            String qry;
            qry = "call pr_send_friendRequest ('"
                    + session.getAttribute("s_userid") + "','"
                    + request.getParameter("userid") + "')";
            out.println(qry);
            db.conectar();
            db.query.execute(qry);
            db.desconectar();
            request.getRequestDispatcher("../home.jsp?friendsToSearch=1&message=201").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            request.getRequestDispatcher("../home.jsp?friendsToSearch=1&message=500").forward(request, response);
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
            request.getRequestDispatcher("../home.jsp?friendsRequests=1&message=202").forward(request, response);
        } catch (Exception e) {
            out.println(3);
            request.getRequestDispatcher("../home.jsp?friendsRequests=1&message=500").forward(request, response);
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
            request.getRequestDispatcher("../home.jsp?friendsList=1&message=204").forward(request, response);
        } catch (Exception e) {
            out.println(3);
            request.getRequestDispatcher("../home.jsp?friendsList=1&message=500").forward(request, response);
        }
    }
%>