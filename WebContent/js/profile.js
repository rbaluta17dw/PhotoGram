$(document).ready(function() {
	$("#config").click(function() {
		$(".prfl").toggleClass("usrconf");
		$(".hidden").toggle();
	});

	$("#ficha").validate({
		rules : {
			username : {
				maxlength : 20
			},
			password : {
				maxlength : 20
			},
			email : {
				email : true,
				maxlength : 40
			},
			birthdate : {
				date : true
			}
		}, // fin de las reglas, rules
		messages : {
			username : {
				maxlength : "Máximo 20 caracteres"
			},
			password : {
				maxlength : "Máximo 20 caracteres"
			},
			email : {
				email : "Introduce un email válido",
				maxlength : "Máximo 40 caracteres"
			},
			birthdate : {
				date : "Introduce una fecha válida"
			}
		}, // fin de los mensajes
		errorPlacement : function(error, element) {
			if (element.is(":radio") || element.is(":checkbox")) {
				error.appendTo(element.parent());
			} else {
				error.insertAfter(element);
			}
		}
	}); // fin validate
});