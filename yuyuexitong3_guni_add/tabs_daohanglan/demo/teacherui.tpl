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
	<div id="main">		
	
	<ul id="browser" class="filetree">
	    <li><span class="folder">过程控制</span>
	    <ul>
	    %for k in Usersgroup_shiyan_date:	    
	    <li><span class="folder">{{wenjianshu_dict[k][0]}}</span><!-- 一个大类，例如过程控制下的上水箱对象特性 -->
	    <ul>
	    %for i in Usersgroup_shiyan_date[k]:
	    <li><a  id={{i}} biaozhi="0" href="#javascript:"><span class="file">{{wenjianshu_dict[k][1]}}<br><span class="tishi_time">({{Usersgroup_shiyan_date[k][i]}})</span></span></a></li><!-- 上水箱对象特性下的所有子实验 -->
	    %end
	    </ul>
	    </li>
	    %end
	    </ul>
	    </li>
		<li><span class="folder">计算机仿真技术</span>
            <ul>
            </ul>
		</li>
		<li><span class="folder">微机原理</span>
        <ul>
        </ul>
		</li>
		<li><span class="folder">电机与拖动</span>
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
							<!--<li><a href="#javascript：" ><span>上水箱讨论组<br><span class="tishi_time">(2015-11-12 8:00-9:30)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#" ><span>上水箱讨论组<br><span class="tishi_time">(2015-11-12 8:00-9:30)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-3" ><span>史密斯讨论组<br><span class="tishi_time">(2015-11-12 8:00-9:30)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-4" ><span>串级讨论组<br><span class="tishi_time">(2015-11-12 8:00-9:30)</span></span></a><div class="tab_close"></div></li>
							<li><a href="#section-iconbox-5" ><span>串级讨论组<br><span class="tishi_time">(2015-11-12 8:00-9:30)</span></span></a><div class="tab_close"></div></li>
                            <li><a href="#section-iconbox-6" ><span>单闭环讨论组<br><span class="tishi_time">(2015-11-12 8:00-9:30)</span></span></a><div class="tab_close"></div></li>-->
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
 	<!--<script src="/tabs_daohanglan/demo/js/cbpFWTabs.js"></script>-->
    <script src="/tabs_daohanglan/demo/js/daohang.js?t=system_time()"></script>
	<script>
	$(function(){	
	     $("#browser li:first ul li:first ul li:first a").trigger("click");
	});
	       
           
	</script>
</body>
</html>