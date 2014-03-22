<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jardín infantil Smart Kids</title>
<!-- <link rel="stylesheet" href="css/estilos.css"> -->
<link rel="stylesheet" type="text/css" href="css/snap.css" />
<link rel="stylesheet" type="text/css" href="css/assets/demo.css" />
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css" type="text/css" media="all" />
<link type="text/css" href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.2.js" ></script>
<style type="text/css">
	.content-main{
		margin-top: 60px;
		
	}
	#content{
		padding: 20px;
	}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$('#goNuevoUser').click(function(event) {
		$( "#agregarTipo" ).dialog({autoOpen:true});
	});
});
</script>	
</head>
<body>

<div class="hide" id="agregarTipo" Title="Add Profesor">
  <form action="" method="post" id="formUsers" name="formUsers">
	<fieldset id="ocultos">
		<input type="hidden" id="accion" name="accion" class="{required:true}"/>
		<input type="hidden" id="id_user" name="id_user" class="{required:true}" value="0"/>
    </fieldset>

	<fieldset id="datosUser">
		<p>Nombre de la Tipologia</p>
		<span></span>
		<input type="text" id="nombre" name="nombre" placeholder="Nombre" class="{required:true,maxlength:120} span3"/>
		<p>Status</p>
		<span></span>
				<select id="usr_status" name="usr_status" class="{required:true} span3">
					<option value="">Seleccione Una Opción</option>
					<option value="1">Activo</option>
					<option value="0">Suspendido</option>	        	
				</select>
			<fieldset id="btnAgregar" style="text-align:center;">
				<input type="submit" id="continuar" value="Continuar" />
			</fieldset>
		</form>
           </div>
	<div class="snap-drawers">
            <div class="snap-drawer snap-drawer-left">
                <div>
                     <h3>Smart Kids</h3>
                    <!-- <div class="demo-social">
                        <a href="https://twitter.com/share" class="twitter-share-button" data-lang="en" data-text="Snap.js - A Library for creating beautiful mobile shelfs in Javascript" data-url="http://jakiestfu.github.com/Snap.js/" data-count="none" data-via="jakiestfu">Tweet</a>
                        <a href="https://twitter.com/jakiestfu" class="twitter-follow-button" data-show-count="false" data-lang="en">Follow @jakiestfu</a>
                        <iframe src="http://ghbtns.com/github-btn.html?user=jakiestfu&amp;repo=Snap.js&amp;type=watch&amp;count=true" allowtransparency="true" frameborder="0" scrolling="0" width="120" height="20"></iframe>
                    </div> -->
                    <h4>Administrción</h4>
                    <ul>
                        <li><a href="MyServletControlador?action=list">Profesores</a></li>
                        <li><a href="noDrag.html">Logros</a></li>
                        <li><a href="dragElement.html">Grados</a></li>
                        <li><a href="rightDisabled.html">Alumnos</a></li>
                        <li><a href="hyperextend.html">Acudientes</a></li>
                        <li><a href="skinnyThreshold.html">Reportes</a></li>
                        <li><a href="toggles.html">Graficas</a></li>
                    </ul>
                    <div>
                        <p>Administración POO-CODE<p>
                    </div>
                </div>
            </div>
            <div class="snap-drawer snap-drawer-right"></div>
        </div>
        
        <div id="content" class="snap-content">
            <div id="toolbar">
                <a href="#" id="open-left"></a>
                <h1>Administración Profesores</h1>
            </div>
            
            
            <!-- Contenido profesores  -->
            <div class="content-main">
	            <p><button id="goNuevoUser" name="goNuevoUser" class="btn btn-inverse btn-small"><i class="icon-plus"></i> Add </button></p>
				<table id="listadoUsers" class="table table-striped table-bordered table-hover table-condensed">
            		<thead>
            			<tr>
							<th>Id</th>
							<th>Nombre - Apellido</th>
							<th>Telefono</th>
							<th>Ciudad</th>
							<th>Status</th>
							<th></th>
						</tr>
            		</thead>
            		
            		<tbody id="listaUsuariosOK">
            		<c:forEach items="${mProfesores}" var="mPe">
            			<tr>
	            			<td><c:out value="${mPe.id}" /></td>
							<td><c:out value="${mPe.nombreApellido}" /></td>
							<td><c:out value="${mPe.telefono}" /></td>
							<td><c:out value="${mPe.ciudad}" /></td>
							<td><c:out value="${mPe.estado}" /></td>
						</tr>
					</c:forEach>	
            		</tbody>
            		
            	</table>
            </div>		
        </div>
        
        <script type="text/javascript" src="js/snap.js"></script>
        <script type="text/javascript">
            var snapper = new Snap({
                element: document.getElementById('content'),
                disable: 'right'
            });  
        </script>
        
</body>
</html>