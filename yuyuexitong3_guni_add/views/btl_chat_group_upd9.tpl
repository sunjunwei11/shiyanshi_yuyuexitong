<!DOCTYPE>
<html>
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style>
.containor {
	    position:relative;
		border-color:#000;
		width:600px;
		margin-bottom:40px;
		margin-top:40px;
		margin-left:0px;
		margin-right:0px;
		padding:0px;
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
	      background-color:#FF0000;
		  
}
.username{
          width:72px;
}
.userid{
          width:110px;
}
#list div
 {
	      margin-top:3px;
		  margin-bottom:3px;
}
#list {
	     position:absolute;
	     border:double;
		 margin:0px;
		 padding:0px;
		 width:100px;
		 left:625px;
		 
}

#huihua { 
          border:double;
          border-color:#000;
		  margin:0px;
		  padding:0px;
          background-color:#FFF;
		  position:relative;
		  width:600px;
		  height:400px;
		  overflow:scroll;
		  overflow-y:auto;
		  overflow-x:auto;
		  white-space:normal;
		  word-break:normal;
		  float:left;
		  background-image:url(/source/images/dialog_background2.jpg);
		  
}
#shuru {
		  
		  margin:0px;
		  padding:0px;
		  clear:left;
}
#tishi {
	    border:double;
	    position:fixed;
		width:220px;
		height:160px;
		right:0px;
		bottom:0px;
		margin:0px;
		padding:0px;
		
}
#tishiheader {
	    background:#0FF;
}
#tishitext {
	    margin:0px;
		padding:0px;
        height:150px;  
        line-height:85px;
		text-align:center;
}

body { 
       position:relative;
	   margin:0px;
	   overflow:hidden;
	   
		
}
</style>
<link rel="stylesheet" type="text/css" href="/source/jquery.qtip.min.css"/>
<link href="/source/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
 
<script type="text/javascript" src='/source/jquery-2.0.3.js'></script>
<script type="text/javascript" src='/source/jquery.qtip.min.js'></script>
<script type="text/javascript" src='/source/jquery.mCustomScrollbar.js'></script>
<script type="text/javascript" src='/js/websocket_conn.js'></script>

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
					my : 'left center',
					at : 'right center',
				},
				show : true,
				hide : false,
				event : false,
				style : {
					classes : 'light', 
					width :  '200px',
				},
			};
		  tipSet.content.text=text;
		  tipSet.content.title=title;
		$(selector).qtip(tipSet);
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
					classes : 'qtip-blue', 
					width :  '200px',
				},
			};
		  tipSet.content.text=text;
		  tipSet.content.title=title;
		$(selector).qtip(tipSet);
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
			if(username==''){
				alert('请填入您的姓名！');
				throw new Object('请填入您的姓名！');
			}
            if(mima==''){
                alert('请输入密码！');
                throw new Object('请输入密码！');
            }	
            var t = setTimeout("wait_websocket_conn(inf)",400);
	$("input[value='发送']").click(function() {
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
    

	$("input[value='离线']").click(function() {
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
			hansocket.send(date+' '+time);
			hansocket.send('Lto/Gqr3TV2xdQ0I1Su9yQ');//用户发送此消息序列即通知服务器用户已离线
			$("#list div").each(function() {
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
				$("#list div").each(function() {
					
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
            if (message[0]=='no permission1'){
                permission1='not allow';
            }   
            if (message[0]=='permission1'){
                permission1='allow';
            }     
            if (message[0]=='no permission2'){
                permission2='not allow';
            }   
            if (message[0]=='permission2'){
                permission2='allow';
            }                   
			if (message[0]=='private'){
				$("#tishitext").text(message[1]+message[2]);
				duixiang2=message[1];
				$("#tishi").fadeIn(2000);
			}
            if (message[0]=='group'){
                $("#taolunzutext").text(message[1]+message[2]);
                duixiang2=message[1];
                $("#taolunzu").fadeIn(2000);
            }			
			if (message[0]=='statusend'){
				user=message[1];
				date=message[2];
				text=message[3];
				
					$("#huihua .mCSB_container").append($.format("<div class='containor' id={0}><div class=''></div></div>",i));//每一个对话元素设置一个唯一的ID,用来查找并为其添加qtip
					 $("#huihua").mCustomScrollbar("update");//在插入会话内容后必须update	
					if (i%2==0){
						$($.format("div[id={0}] > div",i)).text(user).attr('class','userl');
						bubblel(i,date,text);
					}
					else{
						$($.format("div[id={0}] > div",i)).text(user).attr('class','userr');
						bubbler(i,date,text);
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
</script>


</head>

<body>
<div id="huihuaheader">
    %username = session.get("user")["username"]
    %userid = session.get("user")["userid"]
    %password = session.get("user")["password"]
    姓名：
    <input id="username" class = "username" type="text" value = {{username}} />
    学号：
    <input id="userid" class = "userid" type="text" value = {{userid}} />
    密码:
    <input id="mima" class = "username" type="text" value = {{password}} />
    <input type="button" value="参与" />
    <input type="button" value="离线" />
</div>


<div id="huihua">


</div>
<div id="list">
   %for k in student:
   %s = student[k]
    <div id={{k}}>
        <input type="checkbox" value={{s[0]}}/>
        <span>{{s[0]}}</span>
    </div>
    %end
 <!--<div id="老师">
        <input id="memchk1" type="checkbox" value="老师"/>
        <span>老师</span>
    </div>
    <div id="学生1">
        <input id="memchk2" type="checkbox" value="学生1"/>
        <span>学生1</span>
    </div>
    <div id="学生2">
        <input id="memchk3" type="checkbox" value="学生2"/>
        <span>学生2</span>
    </div>
    <div id="学生3">
        <input id="memchk4" type="checkbox" value="学生3"/>
        <span>学生3</span>
    </div>  -->

</div>



<div id="shuru">
    <textarea></textarea>
    <input type="button" value="发送"/>
</div>

</body>
</html>
