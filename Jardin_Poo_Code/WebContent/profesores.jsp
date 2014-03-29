<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jard&iacute;n infantil Smart Kids</title>
<!-- <link rel="stylesheet" href="css/estilos.css"> -->
<link rel="stylesheet" type="text/css" href="css/snap.css" />
<link rel="stylesheet" type="text/css" href="css/assets/demo.css" />
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css" type="text/css" media="all" />
<link type="text/css" href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.2.js" ></script>
<script type="text/javascript" src="js/jquery-validation-1.10.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
<script type="text/javascript" src="js/jquery-validation-1.10.0/localization/messages_es.js"></script>
<style type="text/css">
	.content-main{
		margin-top: 60px;
	}
	#content{
		padding: 20px;
	}
	.error {color: #f00;}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#agregarTipo").dialog({
		autoOpen: false,
		width:300,
		height:'auto',
		close:function(){
			$('#formUsers fieldset > span').removeClass('error').empty();
			$('#formUsers input[type="text"]').val('');
	    	$('#formUsers select > option').removeAttr('selected');
	    	$("#idprofesor").removeAttr("disabled");
		}
	});
	
	$('#goNuevoUser').click(function(event) {
		$( "#agregarTipo" ).dialog({title:'Add Profesor',autoOpen:true});
		
	});
	
	$('#formUsers').validate({
		submitHandler: function(){
			var str = $('#formUsers').serialize();
			//alert(str);
	        $.post('MyServletControlador',str,function(responseText) {
	        	
	        	if($('#indi').val() == 'editPro'){
	        		$('#listaUsuariosOK').empty();
	        	}	        	
	        	$('#listaUsuariosOK').append(responseText); 
	        	
	        	$('#agregarTipo').dialog('close');
	       	});
		},
	    errorPlacement: function(error, element) {
	        error.appendTo(element.prev("span").append());
	    }
	});
	
	
	// Edición de Registros
	$('body').on('click','#listaUsuariosOK a',function (e){
		e.preventDefault();
		idUser_ok = $(this).attr('href');
		$('#indi').val('editPro');
		var varl = "1";
		//$("#idprofesor").attr('disabled','disabled');
		$("#idprofesor").attr("disabled", true);
		$('#idprofesor').val($(this).parent().parent().children('td:eq(0)').text());
		$('#idprofesor2').val($(this).parent().parent().children('td:eq(0)').text());
		$('#nombre').val($(this).parent().parent().children('td:eq(1)').text());
		$('#apellidos').val($(this).parent().parent().children('td:eq(2)').text());
		$('#telefono').val($(this).parent().parent().children('td:eq(3)').text());
		$('#ciudad').val($(this).parent().parent().children('td:eq(4)').text());
		$('#usr_status option[value='+varl+']').attr('selected',true);
		//Abrimos el formulario
		$('#agregarTipo').dialog({
						title:'Edit Profesor',
						autoOpen:true
		});
	});
});

//Buscador
$(document).ready(function(){
    // Write on keyup event of keyword input element
    $("#kwd_search").keyup(function(){
        // When value of the input is not blank
        if( $(this).val() != ""){
        // Show only matching TR, hide rest of tmhe
            $("#listadoUsers tbody>tr").hide();
            $("#listadoUsers td:contains-ci('" + $(this).val() + "')").parent("tr").show();
        }else{
            // When there is no input or clean again, show everything back
            $("#listadoUsers tbody>tr").show();
        }
    });
});
    // jQuery expression for case-insensitive filter
$.extend($.expr[":"], 
{
        "contains-ci": function(elem, i, match, array){
            return (elem.textContent || elem.innerText || $(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
        }
});

function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 48 && key <= 57);
}
</script>	
</head>
<body>

<div class="hide" id="agregarTipo" Title="Add Profesor">
  <form action="" method="post" id="formUsers" name="formUsers">
	<fieldset id="ocultos">
		<input type="hidden" id="indi" name="indi" value="iprs" />
		<input type="hidden" id="accion" name="accion" class="{required:true}"/>
		<input type="hidden" id="id_user" name="id_user" class="{required:true}" value="0"/>
    </fieldset>
	<fieldset id="idprofesort">
		<p>Identifiaci&oacute;n:</p>
		<span></span>
		<input type="text" id="idprofesor" name="idprofesor" class="{required:true,maxlength:120} span3" onKeyPress="return soloNumeros(event)" />
		<input type="hidden" id="idprofesor2" name="idprofesor2" class="{required:true,maxlength:120} span3" onKeyPress="return soloNumeros(event)" />
	</fieldset>
	
	<fieldset id="nombret">
		<p>Nombres:</p>
		<span></span>
		<input type="text" id="nombre" name="nombre" placeholder="" class="{required:true,maxlength:120} span3"/>
	</fieldset>
	
	<fieldset id="apellidost">
		<p>Apellidos:</p>
		<span></span>
		<input type="text" id="apellidos" name="apellidos" placeholder="" class="{required:true,maxlength:120} span3"/>
	</fieldset>
	
	<fieldset id="telefonot">
		<p>Telefono:</p>
		<span></span>
		<input type="text" id="telefono" name="telefono" placeholder="" class="{required:true,maxlength:120} span3"/>
	</fieldset>
	
	<fieldset id="ciudadt">
		<p>Ciudad:</p>
		<span></span>
		<input type="text" id="ciudad" name="ciudad" placeholder="" class="{required:true,maxlength:120} span3"/>
	</fieldset>
	
	<fieldset id="usr_statust">
		<p>Status</p>
		<span></span>
		<select id="usr_status" name="usr_status" class="{required:true} span3">
			<option value="">Seleccione Una Opci&oacute;n</option>
			<option value="1">Activo</option>
			<option value="0">Suspendido</option>	        	
		</select>
	</fieldset>	
		
	<fieldset id="btnAgregar" style="text-align:center;">
		<input type="submit" id="continuar" value="Continuar" />
	</fieldset>
</form>
</div>
	<div class="snap-drawers">
            <div class="snap-drawer snap-drawer-left">
                <div>
                     <h3>Smart Kids</h3>
                    <h4>Administrci&oacute;n</h4>
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
                        <p>Administraci&oacute;n POO-CODE<p>
                    </div>
                </div>
            </div>
            <div class="snap-drawer snap-drawer-right"></div>
        </div>
        
        <div id="content" class="snap-content">
            <div id="toolbar">
                <a href="#" id="open-left"></a>
                <h1>Administraci&oacute;n Profesores</h1>
            </div>
            
            
            <!-- Contenido profesores  -->
            <div class="content-main">
	            <p><button id="goNuevoUser" name="goNuevoUser" class="btn btn-inverse btn-small"><i class="icon-plus"></i> Add </button></p>
				<span for='kwd_search'></span><input type='text' id='kwd_search' placeholder="Buscar" class="bordesinput"/> 	
				<table id="listadoUsers" class="table table-striped table-bordered table-hover table-condensed">
            		<thead>
            			<tr>
							<th>Id</th>
							<th>Nombre</th>
							<th>Apellido</th>
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
							<td><c:out value="${mPe.apellido}" /></td>
							<td><c:out value="${mPe.telefono}" /></td>
							<td><c:out value="${mPe.ciudad}" /></td>
							<td><span class="btn btn-mini">Activo</span></td>
							<td><a data-accion='editar' class='btn btn-mini btn-success' href=<c:out value="${mPe.id}" /> >Editar</a>
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