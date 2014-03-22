package com.poocode.jardinDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.poocode.conexion.DbUtil;
import com.poocode.entidad.ModeloEndidadLogin;
import com.poocode.entidad.ModeloEntidadProfesores;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<ModeloEntidadProfesores> getAllProfesores(){
		
		List<ModeloEntidadProfesores> mProfesores = new ArrayList<ModeloEntidadProfesores>();
		String indicador = "";
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement
					.executeQuery("SELECT res_id, UPPER(CONCAT(res_nombre ,' ', res_apellido)) AS nombreP, res_telefono, res_ciudad, res_estado FROM dinprofesores ORDER BY res_nombre");
			
			while (rs.next()) {
				ModeloEntidadProfesores mProModelo = new ModeloEntidadProfesores();
				mProModelo.setId(rs.getInt("res_id"));
				mProModelo.setNombreApellido(rs.getString("nombreP"));
				mProModelo.setTelefono(rs.getString("res_telefono"));
				mProModelo.setCiudad(rs.getString("res_ciudad"));
				mProModelo.setEstado(rs.getInt("res_estado"));
				mProfesores.add(mProModelo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mProfesores;
	}// Metodo listar profesores 
	
	
	public void addProfesor(ModeloEntidadProfesores addP){
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("INSERT INTO dinprofesores(res_id, res_nombre, res_apellido, res_telefono, res_ciudad, res_estado) VALUES (?,?,?,?,?,?)");
			preparedStatement.setInt(1, addP.getId());
			preparedStatement.setString(2, addP.getNombreApellido());
			preparedStatement.setString(3, addP.getApellido());
			preparedStatement.setString(4, addP.getTelefono());
			preparedStatement.setString(5, addP.getCiudad());
			preparedStatement.setInt(6, addP.getEstado());
			preparedStatement.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}	
	}//Fin del metodo insertar Profesor
	
	
	
	
	
}
