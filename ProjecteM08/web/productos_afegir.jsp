<%-- 
    Document   : productos_afegir
    Created on : 25-abr-2017, 18:33:47
    Author     : Narref
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Afegir joc</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="navbar_admin.jsp"/>
        <div class="container">
            <form method="POST" action="?accio=grabar">
                <div class="form-group">
                    <label for="nom">Nom: </label>
                    <input type="text" class="form-control" id="nom" name="nom" />
                </div>
                <div class="form-group">
                    <label for="precio">Precio: </label>
                    <input type="text" class="form-control" id="precio" name="precio" />
                </div>
                <div class="form-group">
                    <label for="url">Url: </label>
                    <input type="text" class="form-control" id="url" name="url" />
                </div>
                <!--<div class="checkbox">
                    <label><input type="checkbox"> Remember me</label>
                </div>-->
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
    </body>
</html>
