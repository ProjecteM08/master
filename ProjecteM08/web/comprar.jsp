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
        <div class="container">
              <% Usuari user = (Usuari) request.getAttribute("user");%>
        <% List<Juego> juegos = (List<Juego>) request.getAttribute("juegos");%>


        Tu saldo: <%=user.getDinero()%>

        Lista de juegos:

        <%
            for (Juego joc : juegos) {
                %>
                <div class="form-group"><%=joc.getNom()%></div>
                <img class="form-group" src="<%=joc.getUrl()%>" height="250" width="250">
                <div class="form-group"><%=joc.getPrecio()%></div>
                <a href="/ProjecteM08/comprados.jsp?idjuego=<%=joc.getIdjuego()%>&iduser=<%=user.getIdusuaris()%>" class="btn btn-info" role="button">Comprar</a>

                <%
            }
        %>  
        </div>
    </body>
</html>


