<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<script type="text/javascript" src='js/jquery-2.0.3.js'></script>
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-ui.js"></script>

<style type="text/css">
span { color:red;}
body {
	margin-left: 150px;
	margin-top: 100px;
}
.STYLE2 {font-size: medium}
</style>
<script type="text/javascript">
studentid = '0120911360303';
$(document).ready(function() {

	$("input[value='修改']").click(function() {
	     
	    var cc=$("#xin0").val()
        var aa=$("#xin1").val()  //jquery写法
        var bb=$("#xin2").val()  //jquery写法
		//alert(typeof(cc));
		if(cc!="")
		{
		   if(aa==bb)
		   {
		     if(aa!="")
		     {
		           $.ajax({		                            
			            type:"POST",                            
			            url:"/duquyuanmima",            //发送请求的地址
			            cache:false,           //不缓存该页面
			            dataType:"json", //预期服务器返回的数据类型。若不指定，jQuery 将自动根据 HTTP 包 MIME 信息来判断，比如XML MIME类型就被识别为XML
			            data:{"studentid":studentid},
			            success:function(data){
			            $.each(data,function(key,value){
						//alert(value);
			            if(value==cc)
			              {
						   var value0=new Array(); 
	                       var key0=new Array(); 
	                       value0[0]=studentid;         //用户名
	                       value0[1]=bb;
	                       key0[0]="studentid";         
	                       key0[1]="newpassword"; 
	                       var xiugai={};
	                       xiugai[key0[0]]=value0[0];
						   xiugai[key0[1]]=value0[1];
			               $.ajax({		                            
			               type:"POST",                            
			               url:"/xiugaimima",            //发送请求的地址
			               cache:false,           //不缓存该页面
			               dataType:"json", //预期服务器返回的数据类型。若不指定，jQuery 将自动根据 HTTP 包 MIME 信息来判断，比如XML MIME类型就被识别为XML
			                data:xiugai,
							success:function(data){
							$.each(data,function(key,value){
							alert(key);
							
							})
							             }
			                      })
			                 }
						 else
						  alert("您输入的原密码不对，请重新输入！")
			    
			                                           })
			
			                                   }
			                 });
        
		       }
		         else
				 alert("新密码不能为空！");
			}
			else
			 alert("两次输入不一致")
	    }
		else
		alert("原密码不能为空！")
		
             });


	
    
});



 


</script>
</head>


<body>
<div class="STYLE2"><strong>修改密码</strong> <a href="file:///E|/Eclipse/c-s-m/src/html/   ">返回</a></div>
<div class="STYLE2"> 输入原密码:<input  id="xin0" type="password" value="" width="120"/> </div>
<div class="STYLE2"> 输入新密码:<input  id="xin1" type="password" value="" width="120"/></div>
<div class="STYLE2"> 重复新密码:<input  id="xin2" type="password" title="请输入您的姓名" value="" width="120"/></div>
<input type="button" value="修改"/>
</body>
</html>