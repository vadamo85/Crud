/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Valelita
 */
public class SociosDAO 
{
    Connection conexion;
    
    public SociosDAO () throws ClassNotFoundException
    {
       Conexion con=new Conexion(); 
       conexion=con.getConnection();
    }
    
    public List<Socios> listarSocios()
    {
        PreparedStatement ps;
        ResultSet rs;
        List<Socios> lista=new ArrayList<>();
        
        try
        {
           ps=conexion.prepareStatement("select * from socios");
           rs=ps.executeQuery(); 
           
           while(rs.next())
           {
               int idSocio=rs.getInt("idSocio");
               String nombre=rs.getString("nombre");
               String apellido=rs.getString("apellido");
               String direccion=rs.getString("direccion");
               String localidad=rs.getString("localidad");
               LocalDate fnac=rs.getDate("fnac").toLocalDate();
               String mail=rs.getString("mail");
               String telefono=rs.getString("telefono");
               boolean activo=rs.getBoolean("activo");
               
               Socios s1=new Socios(idSocio,nombre,apellido,direccion,localidad,fnac,mail,telefono,activo);
               lista.add(s1);
           }
          
        }
        catch(SQLException e)
        {
            System.out.println(e);
            //return null;
        }
        
        return lista;
        
    }
    
    public Socios mostrarSocio(int _idSocio)
    {
     PreparedStatement ps;
     ResultSet rs;
     Socios s1=null;
        
        try
        {
           ps=conexion.prepareStatement("select * from socios where idSocio=?");
           ps.setInt(1, _idSocio);
           rs=ps.executeQuery(); 
           
           while(rs.next())
           {
               int idSocio=rs.getInt("idSocio");
               String nombre=rs.getString("nombre");
               String apellido=rs.getString("apellido");
               String direccion=rs.getString("direccion");
               String localidad=rs.getString("localidad");
               LocalDate fnac=rs.getDate("fnac").toLocalDate();
               String mail=rs.getString("mail");
               String telefono=rs.getString("telefono");
               boolean activo=rs.getBoolean("activo");
               
               s1=new Socios(idSocio,nombre,apellido,direccion,localidad,fnac,mail,telefono,activo);
               
           }
           
           return s1;
         }
        
        catch(SQLException e)
        {
            System.out.println(e);
            return null;
        }
     }
    
    public boolean insertarSocios(Socios s1)
    {
        PreparedStatement ps;
        
        try
        {
            ps=conexion.prepareStatement("insert into socios (nombre,apellido,direccion,localidad,fnac,mail,telefono,activo) value (?,?,?,?,?,?,?,?)");
            ps.setString(1,s1.getNombre());
            ps.setString(2,s1.getApellido());
            ps.setString(3,s1.getDireccion());
            ps.setString(4,s1.getLocalidad());
            ps.setObject(5,s1.getFnac());
            ps.setString(6,s1.getMail());
            ps.setString(7,s1.getTelefono());
            return true;
        }     
        
        catch(SQLException e)
        {
            System.out.println(e);
            return false;
        }
    }
    
    public boolean actualizarSocios(Socios s1)
    {
        PreparedStatement ps;
        
        try
        {
            ps=conexion.prepareStatement("update socios set nombre=?,apellido=?,direccion=?,localidad=?,fnac=?,mail=?,telefono=?,activo=?)");
            ps.setString(1,s1.getNombre());
            ps.setString(2,s1.getApellido());
            ps.setString(3,s1.getDireccion());
            ps.setString(4,s1.getLocalidad());
            ps.setObject(5,s1.getFnac());
            ps.setString(6,s1.getMail());
            ps.setString(7,s1.getTelefono());
            ps.setBoolean(8,s1.isActivo());
            ps.setInt(9, s1.getIdSocio());
            ps.execute();
            return true;
        }     
        
        catch(SQLException e)
        {
            System.out.println(e);
            return false;
        }
    }
    
    public boolean eliminarSocios(int idSocio)
    {
        PreparedStatement ps;
        
        try
        {
            ps=conexion.prepareStatement("delete from socios where idSocio=?)");
            ps.setInt(1,idSocio);
            ps.execute();
            return true;
        }     
        
        catch(SQLException e)
        {
            System.out.println(e);
            return false;
        }
    }
    
}   
