$(document).ready(function() {
	$("#add").click(function() {
		$("#upload").fadeToggle();
	});
	$("#user").click(function() {
		window.location.replace("../users/profile.jsp");
	});
});