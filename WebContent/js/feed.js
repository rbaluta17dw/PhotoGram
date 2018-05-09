$(document).ready(function() {
	$("#add").click(function() {
		$("#upload").fadeToggle();
	});
	$("#user").click(function() {
		window.location.replace("../users/profile.jsp");
	});
	$("#plus").click(function() {
		$('#imgupload').trigger('click');
		$('#done').replaceWith("<input type='submit' value='Subir fichero' id='done' class='fancy-button pop-onhover bg-gradient4' />");
	});
});