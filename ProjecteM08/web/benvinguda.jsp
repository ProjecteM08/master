<%-- 
    Document   : benvinguda
    Created on : 04-abr-2017, 19:16:11
    Author     : montse
--%>

<%@page import="model.Usuari"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Benvinguda</title>
    </head>
    <body>
        <% Usuari user=(Usuari)request.getAttribute("user");
        if(user.getAdmin()=="T"){
         %>
         <h1>Hola admin</h1>
            <%  
        }else{
         %>
         
          <h1>Hola parguela</h1>
           <%    
        }
        

        %>
       
    </body>
</html>
