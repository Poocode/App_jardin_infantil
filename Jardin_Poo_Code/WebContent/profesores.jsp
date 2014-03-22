<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jardín infantil Smart Kids</title>
<!-- <link rel="stylesheet" href="css/estilos.css"> -->
<link rel="stylesheet" type="text/css" href="css/snap.css" />
<link rel="stylesheet" type="text/css" href="css/assets/demo.css" />
<link type="text/css" href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<style type="text/css">
	.content-main{
		margin-top: 60px;
		
	}
	#content{
		padding: 20px;
	}
</style>
</head>
<body>
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
	            <p><button id="goNuevoUser" class="btn btn-inverse btn-small"><i class="icon-plus"></i> Add </button></p>
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