$(document).ready(function() {
	$("#config").click(function() {
		$(".prfl").toggleClass("usrconf");
		$(".hidden").toggle();
	});
	$("#delete").click(function() {
		window.location.replace("deleteUser.jsp");
	});
	$("#profileimg").click(function() {
		$('#imgupdate').trigger('click');
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