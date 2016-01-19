<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>液位单闭环控制实验预习页面</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description" content="A framework for easily creating beautiful presentations using HTML">
		<meta name="author" content="Hakim El Hattab">

		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <script src="js/jquery-2.0.3.min.js"></script>
		<link rel="stylesheet" href="css/reveal.css">
		<link rel="stylesheet" href="css/theme/league.css" id="theme">
		<link rel="stylesheet" href="css/zenburn.css">
		<style>
		.button1{width:150px;height:40px;border-radius:45px;-moz-border-radius:45px;background-color:#696969;font-size:20px;}
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
			
			%user = session.get("user")
			var studentid = '{{user["userid"]}}';
			//alert(studentid)
			var studentname='{{user["username"]}}';
			//alert(studentname)
			var couname = getquerystring("couname");
			//alert(couname)
			var subname = getquerystring("subname");
			//alert(subname)
			var sta = true;
        $(function() {
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
					async : false,
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
							//alert("继续进行预习")
							$("#button1").click(function() {
								//if (sta == true) {
									//var stytime = 20;
									//alert("sta=false")
									var date2 = new Date();
									var date3 = date2 - date1;
									if (date3 < 36) {
										showMessage("预习时长未满，请认真预习！");
									} else {
										//alert("准备提交")
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
					<h2><font color="#009966">液位单闭环实验介绍</font></h2><br />
					<br />
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---实验要求以及内容均来自过程控制实验室</p>
					
				</section>

				<section>
				<h2 align="left"><font color="#009966">实验目的</font></h2>
						<ol>
							<li class="fragment"><code>通过实验掌握单回路控制系统的构成</code></li>
							<li class="fragment">构成单回路液位控制系统，并应用临界比例度法、阶跃反应曲线法和衰减曲线法整定单回路控制系统的PID参数</li>
							<li class="fragment">熟悉PID参数对控制系统质量指标的影响，用调节器仪表进行PID参数的自整定和自动控制的投运。</li>
						</ol>
				</section>

				<!-- Example of nested vertical slides -->
				
					<section>
						<h2><font color="#009966">1.单回路控制系统的概述</font></h2>
						<ol>
							<li class="fragment"><font>下图为单回路控制系统方框图的一般形式，它是由<strong><font color="#009966">被控对象，执行器，调节器和测量变送器</font></strong>组成的一个单闭环控制系统。系统的给定值是某一定值，要求系统的被控制量稳定至给定量。由于这种<strong>系统结构简单，性能较好，调试方便</strong>等优点，故在工业生产中已被广泛应用。</font></li>
							<li class="fragment"><img src="img/PPT/dhlkt.jpg" width="700px"; height="260px" alt="Unicorn" /></li>
						</ol>
					</section>
					<section>
					<section>
						<h2><font color="#009966">2.干扰对系统性能的影响</font></h2>
						
                         <ul>
                            <li class="fragment"><font color="#009966">a.干扰通道的放大系数，时间常数及纯滞后对系统的影响</font></li>
							<li class="fragment"><font>干扰通道的放大系数Kf会影响干扰加载系统中的幅值。若系统是有差系统，则干扰通道的放大系数愈大，系统的静差也就愈大</font></li>
							<li class="fragment" style="display:block;background-color:#A4CFD5;"><font color="#42426F ">如果干扰通道是一惯性环节，令时间常数为Tf，则阶跃扰动通过惯性环节后，其过渡过程的动态分量被滤波二幅值变小。即时间常数Tf越大，则系统的动态偏差就愈小。通常干扰通道中还会有纯滞后环节，它使被调参数的响应时间滞后一个τ值，但不会影响系统的调节质量。</font></li>
						</ul>
						</section>
						<section>
						<ul>
		                    <li class="fragment"><font color="#009966">b.干扰进入系统中的不同位置</font></li>
		                    <li class="fragment" ><code>复杂是生产过程往往有多个干扰量，作用在系统中的不同位置所产生的静差是不一样的。对扰动产生影响的仅是扰动作用点前的那些环节。</code></li>
		                    <li class="fragment"><img src="img/PPT/rd.jpg" width="500px"; height="300px";alt="Unicorn" / ></li>
						</ul>
					</section>	
					</section>
					<section>
					<section>
						<h2><font color="#009966">3.控制规律的选择</font></h2>
						<p align="left">&nbsp;&nbsp;&nbsp;PID控制规律及其对系统控制质量影响作以下的一些规律：</p>
						<p><font color="#009966"><srtong>&nbsp;&nbsp;&nbsp;比例（P）环节</strong></font></p>
						<ul>
							<li class="fragment"><code>纯比例调节器是一种最简单的调节器，它对控制作用和扰动作用的响应都很快。由于比例调节只有一个参数，所以整定很方便。这种调节器的主要缺点是系统有警察存在。其传递函数为：</code></li>
							<li class="fragment"><font color="#009966"><strong>Gc（s）=Kp=1/δ</font></strong></li>
							<li class="fragment"><code>式中Kp为比例系数，δ为比例带。</code></li>
						</ul>	
						</section>
						<section>
							<p><font color="#009966">&nbsp;&nbsp;&nbsp;比例积分（PI）调节</font></p>
						<ul>
							<li class="fragment">PI调节器就是利用P调节快速抵消干扰的影响，同时利用I调节消除残差，但I调节会降低系统的稳定性，这种调节器在过程控制中的应用最多的一种调节器。其中传递函数为：</li>
							<li class="fragment"><font color="#009966"><strong>Gc（s）=Kp(1+1/Tis)=1/δ(1+1/1/Tis)</strong></font></li>
							<li class="fragment">式中Ti为微分时间。</li>
						</ul>
						</section>
					<section>
						<p><font color="#009966"><srtong>&nbsp;&nbsp;&nbsp;比例微分（PD）环节</strong></font></p>
						<ul>
		                    <li class="fragment"><code>这种调节器由于有微分的超前作用，能增加系统的稳定度，加快系统的调节过程，减小动态和静态误差，但微分抗干扰能力较差，切微分过大，易导致调节阀动作向两端饱和。因此一般不用于流量和液位控制系统。PD调节器的传递函数为：</code></li>
		                    <li class="fragment" ><font color="#009966"><strong>Gc(s)=Kp(1+Td)=1/δ(1+Td)</strong></font></li>
							<li class="fragment">式中Td为微分时间。</li>
						</ul>	
							</section>
							<section>
							
		                    <p><font color="#009966"><srtong>&nbsp;&nbsp;&nbsp;比例积分微分（PID）环节</strong></font></p>
							<ul>
							<li class="fragment">PID是常规调节器重性能最好的一种调节器。由于它具有各类调节器的特点，因此使系统具有更高的控制质量。它的传递函数为：</li>
					        <li class="fragment" ><font color="#009966"><strong>Gc(s)=Kp(1+1/Tis+Tds)=1/δ(1+1/Tis+Tds)</strong></font></li>
		                    <li class="fragment">下图表示了同一对象在相同阶跃扰动下，采用不同控制规律时具有相同衰减率的响应过程。</li>
							<li class="fragment"><img src="img/PPT/qx.png" width="400px"; height="300px";alt="Unicorn" / ></li>
							</ul>
					</section>
					</section>
					
				

				<section>
					<h2><font color="#009966">&nbsp;&nbsp;&nbsp;阶跃响应曲线法：</font></h2>
					 <ul class="build fade">
         <li class="fragment" style="display:block;background-color:#009966;">步骤一：设置变频器频率（建议设置30HZ）</li>
         <li class="fragment">步骤二：选择实验对象，对于本实验就选择液位单闭环实验</li>
		 <li class="fragment" style="display:block;background-color:#009966;">步骤三：点击”开始实验“按钮，输入”控制“</li>
		 <li class="fragment">步骤四：待系统达到初始稳态后，输入新的”控制输入“</li>
		 <li style="display:block;background-color:#009966;">步骤五：在“工艺流程”及“历史曲线”选项卡中观察被控变量的实时值及阶跃曲线</li>
		 <li class="fragment">步骤六：待系统重新达到稳态时，点击“停止实验”按钮</li>
		 <li class="fragment" style="display:block;background-color:#009966;">步骤七：点击“生成报告”按钮，生成报告</li>
		 <li class="fragment">步骤八：用作图法，作图并计算出特征参数，完成实验报告</li>
            </ul>
				</section>
				<section>
						<h2><font color="#009966">实验工艺流程</font></h2>
						<img src="img/PPT/gylc.jpg" ;alt="Unicorn" />
					</section>
				

				<section>
					<h2><font color="#009966">实验参考曲线</font></h2>
					<p>----具体参见实验课上老师给出的参考曲线</p>
					<div id="div1"><input type="button" id="button1" class="button1" value="完成预习" /></div>
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
		<script src="js/reveal.js"></script>

		<script>

			Reveal.initialize({
				controls: true,
				progress: true,
				history: true,
				center: true,

				theme: Reveal.getQueryHash().theme, // available themes are in /css/theme
				transition: Reveal.getQueryHash().transition || 'zoom', // default/cube/page/concave/zoom/linear/none

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
