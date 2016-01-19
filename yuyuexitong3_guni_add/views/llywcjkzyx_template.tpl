<!DOCTYPE html>
<html lang="en">
	<head>
		
		<meta charset="utf-8">
		<title>流量液位串级控制预习页面</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description" content="A framework for easily creating beautiful presentations using HTML">
		<meta name="author" content="Hakim El Hattab">

		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <script src="js/jquery-2.0.3.min.js"></script>
		<link rel="stylesheet" href="css/reveal.min.css">
		<link rel="stylesheet" href="css/theme/beige.css">
		<link rel="stylesheet" href="css/zenburn.css">
		<style>
		.button1{width:150px;height:40px;border-radius:45px;-moz-border-radius:45px;background-color:#FFFF77;font-size:20px;}
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
		document.write( '<link rel="stylesheet" href="css/print/' + ( window.location.search.match( /print-pdf/gi ) ? 'pdf' : 'paper' ) + '.css" type="text/css" media="print">' );
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
			var studentname='{{user["username"]}}';
			var couname = getquerystring("couname");
			var subname = getquerystring("subname");
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
									//var stytime = 20;
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
												showMessage("你已完成预习！");
                                                $("#button1").attr("disabled",true).removeClass("button1").addClass("button2")
											}
										})

									}
									//执行ajax
									//sta = false;
								//} else {
									//showMessage("你已完成预习！");
								//}

							})
						} else {
							showMessage("你已完成预习！");
                            $("#button1").attr("disabled",true).removeClass("button1").addClass("button2")
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
					<h2><font color="#42426F">串级控制实验介绍</font></h2><br />
					<br />
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---实验要求以及内容均来自过程控制实验室</p>
					
				</section>
				<section>
				<h3><font color="#42426F">实验目的</font></h3>
						<ol>
							 <li class="fragment">通过实验了解水箱液位串级控制系统的组成原理。</li>
                             <li class="fragment">掌握水箱液位串级控制系统调节器参数的整定与投运方法。</li>
                             <li class="fragment">了解阶跃扰动分别作用于副对象和主对象时对系统主控制量的影响。</li>
	                         <li class="fragment">掌握液位串级控制系统采用不同控制方案的实现过程。</li>
						</ol>
				</section>

				<!-- Example of nested vertical slides -->
				
					<section>
						<h3><font color="#42426F">1.串级控制系统的概述</font></h3>
						<ul>
							<li class="fragment"><font size="5px">下图是串级控制系统的方框图。该系统有主，副两个控制回路，主，副调节器相串联工作，其中主调节器有自己独立的给定值R，它的输出m1作为副调节器的给定值，副调节器的输出m2控制执行器，以改变主参数C1.</font></li>
                            <li class="fragment"><img src="img/PPT/ckk.jpg" width="800px"; height="200px";alt="Unicorn"></li>
                            <li class="fragment"><font size="5px">R-主参数的给定值；&nbsp;&nbsp;C1-被控的主参数；&nbsp;&nbsp;C2-副参数；</font></li>
                            <li class="fragment"><font size="5px">f1(t)-作用在主对象上的扰动；&nbsp;&nbsp;f2(t)-作用在副对象上的扰动。</font></li>
						</ul>
					</section>
					<section>
						<h3><font color="#42426F">2.串级控制系统的特点</font></h3>
                       <ul>
                        <li class="fragment"><font>串级控制系统及其副回路对系统控制质量的影响已在有关课程中介绍，在此将有关结论在简单归纳一下：</font></li>
                        <li class="fragment">(1) 改善了过程的动态特性；</li>
                        <li class="fragment">(2) 能及时克服进入副回路的各种二次扰动，提高了系统抗扰动能力；</li>
                        <li class="fragment">(3) 提高了系统的鲁棒性；</li>
                        <li class="fragment">(4) 具有一定的自适应能力。</li>
                        </ul>
					</section>
					<section>
					<h3><font color="#42426F">3.主、副调节器控制规律的选择</font></h3>
                    <ul>
                    <li class="fragment"><font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在串级控制系统中，主，副调节器所起的作用是不同的。主调节器起定值控制作用，它的控制任务是使主参数等于给定值（无余差），故一般宜采用PI或PID调节器。由于副回路是一个随动系统，它的输出要求能快速，准确的复现主调节器输出信号的变化规律，对副参数的动态性能和余差无特殊的要求，因而副调节器可采用P或PI调节器。</font></li>
                   </ul>
				   </section>
				   <section>
                   <h3><font color="#42426F">4.主副调节器正反作用方式的选择</font></h3>
                    <ul>
                    <li class="fragment"><font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正如单回路控制系统设计中所述，要使一个过程控制系统能正常工作，系统必须采用负反馈。对于串级控制系统来说，主，副调节器的正，反作用方式的选择原则是使整个系统构成负反馈系统，即其主通道各环节放大系数记性乘积必须为正值。</font></li>
                    <li class="fragment"><font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;各环节的放大系数极性是这样规定的：当测量值增加，调节器的输出也增加，则调节器的放大系数Kc为负（即正作用调节器），反之，Kc为正（即反作用调节器）。</font></li>
</ul>

					</section>
					<section>
					<section>
					<h3><font color="#42426F">5.串级控制系统的整定方法</font></h3>
                     <ul>
<li  class="fragment"><font size="6px">在工程实践中，串级控制系统常用的整定方法有以下三种：</font></li>
<li  class="fragment"><font color="#8E2323 "><strong>逐步逼近法:</strong></font></li>
<li  class="fragment"><font size="6px">所谓逐步逼近法，就是在主回路断开的情况下，按照单回路的整定方法求取副调节器的整定参数，然后将副调节器的参数设置在所求的数值上，使主回路闭合，按单回路整定方法求取主调节器的整定参数。而后，将主调节器参数设在所求得的数值上，在进行整定，求取第二次副调节器的整定参数值，然后再整定主调节器。以此类推，逐步逼近，直至满足质量指标要求为止。</font></li>
</ul>
</section>
<section>
<ul>
<li  class="fragment"><font color="#8E2323 ">两步整定法:<strong></strong></font></li>
<li  class="fragment"><font size="5px">两步整定法就是第一步整定副调节器参数，第二步整定主调节器参数</font></li>
<li  class="fragment"><font size="5px">整定的具体步骤为：</font></li>
<li class="fragment"><font size="5px">（1）在工况稳定，主回路闭合，主，副调节器都在纯比例作用条件下，主调节器的比例度置于100%，然后用单回路控制系统的衰减（如4:1）曲线法来整定副回路。记下相应的比例度δ2s和振荡周期T2s。</font></li>
<li class="fragment"><font size="5px">（2）将副调节器的比例度置于所求的δ2s值上，且吧副回路作为主回路中的一个环节，用同样的方法整定主回路，求取主回路的比例度δ1s和振荡周期T1s。</font></li>
<li class="fragment"><font size="5px">（3）根据求取的δ1s，T1s和δ2s，T2s值，按单回路系统衰减曲线法整定公式计算主，副调节器的比例度δ，积分时间Ti和积分时间Td的数值。</font></li>
<li class="fragment"><font size="5px">（4）按“先副后主”，“先比例后积分最后微分”的整定程序，设置主，副调节器的参数，在观察过渡过程曲线，必要时进行适当调整，直到过程的动态品质达到满意为止。</font></li>
</ul>
</section>
<section>
<ul>
<li class="fragment"><font color="#8E2323 "><strong>一步整定法:</strong></font></li>
<li class="fragment"><font size="5px">由于两步整定法寻求两个4:1的衰减过程，这是一件很花时间的事。因而对两步整定法做了简化，提出了一步整定法。所谓一步整定法，就是根据经验先确定副调节器的参数，然后将副回路作为主回路的一个环节，按单回路反馈控制系统的整定方法整定主调节器的参数。</font></li>
<li class="fragment"><font size="5px">具体的整定步骤为：</font></li>
<li class="fragment"><font size="5px">（1）在工况稳定，系统为纯比例作用的情况下，根据K02/δ2=0.5这一关系式，通过副过程放大系数K02，求取副调节器的比例放大系数δ2或按经验选取，并将其设置在副调节器上。</font></li>
<li class="fragment"><font size="5px">（2）按照单回路控制系统的任一种参数整定方法来整定主调节器的参数。</font></li>
<li class="fragment"><font size="5px">（3）改变给定值，观察被控制量的响应曲线。根据主调节器放大系数K1和副调节器放大系数K2的匹配原理，适当调整调节器的参数，使主参数品质指标最佳。</font></li>
<li class="fragment"><font size="4px" color="#8E2323"><b>如果出现较大的振荡现象，只要加大主调节器的比例度δ或增大积分时间常数Ti，即可得到改善。</b></font></li>
</ul>
					</section>
					</section>
					<section>
					<section>
						<h3><font color="#42426F">实验步骤：</font></h3>

    <ul>
         <li class="fragment" style="display:block;background-color:#FFFF77;"><font size="5px">步骤一：设置变频器频率（建议设置30HZ）</font></li>
         <li class="fragment"><font size="5px">步骤二：选择实验对象，对于本实验就选择流量液位串级实验</font></li>
		 <li class="fragment" style="display:block;background-color:#FFFF77;"><font size="5px">步骤三：点击“开始实验”按钮，输入“控制”</font></li>
		 <li class="fragment"><font size="5px">步骤四：待系统达到初始稳态后，输入新的“控制输入”</font></li>
		 <li class="fragment" style="display:block;background-color:#FFFF77;"><font size="5px">步骤五：在“工艺流程”及“历史曲线”选项卡中观察被控变量的实时值及阶跃曲线</font></li>
		 <li class="fragment"><font size="5px">步骤六：待系统重新达到稳态时，点击“停止实验”按钮</font></li>
		 <li class="fragment" style="display:block;background-color:#FFFF77;"><font size="5px">步骤七：点击“生成报告”按钮，生成报告</font></li>
		 <li class="fragment"><font size="5px">步骤八：用作图法，作图并计算出特征参数，完成实验报告</font></li>
            </ul>
						</section>
					</section>
					<section>
						<h2><font color="#42426F">实验工艺流程</font></h2>
						<img src="img/PPT/gylc.jpg" />
					</section>
				

				<section>
					<h2><font color="#42426F">实验参考曲线</font></h2>
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
		<script src="js/reveal.min.js"></script>

		<script>

			Reveal.initialize({
				controls: true,
				progress: true,
				history: true,
				center: true,

				theme: Reveal.getQueryHash().theme, // available themes are in /css/theme
				transition: Reveal.getQueryHash().transition || 'concave', // default/cube/page/concave/zoom/linear/none

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
