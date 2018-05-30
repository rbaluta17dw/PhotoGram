$(document).ready(function() {
	$("#add").click(function() {
		$("#upload").fadeToggle();
	});
	$("#user").click(function() {
		window.location.replace("Profile");
	});
	$("#plus").click(function() {
		$('#imgupload').trigger('click');
		$('#done').replaceWith("<input type='submit' value='Subir fichero' id='done' />");
	});
	
});