$(function(){
	$(".color-toggle").click(function(e){
		e.preventDefault();
		if ($(this).data("status") === "dark"){
			$(".header").addClass("light-bg");
			$(this).data("status", "light");
			$(this).find(".sc-text").html("Dark");
		}
		else{
			$(".header").removeClass("light-bg");
			$(this).data("status", "dark");
			$(this).find(".sc-text").html("Light");
		}
	});
	$(".sc-btn").click(function(e){
		if ($(this).attr("href") === "#"){
			e.preventDefault();
		}
	});
});
