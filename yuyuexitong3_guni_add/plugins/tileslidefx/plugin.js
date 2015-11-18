/* Plugin JS file */
is_supported = $.browser.name!="msie" /*&& $.browser.name=="opera"*/;

if(!is_supported){
    $(document).on("mouseenter",".tileSlideFx",function(){
		$(this).children('.imgWrapper').stop().animate({"margin-left":-$(this).width()*0.4},500);
	}).on("mouseleave",".tileSlideFx",function(){
		$(this).children('.imgWrapper').stop().animate({"margin-left":0},500);
	})
}else{
	$(document).on("mouseenter",".tileSlideFx",function(){
		$(this).addClass("hovered");
		clearTimeout(timers[$(this)]);
	}).on("mouseleave",".tileSlideFx",function(){
		timers[$(this)] = setTimeout(function(){$(".tileSlideFx").removeClass("hovered")},201);
	})
	
}
$.plugin($siteLoad,{
	tileSlideFx:function(){
		if(is_supported){
			$(".tileSlideFx").each( function() {
          		var $item 	= $( this ),
				    itemwidth = $item.width(),
					img		= $item.find(".imgWrapper").children('img').attr( 'src' ),
					struct	= '<div class="slice s1">\
					<div class="slice s2"  style="background-position: -'+Math.ceil(itemwidth*0.25)+'px 0px;">\
					<div class="slice s3" style="background-position: -'+Math.ceil(itemwidth*0.5)+'px 0px;">\
					<div class="slice s4" style="background-position:-'+Math.ceil(itemwidth*0.75)+'px 0px;">\
					</div></div></div></div>';
				$item.children('.imgWrapper').remove().end()
					.append(struct)
					.find('.slice').css("width", Math.ceil(itemwidth*0.25)).css( 'background-image','url('+img+')')
					.prepend('<span class="overlay" style="width:'+Math.ceil(itemwidth*0.25)+'px;"></span>')

        	});  
		}else{
			$(".tileSlideFx").css("overflow","hidden");
		}
	}
});