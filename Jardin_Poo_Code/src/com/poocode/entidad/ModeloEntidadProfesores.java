package com.poocode.entidad;

public class ModeloEntidadProfesores {
	int id;
	String nombreApellido;
	String telefono;
	String ciudad;
	int estado;
	
	public String getTelefono(){
		return telefono;
	}
	
	public void setTelefono(String telefono){
		this.telefono = telefono;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNombreApellido(){
		return nombreApellido;
	}
	
	public void setNombreApellido(String nombreApellido){
		this.nombreApellido = nombreApellido;
	}
	
	public String getCiudad(){
		return ciudad;
	}
	
	public void setCiudad(String ciudad){
		this.ciudad = ciudad;
	}
	
	public int getEstado(){
		return estado;
	}
	
	public void setEstado(int estado){
		this.estado = estado;
	}
	
	
}
