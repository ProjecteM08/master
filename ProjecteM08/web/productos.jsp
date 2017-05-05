<%-- 
    Document   : productos
    Created on : 25-abr-2017, 18:31:35
    Author     : Narref
--%>

<%@page import="java.util.List"%>
<%@page import="model.Juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productes</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="navbar_admin.jsp"/>
        <div class="container">
            <h1>Productes</h1>
            <table class="table table-responsive table-hover">
                <thead>
                    <tr>
                        <th>Imatge</th>
                        <th>Nom</th>
                        <th>Preu</th>
                        <th>Accions</th>
                    </tr>
                </thead>
                <tbody>
            <%
            List<Juego> juegos = (List<Juego>) request.getAttribute("juegos");
            for (Juego joc : juegos) {
            %>
                <!--<div class="row">
                    <div class="col-md-3">
                        <img class="img-responsive" src="<%=joc.getUrl()%>" height="250" width="250">
                    </div>
                    <div class="col-md-6">
                        <h2><%=joc.getNom()%></h2>
                    </div>
                </div>-->
                <tr>
                    <td><img class="img-responsive" src="<%=joc.getUrl()%>" height="250" width="250" /></td>
                    <td><h2><%=joc.getNom()%></h2></td>
                    <td><h2><%=joc.getPrecio()%> €</h2></td>
                    <td><a class="btn btn-danger" href="productos?accio=eliminar&id=<%=joc.getIdjuego()%>">Eliminar</a></td>
                </tr>
            <%
            }
            %>
                </tbody>
            </table>
            <br/>
        <div class="row">
            <div class="col-md-3">
                <a class="btn btn-success" href="productos?accio=anadir">Afegir joc</a>
            </div>
        </div>
        </div>
    </body>
</html>
