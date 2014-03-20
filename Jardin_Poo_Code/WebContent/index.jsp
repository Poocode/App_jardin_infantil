<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jardín infantil Smart Kids</title>
<link rel="stylesheet" href="css/estilos.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.2.js" ></script>
<script>
   $(document).ready(function() {                        
       $('#submit').click(function(event) {  
           var username = $('#user').val();
           var mPassword = $('#password').val();
       	$.post('MyServlet',{user:username,pass:mPassword},function(responseText) { 
               if(responseText == 0){
            	   $( "#login" ).effect( "shake", 100 );
            	   return false;
               }
               if(responseText == 1){
            	   window.location='home.jsp';
            	   return false;
               }
       			alert("Error de conexión comuníquese con el Administrador.");         
           });
       });
   });
</script>
</head>
<body>
	<section class="container" id="container">
		<div class="login" id="login">
			<h1>Jardín infantil Smart Kids</h1>
			<form id="form1" method="post">
				<p><input type="text" name="user" id="user" placeholder="Usuario" maxlength="9"></p>
				<p><input type="password" name="password" id="password" placeholder="Password" maxlength="9"></p>
				<p class="remember_me">
		          <label>
		            <input type="checkbox" name="remember_me" id="remember_me">
		            Recordarme usuario y password
		          </label>
		        </p>
		        <p class="submit"><input type="button" name="submit" id="submit" value="Login"></p>
			</form>
		</div>
	</section>
</body>
</html>