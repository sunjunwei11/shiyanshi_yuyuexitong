<!DOCTYPE html>

<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="Description" content="Easily create Windows 8 Metro UI-style websites with this templating framework. Many features like live-tiles, slideshows and sidebars."/>
		<meta name="keywords" content="template, windows 8, website, design, download, metro ui, metro template"/>
		
		<meta name="viewport" content="width=device-width,initial-scale=1.00, minimum-scale=1.00">
		<title>武汉理工大学自动化学院</title>

		<link rel="stylesheet" type="text/css" href="css/layout.css" />
		<link rel="stylesheet" type="text/css" href="css/nav.css" />
		<link rel="stylesheet" type="text/css" href="css/tiles.css" />
		<link rel="stylesheet" type="text/css" href="themes/theme_default/theme.css" />
		<link rel="stylesheet" type="text/css" href="plugins/accordion/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/autozoom/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/custom/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/panels/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/plugintemplate/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tileflip/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tilefliptext/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tilemosaic/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tileslide/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tileslidefx/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tileslideshow/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tiletemplate/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tiletwitter/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tileweather/plugin.css" />
		<style>
			html {
				background-color: #1A6577;
			}

			/*#bgImage {
				position: fixed;
				top: 0;
				left: 0;
				z-index: -4;
				min-width: 115%;
				min-height: 100%;
				-webkit-transition: margin-left 450ms linear;
				-moz-transition: margin-left 450ms linear;
				-o-transition: margin-left 450ms;
				-ms-transition: margin-left 450ms;
				transition: margin-left 450ms;
			}*/
			.tile {
				-webkit-transition-property: box-shadow, margin-left, margin-top;
				-webkit-transition-duration: 0.25s, 0.5s, 0.5s;
				-moztransition-property: box-shadow, margin-left, margin-top;
				-moz-transition-duration: 0.25s, 0.5s, 0.5s;
				-o-transition-property: box-shadow, margin-left, margin-top;
				-o-transition-duration: 0.25s, 0.5s, 0.5s;
				-ms-transition-property: box-shadow, margin-left, margin-top;
				-ms-transition-duration: 0.25s, 0.5s, 0.5s;
				transition-property: box-shadow, margin-left, margin-top;
				transition-duration: 0.25s, 0.5s, 0.5s;
			}

			#headerTitles h1 a {
				color: #EBE5E5;
				font-size: 42px;
				text-decoration: none;
				font-weight: 100;
				font-family: Segoe UI Light, "Opens Sans", sans-serif;
			}
		</style>

		<script src="js/jquery-2.0.3.min.js"></script>
		<script src="js/html5.js"></script>


		<script type="text/javascript">
			window.jQuery || document.write('<\/script><script type="text/javascript" src="js/jquery1102.js"><\/script>')
		</script>
		<script type="text/javascript" src="js/plugins.js"></script>
		<script>
			scale = 145;
			spacing = 10;
			theme = 'theme_default';
			$group.titles = ["Home", "Download", "Support"];
			$group.spacingFull = [5, 5, 5];
			$group.inactive.opacity = "1";
			$group.inactive.clickable = "1";
			$group.showEffect = 0;
			$group.direction = "horizontal";

			mouseScroll = "1";

			siteTitle = '武汉理工大学自动化学院';
			siteTitleHome = 'Home';
			showSpeed = 400;
			hideSpeed = 300;
			scrollSpeed = 550;

			device = "desktop";
			scrollHeader = "1";
			disableGroupScrollingWhenVerticalScroll = "";

			/*For background image*/
			bgMaxScroll = "130";
			bgScrollSpeed = "450";

			/*For responsive */
			autoRearrangeTiles = "1";
			autoResizeTiles = "1";
			rearrangeTreshhold = 3;

			
			
		</script><script type="text/javascript" src="plugins/accordion/plugin.js"></script>
		<script type="text/javascript" src="plugins/autozoom/plugin.js"></script>
		<script type="text/javascript" src="plugins/panels/desktop.js"></script><script type="text/javascript" src="plugins/plugintemplate/plugin.js"></script>
		<script type="text/javascript" src="plugins/tileflip/plugin.js"></script>
		<script type="text/javascript" src="plugins/tilefliptext/plugin.js"></script>
		<script type="text/javascript" src="plugins/tilemedia/plugin.js"></script>
		<script type="text/javascript" src="plugins/tilemosaic/plugin.js"></script>
		<script type="text/javascript" src="plugins/tileslide/plugin.js"></script>
		<script type="text/javascript" src="plugins/tileslidefx/plugin.js"></script>
		<script type="text/javascript" src="plugins/tileslideshow/plugin.js"></script>
		<script type="text/javascript" src="plugins/tiletemplate/plugin.js"></script>
		<script type="text/javascript" src="plugins/tiletwitter/plugin.js"></script>
		<script type="text/javascript" src="plugins/tileweather/plugin.js"></script>
		<script type="text/javascript" src="js/functions.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
		<script type="text/javascript" src="plugins/tilemedia/jquery.media.js"></script>
		<script type="text/javascript" src="plugins/tilemedia/jquery.metadata.js"></script>
		<script type="text/javascript" src="plugins/tileweather/jquery.simpleWeather-2.1.2.min.js"></script>
		<style>
			#catchScroll {
				background: rgb(30,30,30);
				-ms-filter: 'progid:DXImageTransform.Microsoft.Alpha(Opacity=00)';
				filter: alpha(opacity=00);
				-moz-opacity: 0;
				-khtml-opacity: 0;
				opacity: 0;
			}
		</style>
		<noscript>
			<style>
				#tileContainer {
					display: block
				}
			</style>
		</noscript>
	</head>
	<body class="full desktop">
		<!--<img src='img/bg/metro_green_angular_low_res.jpg' alt='background-image' id='bgImage'/>-->
		<header>
			<div id="headerWrapper">
				<div id="headerCenter">
					<div id="headerTitles">
						<h1><a href="#!">过程控制实验</a></h1>
						<h2>guo cheng kong zhi shi yan</h2>
					</div>
					<nav>
						<a id="group0"> <img src="img/icons/home.png" alt="Home"/> 基础部分 </a>
						<a id="group1"> <img src="img/icons/download_s.png" alt="Download"/> 提高部分 </a>
						<a id="group2"> <img src="img/icons/questionmark.png" alt="Support"/> 功能部分 </a>
					</nav>
					<div>
						<p align="right" style="margin-bottom:0;margin-top:6px">
							% user=session.get('user')
						</p>
					</div>
					</div>
					<div id="xueshengxinxi">
				    <div>
				        <b>工号:{{user["userid"]}}</b>
				    </div>
				    <div>
				        <b>姓名:{{user["username"]}}</b>
				    </div>				        			    
				</div>
				
				<div id="anquantuichu">
				    <div>
				        <a href="/logout"><b>安全退出</b></a>
				    </div>
				</div>
						
					
			</div>
		</header>
		<div id="wrapper">
			<div id="centerWrapper">
				<div id="tileContainer">
					<img id='arrowLeft' class="navArrows" src='themes/theme_default/img/primary/arrowLeft.png' onClick="javascript:$group.goLeft();" alt="left arrow"/>
					<img id='arrowRight' class="navArrows" src='themes/theme_default/img/primary/arrowRight.png' onClick="javascript:$group.goRight();" alt="right arrow"/>
					<a href="#&amp;home" id="groupTitle0" class="groupTitle" style="margin-left:0px; margin-top:0px" onclick="javascript:$group.goTo(0);"><h3>基础部分</h3></a>
					<a href="#&amp;download" id="groupTitle1" class="groupTitle" style="margin-left:775px; margin-top:0px" onclick="javascript:$group.goTo(1);"><h3>提高部分</h3></a>
					<a href="#&amp;support" id="groupTitle2" class="groupTitle" style="margin-left:1550px; margin-top:0px" onclick="javascript:$group.goTo(2);"><h3>功能部分</h3></a>
					<a  href="/tframepart1" class="tile tileCenteredSlide left group0 " style="
					margin-top:45px; margin-left:0px;
					width:300px; height:145px;
					background:rgb(80, 150, 1);"  data-pos='45-0-300' 	>
					<div class="container1">
						<h3><img title='' alt='' style='margin-top:0px;margin-left:0px;'
						src='img/icons/box_info.png' height="60" width="60"/> 实验预习</h3>
					</div>
					<div class="container2">
						<h5>This is a templating framework to build websites based on the Windows 8 Metro UI style.是实验部分</h5>
					</div> </a>
					<a  href='/tframepart1' id="tileSlideshow0-2-0" class="tile tileSlideshow group0 " style="
					margin-top:45px; margin-left:310px;
					width:300px; height:145px;
					background:#6950ab;"  data-pos='45-310-300'  data-n=0>
					<div class='imgWrapperBack' style="width: 302px; height:147px"><img src='empty' alt='' />
					</div>
					<div class='imgWrapper' style="width: 302px; height:147px"><img src='img/features/tiles.png' alt='' />
					</div>
					<div class='imgText'>
						测试部分1
					</div>
					<script>
						slideshowTiles["tileSlideshow0-2-0"] = [["img\/features\/tiles.png", "img\/features\/modern.png", "img\/features\/seo.png", "img\/features\/devices.png"], ["", "", "", ""], ["这是测试1", "这是测试2", "这是测试3", "这是测试4"], "slide-right, slide-up, slide-down,slide-left", 4000]
					</script>
					<div class='tileLabelWrapper top' style='border-top-color:#FF8000;'>
						<div class='tileLabel top' >
							这是测试环节
						</div>
					</div> </a>
					<a  href='/tframepart1' id="tileScroll1_2-1" class="tile tileScroll group0 " style="
					margin-top:200px; margin-left:310px;
					width:145px; height:145px;
					background:#11528F;"  data-pos='200-310-145' >
					<div class='tileTitle' style='margin-left:10px;'>
						<span style='font-size:24px;'>实验报告</span>
					</div>
					<div class='divScroll' style='margin-left:12px;'>
						实验报告
					</div>
					<script>
						scrollTile("1_2-1", ["jQuery", "JSminPlus", "ACE editor", "Categorizr"], 2000, 0)
					</script> </a>
					<a href='/tframepart1' class="tile tileImg group0 bottom endGroup" style="
					margin-top:200px; margin-left:465px;
					width:145px; height:145px;
					background:#509601;"   data-pos='200-465-145' > <img title='' alt='' src='img/v3.png' width="145" style='margin-left:-72.5px; margin-top: -72.5px; max-height:145px;'/>
					<div class='tileLabelWrapper bottom'>
						<div class='tileLabel bottom' style='border-bottom-color:#FFF;'>
							<span style='color:#11528f;'>实验成绩查询</span>
						</div>
						<div class='imgDesc' style='display:none;'>
							实验成绩查询
						</div>
					</div> </a>
					
					<a  href='/tframepart1' id="tileScroll1_2-1" class="tile tileScroll group0 " style="
					margin-top:200px; margin-left:0px;
					width:145px; height:145px;
					background:#11528F;"  data-pos='200-0-145' >
					<div class='tileTitle' style='margin-left:10px;'>
						<span style='font-size:24px;'>课程设置部分</span>
					</div>
					<div class='divScroll' style='margin-left:12px;'>
						课程设置部分
					</div>
					<script>
						scrollTile("1_2-1", ["jQuery", "JSminPlus", "ACE editor", "Categorizr"], 2000, 0)
					</script> </a>
					<a href='/tframepart1' class="tile tileImg group0 bottom endGroup" style="
					margin-top:200px; margin-left:155px;
					width:145px; height:145px;
					background:#509601;"   data-pos='200-155-145' > <img title='' alt='' src='img/v3.png' width="145" style='margin-left:-72.5px; margin-top: -72.5px; max-height:145px;'/>
					<div class='tileLabelWrapper bottom'>
						<div class='tileLabel bottom' style='border-bottom-color:#FFF;'>
							<span style='color:#11528f;'>预约查询</span>
						</div>
						<div class='imgDesc' style='display:none;'>
							预约查询模块
						</div>
					</div> </a>
					
					<a  href='/tframepart2' class="tile tileCentered group1 " style="
					margin-top:45px; margin-left:775px;
					width:300px; height:145px;background:#11528f;"
					data-pos='45-775-300' 	>
					<div class="container" style="background:#11528f;"
					onMouseOver="javascript:$(this).css('background','#00BFFF')"
					onMouseOut="javascript:$(this).css('background','#11528f')"
					>
						<h3 style='color:#FFF'

						onMouseOver="javascript:$(this).css('color','#11528f')"
						onMouseOut="javascript:$(this).css('color','#FFF')"
						><img title='' alt='' style='margin-top:0px;margin-left:0px;'
						src='img/icons/box_download.png' height="60" width="60"/> 综合创新 </h3>

					</div> </a>
					<a  href='/tframepart2' class="tile tileSlide up group1 " style="
					margin-top:200px; margin-left:775px;
					width:300px; height:145px;
					background:#00BFFF; padding:0;"  data-pos='200-775-300'  data-doslide="1">
					<div class='slideText' style='
					height:145px; width:100%;top:145px;    '>
						<div style='background-color:#11528f;width:100%;height:100%;position:relative;padding-top:60px;'>
							<h3 class='margin-t-0'>资源上传与下载</h3>
						</div>
					</div>
					<div class="imageWrapper">
						<div class="imageCenterer" style="width:300px; height:145px;line-height:143px;">
							<img src='img/bug.png' alt="" title="" style="width:105px;" />
						</div>
						<div class='tileLabelWrapper top' style='border-top-color:#11528f;'>
							<div class='tileLabel top' >
								Bugs&nbsp;&nbsp;
							</div>
						</div>
					</div> </a>
					<a  href='/tframepart2' class="tile tileCentered group1 " style="
					margin-top:45px; margin-left:1085px;
					width:300px; height:145px;background:#FFF;"
					data-pos='45-1085-300' 	>
					<div class="container" style="background:#FFF;"
					onMouseOver="javascript:$(this).css('background','#00BFFF')"
					onMouseOut="javascript:$(this).css('background','#FFF')"
					>
						<h3 style='color:#11528f'

						onMouseOver="javascript:$(this).css('color','#FFF')"
						onMouseOut="javascript:$(this).css('color','#11528f')"
						><img title='' alt='' style='margin-top:0px;margin-left:0px;'
						src='img/icons/box_download_blue.png' height="60" width="60"/> 导师课题 </h3>

					</div> </a>
					<a  href='/tframepart2' class="tile tileSlideFx group1" style="
					margin-top:200px; margin-left:1085px;
					width:300px; height:145px;
					background:#333;"  data-pos='200-1085-300' >
					<div class='slideText' style=''>
					       项目申请部分
					</div>
					<div class='imgWrapper'>
						<img src='img/metro_slide_300x150.png' alt="" title="" />
					</div>
					<div class='tileLabelWrapper bottom'>
						<div class='tileLabel bottom' style='border-bottom-color:rgb(80,150,1);'>
							 项目申请部分
						</div>
					</div> </a>
					<a  href='/tframepart3' class="tile group2 align-center" style="
					margin-top:45px; margin-left:1550px;
					width:455px; height:145px;
					background:#FF8000;"  data-pos='45-1550-455' >
					<div style='line-height:30px;margin-top:40px;padding:5px;text-aling:center;'>
						<span style='font-size:60px;letter-spacing:0px;font-weight:300;'>个人信息</span>
						<div style='font-size:20px;letter-spacing:2px;font-weight:bold;'>
							& information
						</div>
					</div>
					<div class='tileLabelWrapper top' style='border-top-color:rgb(205, 88, 0);'>
						<div class='tileLabel top' >
							Get started or get further
						</div>
					</div> </a>
					<a  href='/tframepart3' class="tile tileFlip horizontal group2 " style="
					margin-top:200px; margin-left:1550px;
					width:145px; height:145px;"  data-pos='200-1550-145' >
					<div class='flipContainer'>
						<div class='flipFront' style="background:#c82345;">
							<div class='flipImgCenterer'>
								<img src="img/forum.png" alt="" title="" style="
								width:103.5px;
								"/>
							</div>
						</div>
						<div class='flipBack' style="background:#c82345;">
							<h5><span style='font-size:22px;'>讨论组</span></h5>
						</div>

					</div> </a>
					<a  href='/tframepart3' class="tile tileFlip horizontal group2 " style="
					margin-top:200px; margin-left:1705px;
					width:145px; height:145px;"  data-pos='200-1705-145' >
					<div class='flipContainer'>
						<div class='flipFront' style="background:#dea317;">
							<div class='flipImgCenterer'>
								<img src="img/icons/mail.png" alt="" title="" style="
								width:103.5px;
								"/>
							</div>
						</div>
						<div class='flipBack' style="background:#dea317;">
							<h5><span style='font-size:22px;'>问卷调查</span></h5>
						</div>

					</div> </a>
					<a  class="tile tileMosaic group2 noClick" style="
					margin-top:200px; margin-left:1860px;
					width:146px; height:145px;
					background:#90D444;"  data-pos='200-1860-146' >
					<div id='f_container' class='f_container9'><img id='tileMosaic9_1' src='img/chars/a.png'><img id='tileMosaic9_2' src='img/chars/b.png'><img id='tileMosaic9_3' src='img/chars/c.png'><img id='tileMosaic9_4' src='img/chars/d.png'><img id='tileMosaic9_5' src='img/chars/e.png'><img id='tileMosaic9_6' src='img/chars/f.png'><img id='tileMosaic9_7' src='img/chars/g.png'><img id='tileMosaic9_8' src='img/chars/h.png'><img id='tileMosaic9_9' src='img/chars/i.png'>
					</div>
					<div id='b_container' class='b_container9'>
						<div id='tileMosaic9_1b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_2b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_3b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_4b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_5b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_6b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_7b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_8b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_9b'  style='background-image:url(img/chars/a_color.png)'></div>
					</div>
					<script>
						setTimeout(function() {
							tileMosaicFlip(10, 0, 9, []);
						}, 2000);
					</script> </a>
				</div>
				<div id="subNavWrapper"></div>
				<div id="contentWrapper" >
					<div id="content"></div>
				</div>
			</div>
			
		</div>
		
		</div>
	</body>
</html>