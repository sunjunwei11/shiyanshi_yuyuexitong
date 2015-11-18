<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> -->
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{{title or 'No title'}}</title>
<style type="text/css">
body{
	//background-color:#E9F1F5;
	min-height:100%
}
.main_tab{
	display:table;
	width:100%;
	overflow:hidden;
//	border-top:5px solid #69B2E6;
	//background-color:#E9F1F5;
}
.quick_menu_content ul,.quick_menu_content ol,.quick_menu_content li,.quick_menu_content img{
	margin:0;padding:0
}
.quick_menu_content ul{
	list-style:none
}
.quick_menu_content li{text-align: center}
.quick_menu_title{
	width:20px;
        min-width:20px;
	background:url(/img/f_bar.gif) no-repeat;
	display:table-cell;
	vertical-align:top;
//	background-color:#69B2E6;
}
.quick_menu_content{
	overflow:hidden;
	display:table-cell;
	width:137px;
        min-width:137px;
	border:1px solid #b3b3b3;
	background-color:#fff;
	color:#353535;
	font-family:微软雅黑;
	font-size:26px;
	font-weight:bold;
	vertical-align:top;
	border-top-width:1px;
	border-left-width:0;
	border-bottom-width:0;
	border-right-width:0;
	height:100%;
}
.quick_menu_content ul,li{
	border-bottom:1px solid #e6e6e6;
	background-color:#D6D6D6;
	cursor:pointer;
}
.quick_menu_li1{
	border-width:0
}
.quick_menu_content a{
	display:block;
	height:50px;
	line-height:50px;
	padding:0 15px;
	text-decoration:none;
}
.subwindow{
	display:table-cell;
	vertical-align:top;
}
a:link,a:visited{
	color:#333;
}

a:hover{
	color:#A52A2A
}

.lout{
    position:absolute;
    top:2em;
    left:2em;
    font-family:微软雅黑;
    font-size:26px;
    font-weight:bold;
}
%cssBlock()     
</style>
    
<script language="javascript" type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src='/js/message.js'></script>
<link rel="stylesheet" type="text/css" href="/js/themes/message_default.css">
         
%jsSrcBlock()
<script type="text/javascript">
   /*
    var ws = new WebSocket("ws://127.0.0.1:8080/echo");
        ws.onopen = function() {
              ws.send("即时消息推送已开启");
          };
        ws.onmessage = function (evt) {
            //alert(evt.data);
        //$("#mmsg").html("开始！<br>");
        //$("#mmsg").append("<div>"+evt.data+"</div>");
            var message = {
            text:evt.data.replace(/\n/g,"<br>").replace(/ /g,"&nbsp"),
            type:"",
        }
        dhtmlx.message(message);
        
        //ws.send(evt.data+"!");
         };*/

$(function(){
	$(".quick_menu_content a").each(function() {
        if(this.text=="{{session['channel']}}") {
			$(this).parents("li").css("background-color","#6CA6CD")
			
		}
		
    });
	$(".quick_menu_title").toggle(function(){
		$(".quick_menu_content").hide();
		$(this).css("background-img","url(/img/e_bar.gif) no-repeat");
		$("#example").width("100%")
	},function(){
		$(".quick_menu_content").show();
		$(this).css("background-img","url(/img/f_bar.gif) no-repeat");
		$("#example").width("100%")
	})
	
	//$("#logout").click(function() {
	    //alert("haha!")
	    //load("./forbiddendsub")
		//});
        $("#chart").click(function() { window.location.href="/defaultsub"})

})


	

%jsBlock()
</script>
</head>
<body> 
<div>	
<p align="right" style="margin-bottom:0;margin-top:6px">
% user=session.get('user')
</p>
</div>	 
<div>
<table height="150" width="100%" border="1" bordercolor="#FFF">
	<tbody>
		<tr>
		<td id="chart" style="background-position: center; background-repeat: no-repeat" align="left" background="/img/newwugang.jpg">
			<font color="#F03" style="font-size:16px; position:relative;top:0%;right:3%;   font-family:'楷体'"><p  align="right"><b>工号:{{user["userid"]}}</b></p></font>
           <font color="#F03" style="font-size:16px; position:relative;top:2%;right:3%;  font-family:'楷体'"><p align="right"><b>姓名:{{user["username"]}}</b></p></font>
           <font color="#F03" style="font-size:16px; position:relative;top:4%;right:3%; font-family:'楷体'"><p align="right"><b>权限:{{user["authority"]}}</b></font> 
           </td>
           </tr>
           </tbody>
           </table>
           </div>  

<div class="main_tab">
<div class="quick_menu_content">
<ul>
% rows=session.get('leftmenu')
% print 'rows',rows
% menuurls=session.get('menumap')
% print menuurls
% for row in rows:
% for col in row:
% menuurl=menuurls.get(col)
<li><a href ='{{menuurl}}'>{{col}}</a></li>
% end
% end
</ul>
</div>
<div class="quick_menu_title">
</div>
<div class="subwindow">
%include
</div>
</div>
</body >
