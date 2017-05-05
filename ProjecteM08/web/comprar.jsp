<%@page import="java.util.ArrayList"%>
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
            <%
                Usuari user = new Usuari();
                if (request.getSession().getAttribute("user") != null) {
                    user = (Usuari) request.getSession().getAttribute("user");
                }

                if (request.getAttribute("user") != null) {
                    user = (Usuari) request.getAttribute("user");
                }

                List<Juego> juegos = new ArrayList<Juego>();
                if (request.getAttribute("juegos") != null) {
                    juegos = (List<Juego>) request.getAttribute("juegos");
                }
            %>
            <div class="page-header">
                <h1>Videojocs</h1>
            </div>
            <h4>Saldo disponible: <%=user.getDinero()%> €</h4>
            <%
                for (int i = 0; i < juegos.size(); i++) {
                    Juego joc = juegos.get(i);
                    if (i == 0) {
            %>
            <div class="row">
                <%
                    }
                %>
                <div class="col-xs-4">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <p><%=joc.getNom()%></p>
                            <img src="<%=joc.getUrl()%>" height="300" width="100%">
                            <h5><%=joc.getPrecio()%> €</h5>
                            <a  class="btn btn-info" role="button" href="/ProjecteM08/comprados.jsp?idjuego=<%=joc.getIdjuego()%>&iduser=<%=user.getIdusuaris()%>">Comprar</a>
                        </div>
                    </div>
                </div>
                <%
                    if ((i + 1) % 3 == 0) {
                %>
            </div>
            <div class="row">
                <%
                        }
                    }
                %> 
            </div>

        </div>
    </body>
</html>


