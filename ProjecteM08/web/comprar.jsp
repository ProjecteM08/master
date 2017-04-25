<%@page import="model.Usuari"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juegos Disponibles</title>
    </head>
    <body>
            <% Usuari user=(Usuari)request.getAttribute("user");%>
            
            Tu saldo: <%=user.getDinero()%>
            
            <table class="table">
                <thead>
                    <tr></tr>
                    <tr></tr>
                </thead>
                
                
            </table>
    </body>
</html>

         
        