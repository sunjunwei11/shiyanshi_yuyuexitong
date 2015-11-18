<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<style type="text/css">
			body {
				background-color: #6CC
			}

			.js .gallery {
				width: 100%;
				max-width: 450px;
				margin: auto;
				border-radius: 20px;
				position: relative;
				background: #000 url("images/111.jpg");
				box-shadow: 0 2px 1px rgba(255,255,255,0.9), 0 -2px 1px rgba(255,255,255,0.9);
			}
			.elastislide-wrapper {
				position: relative;
				background-color: #fff;
				margin: auto;
				min-height: 60px;
				box-shadow: 1px 1px 3px rgba(0,0,0,0.2);
			}
			.elastislide-horizontal {
				padding: 10px 40px;
			}
			.demo-4 .elastislide-horizontal {
				background-color: transparent;
				border-radius: 20px 20px 0 0;
			}
			.elastislide-carousel {
				overflow: hidden;
				position: relative;
			}

			.elastislide-list {
				list-style-type: none;
				display: none;
			}
			.elastislide-horizontal ul {
				white-space: nowrap;
			}
			.elastislide-carousel ul {
				position: relative;
				display: block;
				list-style-type: none;
				padding: 0;
				margin: 0;
				-webkit-backface-visibility: hidden;
				-webkit-transform: translateX(0px);
				-moz-transform: translateX(0px);
				-ms-transform: translateX(0px);
				-o-transform: translateX(0px);
				transform: translateX(0px);
			}
			ul, menu, dir {
				display: block;
				list-style-type: disc;
				-webkit-margin-before: 1em;
				-webkit-margin-after: 1em;
				-webkit-margin-start: 0px;
				-webkit-margin-end: 0px;
				-webkit-padding-start: 40px;
			}
			li {
				display: list-item;
				text-align: -webkit-match-parent;
			}
			.elastislide-wrapper nav span {
				position: absolute;
				background: #ddd url("/images/nav.png") no-repeat 4px 3px;
				width: 23px;
				height: 23px;
				border-radius: 50%;
				text-indent: -9000px;
				cursor: pointer;
				opacity: 0.8;
			}
			.elastislide-horizontal nav span {
				top: 50%;
				left: 10px;
				margin-top: -11px;
			}
			.elastislide-horizontal ul li {
				height: 100%;
				display: inline-block;
			}
			.elastislide-carousel ul li {
				margin: 0;
				-webkit-backface-visibility: hidden;
			}
			.elastislide-carousel ul li {
				min-width: 20px;
			}
			.elastislide-carousel ul li a {
				padding: 2px;
				display: inline-block;
				width: 100%;
			}

			a {
				color: #555;
				text-decoration: none;
			}

			.demo-4 .elastislide-wrapper nav span {
				background-color: #666;
				box-shadow: inset 0 1px 1px rgba(0,0,0,0.2);
			}
			.elastislide-horizontal nav span {
				top: 50%;
				left: 10px;
				margin-top: -11px;
			}
			.elastislide-wrapper nav span {
				position: absolute;
				background: #ddd url(../images/nav.png) no-repeat 4px 3px;
				width: 23px;
				height: 23px;
				border-radius: 50%;
				text-indent: -9000px;
				cursor: pointer;
				opacity: 0.8;
			}
			.elastislide-horizontal nav span.elastislide-next {
				right: 10px;
				left: auto;
				background-position: 4px -17px;
			}
			.demo-4 .image-preview img {
				border-radius: 0 0 20px 20px;
				max-width: 100%;
				display: block;
			}

		</style>

		<title>elastislide test</title>

		<link rel="stylesheet" type="text/css" herf="js/Elastislide/css/demo.css" />
		<link rel="stylesheet" type="text/css" herf="js/Elastislide/css/elastislide.css" />
		<link rel="stylesheet" type="text/css" herf="js/Elastislide/css/custom.css" />
		<script src"js/Elastislide/js/modernizr.custom.17475.js"></script>

		<script type="text/javascript">
			$(function() {
				$('#carousel').elastislide();
			})
			

		</script>

	</head>

	<body>

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
			<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
			<script type="text/javascript" src="js/Elastislide/js/jquerypp.custom.js"></script>
			<script type="text/javascript" src="js/Elastislide/js/jquery.elastislide.js"></script>
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

		</div>

	</body>
</html>

