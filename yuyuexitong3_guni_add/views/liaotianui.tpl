<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
</head>
<style>

.containor {
	    position:relative;
		border-color:#000;
		width:500px;
		margin-bottom:5px;
		margin-top:5px;
		margin-left:0px;
		margin-right:0px;
		padding:30px 0 30px 0;
		right:0px;
		height:40px;
		overflow:visible;

}
.userr {
	    position:absolute;
		margin-bottom:0px;
		margin-top:0px;
		margin-left:0px;
		margin-right:0px;
		padding:0px;
		right:30px;
}
.userl {
	    position:absolute;
		margin-bottom:0px;
		margin-top:0px;
		margin-left:0px;
		margin-right:0px;
		padding:0px;
		left:0px;
}

.zaixian {
	      color:rgb(249, 0, 0);
		  
}
#all {
	width:650px;
	position:relative;
	top:50px;
	left:50px;
	background-image:url(../../img/whut2.png);
	}
#top {
	width:650px;
	height:100px;
	border:double #6F9;
	background-color:#47A083;
	position:relative;
	/*background: -webkit-linear-gradient(top,rgba(204,204,204,0.5),rgba(51,153,51,0.5));
	background: -moz-linear-gradient(left,#096,#096);
	background: linear-gradient(left,#096,#096);
	background: -o-linear-gradient(left,#096,#096);*/
	} 
#shiyan_shijian{
	position:absolute;
	top:5px;
	left:5px;
	paddin:0px;
	margin:0px;
	background-color:rgba(255,255,255,0.19);
	border-style:none;
	color:#FFF;
	font-size:12px;

}

#guanbi {
	position:absolute;
	top:5px;
	left:595px;
	background-color:rgba(255,255,255,0.19);
	border-style:none;
	color:#FFF;
	font-size:18px;
	}
#guanbi:hover {
	background-color:rgb(255,0,0);
	color:rgb(0,102,102);
	}
#guanbi:active {
	color:#CCC;
	box-shadow: 0 1px 3px #4d7254 inset,0 3px 0 #096;
    background: -webkit-linear-gradient(top,#5eac6e,#72b37e);
    background: -moz-linear-gradient(top,#5eac6e,#72b37e);
    background: linear-gradient(top,#5eac6e,#72b37e);
    background: -o-linear-gradient(top,#5eac6e,#72b37e);
	}
#yilixian {
	position:absolute;
	top:22px;
	left:580px;
	font-size:20px;
	font-weight:bold;
	color:rgb(186, 102, 63);
	visibility:hidden;
	}
#bottom {
	width:650px;
	height:600px;
	border-style:double double double double;
	border-color:#6F9;
	}
#left {
	float:left;
	width:500px;
	height:600px;
	border-style:none double none none;
	border-color:#6F9;
	/*background: -webkit-linear-gradient(left,rgba(102,255,153,0.3),rgba(102,255,204,0.3));*/
	}
#right{
	float:right;
	width:146px;
	height:600px;
	background-color:#53A78B;
	/*background: -webkit-linear-gradient(left,#9C9,#C6EABB);
	background: -moz-linear-gradient(left,#9C9,#C6EABB);
    background: linear-gradient(left,#9C9,#C6EABB);
	background: -o-linear-gradient(left,#9C9,#C6EABB);*/
	}
#huihua {
	width:500px;
	height:480px;
	border-style:none none double none;	
	border-color:#6F9;
	overflow:scroll;
	overflow-y:auto;
	overflow-x:auto;
	white-space:normal;
	word-break:normal;
	}
#xia {
	position:relative;
	width:500px;
	height:120px;
	background: -webkit-linear-gradient(left,rgba(92, 160, 123, 0.5),rgb(40, 173, 124));
	background: -moz-linear-gradient(left,rgba(92, 160, 123, 0.5),rgb(40, 173, 124));
    background: linear-gradient(left,rgba(92, 160, 123, 0.5),rgb(40, 173, 124));
	background: -o-linear-gradient(left,rgba(92, 160, 123, 0.5),rgb(40, 173, 124));
    }
#textarea {
	width:496px;
	height:83px;
	border-style:none none none none ;
	border-color:#D3E4DD;
	background: -webkit-linear-gradient(top,rgba(251, 251, 251,1),rgba(251, 251, 251,1));
	background: -moz-linear-gradient(top,rgba(251, 251, 251,1),rgba(251, 251, 251,1));
    background: linear-gradient(top,rgba(251, 251, 251,1),rgba(251, 251, 251,1));
	background: -o-linear-gradient(top,rgba(251, 251, 251,1),rgba(251, 251, 251,1));
	}
#textarea:focus {
	outline:none;
	}
.button{
width: 60px;
line-height: 20px;
text-align: center;
font-weight: bold;
color:#1B441B;
border-radius: 5px;
margin:0px 0px 0px 0px;
position:absolute;
top:90px;
left:436px;
overflow: hidden;
}
.button.green{
border:1px solid #64c878;
box-shadow: 0 1px 2px #b9ecc4 inset,0 -1px 0 #6c9f76 inset,0 -2px 3px #b9ecc4 inset;
background: -webkit-linear-gradient(top,#90dfa2,#84d494);
background: -moz-linear-gradient(top,#90dfa2,#84d494);
background: linear-gradient(top,#90dfa2,#84d494);
background: -o-linear-gradient(top,#90dfa2,#84d494);
}
.green:hover{
background: -webkit-linear-gradient(top,#aaebb9,#82d392);
background: -moz-linear-gradient(top,#aaebb9,#82d392);
background: linear-gradient(top,#aaebb9,#82d392);
background: -o-linear-gradient(top,#aaebb9,#82d392);
}
.green:active{
box-shadow: 0 1px 3px #4d7254 inset,0 3px 0 #fff;
background: -webkit-linear-gradient(top,#5eac6e,#72b37e);
background: -moz-linear-gradient(top,#5eac6e,#72b37e);
background: linear-gradient(top,#5eac6e,#72b37e);
background: -o-linear-gradient(top,#5eac6e,#72b37e);
}
li {
	color:rgba(90, 101, 113, 0.74);
	margin-bottom:5px;
	}
</style>
<link rel="stylesheet" type="text/css" href="/source/jquery.qtip.min.css"/>
<link href="/source/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
 
<script type="text/javascript" src='/source/jquery-2.0.3.js'></script>
<script type="text/javascript" src='/source/jquery.qtip.min.js'></script>
<script type="text/javascript" src='/source/jquery.mCustomScrollbar.js'></script>
<script type="text/javascript" src='/source/websocket_conn.js'></script>
<script type="text/javascript">	
$(document).ready(function() {
	$.format = function (source, params) {
		if (arguments.length == 1)
			return function () {
				var args = $.makeArray(arguments);
				args.unshift(source);
				return $.format.apply(this, args);
				};
		if (arguments.length > 2 && params.constructor != Array) {
			params = $.makeArray(arguments).slice(1);
			}
		if (params.constructor != Array) {
			params = [params];
			}
		$.each(params, function (i, n) {
			source = source.replace(new RegExp("\\{" + i + "\\}", "g"), n);
			});
		return source;
	}; //格式化字符串
	  function bubblel(id,title,text){//左侧用户bubble
		  
		  var selector=$.format("div[id={0}] > div",id);
		  var tipSet={
				//overwrite : false,
				content : {
					
					title : '',
					text : '',
				},
				position:{
					container : $("div[class='containor']"),
					viewport : true,
					my : 'center left',
					at : 'center right',
				},
				show : true,
				hide : false,
				event : false,
				style : {
					classes : 'qtip-blue qtip-shadow',  
					width :  '200px',
				},
			};
		  tipSet.content.text=text;
		  tipSet.content.title=title;
		$(selector).qtip(tipSet);
		$(selector).css("color","rgb(27, 56, 101)");
	  };
	  function bubbler(id,title,text){//右侧用户bubble
		  
		  var selector=$.format("div[id={0}] > div",id);
		  var tipSet={
				//overwrite : false,
				content : {
					
					title : '',
					text : '',
				},
				position:{
					container : $("div[class='containor']"),
					viewport :true,
					my : 'right center',
					at : 'left center',
				},
				show : true,
				hide : false,
				event : false,
				style : {					
					classes : 'qtip-green', 
					width :  '200px',
				},
			};
		  tipSet.content.text=text;
		  tipSet.content.title=title;
		$(selector).qtip(tipSet);
		$(selector).css("color","rgb(12, 74, 14)");	
	  };
       
		    inf = new Object();
			var myDate=new Date();//在发送的瞬间创建，Date对象，这样才是当前最准确的时间
			var year=myDate.getFullYear();
			var month=myDate.getMonth()+1;
			var day=myDate.getDate();
			var time=myDate.getTime();
			var hour=myDate.getHours();
			var minute=myDate.getMinutes();
			var second=myDate.getSeconds();
			var date=year+'-'+month+'-'+day;
			var time=hour+':'+minute+':'+second;
			inf.date = date;
			inf.time = time;
			var username='';
			username=$('#username').val();	
			inf.username = username;
			var userid='';
			userid=$('#userid').val();	
			inf.userid = userid;
			var mima='';
			mima=$('#mima').val();
			inf.mima = mima;
			var student_group='';
			student_group=$('#student_group').val();
			inf.student_group = student_group;
			if(username==''){
				alert('请填入您的姓名！');
				throw new Object('请填入您的姓名！');
			}
            if(mima==''){
                alert('请输入密码！');
                throw new Object('请输入密码！');
            }	
            var t = setTimeout("wait_websocket_conn(inf)",400);
	$("#fasong").click(function() {
			var username=''
			username=$('#username').val();
			if(username==''){
				alert('请填入您的姓名！');
				throw new Object('请填入您的姓名！');
			}
        if(hansocket.readyState){
			var sendmes='';//定义存储会话文本的变量
			sendmes=$("textarea").val();//取文本框的内容
			if(sendmes==''){
				alert('会话不能为空！');//判断用户是否输入了文字
				throw new Object('会话不能为空！');//终止程序运行
			}
			//取日期
			var myDate=new Date();//在发送的瞬间创建，Date对象，这样才是当前最准确的时间
			var year=myDate.getFullYear();
			var month=myDate.getMonth()+1;
			var day=myDate.getDate();
			var time=myDate.getTime();
			var hour=myDate.getHours();
			var minute=myDate.getMinutes();
			var second=myDate.getSeconds();
			var date=year+'-'+month+'-'+day;
			var time=hour+':'+minute+':'+second;
			//alert(newDate);
			hansocket.send(date+' '+time);
			hansocket.send('qunliao'+sendmes);
			
			$("textarea").val('');//点击发送之后立即清空文本框
			
		}
		else{
		    
			alert('connecting...');
		}
	
    });
    

	$("#guanbi").click(function() {
        if(hansocket.readyState){
			var myDate=new Date();//在发送的瞬间创建，Date对象，这样才是当前最准确的时间
			var year=myDate.getFullYear();
			var month=myDate.getMonth()+1;
			var day=myDate.getDate();
			var time=myDate.getTime();
			var hour=myDate.getHours();
			var minute=myDate.getMinutes();
			var second=myDate.getSeconds();
			var date=year+'-'+month+'-'+day;
			var time=hour+':'+minute+':'+second;
			//alert(newDate);
			document.getElementById("yilixian").style.visibility="visible";
			document.getElementById("zaixian_number").innerHTML=0;
			hansocket.send(date+' '+time);
			hansocket.send('Lto/Gqr3TV2xdQ0I1Su9yQ');//用户发送此消息序列即通知服务器用户已离线
			$("#list li").each(function() {
				this.className=null;
                
            });
			
		}
		else{
			alert('connecting...');
		}
	
    });
	
    
    
		var i=0;
		
		$("#huihua").mCustomScrollbar();//为主窗口添加滚动条插件
		hansocket.onmessage=function(mes){//这条语句必须放在件点击事件外面，否则除非点击，才能接受到数据，不点击就没法执行到此函数，从而无法接收消息
		    var message=mes.data.split('Lto/Gqr3TV2xdQ0I1Su9yQ');//mes是一个 MessageEvent对象，返回的数据在其data属性中
			if (message[0]=='statustart'){
				var dict={};
                                //alert(message[1]);         
				dict=eval('('+message[1]+')');
				$("#list li").each(function() {
	                				
					if(dict[this.id] == '1'){
						this.className='zaixian';
					}
					else if(dict[this.id] == '0'){
						this.className=null;
					}
					else{
						;
					}					
                    
                });
				var zaixian_number = document.getElementsByClassName('zaixian').length;
                document.getElementById("zaixian_number").innerHTML=zaixian_number;
			}
			if (message[0]=='add_student'){
			    var para=document.createElement("li");
			    para.setAttribute("id",message[1]);
                var node=document.createTextNode(message[2]);
                para.appendChild(node);

                var element=document.getElementById("list");
                element.appendChild(para);				
				var total_number = document.getElementsByTagName('li').length;
                document.getElementById("total_number").innerHTML=total_number;
			}
		    if (message[0]=='delete_this_student'){
				document.getElementById("guanbi").click();
				document.getElementById("fubiaoti").innerHTML="你已不在此讨论组内";
				document.getElementById("fubiaoti").style.color="rgb(148, 11, 11)";
			} 
			if (message[0]=='delete_student'){
				var parent=document.getElementById("list");
				var child=document.getElementById(message[1]);
				parent.removeChild(child);
				var zaixian_number = document.getElementsByClassName('zaixian').length;
                document.getElementById("zaixian_number").innerHTML=zaixian_number;
                var total_number = document.getElementsByTagName('li').length;
                document.getElementById("total_number").innerHTML=total_number;
			} 
			if (message[0]=='repeat'){
				alert(message[1]);
			} 
			if (message[0]=='biaozhi'){
                alert(message[1]);
            }
            if (message[0]=='biaozhi2'){
                alert(message[1]);
            }    
            if (message[0]=='closewebsocket'){
                alert("您已被迫下线，账号在其他地方登陆！");
                $("#list li").each(function() {
				     this.className=null;           
            });
            }             
			
			if (message[0]=='statusend'){
				user=message[1];
				date=message[2];
				text=message[3];
				
					$("#huihua .mCSB_container").append($.format("<div class='containor' id={0}><div class=''></div></div>",i));//每一个对话元素设置一个唯一的ID,用来查找并为其添加qtip
					 $("#huihua").mCustomScrollbar("update");//在插入会话内容后必须update	
					if (user!=username){
				        if (user == "傅剑"){ 
					        user="傅剑老师";
					        $($.format("div[id={0}] > div",i)).text(user).attr('class','userl');
						    bubblel(i,date,text);}
						else{
						    $($.format("div[id={0}] > div",i)).text(user).attr('class','userl');
						    bubblel(i,date,text);}
					}
					else{
					    if (user == "傅剑"){ 
					        user="傅剑老师";
					        $($.format("div[id={0}] > div",i)).text(user).attr('class','userr');
						    bubbler(i,date,text);}
						else {
						    $($.format("div[id={0}] > div",i)).text(user).attr('class','userr');
						    bubbler(i,date,text);}
											  					   
					    }				    
		
				   $("#huihua").mCustomScrollbar("scrollTo","bottom");
					i+=1;
			    
			}
		};
		hansocket.onclose=function(){

			i=0;
			var username='';
			username=$('#username').val();
			$("#huihuaheader span").text(username+"已离线！");
			
			$("#list div").each(function() {//所有用户的页面中状态部分将全都变为
				this.className=null;
                
            });
		};
});
window.onbeforeunload = function(){
        if(hansocket.readyState){
			var myDate=new Date();//在发送的瞬间创建，Date对象，这样才是当前最准确的时间
			var year=myDate.getFullYear();
			var month=myDate.getMonth()+1;
			var day=myDate.getDate();
			var time=myDate.getTime();
			var hour=myDate.getHours();
			var minute=myDate.getMinutes();
			var second=myDate.getSeconds();
			var date=year+'-'+month+'-'+day;
			var time=hour+':'+minute+':'+second;
			hansocket.send(date+' '+time);
			hansocket.send('Lto/Gqr3TV2xdQ0I1Su9yQ');//用户发送此消息序列即通知服务器用户已离线
			$("#list div").each(function() {
				this.className=null;
                
            });
			
		}
		else{
			alert('connecting...');
		}
　　}
</script>

<body>
<div id = "all">
     <div id = "top">
         <p style = "text-align:center; font-size:30px; color:#383467; margin:0px; padding:10px; text-shadow:5px 0px 5px #FFFFFF;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif">自动化实验室</p>       
         <p id="fubiaoti" style= "text-align:center;font-size:14px;margin:0px; padding:0px,0px,0px,0px;color:#383467; text-shadow:2px 0px 2px #FFFFFF;">{{taolunzu_name}}</p>
         <p id="shiyan_shijian">实验时间:<br>{{shiyan_time}}</p> 
         <button id= "guanbi" type="button" >离线</button>
         <p id="yilixian">已离线</p>
         <div style = "position:absolute; top:0;left:480px;background-color:rgba(0,0,0,0); visibility:hidden;">
              %username = session.get("user")["username"]
              %userid = session.get("user")["userid"]
              %password = session.get("user")["password"]
              %student_group = session.get("user")["student_group"]
              <input id="username" class = "username" type="text" value = {{username}} style = "background-color:rgba(0,0,0,0); width:100px; border:none;" />
              <input id="userid" class = "userid" type="text" value = {{userid}} style = "background-color:rgba(0,0,0,0);width:100px; border:none;"/>
              <input id="mima" class = "username" type="text" value = {{password}} style = "background-color:rgba(0,0,0,0);width:100px; border:none;"/>
              <input id="student_group"  type="text" value = {{student_group}} style = "background-color:rgba(0,0,0,0);width:100px; border:none;"/>
         </div>
     </div>
     <div id = "bottom">
          <div id = "left">
               <div id = "huihua"></div>
               <div id = "xia">
               <textarea id = "textarea" autofocus></textarea>
               <button type="button" class="button green" id = "fasong">发送</button>
               </div>
          </div>
          <div id = "right">
          <p style = "text-align:center">讨论组成员(<span id="zaixian_number">1</span>/<span id ="total_number">4</span>)</p>
          <ul id = "list">
              %for k in student:
              %s = student[k]
              <li id = {{k}}>{{s}}</li>
              %end
          </ul>
          </div>
     </div>
</div>
</body>
<script>
var total_number = document.getElementsByTagName('li').length;
document.getElementById("total_number").innerHTML=total_number;
</script>
</html>
