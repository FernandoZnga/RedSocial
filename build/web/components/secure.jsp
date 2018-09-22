<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
//    out.println("hola");
    if (session.getAttribute("s_userid") != null) {
        try {
            Dba db = new Dba();
            db.conectar();
            String qry = "select fn_valid_token('"
                    + session.getAttribute("s_userid") + "') valid "
                    + "from dual";
            db.query.execute(qry);
            ResultSet rsToken = db.query.getResultSet();
            while (rsToken.next()) {
                if (rsToken.getString(1).equals("0")) {
                    db.desconectar();
                    request.getRequestDispatcher("../loginPage.jsp?message=504").forward(request, response);
                }
                break;
            }
            db.desconectar();
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            request.getRequestDispatcher("../loginPage.jsp?message=504").forward(request, response);
        }
    }

%>