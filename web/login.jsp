<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dba"%>
<%
//request.setAttribute("password",hex_md5(request.getParameter('password')));
    if (request.getParameter("btLogin") != null) {
        try {
            Dba db = new Dba();
            String qry = "select fn_valid_user_pass ('"
                    + request.getParameter("username").toUpperCase()
                    + "','" + request.getParameter("password") + "') valid "
                    //                    + "','" + request.getParameter("password") + "') valid "
                    + "from dual";
            db.conectar();
            db.query.execute(qry);
            ResultSet rsLogin = db.query.getResultSet();
            while (rsLogin.next()) {
                if (rsLogin.getString(1).equals("1")) {
                    qry = "select userid, nombre, apellido, email, "
                            + "fecha_creacion, username, status, "
                            + "idstatus, tipo, idtipo "
                            + "from vw_user_info where username = '" + request.getParameter("username").toUpperCase() + "'";
                    db.query.execute(qry);
                    ResultSet rsUserInfo = db.query.getResultSet();
                    while (rsUserInfo.next()) {
                        session.setAttribute("s_userid", rsUserInfo.getString(1));
                        session.setAttribute("s_username", rsUserInfo.getString(6));
                        session.setAttribute("s_status", rsUserInfo.getString(7));
                        session.setAttribute("s_tipo", rsUserInfo.getString(9));
                        break;
                    }
                    break;
                } else {
                    request.getRequestDispatcher("loginPage.jsp?message=501").forward(request, response);
                }
            }
//            db.desconectar();
            out.println(session.getAttribute("s_userid"));
            out.println(session.getAttribute("s_username"));
            out.println(session.getAttribute("s_status"));
            out.println(session.getAttribute("s_tipo"));

            if (session.getAttribute("s_status").equals("ACTIVO")) {
                db.query.execute("call pr_insert_token('" + session.getAttribute("s_userid") + "')");
                db.desconectar();
                request.getRequestDispatcher("home.jsp?projectsList=1").forward(request, response);
            } else {
                db.desconectar();
                request.getRequestDispatcher("loginPage.jsp?message=502").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            request.getRequestDispatcher("loginPage.jsp?message=500").forward(request, response);
        }
    }
%>