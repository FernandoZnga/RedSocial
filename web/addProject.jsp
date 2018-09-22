<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
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
            qry = "select projectId from vw_projects "
                    + "where createdAt = (select max(createdAt) "
                    + "from vw_projects "
                    + "where createdBy = '" + session.getAttribute("s_userid") + "')";
            db.query.execute(qry);
            ResultSet rs = db.query.getResultSet();
            while (rs.next()) {
                request.setAttribute("projectId", rs.getString(1));
            }
            db.desconectar();

            String path = "/Users/fernando/Desktop/" 
                    + session.getAttribute("s_username") 
                    + "/" + request.getAttribute("projectId");
            out.println(path);
            File f = new File(path);
            if (!f.exists()) {
                if (f.mkdirs()) {
                }
            }
            String file = path + "/Readme.md";
            FileWriter txtFile = new FileWriter(file, true);

            txtFile.write(request.getParameter("txt-content"));
            txtFile.close();

            //txtFile.write("<br>");
            //txtFile.write("<img src=\"" + application.getContextPath() + "/" + "Readme.md\"><br>");
            //txt_file.write(request.getParameter("txt-content"));
            //txt_file.write("<a href=\"" + application.getContextPath() + "/" + fichero.getName() + "\">" + link + "</");
            //txt_file.close();
            //request.getRequestDispatcher("home.jsp?projectsList=1&message=206").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println(e);
            //request.getRequestDispatcher("home.jsp?projectsList=1&message=500").forward(request, response);
        }
    }
%>