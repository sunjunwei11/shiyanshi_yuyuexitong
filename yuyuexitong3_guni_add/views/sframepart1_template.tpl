<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>武汉理工大学专业与创新实验室</title>
		
		<!--<script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>-->
		<link rel="stylesheet" type="text/css" href="js/ligerUI/skins/Aqua/css/ligerui-all.css">
		<script src="js/jquery-2.0.3.min.js" type="text/javascript"></script>
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
				$(".l-link").hover(function ()
                {
                    $(this).addClass("l-link-over");
                }, function ()
                {
                    $(this).removeClass("l-link-over");
                });
				$("#tree1").ligerTree({
					data:createdata("过程控制"),
					//data:indexdata,
					//data:createdata1("jisuanji"),
					checkbox : false,
					slide:false,
					nodeWidth:300,
					attribute: ['nodename', 'url'],
                    onSelect: function (node)
                    {
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid)
                        } 
                        f_addTab(tabid,node.data.text, node.data.url);
                    }
					
					
					
					
					
					
					
					
				});
				$("#tree2").ligerTree({
					nodeWidth:300,
					data:createdata("计算机仿真技术"),
					//data:indexdata,
					//data:createdata1("jisuanji"),
					checkbox : false,
					slide:false,
					attribute: ['nodename', 'url'],
                    onSelect: function (node)
                    {
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid)
                        } 
                        f_addTab(tabid, node.data.text, node.data.url);
                    }
					
				});
				$("#tree3").ligerTree({
					nodeWidth:300,
					data:createdata("微机原理"),
					//data:indexdata,
					//data:createdata1("jisuanji"),
					checkbox : false,
					slide:false,
					attribute: ['nodename', 'url'],
                    onSelect: function (node)
                    {
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid)
                        } 
                        f_addTab(tabid, node.data.text, node.data.url);
                    }
					
				});
				$("#tree4").ligerTree({
					nodeWidth:300,
					data:createdata("电机与拖动"),
					//data:indexdata,
					//data:createdata1("jisuanji"),
					checkbox : false,
					slide:false,
					attribute: ['nodename', 'url'],
                    onSelect: function (node)
                    {
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid)
                        } 
                        f_addTab(tabid,node.data.text, node.data.url);
                    }
					
				});
				
				tab = liger.get("framecenter");
                accordion = liger.get("accordion1");
                //tree = liger.get("tree1");
               
                pages_init();
                
              
				
				function createdata(e){	
				var newdata={},leftdata=new Array();
				var temp=new Array(),data1=[];	
				var chdata=[{url:"",text:"预习"},{url:"",text:"测试"},{url:"",text:"预约"},{url:"",text:"实验报告"}]	
				$.ajax({
					url:"/shiyandata",
					type:"POST",
					dataType:"json",
					async:false,
					data:{"name":e},
					success:function(data){
						//alert("请求实验内容数据成功")
						data2=data["shiyandata1"];
						data3=data["urldata"];
						data4=data["coursename"];
						//alert("1")
						//var hasChildren = true;
						//alert(data.length)
						newdata=data3;
						
											
					}
				
				})
			
			var screen_height = screen.height.toString();	
			for(var i=0;i<newdata.length;i++){
			
				           
							temp[i]={text:newdata[i]["subexperimentname"],isExpand:false,
							children:[{url:newdata[i]["yuxiurl"]+'?couname='+data4+'&subname='+newdata[i]["subexperimentname"],text:"预习"},
							{url:newdata[i]["ceshiurl"]+'?couname='+data4+'&subname='+newdata[i]["subexperimentname"],text:"测试"},
							{url:newdata[i]["yuyueurl"]+'?couname='+data4+'&subname='+newdata[i]["subexperimentname"],text:"预约"},
							//{url:newdata[i]["baogaourl"]+'?couname='+data4+'&subname='+newdata[i]["subexperimentname"],text:"实验报告"},
							{url:"/demo.html",text:"实验报告"},
							{url:newdata[i]["liaotianurl"]+"/"+screen_height,text:newdata[i]["group_name"]+"讨论组"}]};
							/*alert(newdata["text"])
							newdata["isexpand"]=false;
							leftdata.push(newdata);*/
						    data1.push(temp[i]);
							//alert(temp["text"])
							//a=leftdata.push(temp);
					
						}
						
		
			return  data1;		
			
			};
			


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
			 .l-link{ display:block; line-height:22px; height:22px; padding-left:16px;border:1px solid white; margin:4px;}
             .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;} 
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
		<div id="topmenu" class="l-topmenu" style="background-color:#82B1AD">
			<img src="images/logo.png" width="66" height="66" style=" position:absolute;top:1px;left:50px;"/>
			<span style="color:rgb(6,5,8); margin-left: 150px;width:94px;font-size:50px; font-style:italic">武汉理工大学专业与创新实验室</span>
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
			<div position="left" title="实验列表" id="accordion1" >
				<div title="过程控制" class="l-scroll">
					 <ul id="tree1" style="margin-top:3px;"></ul>
				</div>
				<div title="计算机仿真技术" class="l-scroll">
					<ul id="tree2" style="margin-top:3px;"></ul>
				</div>
				<div title="微机原理" class="l-scroll">
					<ul id="tree3" style="margin-top:3px;"></ul>
				</div>
				<div title="电机与拖动" class="l-scroll">
					<ul id="tree4" style="margin-top:3px;"></ul>
				</div>
				<div title="实验预约查询">
					<a class="l-link" href="javascript:f_addTab('listpage','预约查询','yuyuechaxun')">预约查询</a> 
				</div>
				<div title="测试成绩查询" class="l-scroll">
					<a class="l-link" href="javascript:f_addTab('scrinquery','测试成绩查询','/tscrinquery')">测试成绩查询</a>		
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
