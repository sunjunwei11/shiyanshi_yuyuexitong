<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		
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
			
			/*var indexdata = 
[
    { text: '基础',isexpand:false, children: [ 
		{url:"demos/base/resizable.htm",text:"改变大小"},
		{url:"demos/base/drag.htm",text:"拖动"},
		{url:"demos/base/drag2.htm",text:"拖动2"},
		{url:"demos/base/dragresizable.htm",text:"拖动并改变大小"},
		{url:"demos/base/tip.htm",text:"气泡"},
		{url:"demos/base/tip2.htm",text:"气泡2"}
	]
    },
    { text: '过滤器', isexpand: false, children: [
		{ url: "demos/filter/filter.htm", text: "自定义查询" },
		{ url: "demos/filter/filterwin.htm", text: "在窗口显示" },
		{ url: "demos/filter/grid.htm", text: "配合表格" } 
	]
    }, 
	{ text: '弹窗',isexpand:false, children: [ 
		{ url: "demos/dialog/dialogAll.htm", text: "弹出框" },
        { url: "demos/dialog/dialogParent.htm", text: "子窗口传参" },
		{url:"demos/dialog/dialogTarget.htm",text:"载入目标DIV"},
		{url:"demos/dialog/dialogUrl.htm",text:"窗口"}, 
		{url:"demos/dialog/tip.htm",text:"右下角的提示"}, 
		{url:"demos/dialog/window.htm",text:"可最小化"}
	]}]*/
			/*data.push({
				id : 3,
				pid : 1,
				text : '预习ppt'
			});
			data.push({
				id : 4,
				pid : 1,
				text : '实验演示视频'
			});
			data.push({
				id : 5,
				pid : 1,
				text : '测试'
			});
			data.push({
				id : 6,
				pid : 1,
				text : '预约'
			});
			data.push({
				id : 7,
				pid : 1,
				text : '实验讨论'
			});

			data.push({
				id : 1,
				pid : 0,
				text : '对象特性实验'
			});
			data.push({
				id : 2,
				pid : 0,
				text : '实验问卷调查'
			});*/
			
			

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
						saveTabStatus();
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
                
                function createdata1(e){
                	
                	
                	if(e=="过程控制"){
                		var indexdata = 
[
    { text: '基础',isexpand:false, children: [ 
		{url:"demos/base/resizable.htm",text:"改变大小"},
		{url:"demos/base/drag.htm",text:"拖动"},
		{url:"demos/base/drag2.htm",text:"拖动2"},
		{url:"demos/base/dragresizable.htm",text:"拖动并改变大小"},
		{url:"demos/base/tip.htm",text:"气泡"},
		{url:"demos/base/tip2.htm",text:"气泡2"}
	]
    },
    { text: '过滤器', isexpand: false, children: [
		{ url: "demos/filter/filter.htm", text: "自定义查询" },
		{ url: "demos/filter/filterwin.htm", text: "在窗口显示" },
		{ url: "demos/filter/grid.htm", text: "配合表格" } 
	]
    }, 
	{ text: '弹窗',isexpand:false, children: [ 
		{ url: "demos/dialog/dialogAll.htm", text: "弹出框" },
        { url: "demos/dialog/dialogParent.htm", text: "子窗口传参" },
		{url:"demos/dialog/dialogTarget.htm",text:"载入目标DIV"},
		{url:"demos/dialog/dialogUrl.htm",text:"窗口"}, 
		{url:"demos/dialog/tip.htm",text:"右下角的提示"}, 
		{url:"demos/dialog/window.htm",text:"可最小化"}
	]}]
                		
                	}
                	else{
                		var data={},temp=new Array();
                		 data["subexperimentname1"]="zheshiceshi1";
                		 data["subexperimentname2"]="zheshiceshi2";
                		 data["subexperimentname3"]="zheshiceshi3";
                		 data["subexperimentname4"]="zheshiceshi4";
                		 /*temp[0]={text:data["subexperimentname1"]};
                		 temp[1]={text:data["subexperimentname2"]};
                		 temp[2]={text:data["subexperimentname3"]};
                		 temp[3]={text:data["subexperimentname4"]};
                		 temp.push({text:data["subexperimentname1"]});
                		temp.push({text:data["subexperimentname2"]});
                		temp.push({text:data["subexperimentname3"]});
                		temp.push({text:data["subexperimentname4"]});
                		
                		 var temp1={text:"zheshiceshi1"};
                		var temp2={text:"zheshiceshi2"};
                		var temp3={text:"zheshiceshi3"};
                		var temp4={text:"zheshiceshi4"};
                		 var indexdata = 
[
    temp1,
    temp2,temp3,temp4]*/
                     var data1=[];
                     for(i=0;i<4;i++){
                     	temp[i]={text:data["subexperimentname1"]};
                     
                     	data1.push(temp[i])
                     	alert("temp"+i)
                     	alert("11")
                     }
                     //var indexdata=data1;
                	}
                	
	
	//return indexdata;
	return data1
                	
                }
                
              
				
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
						data2=data["shiyandata1"]
						data3=data["urldata"]
						//alert("1")
						//var hasChildren = true;
						//alert(data.length)
						newdata=data3;
						
						//var chdata=[{url:"",text:"预习"},{url:"",text:"测试"},{url:"",text:"预约"}，{url:"",text:"实验报告"}]
						
						
			
						/*var leftdata1=new Array(),leftdata2=new Array(),leftdata3=new Array(),leftdata4=new Array(),
							newdata1={},newdata2={},newdata3={},newdata4={};
						for(var i=0;i<data.length;i++){
							var a=data[i]["coursename"],b=data[i]["subexperimentname"];
							
							if(a=="过程控制"){
								alert(b)
								newdata1["text"]=b;
								newdata1["isexpend"]=false;
								//newdata1["children"]=[{},{}]
								leftdata1.push(newdata1);
								alert(leftdata1.length)
								
								
								
								
								//alert("过程控制")
								
								
							
						}else if(a=="计算机仿真技术"){
							    alert(b)
							    //var o={text:b}
							    //alert("计算机仿真技术")
							    newdata2["text"]=b;
								newdata2["isexpend"]=false;
								//newdata2["children"]=[{},{}]
								leftdata2.push(newdata2);
								alert(leftdata2.length)
							    
						}
						else if(a=="微机原理"){
							alert(b)
							    //var o={text:b}
							    //alert("微机原理")
							    newdata3["text"]=b;
								newdata3["isexpend"]=false;
								//newdata3["children"]=[{},{}]
								leftdata3.push(newdata3);
								alert(leftdata3.length)
							    
						}
						else if(a=="电机与拖动"){
							alert(b)
							//var o={text:b}
							    //alert("电机与拖动")
							    //alert("111")
							    newdata4["text"]=b;
								newdata4["isexpend"]=false;
								//newdata4["children"]=[{},{}]
								leftdata4.push(newdata4);
								alert(leftdata4.length)
							
						}
						
						   
							   
						}*/
						
						
						
					}
				
				})
			
				
			for(var i=0;i<newdata.length;i++){
							temp[i]={text:newdata[i]["subexperimentname"],isExpand:false,children:[{url:newdata[i]["yuxiurl"],text:"预习"},{url:newdata[i]["ceshiurl"],text:"测试"},{url:newdata[i]["yuyueurl"],text:"预约"},{url:newdata[i]["baogaourl"],text:"实验报告"}]};
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