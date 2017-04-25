<%-- 
    Document   : productos_afegir
    Created on : 25-abr-2017, 18:33:47
    Author     : Narref
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="juego" scope="request" class="model.Juego" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Afegir joc</title>
    </head>
    <body>
        <div class="container">
            <jsp:setProperty name="juego" property="*" />
            <form method="post" action="?accio=grabar">
                <div class="form-group">
                    <label for="nom">Nom: </label>
                    <input type="text" class="form-control" id="nom" />
                </div>
                <div class="form-group">
                    <label for="precio">Precio: </label>
                    <input type="text" class="form-control" id="precio" />
                </div>
                <div class="form-group">
                    <label for="url">Url: </label>
                    <input type="text" class="form-control" id="url" />
                </div>
                <!--<div class="checkbox">
                    <label><input type="checkbox"> Remember me</label>
                </div>-->
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
    </body>
</html>
