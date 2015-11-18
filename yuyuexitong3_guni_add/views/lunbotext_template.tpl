<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<title>图片轮播演示</title>
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<style type="text/css">
			* {
				margin: 0px;
				padding: 0px;
				font-size: 14px;
			}
			div.LunBo {
				position: relative;
				list-style-type: none;
				height: 300px;
				width: 300px;
			}
			div.LunBo ul li {
				position: absolute;
				height: 300px;
				width: 300px;
				left: 30px;
				top: 20px;
				display: none;
			}
			div.LunBo ul li.CurrentPic {
				display: block;
			}
			div.LunBo div.LunBoNum {
				position: absolute;
				left: 230px;
				bottom: 11px;
				width: 83px;
				text-align: right;
				background-color: #999;
				padding-left: 10px;
			}
			div.LunBo div.LunBoNum span {
				height: 20px;
				width: 15px;
				display: block;
				line-height: 20px;
				text-align: center;
				margin-top: 5px;
				margin-bottom: 5px;
				float: left;
				cursor: pointer;
			}
			div.LunBo div.LunBoNum span.CurrentNum {
				background-color: #3F6;
			}
		</style>
	</head>

	<body>
		<div class="LunBo">
			<ul>
				<li class="CurrentPic">
					<img src="/images/111.jpg" width=300" height="300" /></li>
					<li><img src="/images/112.jpg"  art=" " width="300" height="300" /></li>
					<li><img src="/images/113.jpg" art=" " width="300" height="300" /></li>
					<li><img src="/images/114.jpg"  art=" " width="300" height="300" /></li>
					<li><img src="/images/115.jpg"  art=" " width="300" height="300" /></li>
					</ul>
					<div class="LunBoNum">
					<span class="CurrentNum">1</span>
					<span>2</span>
					<span>3</span>
					<span>4</span>
					<span>5</span>
					</div>
					</div>
					<script type="text/javascript" language="javascript">
					var PicTotal = 5;
					var CurrentIndex;
					var ToDisplayPicNumber = 0;
					$("div.LunBo div.LunBoNum span").click(DisplayPic);
					function DisplayPic() {
					// 测试是父亲的第几个儿子
					CurrentIndex = $(this).index();
					// 删除所有同级兄弟的类属性
					$(this).parent().children().removeClass("CurrentNum")
					// 为当前元素添加类
					$(this).addClass("CurrentNum");
					// 隐藏全部图片
					var Pic = $(this).parent().parent().children("ul");
					$(Pic).children().hide();
					// 显示指定图片
					$(Pic).children("li").eq(CurrentIndex).show();
					}
					function PicNumClick() {
					$("div.LunBo div.LunBoNum span").eq(ToDisplayPicNumber).trigger("click");
					ToDisplayPicNumber = (ToDisplayPicNumber + 1) % PicTotal;
					setTimeout("PicNumClick()",1000);
					}
					setTimeout("PicNumClick()",1000);
					</script>
	</body>
</html>
