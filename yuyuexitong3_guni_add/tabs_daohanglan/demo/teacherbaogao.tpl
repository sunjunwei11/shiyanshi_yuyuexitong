<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<title>实验报告</title>
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
		    $("#browser").treeview({
                collapsed: true
              });
			//$("#browser").treeview();
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
	    %for k in shiyan_baogao:
	    <ul>	    
	    <li><span class="folder">{{k}}</span>
	    %for i in shiyan_baogao[k]:
	        <ul>
	        <li><span class="folder">{{i}}</span>
	            <ul>
	               <li><a id={{i}}上水箱 biaozhi="0" href="#javascript:"><span class="file">上水箱</span></a>
	               <li><a id={{i}}单闭环 biaozhi="0" href="#javascript:"><span class="file">单闭环</span></a>
	               <li><a id={{i}}串级控制 biaozhi="0" href="#javascript:"><span class="file">串级控制</span></a>
	               <li><a id={{i}}史密斯 biaozhi="0" href="#javascript:"><span class="file">史密斯</span></a>
	            </ul>
	        </li>
	        </ul>
	    %end
	    </li>
	    </ul>
	    %end
	    </li>

	</ul>
	
	</div>
    <div id="content_show">
	<section>
				<div class="tabs tabs-style-iconbox">
					<nav>
						<ul>
							<!--<li><a href="#section-iconbox-7" style="color:#8E8490;"><span>高成的实验报告<br><span class="tishi_time">(0121211360102)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-7" style="color:#B349BF;"><span>李品达的实验报告<br><span class="tishi_time">(0121211360105)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-7" style="color:#8E8490;"><span>刘安平的实验报告<br><span class="tishi_time">(0121211360106)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-7" style="color:#8E8490;"><span>牛保群的实验报告<br><span class="tishi_time">(0121211360107)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-7" style="color:#8E8490;"><span>成栋梁的实验报告<br><span class="tishi_time">(0121211360110)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-7" style="color:#8E8490;"><span>曾冠雄的实验报告<br><span class="tishi_time">(0121211360112)</span></span></a><div class="tab_close"></div></li>	-->			
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
    <!--<div class="liaotian_content" style="position:absolute;top:75px"><iframe class="liantian_jiemian1" style="display:block" src="baogao_chakan.html"></iframe></div>-->
 	<!--<script src="/tabs_daohanglan/demo/js/cbpFWTabs.js"></script>-->
    <script src="/tabs_daohanglan/demo/js/baogao.js?t=system_time()"></script>
	<script>
	//$(function(){	
	     //$("#browser li:first ul li:first ul li:first a:first").trigger("click");
	//});
	       
           
	</script>
</body>
</html>