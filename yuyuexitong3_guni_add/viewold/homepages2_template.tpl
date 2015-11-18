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
				height: 300px;
				color: #F69;
				background: #9F9;
			}
			.b {
				float: right;
				width: 650px;
				height: 300px;
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
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.10.4.js"></script>
		<script type="text/javascript" src="js-pub/jquery-ui.css"></script>
		<script type="text/javascript" src="js/jquery-ui.js"></script>
		<link rel="stylesheet" href="css/style.css">
		<script type="text/javascript" src="js-pub/jquery.ui.accordion.js"></script>
		<script type="text/javascript" src="js-pub/jquery.ui.core.js"></script>
		<script type="text/javascript" src="js-pub/jquery.ui.widget.js"></script>

		<style type="text/css">
			* {
				margin: 0px;
				padding: 0px;
				font-size: 14px;
			}
			div.LunBo {
				position: relative;
				list-style-type: none;
				height: 250px;
				width: 450px;
			}
			div.LunBo ul li {
				position: absolute;
				height: 250px;
				width: 450px;
				left: 30px;
				top: 20px;
				display: none;
			}
			div.LunBo ul li.CurrentPic {
				display: block;
			}
			div.LunBo div.LunBoNum {
				position: absolute;
				left: 380px;
				bottom: 11px;
				width: 83px;
				text-align: right;
				background-color: #999;
				padding-left: 10px;
			}
			div.LunBo div.LunBoNum span {
				height: 20px;
				width: 15px;
				display: block;
				line-height: 20px;
				text-align: center;
				margin-top: 5px;
				margin-bottom: 5px;
				float: left;
				cursor: pointer;
			}
			div.LunBo div.LunBoNum span.CurrentNum {
				background-color: #3F6;
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
			h3:hover{
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
				<div id="win7fenge" style="background:#FFF;height:300px;">
					<div id="lunboqu" class="a">
						<div class="LunBo">
							<ul>
								<li class="CurrentPic"><img src="/images/111.jpg" width="450" height="250" />
								</li>
								<li><img src="/images/112.jpg"  art=" " width="450" height="250" />
								</li>
								<li><img src="/images/113.jpg" art=" " width="450" height="250" />
								</li>
								<li><img src="/images/114.jpg"  art=" " width="450" height="250" />
								</li>
								<li><img src="/images/115.jpg"  art=" " width="450" height="250" />
								</li>
							</ul>
							<div class="LunBoNum">
								<span class="CurrentNum">1</span>
								<span>2</span>
								<span>3</span>
								<span>4</span>
								<span>5</span>
							</div>
						</div>
						<script type="text/javascript" language="javascript">
							var PicTotal = 5;
							var CurrentIndex;
							var ToDisplayPicNumber = 0;
							$("div.LunBo div.LunBoNum span").click(DisplayPic);
							function DisplayPic() {
								// 测试是父亲的第几个儿子
								CurrentIndex = $(this).index();
								// 删除所有同级兄弟的类属性
								$(this).parent().children().removeClass("CurrentNum")
								// 为当前元素添加类
								$(this).addClass("CurrentNum");
								// 隐藏全部图片
								var Pic = $(this).parent().parent().children("ul");
								$(Pic).children().hide();
								// 显示指定图片
								$(Pic).children("li").eq(CurrentIndex).show();
							}

							function PicNumClick() {
								$("div.LunBo div.LunBoNum span").eq(ToDisplayPicNumber).trigger("click");
								ToDisplayPicNumber = (ToDisplayPicNumber + 1) % PicTotal;
								setTimeout("PicNumClick()", 1000);
							}

							setTimeout("PicNumClick()", 1000);
						</script>

					</div>
					<div id="cizhuanqu" class="b">
						这是这是metro ui 瓷砖风格部
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

