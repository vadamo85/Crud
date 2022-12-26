<%-- 
    Document   : socios
    Created on : 14 dic 2022, 00:23:36
    Author     : Valelita
--%>

<%@page import="modelo.SociosDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Socios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gym - Listado de Socios</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/f3515bef66.js" crossorigin="anonymous"></script>
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
                          <a class="nav-link active nav-linkactive" aria-current="page" style="color:white");" href="C:\Users\Valelita\Documents\NetBeansProyects\Crud\src\main\webapp\vistas\socio.jsp">Listado de socios</a>
                      </li>
                    </ul>
                  </div>
             </div>
          </nav>
  <br>
          <div class="container">
             <h1 class="text-center" style="font-family: 'Unbounded', cursive;">Listado de Socios</h1>
            <br>
            <div class="row">
                <table class="table table-primary table-striped"> 
                    <thead>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Dirección</th>
                        <th>Localidad</th>
                        <th>Fecha de nacimiento</th>
                        <th>Mail</th>
                        <th>Teléfono</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                    </thead>
                    
                    <%
                        List<Socios> resultado=null;
                        SociosDAO s1=new SociosDAO();
                        resultado=s1.listarSocios();
                        
                        for(int i=0;i<resultado.size();i++)
                        {
                        String ruta="SociosController?accion=modificar&idSocio="+resultado.get(i).getIdSocio();
                        String rutaE="SociosController?accion=eliminar&idSocio="+resultado.get(i).getIdSocio();
                        String rutaA="SociosController?accion=insertar&idSocio="+resultado.get(i).getIdSocio();
                    %>
                    
                    <tr>
                        <td><%=resultado.get(i).getIdSocio()%></td>
                        <td><%=resultado.get(i).getNombre()%></td>
                        <td><%=resultado.get(i).getApellido()%></td>
                        <td><%=resultado.get(i).getDireccion()%></td>
                        <td><%=resultado.get(i).getLocalidad()%></td>
                        <td><%=resultado.get(i).getFnac()%></td>
                        <td><%=resultado.get(i).getTelefono()%></td>
                        <td><%=resultado.get(i).getMail()%></td>
                        <td><a href=<%=ruta%>><i class="fa-sharp fa-solid fa-pencil"></i></a></td>
                        <td><a href=<%=rutaE%>><i class="fa-sharp fa-solid fa-trash-can"></i></a></td>
                    </tr>
                    <%
                    }
                    %>
                </table>
                <br>
                <div class="row container-fluid justify-content-center">
                    <a href="SociosController?accion=nuevo"><input type="button" class="btn btn-primary col-md-5" value="Agregar Socio"></a>
                    </div> 
                    
                    
            </div>
            
        </div>
  <br>
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
