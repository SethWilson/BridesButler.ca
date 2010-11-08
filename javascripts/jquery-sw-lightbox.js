// display the lightbox
function lightbox(insertContentDiv){
	
	// add lightbox/shadow <div/>'s if not previously added
	if($('#lightbox').size() == 0){
		var theLightbox = $('<div id="lightbox" style="background: none repeat scroll 0 0 #FEDFEE;"/>');
		var theShadow = $('<div id="lightbox-shadow"/>');
		$(theShadow).click(function(e){
			closeLightbox();
		});
		$('body').append(theShadow);
		$('body').append(theLightbox);
	}
	
	// remove any previously added content
	$('#lightbox').empty();

	// insert HTML content Div
	if(insertContentDiv != null){
		$('#lightbox').append($(insertContentDiv).html());
	}


	// move the lightbox to the current window top + 100px
	$('#lightbox').css('top', $(window).scrollTop() + 100 + 'px');
	$('#lightbox-shadow').css('height', $(document).height());
	// display the lightbox
	$('#lightbox').show();
	$('#lightbox-shadow').show();

}

// close the lightbox
function closeLightbox(){

	// hide lightbox and shadow <div/>'s
	$('#lightbox').hide();
	$('#lightbox-shadow').hide();

	// remove contents of lightbox in case a video or other content is actively playing
	$('#lightbox').empty();
}

//update the lightbox
function updateLightbox(insertContentDiv) {
	// remove any previously added content
	$('#lightbox').empty();
	$('#lightbox').append($(insertContentDiv).html());
}