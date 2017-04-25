<%@page import="model.Usuari"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Benvinguda</title>
    </head>
    <body>
        <% Usuari user=(Usuari)request.getAttribute("user");%>
     
        <%
        if(user.getAdmin().equals("T")){
         %>
            <jsp:forward page="ControladorProductos"/> 
            <%  
        }else{
         %>
            <jsp:setProperty name="romerito" property="*" />
             <form method="post">
            nom<input type="text" name="nombre" size="20" required/><br/>
            password    <input type="password" name="apellido" size="20"  required/> <br/>
            <input type="submit" value="Entrar"/>
        </form>
          <jsp:forward page="ControladorCompras?accio=login"/> 
           <%    
        }
        

        %>
       
        
        
    </body>
</html>

         
        