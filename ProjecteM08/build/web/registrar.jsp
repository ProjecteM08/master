<%-- 
    Document   : registrar.jsp
    Author     : montse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="pagina_errors_usuaris.jsp" contentType="text/html" %>
<jsp:useBean id="usu" scope="request" class="model.Usuari" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nou usuari</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        
                <style>
            .wrapper {    
                margin-top: 80px;
                margin-bottom: 20px;
            }

            .form-signin {
                max-width: 420px;
                padding: 30px 38px 66px;
                margin: 0 auto;
                background-color: #eee;
                border: 3px dotted rgba(0,0,0,0.1);  
            }

            .form-signin-heading {
                text-align:center;
                margin-bottom: 30px;
            }

            .form-control {
                position: relative;
                font-size: 16px;
                height: auto;
                padding: 10px;
            }

            input[type="text"] {
                margin-bottom: 0px;
                border-bottom-left-radius: 0;
                border-bottom-right-radius: 0;
            }

            input[type="password"] {
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }

            .colorgraph {
                height: 7px;
                border-top: 0;
                background: #c4e17f;
                border-radius: 5px;
                background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
                background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
                background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
                background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            }
        </style>
    </head>
    <body>
        <jsp:setProperty name="usu" property="*" />
        <% if (request.getParameter("id") == null) {%>                                  
        <div class="wrapper">
                <form method="post" class="form-signin">       
                    <h3 class="form-signin-heading">Registre</h3>
                    <hr class="colorgraph"><br>

                    <input class="form-control" placeholder="Email/Id" name="id" type="text" size="20" required>
                    <input class="form-control" placeholder="Contrasenya" name="password" type="password" size="20" required>
                    <input class="form-control" placeholder="Nom" type="text" name="nom" size="40" required/>
                    <br/>
                    <button class="btn btn-lg btn-success btn-block" name="Submit" value="Login" type="Submit">Registrar</button>  			
                    <br/><a class="btn btn-success" href="/ProjecteM08">Tornar </a>
                </form>			
        </div>
        <!--<form method="post">
            <p> email o id <input name="id" type="text" size="20" required></p>
            <p> password <input name="password" type="password" size="20" required></p>
            <p> nom <input type ="text" name="nom" size="40" required/> </p>
            <input type="submit" name="Inserir" value="Nou usuari"> 
        </form>-->
        <%} else {%>
        <jsp:forward page="ControladorUsuaris?accio=registre"/>
        <%}%>
    </body>
</html>
