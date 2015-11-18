<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<style type="text/css">
			body {
				background-color: #6CC
			}
			.title {
				color: #03C;
				font-size: 28px;
			}
			.a {
				float: left;
				width: 650px;
				height: 400px;
				color: #F69;
				background: #9F9;
			}
			.b {
				float: right;
				width: 650px;
				height: 400px;
				color: #CF6;
				background: #F69;
			}
			.c {
				height: 35px;
				color: #606;
				background: #FF9;
			}
			.d {
				height: 35px;
				color: #606;
				background: #939;
			}
			.e {
				height: 35px;
				color: #606;
				background: #03C;
			}

		</style>

		<title>实验室网页1</title>

		<link rel="stylesheet" type="text/css" href="js/slicebox/demo.css" />
		<link rel="stylesheet" type="text/css" href="js/slicebox/slicebox.css" />
		<link rel="stylesheet" type="text/css" href="js/slicebox/custom.css" />
		<script type="text/javascript" src="js/slicebox/modernizr.custom.46884.js"></script>

		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script src="js/jquery-1.8.1.js"></script>

		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.10.4.js"></script>
		<script type="text/javascript" src="js-pub/jquery-ui.css"></script>
		<script type="text/javascript" src="js/jquery-ui.js"></script>
		<link rel="stylesheet" href="css/style.css">
		<script type="text/javascript" src="js-pub/jquery.ui.accordion.js"></script>
		<script type="text/javascript" src="js-pub/jquery.ui.core.js"></script>
		<script type="text/javascript" src="js-pub/jquery.ui.widget.js"></script>

		<script type="text/javascript" src="js/slicebox/jquery.slicebox.js"></script>

		<!--这是metro UI css的引入文件-->
		<link rel="stylesheet" href="js/Metro-UI-CSS-master/css/metro-bootstrap.css">
		<!--<script src="js/Metro-UI-CSS-master/js/jquery/jquery.min.js"></script>
		<script src="js/Metro-UI-CSS-master/js/jquery/jquery.widget.min.js"></script>
		<script src="js/Metro-UI-CSS-master/js/metro/metro.min.js"></script>
		<link herf="js/Metro-UI-CSS-master/css/modern.css" />
		<link herf="js/Metro-UI-CSS-master/css/modern-responsive.css" />
		<link herf="js/Metro-UI-CSS-master/css/prettify.css" />
		<link herf="js/Metro-UI-CSS-master/css/site.css" />
		-->

		<script src="js/layer/layer.min.js"></script>

		<style type="text/css">
			* {
				margin: 0px;
				padding: 0px;
				font-size: 14px;
			}

			#accordion {
				margin: auto;
			}
			.ui-accordion .ui-accordion-header {
				display: block;
				cursor: pointer;
				position: relative;
				margin-top: 2px;
				padding: .5em .5em .5em .7em;
				min-height: 0;
			}
			.ui-helper-reset {
				margin: 0;
				outline: 0;
				line-height: 1.3;
				text-decoration: none;
				font-size: 100%;
				list-style: none;
			}
			h3 {

				-webkit-margin-before: 1em;
				-webkit-margin-after: 1em;
				-webkit-margin-start: 0px;
				-webkit-margin-end: 0px;
			}
			h3:hover {
				background-color: #D3D3D3;
			}
			.ui-accordion .ui-accordion-icons {
				padding-left: 2.2em;
			}
			.ui-widget {
				font-family: Verdana, Arial, sans-serif;
				font-size: 1.1em;
			}

			.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
				border: 1px solid #d3d3d3;
				background: #e6e6e6 url(images/ui-bg_glass_75_e6e6e6_1x400.png) 50% 50% repeat-x;
				font-weight: normal;
				color: #555555;
			}

			.ui-widget-content {
				border: 1px solid #aaaaaa;
				background: #ffffff url(images/ui-bg_flat_75_ffffff_40x100.png) 50% 50% repeat-x;
				color: #222222;
			}

			.wrapper {
				position: relative;
				max-width: 840px;
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

		<style>
			.clearfix {
				padding-left: 10px;
				padding-top: 10px;
				margin: auto;
			}
			.tile {
				display: block;
				float: left;
				background-color: #525252;
				width: 150px;
				height: 150px;
				cursor: pointer;
				box-shadow: inset 0px 0px 1px #FFFFCC;
				text-decoration: none;
				color: #ffffff;
				overflow: hidden;
				position: relative;
				font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;
				font-weight: 300;
				font-size: 11pt;
				letter-spacing: 0.02em;
				line-height: 20px;
				margin: 0 10px 10px 0;
				overflow: hidden;
			}
			.bg-color-orange {
				background-color: #e3a21a !important;
			}
			.clearfix {
				padding-left: 10px;
				padding-top: 10px;
				margin: auto;
			}
			.tile {
				display: block;
				float: left;
				background-color: #525252;
				width: 150px;
				height: 150px;
				cursor: pointer;
				box-shadow: inset 0px 0px 1px #FFFFCC;
				text-decoration: none;
				color: #ffffff;
				overflow: hidden;
				position: relative;
				font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;
				font-weight: 300;
				font-size: 11pt;
				letter-spacing: 0.02em;
				line-height: 20px;
				margin: 0 10px 10px 0;
				overflow: hidden;
			}
			.bg-color-orange {
				background-color: #e3a21a !important;
			}

		</style>
		<script type="text/javascript">
			$(function() {
				$("#accordion").accordion({
					collapsible : true
				});

			});

		</script>

	</head>

	<body>
		<div id="mainwrapper">
			<div>
				<div id="headwrapper">
					<div style="background-image:url('/images/111.jpg');width:auto;height:150px;">
						<p class="title">
							武汉理工大学自动化实验室
						</p>
					</div>

					<!--<img src="file:///D|/myWedFiles/pictures/3.jpg" alt="这是一种花卉" width="500" height="200"/>-->
				</div>
			</div>
			<div>
				<div id="win7fenge" style="background:#FFF;height:400px;">
					<div id="lunboqu" class="a">
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

					</div>
					<div id="cizhuanqu" class="metro b">
						<div class="clearfix">
							<div>
								<div class="tile bg-color-orange" id="test3">
									<div class="tile-content">
										<h3>youxiang</h3>
										<p>
											登陆1
										</p>

										<script>
											$(function() {

												//弹出一个iframe层
												$('#test3').on('click', function() {
													$.layer({
														type : 2,
														title : '登陆窗口',
														maxmin : true,
														shadeClose : true, //开启点击遮罩关闭层
														area : ['428px', '330px'],
														offset : ['100px', ''],
														iframe : {
															src : 'iframe'
														}
													});
												});

												/*$("#password").keydown(function() {
													if (event.keyCode == 13) {
														$("#login_submit").click()
													}
												})

												$("#login_submit").click(function() {

													userid = $("#userid").val()
													password = $("#password").val()
													alert(userid)-- >
													<!--关闭弹出窗口-- >
													<!--alert($(document.getElementById('ui-accordion-accordion-panel-0')).html())
													var index = parent.layer.getFrameIndex(window.name);
													alert(index)
													parent.location.reload();
													parent.fn($('#userid').val())
													parent.layer.close(index);

													//alert($(document.getElementById('ui-accordion-accordion-panel-0')).html())
													alert("666")
													$.ajax({
														url : "/resign",
														type : "post",
														data : {
															userid : userid,
															password : password
														},
														datatype : "json",
														async : false,
														success : function(data) {
															if (data["meg"]) {
																$("#cuowu").show()
																$("#userid").val(userid)
																$("#password").val("")
															} else {
																alert("aa")
																window.location.href = "/defaultsub"
																alter("cccc")

															}

														}
													})
												})
											})*/

										</script>

									</div>

								</div>
								<div class="tile bg-color-blue">
									<div class="tile-content">
										<h2>登陆</h2>
									</div>

								</div>
							</div>

							<div class="tile double bg-color-orange">
								<div class="tile-content">
									登陆
								</div>

							</div>
							<div class="tile double bg-color-orange">
								<div class="tile-content">
									登陆
								</div>

							</div>
							<div>
								<div class="tile bg-color-orange">
									<div class="tile-content">
										<h3>youxiang</h3>
										<p>
											邮箱地址
										</p>
									</div>

								</div>
								<div class="tile bg-color-blue">
									<div class="tile-content">
										<h2>登陆</h2>
									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
				<div>

					<div id="accordion">
						<h3>Section 1</h3>
						<div>
							<p>
								Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
							</p>
						</div>
						<h3>Section 2</h3>
						<div>
							<p>
								Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
							</p>
						</div>
						<h3>Section 3</h3>
						<div>
							<p>
								Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
							</p>
							<ul>
								<li>
									List item one
								</li>
								<li>
									List item two
								</li>
								<li>
									List item three
								</li>
							</ul>
						</div>
						<h3>Section 4</h3>
						<div>
							<p>
								Cras dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia mauris vel est.
							</p>
							<p>
								Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
							</p>
						</div>
						<h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-accordion-header-active ui-state-active ui-corner-top" role="tab" id="ui-accordion-accordion-header-0" aria-controls="ui-accordion-accordion-panel-0" aria-selected="true" aria-expanded="true" tabindex="0"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span> Section 5 </h3>
						<div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" id="ui-accordion-accordion-panel-0" aria-labelledby="ui-accordion-accordion-header-0" role="tabpanel" aria-hidden="false" style="display: block; height: 148px;">
							<p>
								Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
							</p>

						</div>

					</div>
				</div>
				<div id="dibu" style="background:#3FF;height:150px;">
					版权信息部分
				</div>
			</div>

	</body>
</html>

