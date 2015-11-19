<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>上水箱对象特性实验预习</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		
		<meta name="description" content="A framework for easily creating beautiful presentations using HTML">
		<meta name="author" content="Hakim El Hattab">

		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <script src="js/jquery-2.0.3.min.js"></script>
		<link rel="stylesheet" href="css/reveal.min.css">
		<link rel="stylesheet" href="css/theme/sky.css" id="theme">
		<link rel="stylesheet" href="css/zenburn.css">
		<style>
		.button1{width:150px;height:40px;border-radius:45px;-moz-border-radius:45px;background-color:#00BFFF;font-size:20px;}
		.button2{width:150px;height:40px;border-radius:45px;-moz-border-radius:45px;background-color:#DCDCDC;border:1px solid #FFFFFF;font-size:20px;}
		.dialog{width:360px;border:solid 5px #CCDDFF;position:absolute;display:none;z-index:999;}
        .dialog .title{background-color:#CCDDFF;padding:10px 10px 10px 30px;;font-weight:bold;}
        .dialog .title img{float:right;}
        .dialog .content{background-color:#fff;padding:10px 25px 10px 10px;height:60px;}
        .dialog .content img{float:left;}
        .dialog .content span{float:left;padding-top:10px;padding-left:5px;font-size:15px;}
        .dialog .bottom{text-align:center;padding:10px 10px 10px 10px;background-color:#FFFFFF;}
        .btn{height:25px;width:70px;border-radius:15px;background-color:#BBFFEE;font-size:15px;}
        .mask{width:100%;height:500%;background-color:#DCDCDC;position:absolute;top:0px;left:0px;opacity:0.8;display:none;z-index:50;}
		</style>
		<script>
		
		 
		    //document.write( '<link rel="stylesheet" href="css/print/' + ( window.location.search.match( /print-pdf/gi ) ? 'pdf' : 'paper' ) + '.css" type="text/css" media="print">' );
			function getquerystring(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return decodeURI(r[2]);
				return null;

			}

			//先取studentid，coursename,subexperimentname通过ajax传到后台
			//alert("test");
			%user = session.get("user")
			var studentid = '{{user["userid"]}}';
			var studentname='{{user["username"]}}';
			var couname = getquerystring("couname");
			//alert(couname)
			var subname = getquerystring("subname");
			var sta = true;
		$(function(){
            var date1 = new Date();
            function showMessage(string){
                 $(".mask").show();
                 showDialog();
                 var a=string;
                 $("#message").html(a);
                 $(".dialog").show();
                      }
            function showDialog(){
                 var objW = $(window);
                 var objC = $(".dialog");
                 var brsW = objW.width();
                 var brsH = objW.height();
                 var sclL = objW.scrollLeft();
                 var sclT = objW.scrollTop();
                 var curW = objC.width();
                 var curH = objC.height();
                 var left = sclL + (brsW - curW) / 2;
                 var top = sclT + (brsH - curH) / 2;
                 objC.css({"left":left,"top":top});
                     }
          $(window).resize(function(){
                 if(!$(".dialog").is(":visible")){
                 return;
                     }
                 showDialog();
                   })
          $(".title img").click(function(){
                 $(".dialog").hide();
                 $(".mask").hide();
                 }) 
          $("#Dialogbutton").click(function(){
                 $(".dialog").hide();
                 $(".mask").hide();
              })
			$.ajax({
					type : "POST",
					url : "/statecheckForYuxi",
					data : {},
					dataType : "json",
					async : true,
					success : function(data) {
						//alert()
						if (data["msg"] == 0) {
							showMessage("请先完成问卷调查！");
							$("#button1").attr("disabled",true).removeClass("button1").addClass("button2")
							$("#div1").append("<div><b>请先完成问卷调查</b></div>")
						}
					}
				})

				//alert(studentid)
				//先做一个检查，如果第一次点击预习，则在processbiao中填预习，不是第一次且预习未完成状态不变，若预习完成则调用存储过程改变状态。
				$.ajax({
					url : "/yuxijiancha",
					type : "POST",
					dataType : "json",
					data : {
						studentid : studentid,
						studentname:studentname,
						couname : couname,
						subname : subname
					},
					success : function(data) {
						if (data["row1"] == "预习") {
							//alert("继续进行预习");
							$("#button1").click(function() {
								//if (sta == true) {
									//var stytime = 20;
									var date2 = new Date();
									var date3 = date2 - date1;
									//alert("sta=false")
									if (date3 < 360000) {
										showMessage("预习时长未满，请认真预习！");
									} else {
										//alert("准备提交");
										var action = 0;
										$.ajax({
											url : "/yuxibufen",
											type : "POST",
											dataType : "json",
											data : {
												studentid : studentid,
												couname : couname,
												subname : subname,
												action : action
												//studentname:studentname
											},
											success : function(data) {
												showMessage("你已完成预习!");
                                                 $("#button1").attr("disabled",true).removeClass("button1").addClass("button2");  
											}
										})

									}
									//执行ajax
									//sta = false;
								//} else {
									//showMessage("你已完成预习!");
								//}

							})
						} else {
						    $("#button1").attr("disabled",true).removeClass("button1").addClass("button2");
							showMessage("你已完成预习!");

						}
					}
				})

		})	
	</script>

	</head>
	<body>
		<div class="reveal">

			<!-- Any section element inside of this container is displayed as a slide -->
			<div class="slides">

				
				<section>
					<h2><font color="#5C3317">上水箱实验特性介绍</font></h2><br />
					<br />
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---实验要求以及内容均来自过程控制实验室</p>
					
					
				</section>

				<section>
				<h2 align="left"><font color="#5C3317">实验目的</font></h2>
						<ul>
							<li class="fragment">(1)掌握单容水箱的阶跃响应测试的方法，并记录相应液位的响应曲线；</li>
							<li class="fragment">(2)根据实验得到的液位节约响应曲线，用相应的方法确定被测对象的特征参数K，T和传递函数；</li>
							<li class="fragment">(3)掌握同一控制系统采用不同控制方案的实现过程。</li>
						</ul>
				</section>

				<!-- Example of nested vertical slides -->
				
					<section>
						<h2 align="left"><font color="#5C3317">实验设备 </font></h2>
						<ul >
							<li class="fragment" >过控控制综合型实验设备;</li>
							<li class="fragment">实验室中的两台实验平台都可用;</li>
							<li class="fragment">PC机。</li>
						</ul>
					</section>
					<section>
						<h2 align="left"><font color="#5C3317">实验原理</font></h2>
						<p align="left"><font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所谓<strong>单容</strong>指<em>只有一个贮蓄容量</em>。自衡是指对象在扰动作用下，其平衡位置被破坏后，不需要操作人员等干预.依                         靠其自身重新恢复平衡的过程。</font></p>
                                        </section>
                                        <section>
                                        
                                                 <h4 align="left"><font color="#5C3317">下面所示为上水箱对像特性的实验原理</font></h4>
                                                 <img src="img/PPT/yl1.jpg" />
					</section>
					<section>
					    <section>
						<h2 align="left"><font color="#5C3317">实验内容与步骤</font></h2>
						<p align="left"><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本实验采用上水箱和下水箱串联作为被测对象，实验之前先按照要求将容器与电路连接完好，然后按照如下步骤：</font></p>
						<ul>
							<li class="fragment"><code>步骤一：设置变频器频率<font color="#CC0000"><strong>（建议设置30HZ）</strong></font></code></li>
							<li class="fragment"> <code>步骤二：选择实验对象，对于本实验就选择上水箱或者下水箱特性测试实验</code></li>
							<li class="fragment"><code>步骤三：点击”开始实验“按钮，输入”控制"</code></li>
							<li class="fragment"><code>步骤四：待系统达到初始稳态后，输入新的”控制输入“</code></li>
							<li class="fragment"><code>步骤五：在“工艺流程”及“历史曲线”选项卡中观察被控变量的实时值及阶跃曲线</code></li>
							</ul>
							</section>
							<section>
							<ul>
							<li class="fragment"><code>步骤五：在“工艺流程”及“历史曲线”选项卡中观察被控变量的实时值及阶跃曲线</code></li>
		                    <li class="fragment"><code>步骤六：待系统重新达到稳态时，点击“停止实验”按钮</code></li>
		                    <li class="fragment" ><code>步骤七：点击“生成报告”按钮，生成报告</code></li>
		                    <li class="fragment"><code>步骤八：用作图法，作图并计算出特征参数，完成实验报告</code></li>
						</ul>
						</section>
					</section>
					<section>
						<h2 align="left"><font color="#5C3317">实验工艺流程</font></h2>
						<img src="img/PPT/gylc.jpg" />
					</section>
				

				<section>
					<h2 align="left"><font color="#5C3317">实验参考曲线</font></h2>
					<img src="img/PPT/ckqx.jpg" width="760px" height="280px" />
					<div id="div1"><input type="button" class="button1" id="button1" value="完成预习" /></div>
				</section>
				    
				
	</div>

		</div>
		<div class="mask"></div>
        <div class="dialog">
          <div class="title"><img src="../images/close.gif" /><br /></div>
          <div class="content"><img src="../images/warning.png" /><span id="message"></span>
          </div> 
          <div class="bottom">
              <input type="button" id="Dialogbutton" value="确定" class="btn" />
          </div>
        </div> 
		<script src="js/head.min.js"></script>
		<script src="js/reveal.min.js"></script>

		<script>

			Reveal.initialize({
				controls: true,
				progress: true,
				history: true,
				center: true,

				theme: Reveal.getQueryHash().theme, // available themes are in /css/theme
				transition: Reveal.getQueryHash().transition || 'page', // default/cube/page/concave/zoom/linear/none

				// Optional libraries used to extend on reveal.js
				dependencies: [
					{ src: 'lib/js/classList.js', condition: function() { return !document.body.classList; } },
					{ src: 'plugins/markdown/showdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
					{ src: 'plugins/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
					{ src: 'plugins/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } },
					{ src: 'plugins/zoom-js/zoom.js', async: true, condition: function() { return !!document.body.classList; } },
					{ src: 'plugins/notes/notes.js', async: true, condition: function() { return !!document.body.classList; } }
					
				]
			});

		</script>

		
	</body>
</html>

