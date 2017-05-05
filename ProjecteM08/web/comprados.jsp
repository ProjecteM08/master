<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Usuari"%>
<%@page import="model.Juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juegos Disponibles</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="container">
            <% String iduser = (String) request.getParameter("iduser");
                String idjuego = (String) request.getParameter("idjuego");
                Usuari user = (Usuari) request.getAttribute("user");
                Juego joc = (Juego) request.getAttribute("joc");
                
                if (user != null) {
            %>
            <div class="page-header">
                <h1>Gracias per utilitzar els nostres serveis!</h1>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <img class="form-group" src="<%=joc.getUrl()%>" height="100%" width="100%">
                </div>
                <div class="col-md-9">
                    <p>Hola <%=user.getNom()%>, has comprado:</p>
                    <p><%=joc.getNom()%></p>
                </div>
            </div>
            <p>Te quedan <%=user.getDinero()%> €</p>
            <a class="btn btn-success" href="ControladorCompras?accio=login">Continua comprant</a>
            <%
            } else {
            %>
            <jsp:forward page="ControladorCompras?accio=comprar&iduser=<%=iduser%>&idjuego=<%=idjuego%>"/>   
            <%
                }
            %>
        </div>
    </body>
</html>


