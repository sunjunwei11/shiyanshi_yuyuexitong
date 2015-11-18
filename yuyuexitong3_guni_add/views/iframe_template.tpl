
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆界面</title>
<style type="text/css">

*{margin:0;padding:0;}
#bg{
position:absolute;
top:0px;
left:0px;
z-index:-999;
}
.he
help{
/*     <font color="#EEE" style="font-size:16px; position:absolute;top:0px;left:1210px;   font-family:'楷体'"><p  align="right"><a href="http://www.w3school.com.cn">使用说明</a></p></font> */
    color: "#EEE";
    font-size: 16px;
    font-family:'楷体'; 
    position: absolute;
    top: 0%;
    left: 92%;
}
a:link {color: #EEE}
a:visited {color: #EEE}
a:hover {color: #FF00FF}
a:active {color: #EEE}

</style>
     <script language="javascript" type="text/javascript" 
            src="/js/jquery-1.7.1.min.js"></script>
        
     <SCRIPT language="JavaScript">    javascript:window.history.forward(1);    </SCRIPT> 
      
         
<!--<script type="text/javascript">
 window.onresize = window.onload = function(){
     var w,h
     if(!!(window.attachEvent && !window.opera))
     {
      h = document.documentElement.clientHeight;
      w = document.documentElement.clientWidth;
     }else{
      h = window.innerHeight;
      w = window.innerWidth;
     }
  document.getElementById('msg').value  ='窗口大小：' + 'width:' + w + '; height:'+h;
    var bgImg = document.getElementById('bg').getElementsByTagName('img')[0];
    bgImg.width = (w-1);
    bgImg.height= (h-1) ;  
          
   }  --> 

$(function(){
	 $("#password").keydown(function(){
	 	if(event.keyCode==13){
	 		$("#login_submit").click()
	 	}
	 })
	
     $("#login_submit").click(function(){
     	
	  userid=$("#userid").val()
	  password=$("#password").val()
	  alert(userid)
	  <!--关闭弹出窗口-->
	 <!-- alert($(document.getElementById('ui-accordion-accordion-panel-0')).html())
	var index = parent.layer.getFrameIndex(window.name);
	  alert(index)
	  parent.location.reload();
	  parent.fn($('#userid').val())
	  parent.layer.close(index);
	  
	 
	  //alert($(document.getElementById('ui-accordion-accordion-panel-0')).html())
	  alert("666")
	  $.ajax({
		  url:"/resign",
		  type:"post",
		  data:{userid:userid,
		  password:password},
		  datatype:"json",
		  async:false,
		  success:function(data){
			  if (data["meg"]){
				 $("#cuowu").show()
				 $("#userid").val(userid)
				 $("#password").val("")
			  }
			  else{
			  	alert("aa")
				  window.location.href="/defaultsub"
				  alter("cccc")
				           
			  }
			  
		  }
		  
	  })  
	  })
	 })  
</script>-->
<style type="text/css">

body {
	
 


</style>
</head>  


	 	 
<input type="text" id="msg" name="msg" size="50" style="display: none" />
<table width="426" height="297" background="img/background.jpg" align="center" >
   
<tr><td><p>&nbsp;</p><p>&nbsp;</p><hr align="center" width="420" size="3" color="#FFFFFF" /></td></tr>
<tr height="40px">
<td align="center"><img id="cuowu" style="display: none" src ="/img/cuowu.jpg" width="280" height="30" /></td>
</tr>
<tr>
<td>  
  <form>
    <h3 style="margin-top:0;margin-bottom: 0"><label><font color="#000066" style=" position:absolute;top:64%;left:25%; ">学&nbsp;号：</font></label><input name="userid" id="userid" type="text" style=" background:#FF9;position:absolute;top:64%;left:40%; "size="15" /></h3> 
    <h3 style="margin-top:10px;margin-bottom: 10px"><label><font color="#000066" style=" position:absolute;top:73%;left:25%; ">密&nbsp;码：</font></label><input name="password" id="password" type="password" style="background:#FF9;position:absolute;top:73%;left:40%;" size="15" autocomplete="off" /></h3>
 <input type="button" class="btn-login" style="width:80px; height:30px;position:absolute;top:85%;left:43%;background:url('/img/button.jpg'); height=25px;"name="login_submit" id="login_submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>
 </p>  
</form>
</td>
</tr>
</table>
<A HREF="defaultsub" onclick="javascript:location.replace(this.href);event.returnValue=false; ">
