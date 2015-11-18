<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>jQuery validation plug-in - main demo</title>
		<script src="/js/jquery-1.10.2.js"></script>
		<link rel="stylesheet" type="text/css" href="/js/jquery-ui-1.8.22.css" />
		<link rel="stylesheet" type="text/css" href="/js/jquery.ptTimeSelect.css" />
		<script type="text/javascript" src="/js/jquery.ptTimeSelect.js"></script>

		<link rel="stylesheet" href="/js/jquery-ui-1.11.0/jquery-ui.css">
		<script src="/js/jquery-ui-1.11.0/jquery-ui.js"></script>
		<link rel="stylesheet" href="/css/style.css">

		<link rel="stylesheet" href="/js/zTree_v3/css/demo.css" type="text/css">
		<link rel="stylesheet" href="/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<!--<script type="text/javascript" src="/js/zTree_v3/js/jquery-1.4.4.min.js"></script>-->
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.exedit-3.5.js"></script>
		<!--<link rel="stylesheet" href="/js/validate/css/screen.css">
		<script src="/js/validate/jquery.js"></script>-->
		<script src="/js/validate/jquery.validate.js"></script>
		<!--<script>
		$.validator.setDefaults({
		submitHandler : function() {
		alert("submitted!");
		}
		});

		$().ready(function() {

		$("#signupForm").validate({
		rules : {
		firstname : "required",
		lastname : "required",
		username : {
		required : true,
		minlength : 2
		},
		password : {
		required : true,
		minlength : 5
		},
		confirm_password : {
		required : true,
		minlength : 5,
		equalTo : "#password"
		},
		email : {
		required : true,
		email : true
		},
		topic : {
		required : "#newsletter:checked",
		minlength : 2
		},
		agree : "required"
		},
		messages : {
		firstname : "Please enter your firstname",
		lastname : "Please enter your lastname",
		username : {
		required : "Please enter a username",
		minlength : "Your username must consist of at least 2 characters"
		},
		password : {
		required : "Please provide a password",
		minlength : "Your password must be at least 5 characters long"
		},
		confirm_password : {
		required : "Please provide a password",
		minlength : "Your password must be at least 5 characters long",
		equalTo : "Please enter the same password as above"
		},
		email : "Please enter a valid email address",
		agree : "Please accept our policy"
		}
		});

		});
		</script>-->
		<script>
			$(document).ready(function() {
				$("#form2").validate({
					/*自定义验证规则*/
					rules : {
						Newcourse2 : "required",
						Newexperiments2 : "required",
						Newcontent2 : "required",
						datepicker3 : "required",
						PtTime1 : {
							required : true,
						},
						PtTime2 : {
							required : true,
						},
						classlist : {
							required : true,
						},
						citySel2 : {
							required : true,
						},

					},
					messages : {
						Newcourse2 : "Please enter your firstname",
						Newexperiments2 : "Please enter your lastname",
						Newcontent2 : "111",
						datepicker3 : "222",
						PtTime1 : "111",
						PtTime2 : "Please enter a valid email address",
						classlist : "Please accept our policy",
						citySel2 : "333"
					}
				});
				$("#saveTappoint1").submit(function() {
				

					var appointinf = {};
					/*验证功能*/
					//是否要验证老师指定的实验日期在该实验设置的实验时间段内（验证：则只能在设置的时间段内实验，超期不能做；不验证：则可以方便超过时间的同学完成实验。）
					//是否要验证老师指定的人员数应<=设置课程实验的的最大实验人数（验证：规定实验人数后就不能改变，不验证：方便没有做实验的人数比最大容量人数多一两个，具有较大的随意性）
					//验证开始时间在结束时间之前
					var aa = $("#PtTime1").val(), bb = $("#PtTime2").val(), a1, b1;
					alert(aa)
					aa = aa.split(" ");
					//alert(aa[1])
					bb = bb.split(" ");
					a1 = aa[0].split(":");
					//alert(a1[0])
					b1 = bb[0].split(":");
					a1[0] = parseInt(a1[0]);
					//alert(a1[0])
					a1[1] = parseInt(a1[1]);
					//alert(a1[1])
					b1[0] = parseInt(b1[0]);
					//alert(b1[0])
					b1[1] = parseInt(b1[1]);
					//alert(b1[1])
					//alert(a1[0]<b1[0])
					//alert(a1[1]<b1[1])
					//alert((8 <= a1[0])&&((a1[0] < b1[0])||(a1[0]==b1[0]&&a1[1]<b1[1])))
					//alert((b1[0]<=9)&&((a1[0] < b1[0])||(a1[0]==b1[0]&&a1[1]<b1[1])))
					if (aa[1] > bb[1]) {
						alert("111请注意时间先后性-请设置时间在8：00 AM 到9:55 PM")
						$("#PtTime1").val("");
						$("#PtTime2").val("");
					} else if (aa[1] == 'AM' && bb[1] == 'AM') {
						if (((8 <= a1[0]) && (a1[0] < b1[0])) || (8 <= (a1[0] == b1[0]) && a1[1] < b1[1])) {
							appointinf["StartTime"] = Timechange($("#PtTime1").val());
							appointinf["EndTime"] = Timechange($("#PtTime2").val());
							alert("AM11")

						} else {
							alert("222请注意检查时间是否在8:00AM到9:55PM之间")
							$("#PtTime1").val("");
							$("#PtTime2").val("");
						}
					} else if (aa[1] == 'PM' && bb[1] == 'PM') {
						if ((b1[0] <= 9) && ((a1[0] < b1[0]) || (a1[0] == b1[0] && a1[1] < b1[1]))) {
							appointinf["StartTime"] = Timechange($("#PtTime1").val());
							appointinf["EndTime"] = Timechange($("#PtTime2").val());
							alert("PM11")
						} else {
							alert("333请注意检查时间是否在8:00AM到9:55PM之间")
							$("#PtTime1").val("");
							$("#PtTime2").val("");
						}
					} else {
						if (a1[0] >= 8 && b1[0] <= 9) {
							appointinf["StartTime"] = Timechange($("#PtTime1").val());
							appointinf["EndTime"] = Timechange($("#PtTime2").val());
							alert("8：00AM到9:55PM之间")
						} else {
							alert("请注意检查时间是否在8：00AM到9:55PM之间")
							$("#PtTime1").val("");
							$("#PtTime2").val("");
						}
					}
					;

					/*保存功能*/

					appointinf["coursename"] = $("#Newcourse2").val();
					appointinf["experimentname"] = $("#Newexperiments2").val();
					appointinf["subexperimentname"] = $("#Newcontent2").val();
					appointinf["ADate"] = $("#datepicker3").val();
					//appointinf["StartTime"] = Timechange($("#PtTime1").val());
					//appointinf["EndTime"] = Timechange($("#PtTime2").val());
					appointinf["classname"] = $("#classlist").val();
					appointinf["devicenum"] = $("#devicenum").val();
					appointinf["path"] = 1;
					appointinf["studentsname"] = $("#citySel2").val();
					//检查字典中的值是否有空值，有则提示有未填写项，没有则正常提交
					$.ajax({
						url : "/saveTappoint",
						dataType : "json",
						type : "post",
						data : {
							choice : $.param(appointinf)
						},
						success : function(data) {
							alert(data["msg"]);

						}
					})
					//})
				})
			});

		</script>

	</head>
	<body>
		
		<!--<div id="main">

		<form  id="signupForm" method="get" action="">
		<fieldset>

		<p>
		<label for="firstname">Firstname</label>
		<input id="firstname" name="firstname" type="text">
		</p>
		<p>
		<label for="lastname">Lastname</label>
		<input id="lastname" name="lastname" type="text">
		</p>
		<p>
		<label for="username">Username</label>
		<input id="username" name="username" type="text">
		</p>
		<p>
		<label for="password">Password</label>
		<input id="password" name="password" type="password">
		</p>
		<p>
		<label for="confirm_password">Confirm password</label>
		<input id="confirm_password" name="confirm_password" type="password">
		</p>
		<p>
		<label for="email">Email</label>
		<input id="email" name="email" type="email">
		</p>
		<p>
		<label for="agree">Please agree to our policy</label>
		<input type="checkbox" class="checkbox" id="agree" name="agree">
		</p>

		<p>
		<input class="submit" type="submit" value="Submit">
		</p>
		</fieldset>
		</form>

		</div>-->
		<div>
			<form id="form2" name="form2" method="post" action="">
				<table>
					<tr>
						<td>
						<p>
							<label for="Newcourse2">实验课程</label>
							<input id="Newcourse2" name="Newcourse2" type="text">
						</p></td>
					</tr>
					<tr>
						<td>
						<p>
							<label for="Newexperiments2">实验项目</label>
							<input id="Newexperiments2" name="Newexperiments2" type="text">
						</p></td>
					</tr>
					<tr>
						<td>
						<p>
							<label for="Newcontent2">实验内容</label>
							<input id="Newcontent2" name="Newcontent2" type="text">
						</p></td>
					</tr>
					<tr>
						<td>
						<p>
							<label for="datepicker3">实验日期</label>
							<input id="datepicker3" name="datepicker3" type="text">
						</p></td>
					</tr>
					<tr>
						<td>
						<p>
							<label for="PtTime1">开始时间</label>
							<input id="PtTime1" name="PtTime1" type="text">
						</p></td>
					</tr>
					<tr>
						<td>
						<p>
							<label for="PtTime2">结束时间</label>
							<input id="PtTime2" name="PtTime2" type="text">
						</p></td>
					</tr>
					<tr>
						<td>
						<p>
							<label for="classlist">指定班级</label>
							<input type="text" id="classlist" name="classlist">
						</p></td>
					</tr>
					<tr>
						<td>
						<p>
							<label for="citySel2">具体人员</label>
							<input type="text" id="citySel2" name="citySel2">
						</p></td>
					</tr>
					<tr>
						<td>
						<input name="特别设置保存" type="button" id="saveTappoint" value="老师指定预约实验"/>
						</td>
					</tr>
					<tr>
						<td>
						<p>
							<input class="submit" type="submit" id="saveTappoint1" value="Submit">
						</p></td>
					</tr>

				</table>

				<!--<div class="courseset" align="left">
				<table class="course">
				<tr>
				<td>实验课程
				<input type="text" id="Newcourse2" size="30"/>
				</td>
				</tr>
				<tr>
				<td>实验项目
				<input type="text" id="Newexperiments2" size="30"/>
				</td>
				</tr>
				<tr>
				<td>实验内容
				<input type="text" id="Newcontent2" size="30"/>
				</td>
				</tr>
				<tr>
				<td>实验日期
				<input type="text" id="datepicker3" name="datetime" size="30"/>
				</td>
				</tr>
				<tr>
				<td>开始时间
				<input id="PtTime1" name="time" value="" size="30"/>
				</td>
				</tr>
				<tr>
				<td>结束时间
				<input id="PtTime2" name="time" value="" size="30"/>
				</td>

				</tr>
				<tr>
				<td>实验设备
				<select name="maxnum" id="devicenum" style="width:256px">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				</select></td>
				</tr>
				<tr>
				<td>指定班级
				<input type="text" id="classlist" value=""  size="30"/>
				</td>
				</tr>
				<tr>
				<td>具体人员
				<input id="citySel2" type="text" readonly value="" style="width:255px;" onclick="showMenu2();"/>
				<!--member的树形部分
				<ul class="list">
				<li class="title">
				<input id="citySel2" type="text" readonly value="" style="width:255px;" onclick="showMenu2();"/>
				</li>
				</ul>-->
				<!--<div id="menuContent2" class="menuContent" style="display:none; position: absolute;">
				<ul id="treeDemo2" class="ztree" style="margin-top:0; width:240px;"></ul>
				</div></td>
				</tr>
				<tr>
				<td>
				<input name="特别设置保存" type="button" id="saveTappoint" value="老师指定预约实验" />
				</td>
				</tr>
				<tr>
				<td>
				<input class="submit" type="submit" value="Submit">
				</td>
				</tr>

				</table>
				</div>-->

			</form>
		</div>
	</body>
</html>
