/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Socios;
import modelo.SociosDAO;

/**
 *
 * @author Valelita
 */
public class SociosController extends HttpServlet 
{
    public SociosController()
            {
                super();
            
            }
    

    
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        SociosDAO sociosDAO=null;
        sociosDAO=new SociosDAO();
        
        String accion;
        accion=request.getParameter("accion");
        RequestDispatcher dispacher=null;
        
        if(accion==null||accion.isEmpty())
        {
            dispacher=request.getRequestDispatcher("vistas/socios.jsp");
        }
        
        else if(accion.equals("modificar"))
        {
          dispacher=request.getRequestDispatcher("vistas/modificar.jsp");
        }
        
        else if(accion.equals("actualizar"))
        {
          int id=Integer.parseInt(request.getParameter("id"));
          String nombre=request.getParameter("nombre");
          String apellido=request.getParameter("apellido");
          String direccion=request.getParameter("direccion");
          String localidad=request.getParameter("localidad");            
          LocalDate fecha =LocalDate.parse(request.getParameter("fnac"));                 
          String email=request.getParameter("mail");
          String telefono=request.getParameter("telefono");                                    
          Socios s1=new Socios(id,nombre,apellido,direccion,localidad,fecha,email,telefono,true);
          sociosDAO.actualizarSocios(s1);
	  dispacher=request.getRequestDispatcher("vistas/socios.jsp");	
        }
        
        else if(accion.equals("eliminar"))
        {
           int id=Integer.parseInt(request.getParameter("Id"));
           sociosDAO.eliminarSocios(id);
           dispacher=request.getRequestDispatcher("vistas/socios.jsp");
        }        
        
        else if(accion.equals("nuevo"))
		{
			dispacher=request.getRequestDispatcher("vistas/nuevo.jsp");
		}
		
        else if(accion.equals("insert"))
		{
	            String nombre=request.getParameter("nombre");
                    String apellido=request.getParameter("apellido");
                    String direccion=request.getParameter("direccion");
                    String localidad=request.getParameter("localidad");            
                    LocalDate fecha =LocalDate.parse(request.getParameter("fnac"));                 
                    String email=request.getParameter("mail");
                    String telefono=request.getParameter("telefono");                                     
                    Socios s1=new Socios(0,nombre,apellido,direccion,localidad,fecha,email,telefono,true);
		    sociosDAO.insertarSocios(s1);
	            dispacher=request.getRequestDispatcher("vistas/socios.jsp");
		}
        
        dispacher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        doGet(request,response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
