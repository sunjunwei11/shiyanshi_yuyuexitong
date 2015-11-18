<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>表格</title>
		
		<!--<script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>-->
		<link rel="stylesheet" type="text/css" href="js/ligerUI/skins/Aqua/css/ligerui-all.css">
		<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerTab.js" type="text/javascript"></script>
		<script src="js/ligerUI/lib/jquery.cookie.js"></script>
		<script src="js/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
		<!--<script src="js/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerAccordion.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerCheckBox.js"></script>
		<script src="js/ligerUI/js/plugins/ligerCheckBoxList.js"></script>
		<script src="js/ligerUI/js/plugins/ligerTree.js"></script>-->
		<script src="js/ligerUI/lib/json2.js"></script>
		<script type="text/javascript">
		var jsonObj = {};
		$(document).ready(function() {
		var columns =
            [
                { display: '学号', name: 'studentid' },
                { display: '姓名', name: 'studentname' },
                { display: '课程', name: 'coursename' },
                { display: '实验', name: 'experimentname' },
                { display: '实验名称', name: 'subexperimentname' },
                { display: '实验日期', name: 'date' },
                { display: '实验开始时间', name: 'startTime' },
                { display: '实验结束时间', name: 'xiakeTime' },
                { display: '设备号', name: 'equipment' },
             ];
            


      $.ajax({
			type:"POST",                            
			url:"/bg",            //发送请求的地址
			cache:false,           //不缓存该页面
			async:false,
			dataType:"json", //预期服务器返回的数据类型。若不指定，jQuery 将自动根据 HTTP 包 MIME 信息来判断，比如XML MIME类型就被识别为XML
			success:function(data){
		
			$.each(data,function(key,value){
			    alert(value);
                  jsonObj.Rows=value;                      
			     $.each(value,function(indec,items){
			         //alert()
			          $.each(items,function(key,value){
			             //alert(value);
			                                          }) 
			                 }) 
			                                     })
			
			},
			})	  	
	          
alert(jsonObj.Rows);
$("#maingrid").ligerGrid({
                columns: columns,
                data:jsonObj,
                title:'我的标题',
                showTitle:true,
                                      //不分页usePager:false 
                                  // 不出现滚动条   isScroll:false 
                
		        
				           });
			                      	
		})	

		</script>
		<style type="text/css">
			body {
				padding: 0px;
				margin: 0;
				overflow: hidden;
			}
			.l-layout-top {
				background: #102A49;
				color: #000033
			}
			.l-topmenu-welcome {
				position: absolute;
				height: 24px;
				line-height: 24px;
				right: 30px;
				top: 2px;
				color: #070A0C;
			}
			.l-topmenu-welcome a {
				color: #E7E7E7;
				text-decoration: underline
			}
			.body-gray2014 #framecenter {
				margin-top: 3px;
			}
			.viewsourcelink {
				background: #B3D9F7;
				display: block;
				position: absolute;
				right: 10px;
				top: 3px;
				padding: 6px 4px;
				color: #333;
				text-decoration: underline;
			}
			.viewsourcelink-over {
				background: #81C0F2;
			}
			.l-topmenu-welcome label {
				color: white;
			}
			#skinSelect {
				margin-right: 6px;
			}

		</style>
	</head>

	<body>
	<div id="maingrid"></div>
	</body>
</html>