package com.poocode.jardinDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
					.executeQuery("SELECT res_id, UPPER(res_nombre) AS nombre, UPPER(res_apellido) AS apellido, res_telefono, res_ciudad, res_estado FROM dinprofesores WHERE res_estado = 1 ORDER BY res_nombre");
			
			while (rs.next()) {
				ModeloEntidadProfesores mProModelo = new ModeloEntidadProfesores();
				mProModelo.setId(rs.getInt("res_id"));
				mProModelo.setNombreApellido(rs.getString("nombre"));
				mProModelo.setApellido(rs.getString("apellido"));
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
			
		}catch (SQLException e) {
			e.printStackTrace();
		}	
	}//Fin del metodo insertar Profesor
	
	
	public void editProfesores(ModeloEntidadProfesores editP){
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("UPDATE dinprofesores SET res_nombre=?,res_apellido=?,res_telefono=?,res_ciudad=?,res_estado=? WHERE res_id=?");
			preparedStatement.setString(1, editP.getNombreApellido());
			preparedStatement.setString(2, editP.getApellido());
			preparedStatement.setString(3, editP.getTelefono());
			preparedStatement.setString(4, editP.getCiudad());
			preparedStatement.setInt(5, editP.getEstado());
			preparedStatement.setInt(6, editP.getId());
			preparedStatement.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}//Fin del metodo actualizar 
	
	public String selectEspecial(){
		String resultadogeneral = "";
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement
					.executeQuery("SELECT res_id, UPPER(res_nombre) AS nombre, UPPER(res_apellido) AS apellido, res_telefono, res_ciudad, res_estado FROM dinprofesores WHERE res_estado = 1 ORDER BY res_nombre");
			
			while (rs.next()) {
				resultadogeneral = resultadogeneral+" <tr>" +
														"<td>"+rs.getInt("res_id")+"</td>" +
														"<td>"+rs.getString("nombre")+"</td>" +
														"<td>"+rs.getString("apellido")+"</td>" +
														"<td>"+rs.getString("res_telefono")+"</td>" +
														"<td>"+rs.getString("res_ciudad")+"</td>" +
														"<td><span class='btn btn-mini'>Activo</span></td>" +
														"<td><a data-accion='editar' class='btn btn-mini btn-success' href="+rs.getInt("res_id")+">Editar</a></td>" +
													" </tr>";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return resultadogeneral;
	}
	
}
