<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>无标题文档</title>
        <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="js/ligerUI/skins/Aqua/css/ligerui-all.css">
		
		<script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerTab.js" type="text/javascript"></script>
		<script src="js/ligerUI/lib/jquery.cookie.js"></script>
		<script src="js/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerAccordion.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerCheckBox.js"></script>
		<script src="js/ligerUI/js/plugins/ligerCheckBoxList.js"></script>
		<script src="js/ligerUI/js/plugins/ligerTree.js"></script>-->
		<script src="js/ligerUI/lib/json2.js"></script>

		<script type="text/javascript">
			var mytab
			var tab = null;
			var accordion = null;
			var tree = null;
			var tabItems = [];
			var str_1 = new Array();
			//alert(str_1)
			
			var hour = str_1[0], minute = str_1[1], second = str_1[2];
			//var t = 0;
			var flag1;
			function studyTime(t) {
				//alert(typeof(t))
				hour = parseInt(t / 60 / 60);
				minute = parseInt(t / 60 % 60);
				second = parseInt(t % 60);
				document.getElementById('SECOND').innerHTML = second;
				document.getElementById('HOUR').innerHTML = hour;
				document.getElementById('MINUTE').innerHTML = minute;
				t = t + 1;
				flag1 = setTimeout("studyTime(t)", 1);

			}

			//终止学习计时器
			function stopTime() {
				var s = document.getElementById('SECOND').innerHTML;
				var m = document.getElementById('MINUTE').innerHTML;
				var h = document.getElementById('HOUR').innerHTML;
				//alert(s);
				//alert(m);
				//alert(h);
				var stime = h + ':' + m + ':' + s;
				$.ajax({
					type : "POST",
					url : "/shiyan1",
					data : {
						"choice" : stime,
						"title" : "实验问卷调查"
					},
					dataType : "json",
					async : false,
					success : function(data) {
						alert(data["msg"]) //注意提取数据的格式

					}
				})

				clearTimeout(flag1);
			}


			$(function() {

				$("#layout1").ligerLayout({
					leftWidth : 190,
					height : '100%',
					heightDiff : -34,
					space : 4,
					onHeightChanged : f_heightChanged
				});

				$("#accordion1").ligerAccordion();
				mytab = $("#framecenter").ligerTab();

				$("#lign").click(function() {
					$.ajax({
						type : "POST",
						url : "/shiyan11",
						dataType : "json",
						data : {
							"title" : "实验问卷调查"
						},
						async : false,
						success : function(data) {

							alert(typeof(data["tkey"][0]))  //注意提取数据的格式
							str_1 = data["tkey"][0].split(":");
							var a = parseInt(str_1[0]) * 3600 + parseInt(str_1[1]) * 60 + parseInt(str_1[2]);
							alert(parseInt(str_1[2]))
							//alert(typeof(a))
							studyTime(a);
							//window.setInterval(studyTime(), 1000);
							// alert(a)
							//if(a==0){
							//alert(a)
							//SECOND="0";MINUTE="0";HOUR="0";
							// studyTime();
							// }
							// else{
							//alert(a)
							//document.getElementById('SECOND').innerHTM=parseInt(str_1[2]);MINUTE=parseInt(str_1[1]);HOUR=parseInt(str_1[0]);
							//alert("SECOND")

						}
					})

					

				})

				$("#stop").click(function() {
					stopTime();

				})
			})
			
			function opentab(id, arg) {
				mytab.addTabItem({
					tabid : id,
					url : arg,
					text : "页面一"
				});
			}

			function f_heightChanged(options) {
				if (tab)
					tab.addHeight(options.diff);
				if (accordion && options.middleHeight - 24 > 0)
					accordion.setHeight(options.middleHeight - 24);
			}

			function f_addTab(tabid, text, url) {
				tab.addTabItem({
					tabid : tabid,
					text : text,
					url : url,
					callback : function() {
						addShowCodeBtn(tabid);
						addFrameSkinLink(tabid);
					}
				});
			}
		</script>
		<style type="text/css">
			body {
				padding: 0px;
				margin: 0;
				overflow: hidden;
			}
			.l-layout-top {
				background: #102A49;
				color: #000033
			}
			.l-topmenu-welcome {
				position: absolute;
				height: 24px;
				line-height: 24px;
				right: 30px;
				top: 2px;
				color: #070A0C;
			}

			.body-gray2014 #framecenter {
				margin-top: 3px;
			}
			.viewsourcelink {
				background: #B3D9F7;
				display: block;
				position: absolute;
				right: 10px;
				top: 3px;
				padding: 6px 4px;
				color: #333;
				text-decoration: underline;
			}
			.viewsourcelink-over {
				background: #81C0F2;
			}
			.l-topmenu-welcome label {
				color: white;
			}
			#skinSelect {
				margin-right: 6px;
			}

		</style>
	</head>

	<body>
		<div id="pageloading"></div>
		<div id="topmenu" class="l-topmenu">
			
			<span style="color:#FFFF00; margin-left: 150px;width:94px;font-size:50px;">武汉理工大学过程控制实验室</span>
			<div class="l-topmenu-welcome">
				<span id="nowDateIs"></span>&nbsp;&nbsp;

				<span id="nowTimeIs"></span>&nbsp;&nbsp;

				<span id="nowCnYearIs"></span> &nbsp;&nbsp;

				<span  id="nowCnDateIs"></span>&nbsp;&nbsp;

				<div class="l-topmenu-right-butttom">
					% user=session.get('user')
					<font>欢迎你  {{user["username"]}}</font>&nbsp;&nbsp; <span>您已在线学习了</span>
					<span id="HOUR"></span><span>小时</span>
					<span id="MINUTE"></span><span>分钟</span>
					<span id="SECOND"></span><span>秒</span>&nbsp;&nbsp;
				</div>
				<div class="l-topmenu-right-butttom1">
					<a href="/logout" style="text-decoration: none">安全退出</a>
				</div>
			</div>
		</div>
		<div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; ">
			<div position="left" title="实验列表" id="accordion1" >
				<div title="过程控制实验" class="l-scroll">
					<ul>
						<li id="lign">
							<a href="javascript:opentab('2','/labfeedback1')">实验问卷调查</a>
						</li>
						<li id="stop">
							<a href="javascript:opentab('4','web2.html')">工程基本信息2</a>
						</li>
						<li>
							工程基本信息3
						</li>
					</ul>
				</div>
				<div title="单片机实验">
					<div style=" height:7px;"></div>
					<ul>
						<li>
							甲方
						</li>
					</ul>
					<ul>
						<li>
							乙方
						</li>
					</ul>
					<ul>
						<li>
							丙方
						</li>
					</ul>
				</div>
				<div title="PLC实验">
					<div style=" height:7px;"></div>
					<ul>
						<li>
							工程基本信息
						</li>
					</ul>
					<ul>
						<li>
							项目基本信息
						</li>
					</ul>
					<ul>
						<li>
							程序基本信息
						</li>
					</ul>
				</div>
			</div>
			<div position="center" id="framecenter">
				<div tabid="home" title="实验主页">
					<iframe frameborder="0" name="home" id="home" src="/zhuye"></iframe>
				</div>
			</div>
		</div>
		<div  style="height:32px; line-height:32px; text-align:center;">
			Copyright © 武汉理工大学自动化学院
		</div>
		<div style="display:none"></div>
	</body>
</html>