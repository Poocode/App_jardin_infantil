package com.poocode.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poocode.conexion.DbUtil;
import com.poocode.entidad.ModeloEntidadProfesores;
import com.poocode.jardinDao.JardinInfantilClases;


@WebServlet("/MyServletControlador")
public class MyServletControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LIST_PROFESORES = "/profesores.jsp";   
	private JardinInfantilClases mClases;
    public MyServletControlador() {
        super();
        mClases = new JardinInfantilClases();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String indicador = request.getParameter("action");
		String forward = "";
		
		if(indicador.equalsIgnoreCase("list")){
			forward = LIST_PROFESORES;
			request.setAttribute("mProfesores", mClases.getAllProfesores());
		} 
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String indicador = request.getParameter("indi");
		
		if(indicador.equalsIgnoreCase("iprs")){
			ModeloEntidadProfesores profeso = new ModeloEntidadProfesores();
			String cc = request.getParameter("idprofesor");
			String est = request.getParameter("usr_status");
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("apellidos");
			String telefon = request.getParameter("telefono");
			String ciudad = request.getParameter("ciudad");
			try {
				int cc2 = Integer.parseInt(cc);
				profeso.setId(cc2);
				profeso.setNombreApellido(nombre);
				profeso.setApellido(apellido);
				profeso.setTelefono(telefon);
				profeso.setCiudad(ciudad);
				profeso.setEstado(Integer.parseInt(est));
				mClases.addProfesor(profeso);
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.setContentType("text/plain");  
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("<tr><td>"+cc+"</td><td>"+nombre+"</td><td>"+apellido+"</td><td>"+telefon+"</td><td>"+ciudad+"<td><span class='btn btn-mini'>Activo</span></td><td><a data-accion='editar' class='btn btn-mini btn-success' href="+cc+">Editar</a></td>");
		}else if(indicador.equalsIgnoreCase("editPro")){
			ModeloEntidadProfesores profeso = new ModeloEntidadProfesores();
			String est = request.getParameter("usr_status");
			String cc = request.getParameter("idprofesor2");
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("apellidos");
			String telefon = request.getParameter("telefono");
			String ciudad = request.getParameter("ciudad");
			
			try {
				int cc2 = Integer.parseInt(cc);
				profeso.setId(cc2);
				profeso.setNombreApellido(nombre);
				profeso.setApellido(apellido);
				profeso.setTelefono(telefon);
				profeso.setCiudad(ciudad);
				profeso.setEstado(Integer.parseInt(est));
				mClases.editProfesores(profeso);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			String result = "";
			result = mClases.selectEspecial();
			response.setContentType("text/plain");  
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(result);
		}
		
	}//Fin

}
