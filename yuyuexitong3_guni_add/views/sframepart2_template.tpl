<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>汉理工大学过程控制实验室</title>
		
		<!--<script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>-->
		<link rel="stylesheet" type="text/css" href="js/ligerUI/skins/Aqua/css/ligerui-all.css">
		<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerTab.js" type="text/javascript"></script>
		<script src="js/ligerUI/lib/jquery.cookie.js"></script>
		<script src="js/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
		<!--<script src="js/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerAccordion.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerCheckBox.js"></script>
		<script src="js/ligerUI/js/plugins/ligerCheckBoxList.js"></script>
		<script src="js/ligerUI/js/plugins/ligerTree.js"></script>-->
		<script src="js/ligerUI/lib/json2.js"></script>
		<script type="text/javascript">
			var mytab;
			var tab = null;
			var accordion = null;
			//var tree = null;
			var tabItems = [];
			
			
			
			

			$(function() {
				$("#layout1").ligerLayout({
					leftWidth : 190,
					height : '100%',
					heightDiff : -34,
					space : 4,
					onHeightChanged : f_heightChanged
				});
				
				
				var height = $(".l-layout-center").height();
				
				//Tab
				$("#framecenter").ligerTab({
					height : height,
					showSwitchInTab : true,
					showSwitch : true,
					onAfterAddTabItem : function(tabdata) {
						tabItems.push(tabdata);
						//saveTabStatus();
					},
					onAfterRemoveTabItem : function(tabid) {
						for (var i = 0; i < tabItems.length; i++) {
							var o = tabItems[i];
							if (o.tabid == tabid) {
								tabItems.splice(i, 1);
								saveTabStatus();
								break;
							}
						}
					},
					onReload : function(tabdata) {
						var tabid = tabdata.tabid;
						addFrameSkinLink(tabid);
					}
				});

				$("#accordion1").ligerAccordion({
					height : height - 24,
					speed : null
				});
				
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
					//callback : function() {
						//addShowCodeBtn(tabid);
						//addFrameSkinLink(tabid);
					//}
				});
			}
			
			 function pages_init()
            {
                var tabJson = $.cookie('liger-home-tab'); 
                if (tabJson)
                { 
                    var tabitems = JSON2.parse(tabJson);
                    for (var i = 0; tabitems && tabitems[i];i++)
                    { 
                        f_addTab(tabitems[i].tabid, tabitems[i].text, tabitems[i].url);
                    } 
                }
            }
            
            function saveTabStatus()
            { 
                $.cookie('liger-home-tab', JSON2.stringify(tabItems));
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
			.l-topmenu-welcome a {
				color: #E7E7E7;
				text-decoration: underline
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

	<body style="padding:0px;background:#EAEEF5;">
		<div id="pageloading"></div>
		<div id="topmenu" class="l-topmenu" style="background-color:#000033">
			<img src="images/logo.png" width="66" height="66" style=" position:absolute;top:1%;left:5%;"/>
			<span style="color:#FFFF00; margin-left: 150px;width:94px;font-size:50px; font-style:italic">武汉理工大学过程控制实验室</span>
			<div>
				<p align="right" style="margin-bottom:0;margin-top:6px">
					% user=session.get('user')
				</p>
			</div>
			<div class="l-topmenu-welcome">
				<a>姓名:{{user["username"]}}</a>
                                <span class="space">|</span>
                                <a href="/studentsys">回到桌面</a>
				<span class="space">|</span>
				<a href="/logout">安全退出</a>

			</div>
		</div>
		<div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; ">
			<div position="left" title="菜单列表" id="accordion1" >
				<div title="综合创新" class="l-scroll">
					 
				</div>
				<div title="导师课题发布" class="l-scroll">
					
				</div>
				<div title="课外资源下载" class="l-scroll">
					
				</div>
				<div title="申请部分" class="l-scroll">
					
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
