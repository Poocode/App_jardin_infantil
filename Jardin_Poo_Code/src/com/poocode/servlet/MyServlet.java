package com.poocode.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poocode.entidad.ModeloEndidadLogin;
import com.poocode.jardinDao.JardinInfantilClases;


@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JardinInfantilClases mClases;

    public MyServlet() {
        super();
        mClases = new JardinInfantilClases();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	//Metodo para re parametros
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("user");
		String mPassword = request.getParameter("pass");
		ModeloEndidadLogin mLogin = new ModeloEndidadLogin();
		mLogin.setUsuario(username.trim());
		mLogin.setPassword(mPassword.trim());
		String mRespuesta;
		
		mRespuesta = mClases.LoginUsuario(mLogin);
		response.setContentType("text/plain");  
		response.setCharacterEncoding("UTF-8"); 
		
		if("ok".equals(mRespuesta)){
			response.getWriter().write("1");
		}else{
			response.getWriter().write("0");
		}
	}
}
