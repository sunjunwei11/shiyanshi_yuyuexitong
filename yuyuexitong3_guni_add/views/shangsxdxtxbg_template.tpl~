<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Slicebox - 3D Image Slider</title>
		<meta charset="UTF-8" />
		<script src="js/jquery-2.0.3.min.js"></script>
		<!--<script>
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
			var couname = getquerystring("couname");
			var subname = getquerystring("subname");
			var sta = true;

			$(function() {

				//alert(studentid)
				//先做一个检查，如果第一次点击预习，则在processbiao中填预习，不是第一次且预习未完成状态不变，若预习完成则调用存储过程改变状态。
				$.ajax({
					url : "/yuxijiancha",
					type : "POST",
					dataType : "json",
					data : {
						studentid : studentid,
						couname : couname,
						subname : subname
					},
					success : function(data) {
						if (data["row1"] == "预习") {
							//alert("继续进行预习")
							$("#button1").click(function() {
								if (sta == true) {
									var stytime = 20;
									alert("sta=false")
									if (stytime < 20) {
										alert("未达到规定预习时间请继续预习")
									} else {
										alert("准备提交")
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
												alert("1111")

											}
										})

									}
									//执行ajax
									sta = false;
								} else {
									alert("已完成预习部分111")
								}

							})
						} else {
							alert("您已完成预习部分")

						}
					}
				})

			})
		
			
			

		</script>-->

	</head>
	<body>

		<div class="wrapper">
			<p>
				这是上水箱特性实验报告页面,该页面内容正在创建中。
			</p>
			<!--<input type="button" id="button1" value="完成测试" />-->
			

		</div>
	</body>
</html>
