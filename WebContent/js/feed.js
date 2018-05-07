$(document).ready(function() {
	$("#add").click(function() {
		$("#upload").fadeToggle();
	});
	$("#user").click(function() {
		window.location.replace("../users/profile.jsp");
	});
	$("#plus").click(function() {
		$('#imgupload').trigger('click');
		$('#done').replaceWith("<input type='text' placeholder='descripcion' name='desc'/>" +
				"<input type='submit' value='Subir fichero' />");
	});
});