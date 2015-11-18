<!DOCTYPE html>
<html lang="en">
	<head>
		<title>流量液位串级控制测试页面</title>
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
			var studentname='{{user["username"]}}';
			var couname = getquerystring("couname");
			var subname = getquerystring("subname");
			var sta = true;

			$(function() {

				//alert(studentid)
				//先做一个检查，如果第一次点击预习，则在processbiao中填预习，不是第一次且预习未完成状态不变，若预习完成则调用存储过程改变状态。
				$.ajax({
					url : "/ceshijiancha",
					type : "POST",
					dataType : "json",
					data : {
						studentid : studentid,
						studentname:studentname,
						couname : couname,
						subname : subname
					},
					success : function(data) {
						if (data["resul"] == "预习完成") {
							//alert("继续进行测试")
							$("#button1").click(function() {
								if (sta == true) {
									var styscope = 80;
									alert("sta=false")
									if (styscope < 80) {
										alert("未达到规定测试分数，请继续测试")
									} else {
										alert("准备提交")
										var action = 0;
										$.ajax({
											url : "/ceshibufen",
											type : "POST",
											dataType : "json",
											data : {
												studentid : studentid,
												couname : couname,
												subname : subname,
												action : action
											},
											success : function(data) {
												alert("msg")

											}
										})

									}
									//执行ajax
									sta = false;
								} else {
									alert("已完成测试部分111")
								}

							})
						} 
						else if(data["resul"]=="预习"||data["resul"]==""){
							alert("请先完成预习部分")
							
						}
						else {
							alert("您已完成测试部分")

						}
					}
				})

			})
			

			

		</script>-->

	</head>
	<body>

		<div class="wrapper">
			<p>
				这是流量液位串级控制环实验--测试页面,该页面正在创建中。
			</p>
			<!--<input type="button" id="button1" value="完成预习" />-->
			

		</div>
	</body>
</html>
