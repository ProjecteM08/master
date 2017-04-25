<%-- 
    Document   : login
    Created on : 04-abr-2017, 17:41:12
    Author     : montse
--%>


<%@page errorPage="pagina_errors_usuaris.jsp" contentType="text/html" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="usu" scope="request" class="model.Usuari" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entrada al sistema</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1> Entrada al sistema </h1>
        <jsp:setProperty name="usu" property="*" />
        <% if (request.getParameter("nom") == null) { %>
        <form method="post">
            nom<input type="text" name="nom" size="20" required/><br/>
            password    <input type="password" name="password" size="20"  required/> <br/>
            <input type="submit" value="Entrar"/>
        </form>
        <!-- s'hauria de controlar amb javascript que el formulari no pot ser buit-->
        <% } else {%>
        
        <jsp:forward page="ControladorUsuaris?accio=login"/>   

        <%  }
        %>
        Si és la primera vegada, <a href="registrar.jsp">registra't </a>
    </body>
</html>

