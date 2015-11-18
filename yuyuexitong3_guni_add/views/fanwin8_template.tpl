<!DOCTYPE html>
<html>
    <head>
        <script src="js/jquery-1.8.1.min.js"></script>
        <script src="js/jquery.masonry.min.js"></script>
        <style type="text/css">
        	.container-fluid{
        		padding: 20px;
        	}
        	.box{
        		margin-bottom: 20px;
        		float:left;
        		width:220px;
        	}
        	.box img{
        		max-width:100%
        	}
        	.cizhuan1{
        		
        	}
        	.cizhuan2{
        		
        	}
        </style>
        <script type="text/javascript">
        	$(function(){
        		var $container = $('#masonry');
        		$container.imagesLoaded(function(){
        			$container.masonry({
        			itemSelector:'.box',
        			gutterwidth:20,
        			isAnimated:ture,
        		});
        		});
        		
        	});
        </script>
    </head>
    <body>
    	<div id="masonry" class="container-fluid">
    		<div class="cizhuan1">
    			<div class="box"><img src="images/111.jpg" width="150px" height="150px" /></div>
    		    <div class="box"><img src="images/112.jpg" width="150px" height="150px" /></div>
    		</div>
    		<div class="cizhuan2">
    			<div class="box"><img src="images/113.jpg" width="150px" height="150px" /></div>
    		    <div class="box"><img src="images/114.jpg" width="150px" height="150px" /></div>
    		</div>
    		
    	</div>
       
    </body>
</html>