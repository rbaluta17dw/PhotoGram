$(document).ready(function() {
	$("#add").click(function() {
		$("#upload").fadeToggle();
	});
	$("#user").click(function() {
		window.location.replace("../users/profile.jsp");
	});
	$("#plus").click(function() {
		$('#imgupload').trigger('click');
		$('#done').replaceWith("<input type='submit' value='Subir fichero' id='done' />");
	});
	$(".anteoptions").click(function(){
		$(this).css("background-image", "url(https://cdn2.iconfinder.com/data/icons/credocon/512/bin-256.png)")
		$(this).addClass("eliminar");
		$(".eliminar").click(function(){
			window.location.replace("../deletePost.jsp");
		});
	});
	
});