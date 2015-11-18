<!DOCTYPE html>

<html class="no-js">
	<!--<![endif]-->
	<head>
		<title>Elastislide - A Responsive Image Carousel</title>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="description" content="Elastislide - A Responsive Image Carousel" />
		<meta name="keywords" content="carousel, jquery, responsive, fluid, elastic, resize, thumbnail, slider" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="elastislide/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="elastislide/css/elastislide.css" />
		<link rel="stylesheet" type="text/css" href="elastislide/css/custom.css" />
		<script type="text/javascript" async="" src="js/ga.js"></script>
		<script src="elastislide/js/modernizr.custom.17475.js"></script>
		<style>
			.js.gallery {
				width: 100%;
				max-width: 450px;
				margin: 0 auto;
				border-radius: 20px;
				position: relative;
				background: #000 url(../images/black_denim.png);
				box-shadow: 0 2px 1px rgba(255,255,255,0.9), 0 -2px 1px rgba(255,255,255,0.9);
			}
			.demo-4 .elastislide-horizontal {
				background-color: transparent;
				border-radius: 20px 20px 0 0;
			}
			.elastislide-horizontal {
				padding: 10px 40px;
			}
			.elastislide-wrapper {
				position: relative;
				background-color: #fff;
				margin: 0 auto;
				min-height: 60px;
				box-shadow: 1px 1px 3px rgba(0,0,0,0.2);
			}
			.elastislide-carousel {
				overflow: hidden;
				position: relative;
			}
		</style>
		<script type="text/javascript">
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-7243260-2']);
			_gaq.push(['_trackPageview']);

			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();

		</script>
		<link rel="stylesheet" type="text/css" href="css/demoad.css?1400323962714">
		
	</head>
	<body>
		<div class="container demo-4">
			<!-- Codrops top bar -->
			<div class="codrops-top clearfix">
				<a href="http://tympanus.net/Development/Slicebox/"><strong>&laquo; Previous Demo: </strong>Slicebox</a>
				<span class="right"> <a href="http://www.flickr.com/people/smanography/" target="_blank">Images by Sherman Geronimo-Tan</a> <a href="http://tympanus.net/codrops/?p=5677"><strong>back to the Codrops post</strong></a> </span>
			</div><!--/ Codrops top bar -->

			<div class="main">

				<div class="gallery">
					<!-- Elastislide Carousel -->
					<ul id="carousel" class="elastislide-list">
						<li data-preview="images/larger/4.jpg">
							<a href="#"><img src="images/small/4.jpg" alt="image04" /></a>
						</li>
						<li data-preview="images/larger/5.jpg">
							<a href="#"><img src="images/small/5.jpg" alt="image05" /></a>
						</li>
						<li data-preview="images/larger/6.jpg">
							<a href="#"><img src="images/small/6.jpg" alt="image06" /></a>
						</li>
						<li data-preview="images/larger/7.jpg">
							<a href="#"><img src="images/small/7.jpg" alt="image07" /></a>
						</li>
						<li data-preview="images/larger/11.jpg">
							<a href="#"><img src="images/small/11.jpg" alt="image11" /></a>
						</li>
						<li data-preview="images/larger/12.jpg">
							<a href="#"><img src="images/small/12.jpg" alt="image12" /></a>
						</li>
						<li data-preview="images/larger/13.jpg">
							<a href="#"><img src="images/small/13.jpg" alt="image13" /></a>
						</li>
						<li data-preview="images/larger/14.jpg">
							<a href="#"><img src="images/small/14.jpg" alt="image14" /></a>
						</li>
						<li data-preview="images/larger/15.jpg">
							<a href="#"><img src="images/small/15.jpg" alt="image15" /></a>
						</li>
						<li data-preview="images/larger/16.jpg">
							<a href="#"><img src="images/small/16.jpg" alt="image16" /></a>
						</li>
						<li data-preview="images/larger/17.jpg">
							<a href="#"><img src="images/small/17.jpg" alt="image17" /></a>
						</li>
						<li data-preview="images/larger/18.jpg">
							<a href="#"><img src="images/small/18.jpg" alt="image18" /></a>
						</li>
						<li data-preview="images/larger/19.jpg">
							<a href="#"><img src="images/small/19.jpg" alt="image19" /></a>
						</li>
						<li data-preview="images/larger/20.jpg">
							<a href="#"><img src="images/small/20.jpg" alt="image20" /></a>
						</li>
						<li data-preview="images/larger/1.jpg">
							<a href="#"><img src="images/small/1.jpg" alt="image01" /></a>
						</li>
						<li data-preview="images/larger/2.jpg">
							<a href="#"><img src="images/small/2.jpg" alt="image02" /></a>
						</li>
						<li data-preview="images/larger/3.jpg">
							<a href="#"><img src="images/small/3.jpg" alt="image03" /></a>
						</li>
						<li data-preview="images/larger/8.jpg">
							<a href="#"><img src="images/small/8.jpg" alt="image08" /></a>
						</li>
						<li data-preview="images/larger/9.jpg">
							<a href="#"><img src="images/small/9.jpg" alt="image09" /></a>
						</li>
						<li data-preview="images/larger/10.jpg">
							<a href="#"><img src="images/small/10.jpg" alt="image10" /></a>
						</li>
					</ul>
					<!-- End Elastislide Carousel -->

					<div class="image-preview">
						<img id="preview" src="images/large/4.jpg" />
					</div>
				</div>

			</div>
		</div>
		<script type="text/javascript" src="elastislide/js/jquery-1.82.min.js"></script>
		<script type="text/javascript" src="elastislide/js/jquerypp.custom.js"></script>
		<script type="text/javascript" src="elastislide/js/jquery.elastislide.js"></script>
		<script type="text/javascript">
			// example how to integrate with a previewer

			var current = 0, $preview = $('#preview'), $carouselEl = $('#carousel'), $carouselItems = $carouselEl.children(), carousel = $carouselEl.elastislide({
				current : current,
				minItems : 4,
				onClick : function(el, pos, evt) {

					changeImage(el, pos);
					evt.preventDefault();

				},
				onReady : function() {

					changeImage($carouselItems.eq(current), current);

				}
			});

			function changeImage(el, pos) {

				$preview.attr('src', el.data('preview'));
				$carouselItems.removeClass('current-img');
				el.addClass('current-img');
				carousel.setCurrent(pos);

			}

		</script>
		<script src="elastislide/js/demoad.js"></script>
	</body>
</html>
