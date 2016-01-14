<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<title>聊天列表</title>
	<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
	<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
	<meta name="author" content="Codrops" />
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="/tabs_daohanglan/demo/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="/tabs_daohanglan/demo/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="/tabs_daohanglan/demo/css/tabs.css?t=system_time()" />
	<link rel="stylesheet" type="text/css" href="/tabs_daohanglan/demo/css/tabstyles.css" />
    <style>
    #browser li a {
		color:#333;
		}
	#browser li a:hover {
		color:#F00;
		}
	#browser li a:active {
		color:#636;
		}
	</style>
  	<script src="js/modernizr.custom.js"></script>
    
    <!--tabs插件和导航栏插件分隔符 -->	
	<link rel="stylesheet" href="/tabs_daohanglan/jquery.treeview.css" />
	<link rel="stylesheet" href="/tabs_daohanglan/demo/screen.css?t=system_time()" />
	
	<script src="/tabs_daohanglan/lib/jquery.js" type="text/javascript"></script>
	<!--<script src="../lib/jquery.cookie.js" type="text/javascript"></script>-->
	<script src="/tabs_daohanglan/jquery.treeview.js" type="text/javascript"></script>
	<script src="/tabs_daohanglan/jquery.treeview.edit.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		$(function() {
			$("#browser").treeview();
			$("#add").click(function() {
				var branches = $( 
					"<li><span class='file'>gg</span></li>" + 
					"<li><span class='file'>dd</span></li>").appendTo("#folder21");
				$("#browser").treeview({
					add: branches
				});
				branches = $("<li class='closed'><span class='folder'>New Sublist</span><ul><li><span class='file'>Item1</span></li><li><span class='file'>Item2</span></li></ul></li>").prependTo("#folder21");
				$("#browser").treeview({
					add: branches
				});
			});
			/*$("#browser").bind("contextmenu", function(event) {
				if ($(event.target).is("li") || $(event.target).parents("li").length) {
					$(event.target).parents("li").filter(":first").remove();
					$("#browser").treeview();
					//$("#browser").treeview({
						//remove: $(event.target).parents("li").filter(":first")
					//});
					return false;
				}
			});*/
		})
		
	</script>
	
	</head>
	<body>
	
	<!--<h1 id="banner">讨论组列表</h1>-->
	<div id="main" style="min-height:875px;">		
	
	<ul id="browser" class="filetree">
	    <li><span class="folder">学生列表</span>
	    <ul>
	    
	    <li><span class="folder">自动化1201班</span>
	    <ul>

	    <li><a><span class="file">高成</span></a></li>
	    <li><a><span class="file">李品达</span></a></li>
	    <li><a><span class="file">刘安平</span></a></li>
	    <li><a><span class="file">牛保群</span></a></li>
	    <li><a><span class="file">成栋梁</span></a></li>
	    <li><a><span class="file">曾冠雄</span></a></li>
	    <li><a><span class="file">蒋睿</span></a></li>
	    <li><a><span class="file">朱鑫</span></a></li>
	    <li><a><span class="file">牛怡青</span></a></li>
	    <li><a><span class="file">梅枭央</span></a></li>
	    <li><a><span class="file">刘欣宇</span></a></li>
	    <li><a><span class="file">张宗海</span></a></li>
	    <li><a><span class="file">谢阳</span></a></li>
	    <li><a><span class="file">袁韬</span></a></li>
	    <li><a><span class="file">吴培达</span></a></li>
	    <li><a><span class="file">彭方成</span></a></li>
	    <li><a><span class="file">许天辉</span></a></li>
	    <li><a><span class="file">赵明</span></a></li>
	    <li><a><span class="file">周杨</span></a></li>
	    <li><a><span class="file">张涛</span></a></li>
	    <li><a><span class="file">舒佳康</span></a></li>
	    <li><a><span class="file">胡芳香</span></a></li>
	    <li><a><span class="file">刘子伟</span></a></li>
	    <li><a><span class="file">王涛</span></a></li>
	    <li><a><span class="file">李天德</span></a></li>
	    <li><a><span class="file">朱剑怀</span></a></li>
	    <li><a><span class="file">张生辉</span></a></li>
	    <li><a><span class="file">田梓元</span></a></li>
	    <li><a><span class="file">陈冠余</span></a></li>
	    <li><a><span class="file">陈李俊</span></a></li>
	    <li><a><span class="file">李培鹤</span></a></li>
	    <li><a><span class="file">孟雪平</span></a></li>
	    </ul>
	    </li>
	    </ul>
	    </li>
		<li><span class="folder">自动化1202班</span>
            <ul>
            </ul>
		</li>
	</ul>
	
	</div>
    <div id="content_show">
	<section>
				<div class="tabs tabs-style-iconbox">
					<nav>
						<ul>
							<li><a href="#section-iconbox-7" style="color:#8E8490;"><span>高成的实验报告<br><span class="tishi_time">(0121211360102)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-7" style="color:#B349BF;"><span>李品达的实验报告<br><span class="tishi_time">(0121211360105)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-7" style="color:#8E8490;"><span>刘安平的实验报告<br><span class="tishi_time">(0121211360106)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-7" style="color:#8E8490;"><span>牛保群的实验报告<br><span class="tishi_time">(0121211360107)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-7" style="color:#8E8490;"><span>成栋梁的实验报告<br><span class="tishi_time">(0121211360110)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-7" style="color:#8E8490;"><span>曾冠雄的实验报告<br><span class="tishi_time">(0121211360112)</span></span></a><div class="tab_close"></div></li>				
						</ul>
					</nav>
					<!--<div class="content-wrap">
						<section id="section-iconbox-1"><p></p></section>
						<section id="section-iconbox-2"><p></p></section>
						<section id="section-iconbox-3"><p></p></section>
						<section id="section-iconbox-4"><p></p></section>
						<section id="section-iconbox-5"><p></p></section>
                        <section id="section-iconbox-6"><p></p></section>
                        <section id="section-iconbox-7"><p></p></section>
					</div>-->
 
				</div><!-- /tabs -->
	</section>
    </div>
    <div class="liaotian_content" style="position:absolute;top:75px"><iframe class="liantian_jiemian1" style="display:block" src="baogao_chakan.html"></iframe></div>
 	<div style="color:red;font-size:27px;margin-top:5px;background-color:#C9D4D1;"> &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;评定分数:<input type="text" name="11" style="width:100px;" />
 	     <input type="submit" value="提交" />
 	</div>
 	<!--<script src="/tabs_daohanglan/demo/js/cbpFWTabs.js"></script>-->
    <script src="/tabs_daohanglan/demo/js/daohang.js?t=system_time()"></script>
	<script>
	$(function(){	
	     $("#browser li:first ul li:first ul li:first a").trigger("click");
	});
	       
           
	</script>
</body>
</html>