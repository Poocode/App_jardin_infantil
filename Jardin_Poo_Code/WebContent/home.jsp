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
                        <li><a href="default.html">Profesores</a></li>
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
                <h1>Jardin infantil Smart Kids</h1>
            </div>
            
            <h1></h1>
        </div>
        <script type="text/javascript" src="js/snap.js"></script>
        <script type="text/javascript">
            var snapper = new Snap({
                element: document.getElementById('content'),
                disable: 'right'
            });  
        </script>
        <script type="text/javascript" src="css/assets/demo.js"></script>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</body>
</html>
