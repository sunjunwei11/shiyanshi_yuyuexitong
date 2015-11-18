<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="layer_html">
	<head>
		<title>开始使用layer</title>
		<script src="js/jquery-1.8.1.js"></script>
		<script src="js/jquery-1.8.2.min.js"></script>
		
		<script src="js/layer/layer.min.js"></script>

		<style>
			.button {
				display: inline-block;
				line-height: 30px;
			}
			.button:hover {
				background-color: #EF502E;
				color: #fff;
			}
			.button {
				padding: 0 15px;
				line-height: 80px;
				border: none;
				background-color: #99CC66;
				color: #fff;
				font-size: 12px;
				border-radius: 3px;
				cursor: pointer;
			}
			a {
				color: #363636;
				text-decoration: none;
			}
		</style>
		<style>
			.clearfix {
				padding-left: 10px;
				padding-top:10px;
				margin: auto;
			}
			.tile {
				display: block;
				float: left;
				background-color: #525252;
				width: 150px;
				height: 150px;
				cursor: pointer;
				box-shadow: inset 0px 0px 1px #FFFFCC;
				text-decoration: none;
				color: #ffffff;
				overflow: hidden;
				position: relative;
				font-family: 'Segoe UI Semilight', 'Open Sans', Verdana, Arial, Helvetica, sans-serif;
				font-weight: 300;
				font-size: 11pt;
				letter-spacing: 0.02em;
				line-height: 20px;
				margin: 0 10px 10px 0;
				overflow: hidden;
			}
			.bg-color-orange {
				background-color: #e3a21a !important;
			}
			
		</style>
	</head>
	<body>

		
		<script>
			$(function() {

				//弹出一个iframe层
				$('#test3').on('click', function() {
					$.layer({
						type : 2,
						title : '登陆窗口',
						maxmin : true,
						shadeClose : true, //开启点击遮罩关闭层
						area : ['428px', '330px'],
						offset : ['100px', ''],
						iframe : {
							src : 'iframe'
						}
					});
				});
			})

		</script>
		

		<button id="test3" class="button">
			运行：登录窗口
		</button>

	</body>
</html>