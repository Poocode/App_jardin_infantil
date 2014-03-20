package com.poocode.jardinDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.poocode.conexion.DbUtil;
import com.poocode.entidad.ModeloEndidadLogin;

public class JardinInfantilClases {
	private Connection connection;

	public JardinInfantilClases() {
		connection = DbUtil.getConnection();
	}

	public String LoginUsuario(ModeloEndidadLogin mUsuarios) {
		String mUsuario = mUsuarios.getUsuario();
		String mPassword = mUsuarios.getPassword();
		String mensaje = "mal";
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT ios_usuario, ios_password FROM dinusuarios WHERE ios_usuario =? AND ios_password =?");
			preparedStatement.setString(1, mUsuario);
			preparedStatement.setString(2, mPassword);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next()){
				mensaje = "ok";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mensaje;
	}// Fin del metodo validar Usuairo
}
