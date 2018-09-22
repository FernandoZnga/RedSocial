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
                    + request.getParameter("country") + "','"
                    + request.getParameter("dob") + "')";
            db.conectar();
            out.println(qry);
            db.query.execute(qry);
            db.desconectar();
%>
<jsp:include page="components/sendMail.jsp" />
<%
            request.getRequestDispatcher("loginPage.jsp?message=200").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            request.getRequestDispatcher("loginPage.jsp?message=505").forward(request, response);
        }
    }
    if (request.getParameter("btCrear") != null) {
        try {
            Dba db = new Dba();
            String qry = "call pr_insert_user ('"
                    + request.getParameter("firstname") + "','"
                    + request.getParameter("lastname") + "','"
                    + request.getParameter("email") + "','"
                    + request.getParameter("username") + "','"
                    + request.getParameter("pass1") + "','"
                    + request.getParameter("country") + "','"
                    + request.getParameter("dob") + "')";
            db.conectar();
            out.println(qry);
            db.query.execute(qry);
            db.desconectar();
%>
<jsp:include page="components/sendMail.jsp" />
<%
            request.getRequestDispatcher("home.jsp?usersList=1&message=200").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            request.getRequestDispatcher("home.jsp?usersList=1&message=505").forward(request, response);
        }
    }
%>
