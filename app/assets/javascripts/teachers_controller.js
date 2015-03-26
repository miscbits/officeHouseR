function scrollToSection() {	
	$("body, html, #home-section").animate({ scrollTop: $("#home-section").offset().top }, "5600");
}

$(document).ready(function() {
	$(".nextSection").click(function() {
		scrollToSection();
		console.log("wrecked")
	});
});