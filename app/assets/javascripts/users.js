// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
	$("#following_btn").click(function() {
	    if ($(this).text() == "Follow") {
	        $(this).text("Following"); 
	    } else {
	        $(this).text("Follow"); 
	    }; 
	});


	// $('#following_btn').submit(function(e){
	// 	e.preventDefault();
	// 	$.ajax({
	// 		url: '/follow',
	// 		method: 'GET',
	// 		data: $(this).serialize(),
	// 		dataType: 'json',
	// 		success: function(data){
	// 			console.log(data);
	// 			$('#follower_ajax').text("3");
	// 		}		
	// 	})
	// });
	// $('.newanswer').submit(function(e){
	// 	targetDiv = $(this);
	// 		e.preventDefault();
	// 		$.ajax({
	// 			url: '/new_answer',
	// 			method: 'POST',
	// 			data: $(this).serialize(),
	// 			dataType: 'json',
	// 			success: function(data){
	// 				console.log(data);
	// 				targetDiv.prev().append('\
	// 					<p>' + data.content +'</td>\
	// 				');
	// 			}		
	// 		})
	// });
});