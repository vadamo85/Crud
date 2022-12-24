/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
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
//@WebServlet(name = "SociosController", urlPatterns = {"/SociosController"})

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
        try
            {
                sociosDAO=new SociosDAO();
            }
        catch (ClassNotFoundException e)
            {
               e.printStackTrace();     
            }        
        
        String accion;
        RequestDispatcher dispatcher=null;
        accion=request.getParameter("accion");
                
        if(accion==null||accion.isEmpty())
        {
            dispatcher=request.getRequestDispatcher("vistas/socios.jsp");
        }
        
        else if(accion.equals("modificar"))
        {
          dispatcher=request.getRequestDispatcher("vistas/modificar.jsp");
        }
        
        else if(accion.equals("actualizar"))
        {
          int idSocio=Integer.parseInt(request.getParameter("idSocio"));
          String nombre=request.getParameter("nombre");
          String apellido=request.getParameter("apellido");
          String direccion=request.getParameter("direccion");
          String localidad=request.getParameter("localidad");            
          LocalDate fecha =LocalDate.parse(request.getParameter("fnac"));                 
          String mail=request.getParameter("mail");
          String telefono=request.getParameter("telefono");                                    
          Socios s1=new Socios(idSocio,nombre,apellido,direccion,localidad,fecha,mail,telefono,true);
          sociosDAO.actualizarSocios(s1);
	  dispatcher=request.getRequestDispatcher("vistas/socios.jsp");	
        }
        
        else if(accion.equals("eliminar"))
        {
           int idSocio=Integer.parseInt(request.getParameter("idSocio"));
           sociosDAO.eliminarSocios(idSocio);
           dispatcher=request.getRequestDispatcher("vistas/socios.jsp");
        }        
        
        else if(accion.equals("nuevo"))
		{
			dispatcher=request.getRequestDispatcher("vistas/nuevo.jsp");
		}
		
        else if(accion.equals("insert"))
		{
	            String nombre=request.getParameter("nombre");
                    String apellido=request.getParameter("apellido");
                    String direccion=request.getParameter("direccion");
                    String localidad=request.getParameter("localidad");            
                    LocalDate fecha =LocalDate.parse(request.getParameter("fnac"));                 
                    String mail=request.getParameter("mail");
                    String telefono=request.getParameter("telefono");                                     
                    Socios s1=new Socios(0,nombre,apellido,direccion,localidad,fecha,mail,telefono,true);
		    sociosDAO.insertarSocios(s1);
	            dispatcher=request.getRequestDispatcher("vistas/socios.jsp");
		}
        
        dispatcher.forward(request,response);
    }
    
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        doGet(request,response);
    }

    @Override
    public String getServletInfo() 
    {
        return "Short description";
    }
}
    
