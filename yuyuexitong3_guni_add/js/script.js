var MenuSpeed = 400;
var accordianSpeed = 500;

$(document).ready(function(){

    $('.content').hide();
    $('.navbarwrapper').click(navClicked);
    
    $('#contentwrapper, #homecontentwrapper').live('mouseenter', function (e) {          
        $('#topnavwrapper  > .open').slideUp(MenuSpeed,function(){$(this).removeClass('open');});
        $('.selected').removeClass('selected');     
    });

    $('.dropdownmenu').hide();
    $('#menuNav li a').click(menuNav_click);

});


function navClicked(e){
    e.preventDefault(); 
    
    if ($(this).hasClass('active')){
        $('.content').slideUp(accordianSpeed);
        $(this).removeClass('active');
    }else {
        $('.navbarwrapper').removeClass('active');
        $('.content').slideUp(accordianSpeed);      
        $(this).next('.content').slideToggle(accordianSpeed);
        $(this).addClass('active'); 
    }
    
    
}

function menuNav_click(e){
    e.preventDefault();
    $('.selected').removeClass('selected');
    $(this).parent().addClass('selected')
    id = $(this).attr('href');  
    
    
    count = $('.open:visible').length;
    if (count == 0 ){
        $(id).slideDown(MenuSpeed); 
    } else {        
        if ($(id)[0].id == $('.open:visible')[0].id){
            $(id).slideUp(MenuSpeed);
        }else{
            $('.open:not('+id+')').hide();
            $('.open:not('+id+')').removeClass('open');
            $(id).show();
        }        
    }    
    
    $(id).addClass('open');
    
    
}
