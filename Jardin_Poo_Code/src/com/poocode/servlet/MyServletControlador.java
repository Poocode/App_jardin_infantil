package com.poocode.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			
			try {
				profeso.setId(Integer.parseInt(cc));
				profeso.setNombreApellido(request.getParameter("nombre"));
				profeso.setApellido(request.getParameter("apellidos"));
				profeso.setTelefono(request.getParameter("telefono"));
				profeso.setCiudad(request.getParameter("ciudad"));
				profeso.setEstado(Integer.parseInt(est));
				mClases.addProfesor(profeso);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
