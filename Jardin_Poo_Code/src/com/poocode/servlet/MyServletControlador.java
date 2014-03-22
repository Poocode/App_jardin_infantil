package com.poocode.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MyServletControlador")
public class MyServletControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LIST_PROFESORES = "/profesores.jsp";   
  
    public MyServletControlador() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String indicador = request.getParameter("action");
		String forward = "";
		
		if(indicador.equalsIgnoreCase("list")){
			forward = LIST_PROFESORES;
		} 
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
