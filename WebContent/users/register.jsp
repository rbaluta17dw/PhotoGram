<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="../css/register.css">
<jsp:include page="../include/index.html"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#ficha").validate({
			rules : {
				username : {
					maxlength : 20,
					required : true
				},

				password : {
					maxlength : 20,
					required : true
				},

				repassword : {
					maxlength : 20,
					required : true,
					equalTo : "#password"
				},

				email : {
					email : true,
					maxlength : 40,
					required : true
				},

				birthdate : {
					date : true,
					required : true
				}

			}, //fin de las reglas, rules

			messages : {
				username : {
					maxlength : "Máximo 20 caracteres",
					required : "Campo obligatorio"
				},

				password : {
					maxlength : "Máximo 20 caracteres",
					required : "Campo obligatorio"
				},

				repassword : {
					maxlength : "Máximo 20 caracteres",
					required : "Campo obligatorio",
					equalTo : "Las contraseñas no coinciden"
				},

				email : {
					email : "Introduce un email válido",
					maxlength : "Máximo 40 caracteres",
					required : "Campo obligatorio"
				},

				birthdate : {
					date : "Introduce una fecha válida",
					required : "Campo obligatorio"
				}
			}, //fin de los mensajes

			errorPlacement : function(error, element) {
				if (element.is(":radio") || element.is(":checkbox")) {
					error.appendTo(element.parent());
				} else {
					error.insertAfter(element);
				}
			}
		}); //fin validate
	}); //fin ready
</script>
</head>
<body>
	<div id="container">
		<form action="registerUser.jsp" method="post" name="ficha" id="ficha">
			<h1>FORMULARIO DE REGISTRO</h1>
			<input type="text" name="username" placeholder="Nombre de usuario">
			<input type="password" name="password" placeholder="Contraseña">
			<input type="password" name="repassword"
				placeholder="Vuelve a escribir la contraseña"> <input
				type="email" name="email" placeholder="Email"> <input
				type="date" name="birthdate" placeholder="Fecha de nacimiento">
			<input type="submit" value="Register">
		</form>
	</div>

</body>
</html>