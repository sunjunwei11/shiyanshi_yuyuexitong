<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Slicebox - 3D Image Slider</title>
		<meta charset="UTF-8" />

		<link rel="stylesheet" type="text/css" href="js/slicebox/demo.css" />
		<link rel="stylesheet" type="text/css" href="js/slicebox/slicebox.css" />
		<link rel="stylesheet" type="text/css" href="js/slicebox/custom.css" />
		<script type="text/javascript" src="js/slicebox/modernizr.custom.46884.js"></script>

		<style type="text/css">
			.wrapper {
				position: relative;
				max-width: 640px;
				width: 100%;
				padding: 50px;
				margin: auto;
			}
			.sb-slider {
				margin: 10px auto;
				position: relative;
				overflow: hidden;
				width: 100%;
				list-style-type: none;
				padding: 0;
			}

			.sb-description {
				padding: 20px;
				bottom: 10px;
				left: 10px;
				right: 10px;
				z-index: 1000;
				position: absolute;
				background: #CBBFAE;
				background: rgba(190,176,155, 0.4);
				border-left: 4px solid rgba(255,255,255,0.7);
				-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
				filter: alpha(opacity=0);
				opacity: 0;
				color: #fff;
				-webkit-transition: all 200ms;
				-moz-transition: all 200ms;
				-o-transition: all 200ms;
				-ms-transition: all 200ms;
				transition: all 200ms;
			}
			h4 {
				display: block;
				font-size: 1.17em;
				-webkit-margin-before: 1em;
				-webkit-margin-after: 1em;
				-webkit-margin-start: 0px;
				-webkit-margin-end: 0px;
				font-weight: bold;
			}
			.shadow {
				width: 100%;
				height: 168px;
				position: relative;
				margin-top: -110px;
				background-size: 100% 100%;
				z-index: -1;
				display: none;
			}
			.nav-dots {
				text-align: center;
				position: absolute;
				bottom: -5px;
				height: 30px;
				width: 100%;
				left: 0;
				display: none;
			}
			.nav-dots span {
				display: inline-block;
				width: 16px;
				height: 16px;
				border-radius: 50%;
				margin: 3px;
				background: #cbbfae;
				cursor: pointer;
				box-shadow: 0 1px 1px rgba(255,255,255,0.6), inset 0 1px 1px rgba(0,0,0,0.1);
			}
			.nav-arrows a {
				width: 44px;
				height: 42px;
				background: #D3D3D3 url("/images/nav.png") no-repeat top left;
				position: absolute;
				top: 50%;
				left: 2px;
				text-indent: -9000px;
				cursor: pointer;
				margin-top: -21px;
				opacity: 0.9;
				border-radius: 50%;
				box-shadow: 0 1px 1px rgba(255,255,255,0.8);
			}
			.nav-arrows a:hover {
				opacity: 1;
			}

			.nav-arrows a:first-child {
				left: auto;
				right: 2px;
				background-position: top right;
			}

		</style>

	</head>
	<body>

		<div class="wrapper">

			<ul id="sb-slider" class="sb-slider">
				<li>
					<a><img src="images/fengjing1.jpg" alt="image1"/></a>
					<div class="sb-description">
						<h4>Creative Lifesaver</h4>
					</div>
				</li>
				<li>
					<a><img src="images/fengjing2.jpg" alt="image2"/></a>
					<div class="sb-description">
						<h4>Honest Entertainer</h4>
					</div>
				</li>
				<li>
					<a><img src="images/fengjing3.jpg" alt="image1"/></a>
					<div class="sb-description">
						<h4>Brave Astronaut</h4>
					</div>
				</li>
				<li>
					<a><img src="images/fengjing4.jpg" alt="image1"/></a>
					<div class="sb-description">
						<h4>Affectionate Decision Maker</h4>
					</div>
				</li>
				<li>
					<a><img src="images/fengjing7.jpg" alt="image1"/></a>
					<div class="sb-description">
						<h4>Faithful Investor</h4>
					</div>
				</li>
				<li>
					<a><img src="images/fengjing9.jpg" alt="image1"/></a>
					<div class="sb-description">
						<h4>Groundbreaking Artist</h4>
					</div>
				</li>
				<li>
					<a><img src="images/fengjing11.jpg" alt="image1"/></a>
					<div class="sb-description">
						<h4>Selfless Philantropist</h4>
					</div>
				</li>
			</ul>

			<div id="shadow" class="shadow"></div>

			<div id="nav-arrows" class="nav-arrows">
				<a href="#">Next</a>
				<a href="#">Previous</a>
			</div>

		</div><!-- /wrapper -->

		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="plugins/slicebox/jquery.slicebox.js"></script>
		<script type="text/javascript">
			$(function() {

				var Page = (function() {

					var $navArrows = $('#nav-arrows').hide(), $shadow = $('#shadow').hide(), slicebox = $('#sb-slider').slicebox({
						onReady : function() {

							$navArrows.show();
							$shadow.show();

						},
						orientation : 'r',
						cuboidsRandom : true
					}), init = function() {

						initEvents();

					}, initEvents = function() {

						// add navigation events
						$navArrows.children(':first').on('click', function() {

							slicebox.next();
							return false;

						});

						$navArrows.children(':last').on('click', function() {

							slicebox.previous();
							return false;

						});

					};

					return {
						init : init
					};

				})();

				Page.init();

			});
		</script>

	</body>
</html>
