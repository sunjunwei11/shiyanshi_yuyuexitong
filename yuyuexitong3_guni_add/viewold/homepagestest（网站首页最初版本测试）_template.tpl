<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="ui-mobile" lang="en">
	<head>
		<meta charset="utf-8"/>

		<!-- desktop -->
		<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
		<script src="js/jquery-ui-1.8.2.custom.min.js" type="text/javascript"></script>
		<link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
		<script src="js/script.js" type="text/javascript"></script>
		<link href="css/core-layout.css" media="screen and (min-width: 641px)" rel="stylesheet" type="text/css"/>
		<link href="css/core-identity.css" media="screen and (min-width: 641px)" rel="stylesheet" type="text/css"/>
		<link href="css/core-print.css" media="print" rel="stylesheet" type="text/css"/>

		<script src="js/jquery.wijmo-open.all.2.0.8.min.js" type="text/javascript"></script>
		<link href="css/calendar.css" rel="stylesheet" type="text/css"/>
		<script src="js/twisty-plugin-1.0/jquery.twisty.js" type="text/JavaScript"></script>
		<link href="js/twisty-plugin-1.0/twisty.css" rel="stylesheet" type="text/css"/>
		<!--jQuery UI Dialog - Modal form-->
		<link rel="stylesheet" href="js/jquery-ui-1.11.0-beta.2/jquery-ui.css">
		<script src="js/jquery-1.11.0-beta2.js"></script>
		<script src="js/jquery-ui-1.11.0-beta.2/jquery-ui.js"></script>
		<link rel="stylesheet" href="css/style.css">
		<style>
			.ui-dialog .ui-state-error {
				padding: .3em;
			}
			.no-close .ui-dialog-titlebar-close {
				display: none;
			}
		</style>
		<script>
			$(function() {
				var dialog, form;

				var name = $("#name"), position = $("#position"), password = $("#password"), allFields = $([]).add(name).add(position).add(password), tips = $(".validateTips");
                function checkuser(){
                	userid = name.val()
							password = password.val()
							position = position.val()
							$.ajax({
								url : "/resign",
								type : "post",
								data : {
									userid : userid,
									password : password,
									position : position
								},
								datatype : "json",
								async : false,
								success : function(data) {
									if (data["meg"]) {
										alert(data["meg"])
										$("#name").val(userid)
										$("#password").val("")

									} else {
										alert("hehehe")
										if (data["position"] == "学生") {
											window.location.href = "/studentstest"
										} else if (data["position"] == "老师") {
											window.location.href = "/teachersettest"
										} else {
											window.location.href = "/managertest"
										}

									}

								}
							})

							

                }
				dialog = $("#dialog-form").dialog({
					dialogClass : "no-close",
					autoOpen : false,
					height : 300,
					width : 350,
					modal : true,
					buttons : {
						取消 : function() {
							dialog.dialog("close");
						},
						登陆 : function() {
							userid = $("#name").val()
							password =$("#password").val()
							position = $("#position").val()
							$.ajax({
								url : "/resign",
								type : "post",
								data : {
									userid : userid,
									password : password,
									position : position
								},
								datatype : "json",
								async : false,
								success : function(data) {
									if (data["meg"]) {
										alert(data["meg"])
										$("#name").val(userid)
										$("#password").val("")

									} else {
										alert("hehehe")
										if (data["position"] == "学生") {
											window.location.href = "/studentsys"
										} else if (data["position"] == "老师") {
											window.location.href = "/teachersys"
										} else {
											window.location.href = "/managersys"
										}

									}

								}
							})

							//$(this).dialog("close");

						}
					},
					
				});

				$("#create-user").click(function() {
					$("#dialog-form").dialog("open");
				});
			});
		</script>
		<link href="css/core-homepageElements-task-portal.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript"></script>
	</head>
	<body>
		<div id="mainwrapper">
			<div id="homecontent-top">
				<h1>武汉理工大学自动化学院</h1>
				<h4>——过程控制实验室</h4>
			</div>

			<div id="contentwrapper">

				<div id="homecontent-sharebar">

				</div>

				<div id="task-bar">
					<div class="item" id="meet-scientists">
						<h2><a >Meet Scientists</a></h2>
						<a ><img alt="Amit Misra" border="0" height="65%" src="images/xtransparent.gif" width="100%"/></a>
						<h3><a >Our people, their research</a></h3>
					</div>
					<div class="item nyroModal-video" id="test-drive">
						<h2><a >Test Drive CINT</a></h2>
						<a><img alt="cint" border="0" height="65%" src="images/xtransparent.gif" width="100%"/></a>
						<h3><a>Virtual tour of CINT facilities</a></h3>
					</div>
					<div class="item" id="get-science">
						<h2><a>Get Science</a></h2>
						<a ><img alt="cint" border="0" height="65%" src="images/xtransparent.gif" width="100%"/></a>
						<h3><a>70+ years of discovery science</a></h3>
					</div>
					<div class="item" id="careers">
						<h2><a>Jumpstart Career</a></h2>
						<a ><img  id="create-user" alt="Nina" border="0" height="65%" src="images/xtransparent.gif" style="transform" width="100%"/></a>
						<h3><a >Work and Life Balance</a></h3>
						<div id="dialog-form" title="用户登陆">
							<form>
								<fieldset>
									<label for="name">Name</label>
									<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all">
									<label for="password">Password</label>
									<input type="password" name="password" id="password"  class="text ui-widget-content ui-corner-all">
									<label for="position">类别</label>
									<select name="position" id="position" class="text ui-widget-content ui-corner-all">
										<option value="学生">学生</option>
										<option value="老师">老师</option>
										<option value="管理员">管理员</option>
									</select>
									<!--允许利用键盘的enter键提交-->
									<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
								</fieldset>
							</form>
						</div>

					</div>
				</div>
				<div class="clearBoth"></div>
			</div>
			<div id="accordion">
				<div class="navbarwrapper">
					<div class="navbarcontainer">
						<div class="navitemwrapper">
							<header>
								<nav>
									<a href="" title="Features">Features</a>
									<div class="navbarsummary">
										Scientists, Space, Supercomputing, Sustainability and more
									</div>
								</nav>
							</header>
						</div>
					</div>
				</div>
				<div class="content">
					<div class="accordion-panel">

						<ul class="additional-nav">
							<li>
								<p>
									70 Years of Innovations
								</p>
							</li>
							<li>
								<p>
									Science Digests
								</p>
							</li>
							<li>
								<p>
									Career Options
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="navbarwrapper">
					<div class="navbarcontainer">
						<div class="navitemwrapper">
							<header>
								<nav>
									<a href="" title="How We Serve The Nation">How We Serve The Nation</a>
									<div class="navbarsummary">
										Solving National Security Challenges Through Scientific Excellence
									</div>
								</nav>
							</header>
						</div>
					</div>
				</div>
				<div class="content">
					<div class="accordion-panel">
						1111111111
					</div>

				</div>
				<div class="navbarwrapper">
					<div class="navbarcontainer">
						<div class="navitemwrapper">
							<header>
								<nav>
									<a href="" title="News, Video, Stay Connected ">News, Video, Stay Connected </a>
									<div class="navbarsummary">
										Updates: Social Media, Video, Twitter, Press Releases, Publications
									</div>
								</nav>
							</header>
						</div>
					</div>
				</div>
				<div class="content">
					2222222
				</div>
				<div class="navbarwrapper">
					<div class="navbarcontainer">
						<div class="navitemwrapper">
							<header>
								<nav>
									<a href="" title="Visiting Los Alamos Lab">Visiting Los Alamos Lab</a>
									<div class="navbarsummary">
										Visiting us? Moving To Los Alamos? Maps, Badging, Virtual Tours, Housing
									</div>
								</nav>
							</header>
						</div>
					</div>
				</div>
				<div class="content">
					333333333333333333333333333333
				</div>
			</div>
			<div id="dibu" style="background:#3FF;height:150px;">
				版权信息部分
			</div>

		</div>
	</body>
</html>