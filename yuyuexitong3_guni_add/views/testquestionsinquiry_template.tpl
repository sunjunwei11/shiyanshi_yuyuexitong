<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <link rel="shortcut icon" type="image/ico" href="http://www.datatables.net/favicon.ico">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">

	<title>DataTables example - Form inputs</title>
	<link rel="stylesheet" type="text/css" href="../js/media/css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="../js/resources/syntax/shCore.css">
    <link rel="stylesheet" type="text/css" href="../js/resources/demo.css">
    <link rel="stylesheet" type="text/css" href="../css/select.dataTables.css">
	<style type="text/css" class="init">

	</style>
	<script src="../../js/jquery-1.8.0.min.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript" src="../js/media/js/jquery.js"></script>
	<script type="text/javascript" language="javascript" src="../js/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript" language="javascript" src="../js/dataTables.select.js"></script>
	<script type="text/javascript" language="javascript" src="../js/resources/syntax/shCore.js"></script>
	<script type="text/javascript" language="javascript" src="../js/resources/demo.js"></script>
	<script type="text/javascript" language="javascript" class="init"></script>
	<style>
	.liu{margin:0 auto;text-align:center;padding:10px;background-color:white}
	.button{width:150px;height:30px;border-radius:30px;-moz-border-radius:45px;background-color:#CCCCFF;font-size:18px;}
	.dialog{width:360px;border:solid 5px #CCDDFF;position:absolute;display:none;z-index:999;}
    .dialog .title{background-color:#CCDDFF;padding:10px 10px 10px 30px;;font-weight:bold;}
    .dialog .title img{float:right;}
    .dialog .content{background-color:#fff;padding:10px 25px 10px 10px;height:60px;}
    .dialog .content img{float:left;}
    .dialog .content span{float:left;padding-top:10px;padding-left:5px;font-size:15px;}
    .dialog .bottom{text-align:center;padding:10px 10px 10px 10px;background-color:#FFFFFF;}
    .mask{width:100%;height:500%;background-color:#DCDCDC;position:absolute;top:0px;left:0px;opacity:0.8;display:none;z-index:50;}
	</style>
	<script>
    var columns=
       [    
            { "data": ""},
            { "data": "序号" },
            { "data": "课程名称" },
            { "data": "实验名称" },
            { "data": "测试题目" },
            { "data": "选项A" },
            { "data": "选项B"},
            { "data": "选项C"},
            { "data": "选项D"},
            { "data": "正确答案"}        
        ]
var jsonObj = {};
var jsonObj1 ={};
var jsonObj2 ={};
var jsonObj3 ={};
var jsonstd ;
$(document).ready(function() {
  function showMessage(string){
          $(".mask").show();
          showDialog();
          var a=string;
          $("#message").html(a);
          $(".dialog").show();
                      }
  function showDialog(){
          var objW = $(window);
          var objC = $(".dialog");
          var brsW = objW.width();
          var brsH = objW.height();
          var sclL = objW.scrollLeft();
          var sclT = objW.scrollTop();
          var curW = objC.width();
          var curH = objC.height();
          var left = sclL + (brsW - curW) / 2;
          var top = sclT + (brsH - curH) / 2;
          objC.css({"left":left,"top":top});
                 }
  $(window).resize(function(){
          if(!$(".dialog").is(":visible")){
                 return;
                     }
          showDialog();
                })
  $(".title img").click(function(){
          $(".dialog").hide();
          $(".mask").hide();
          window.location.reload();
                }) 
  $("#Dialogbutton").click(function(){
          $(".dialog").hide();
          $(".mask").hide();
          window.location.reload();
              })
$.ajax({
			type:"POST",                            
			url:"/questionsinquiry",            //发送请求的地址
			cache:false,           //不缓存该页面
			async:false,
			dataType:"json", //预期服务器返回的数据类型。若不指定，jQuery 将自动根据 HTTP 包 MIME 信息来判断，比如XML MIME类型就被识别为XML
			success:function(data){
			   $.each(data,function(key,value){
			  //       alert(data);
                  jsonObj.Rows=value;
                 
                  
                   });
			    }

     });	
	
	var table = $('#example').DataTable({
	       data:jsonObj.Rows,
	       columns:columns,
	       columnDefs: [ {
           orderable: false,
           className: 'select-checkbox',
           targets:   0
        } ],
      select: {
            style:    'os',
            selector: 'td:first-child'
        },
        order: [[ 1, 'asc' ]]     

	       	});
      
 /*   $('#example').on( 'click', 'tbody tr', function () {
          $(this).toggleClass('selected');
                                            } );               */
			                  

$('button').click( function() {

       //   alert( table.row('.selected').data() +' row(s) selected' );
       //    A = [{"studentid":"0121011360622","studentname":"王开元","coursename":"过程控制","subexperiment":"上水箱对象特性" ,"data":"2015/8/14","startTime":"14:00","xiakeTime":"15:30","experiment":"设备1","equipment":"未到"}]
       //     alert(A[0]);
       //   alert(B["studentid"]);
         
         

    /*   $.each(A,function(index,items){
			 alert(items);
			 var j=0;
			$.each(items,function(key,value){
			     information[j]=value;
		          //alert(information);
		          j=j+1;  })
		        alert(information[0]);
		          
		          })
        
        for (var i in A[A.length-1]){
         
         
                     alert(i);
         };        */   
         
         jsonObj2 = table.rows('.selected').data();
         var B = jsonObj2[0];
         var A = {"序号":B["序号"]};
         //jsonObj1={"wode":"nide"};                      
         $.ajax({
			type:"POST",                            
			url:"/questiondelete",            //发送请求的地址
			cache:false,           //不缓存该页面
			async:false,
            data:A,
			dataType:"json", //预期服务器返回的数据类型。若不指定，jQuery 将自动根据 HTTP 包 MIME 信息来判断，比如XML MIME类型就被识别为XML
			success:function(data){     
			            pass   
			            },
			});                       
		
		var data = table.$('input, select').serialize();
		showMessage(
		            "序号为" + B["序号"]+ "的测试题目将会从数据库删除！"
			
		);

        //window.location.reload();

		return false;
	})

}) 


	</script>
</head>
<body class="dt-example">
	<div class="container">
            
            <table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
					    <th></th>
						<th>序号</th>
						<th>课程名称</th>
						<th>实验名称</th>
						<th>测试题目</th>
						<th>选项A</th>
						<th>选项B</th>
						<th>选项C</th>
						<th>选项D</th>
						<th>正确答案</th>
					</tr>
				</thead>

			      
			</table>
			
			<div class="liu"><button type="submit" class="button">删除</button></div>
         </div>
      <div class="mask"></div>
      <div class="dialog">
          <div class="title"><img src="../images/close.gif" /><br /></div>
          <div class="content"><img src="../images/warning.png" /><span id="message"></span>
          </div> 
          <div class="bottom">
              <input type="button" id="Dialogbutton" value="确定" class="btn" />
          </div>
      </div> 
		</body>
	</html>