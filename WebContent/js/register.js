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
				if (element.is(":radio") || element.is(":checkbox")) {
					error.appendTo(element.parent());
				} else {
					error.insertAfter(element);
				}
			}
		}); //fin validate
	}); //fin ready