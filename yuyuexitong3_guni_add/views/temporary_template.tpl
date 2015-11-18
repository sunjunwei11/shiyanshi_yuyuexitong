<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		

		
		
<!--
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
		
		<script type="text/javascript" src="js/slicebox/jquery.slicebox.js"></script>-->
		
		<!--这是metro UI css的引入文件-->
		<link rel="stylesheet" href="js/Metro-UI-CSS-master/css/metro-bootstrap.css">
		<script src="js/Metro-UI-CSS-master/js/jquery/jquery.min.js"></script>
		<script src="js/Metro-UI-CSS-master/js/jquery/jquery.widget.min.js"></script>
		<script src="js/Metro-UI-CSS-master/js/metro/metro.min.js"></script>
		<link herf="js/Metro-UI-CSS-master/css/modern.css" />
		<link herf="js/Metro-UI-CSS-master/css/modern-responsive.css" />
		<link herf="js/Metro-UI-CSS-master/css/prettify.css" />
		<link herf="js/Metro-UI-CSS-master/css/site.css" />


		
		<script src="js/layer/layer.min.js"></script>
		
		

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
		
	</head>

	<body>
		<div id="mainwrapper">
			<div>
				<div id="headwrapper">
					<div style="background-image:url('/images/top-bg.jpg');width:auto;height:150px;">
						<p class="title">
							武汉理工大学自动化实验室
						</p>
					</div>

					
				</div>
			</div>
			<div>
				<div id="win7fenge" style="background:#FFF;height:400px;">
					
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
											})
											
											

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
				
				
			</div>

	</body>
</html>

