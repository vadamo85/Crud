<%-- 
    Document   : modificar
    Created on : 14 dic 2022, 00:27:05
    Author     : Valelita
--%>

<%@page import="modelo.SociosDAO"%>
<%@page import="modelo.Socios"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modificar datos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Bangers&family=Clicker+Script&family=Fredericka+the+Great&family=Rubik+Vinyl&family=Unbounded:wght@900&display=swap" rel="stylesheet">
    </head>
    <body>
        <!-- Barra de navegación -->
        <nav class="navbar navbar-expand-lg" style="background-color: lightskyblue;">
             <div class="container">
                 <a style="color: white !important; font-family: 'Rubik Vinyl', cursive; font-size: 35px"><b>SportsYeah!</b></a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <ul class="navbar-nav"> 
                      <li class="nav-item">
                          <a class="nav-link active nav-linkactive" aria-current="page" style="color:white");" href="C:\Users\Valelita\Documents\NetBeansProyects\Crud\src\main\webapp\vistas\index.html">Inicio</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link active nav-linkactive" aria-current="page" style="color:white");" href="C:\Users\Valelita\Documents\NetBeansProyects\Crud\src\main\webapp\vistas\nuevo.jsp">Hacete Socio</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link active nav-linkactive" aria-current="page" style="color:white";" href="C:\Users\Valelita\Documents\NetBeansProyects\Crud\src\main\webapp\vistas\modificar.jsp">Modificá tus datos</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link active nav-linkactive" aria-current="page" style="color:white");" href="C:\Users\Valelita\Documents\NetBeansProyects\Crud\src\main\webapp\vistas\socios.jsp">Listado de socios</a>
                      </li>
                    </ul>
                  </div>
             </div>
          </nav>
  <br>
  <!-- Modificar socio -->
        <div class="container">
            <br>
            <h1 class="text-center" style="font-family: 'Unbounded', cursive;">Modificá tus datos</h1>
            <br>
            <h4 class="text-center"> Si te mudaste, usas otro mail o cambiaste el celu; actualizá tus datos acá así estamos siempre en contacto. </h4>
            <div class="row">
                
                <%
                    String idSocio=request.getParameter("idSocio");
                    int mid;
                    mid=Integer.parseInt(idSocio);
                    Socios resultado=null;
                    SociosDAO socio=new SociosDAO();
                    resultado=socio.mostrarSocio(mid);
                %>
                
                <form class="p-5" method="post" action="SociosController?accion=actualizar">
                    <div class="mb-3">
                        <label for="idSocio" class="form-label">Número de Socio</label>
                        <input type="text" class="form-control" name="idSocio" readonly="true" value=<%=resultado.getIdSocio()%> id="idSocio" required placeholder="Ej: 25">
                        <br>
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" name="nombre" value=<%=resultado.getNombre()%> id="nombre" required placeholder="Ej: Juan">
                        <br>
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="text" class="form-control" name="apellido" value=<%=resultado.getApellido()%> id="apellido" required placeholder="Ej: Pérez">
                        <br>
                        <label for="direccion" class="form-label">Dirección</label>
                        <input type="text" class="form-control" name="direccion" value=<%=resultado.getDireccion()%> id="direccion"placeholder="Ej: Córdoba 2358">
                        <br>
                        <label for="localidad" class="form-label">Localidad</label>
                        <input type="text" class="form-control" name="localidad" value=<%=resultado.getLocalidad()%> id="localidad" placeholder="Ej: Quilmes">
                        <br>
                        <label for="fnac" class="form-label">Fecha de Nacimiento</label>
                        <input type="date" class="form-control" name="fnac" value=<%=resultado.getFnac()%> id="fnac">
                        <br>
                        <label for="mail" class="form-label">E-Mail</label>
                        <input type="email" class="form-control" name="mail" value=<%=resultado.getMail()%> id="mail" required placeholder="Ej: jperez@gm.com">
                        <br>
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="text" class="form-control" name="telefono" value=<%=resultado.getTelefono()%> id="telefono" required placeholder="Ej: 23568974">
                        <br>
                    </div> 
                    <div class="row container justify-content-center">
                        <button type="submit" class="btn btn-primary col-md-5">¡Actualizar mis datos ahora!</button>
                    </div> 
                </form>
            </div>
        </div>
   <!-- Footer -->
  <nav class="navbar navbar-expand-lg" id="footer" style="background-color: lightskyblue;">
    <div class="container container-fluid">
       <div class="collapse navbar-collapse justify-content-lg-center" id="navbarSupportedContent">
           <ul class="navbar-nav"> 
             <li class="nav-item">
               <a class="nav-link active nav-linkactive" aria-current="page" style="color: white;"  href="#">Preguntas frecuentes</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" style="color: white !important;" id="letrasf" href="#">Contáctanos</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" aria-current="page" style="color: white !important;" id="letrasf" href="#">Prensa</a>
             </li>
           </ul>
         </div>
    </div>
 </nav>
    </body>
</html>

