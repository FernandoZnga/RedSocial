<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
    <head>
        <!--JS para usar el treeView-->
        <script type="text/javascript" src="TREE/dtree.js"></script>	
        <link rel="StyleSheet" href="TREE/dtree.css" type="text/css" />	

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"></link>

        <meta charset="UTF-8"></meta>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>

        <script type="text/javascript" src="js/jquery-1.12.0.js"></script>
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>-->
        <script type="text/javascript" src="js/editor.js"></script>

        <link rel="stylesheet" type="text/css" href="css/editor.css"></link>
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"></link>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#txt-content').Editor();
                $('#btn-enviar').click(function (e) {
                    e.preventDefault();
                    var texto = $('#txt-content').Editor('getText');
                    $('#texto').html(texto);
                });
            });
        </script>
    </head>
    <body>
        <jsp:include page="components/secure.jsp" />
        <jsp:include page="components/header.jsp" />
        <br></br>
        <div class="container-fluid">
            <form name="formUpdateFile" method="POST">

                <div class="row">
                    <div class="col-lg-2">
                        <div class="dtree">
                            <p><a class="btn btn-outline-primary btn-sm" href="javascript: d.openAll();" role="button">Expandir</a> | <a class="btn btn-outline-primary btn-sm" href="javascript: d.closeAll();" role="button">Colapsar</a>
                                <!--<a href="javascript: d.openAll();">Expandir</a> | <a href="javascript: d.closeAll();">Colapsar</a></p>-->
                                <script type="text/javascript">
                                    d = new dTree('d');
                                    //                                    ejemplo 01
                                    //                                    d.add(0, -1, 'Mi Ejemplo TREE');
                                    //                                    d.add(1, 0, 'Nodo 1', 'viewProject.jsp?valor=nodo1');
                                    //                                    d.add(2, 0, 'Nodo 2', 'viewProject.jsp?valor=nodo2');
                                    //                                    d.add(3, 1, 'Nodo 1.1', 'viewProject.jsp?valor=nodo1.1');
                                    //                                    d.add(4, 0, 'Nodo 3', 'viewProject.jsp?valor=nodo3');
                                    //                                    d.add(5, 3, 'Nodo 1.1.1', 'viewProject.jsp?valor=nodo1.1.1');
                                    //                                    d.add(6, 5, 'Nodo 1.1.1.1', 'viewProject.jsp?valor=nodo1.1.1.1');
                                    //                                    d.add(7, 0, 'Nodo 4', 'viewProject.jsp?valor=nodo4');
                                    //                                    d.add(8, 1, 'Nodo 1.2', 'viewProject.jsp?valor=nodo1.2');
                                    //                                    d.add(9, 0, 'My Pictures', 'viewProject.jsp?valor=My pictures', 'Fotos', '', '', 'TREE/img/imgfolder.gif');
                                    //                                    d.add(10, 9, 'Viaje a USA', 'viewProject.jsp?valor=viaje', 'Recuerdos');
                                    //                                    d.add(11, 9, 'Cumpleanios', 'viewProject.jsp?valor=cumpleanios');
                                    //                                    d.add(12, 0, 'Papelera', 'viewProject.jsp?valor=papelera', '', '', 'TREE/img/trash.gif');
                                    //                                    ejemplo 02

                                    d.add(0, -1, "nombre del proyecto");
                                    d.add(1, 0, "css", 'viewProject.jsp?valor=css');
                                    d.add(2, 0, "index.html", 'viewProject.jsp?valor=index.html');
                                    d.add(3, 1, "main.css", 'viewProject.jsp?valor=main.css');
                                    d.add(4, 1, "bootstrap.css", 'viewProject.jsp?valor=bootstrap.css');
                                    document.write(d);
                                </script>
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <!--                    <h1><label id="datos">Bienvenidos</label></h1>-->
                        <div class="col-md-12">
                            <a href="viewProject.jsp" class="btn btn-primary">Editar Proyecto</a>
                            <br></br>
                            <h2><label for="readme" id="datos"></label></h2>
                            <textarea id="txt-content" class="form-control" name="txt-content"></textarea>

                        </div>
                    </div>

                </div>
            </form>
        </div>
        <script type="text/javascript">
            document.getElementById("datos").innerHTML = GetAtributo('valor');
        </script>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>