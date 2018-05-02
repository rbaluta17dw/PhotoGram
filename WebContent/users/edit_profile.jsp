<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Minimal Navigation bar</title>



<link rel="stylesheet" href="../css/profile.css">
<link rel="stylesheet" href="../css/nav.css">
<link rel="stylesheet" href="../css/botonguardar.css">
<link rel="stylesheet" href="../scss/botonguardar.scss">

<script src="../js/jquery-3.3.1.min.js"></script>
		<script src="../js/jquery.validate.min.js"></script>
    	<script type="text/javascript">
    		$(document).ready(function(){
    			$("#ficha").validate({
    				rules: {
    					username: {
    						maxlength: 20
    					},
    					
    					password: {
    						maxlength: 20
    					},
    					
    					email: {
    						email: true,
    						maxlength: 40
						},

    					birthdate: {
    						date: true
    					}

					}, //fin de las reglas, rules

					messages: {
						username: {
    						maxlength: "Máximo 20 caracteres"
    					},	

    					password: {
    						maxlength: "Máximo 20 caracteres"
    					},	

    					email: {
    						email: "Introduce un email válido",
    						maxlength: "Máximo 40 caracteres"
    					},

    					birthdate: {
    						date: "Introduce una fecha válida"
						}
					},  //fin de los mensajes

				errorPlacement: function(error, element) { 
			       if ( element.is(":radio") || element.is(":checkbox")) {
			          error.appendTo( element.parent()); 
			        } else {
			          error.insertAfter(element);
			        } 
			    } 
				});  //fin validate
			});	//fin ready
			
		</script>


</head>

<body>

	<header id="header"> <logo>iCloud <font color="orange">PhotoGram</font></logo>

	<center>
		<a href="javascript:add();" style="text-decoration: none;"> <img
			src="http://iconshow.me/download.php?file=path/media/images/ui/slim-square-icons/png/128/add.png"
			alt="add" title="add" class="icon">
		</a> <a href="javascript:search();" style="text-decoration: none;"> <img
			src="http://iconshow.me/download.php?file=path/media/images/ui/slim-square-icons/png/128/search.png"
			id="action" alt="EditIcon" title="Edit Sites" class="icon">
		</a> <a href="javascript:setting();" style="text-decoration: none;"> <img
			src="http://iconshow.me/download.php?file=path/media/images/ui/ios7-icons/png/128/gear-outline.png"
			id="action" alt="EditIcon" title="Setting" class="icon">
		</a>
	</center>

	<nav id="right" style="right: 0.5em;">
	<ul>
		<li><a href="javascript:share();" style="text-decoration: none;">
				<img
				src="http://iconshow.me/download.php?file=path/media/images/ui/iOS7-optimized-icon/png/128/44.share.png"
				alt="Lock" title="Logout" class="icon" />
		</a></li>
	</ul>
	</nav> <!-- Enter Content below. The header will follow the page down --> </header>


	<div id="profile">
		<div id="profileimg">
			<img src="../images/pinguino.png" height="80%" width="70%"
				id="profile_image">
				<br>
				<input type="button" value="Seleccionar archivo">
		</div>
		<br>
		<div id="profileinfo">
		<form action="" method="post" name="ficha" id="ficha">
			<input type="text" name="username" value="nazivince">
			<br><br>
			<input type="password" name="password" placeholder="nueva contraseña"><br>
			<input type="email" name="email" placeholder="nuevo email"><br>
			<input type="date" name="birthdate" placeholder="nueva fecha de nacimiento"><br>
			<br><br><b>Posts: 0</b>
			<div class="wrapper"><a href="profile.jsp" class="fancy-button pop-onhover bg-gradient4"><span>Guardar</span></a></div>
			</form>
			<div>
				<br>
			</div>
		</div>
		
	</div>
</body>

</html>