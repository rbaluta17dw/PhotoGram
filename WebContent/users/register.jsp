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
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script type="text/javascript">
	//Validacion de formulario con Jquery

	$(document).ready(function() {
		$("#ficha").validate({
			rules : {
				username : {
					maxlength : 20,
					required : true
				},

				password : {
					maxlength : 20,
					minlength : 8,
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
					minlength : "Mínimo de 8 carácteres",
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
				if (element.is(":password") || element.is(":text")) {
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
			<div>
				<label for="username" class="label"><h2>Nombre</h2> </label> <input
					style="width: 40%;" type="text" name="username"
					placeholder="Nombre de usuario" />
			</div>
			<div>
				<label for="password" class="label"><h2>Contraseña</h2> </label> <input
					style="width: 40%;" type="password" name="password" id="password"
					placeholder="Contraseña" />
			</div>
			<div>
				<label for="repassword" class="label"><h2>Vuelve a
						escribir la contraseña</h2> </label> <input style="width: 40%;" type="password"
					name="repassword" placeholder="Repite contraseña" />
			</div>
			<div>
				<label for="email" class="label"><h2>Email</h2> </label> <input
					style="width: 40%;" type="email" name="email" placeholder="Email" />
			</div>
			<div>
				<label for="birthdate" class="label"><h2>Fecha de
						nacimiento</h2> </label> <input style="width: 40%;" type="date"
					name="birthdate" placeholder="Fecha de nacimiento" />
			</div>
			<div>
				<input style="width: 30%;" type="submit" value="Register">
			</div>
		</form>
	</div>
</body>
</html>