<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线试题编辑</title>
<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
<style type="text/css">
body,td,th {font-size: 20px;}
textarea {resize:none;}
.all{background-color:lightgreen;width:700px;position:fixed;left:24%;top:23%;margin-left:auto;margin-top:auto;}
.liu{padding:5px;}
.si{margin:0 auto;text-align:center;padding:10px;background-color:white}
.button{width:300px;height:50px;border-radius:45px;-moz-border-radius:45px;background-color:#00FF00;margin-left:auto;margin-right:auto;font-size: 20px;}
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
$(function() {
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
          $("#course").val("");
		  $("#experiment").val("");
		  $("#question").val("");
		  $("#A").val("");
		  $("#B").val("");
		  $("#C").val("");
		  $("#D").val("");
		  $("#anwser").val("");
                }) 
  $("#Dialogbutton").click(function(){
          $(".dialog").hide();
          $(".mask").hide();
          $("#course").val("");
		  $("#experiment").val("");
		  $("#question").val("");
		  $("#A").val("");
		  $("#B").val("");
		  $("#C").val("");
		  $("#D").val("");
		  $("#anwser").val("");
              })
$("#button").click(function(){
	var mark=0;
	var content={};
	if($("#course").val()=="" || $("#experiment").val()=="" || $("#anwser").val()=="" ||$("#question").val()=="" || $("#A").val()==""||$("#B").val()==""||$("#C").val()==""||$("#D").val()==""){
		mark=1;
	}else{
		content["course"]=$("#course").val();
		content["experiment"]=$("#experiment").val();
		content["question"]=$("#question").val();
		content["A"]=$("#A").val();
		content["B"]=$("#B").val();
		content["C"]=$("#C").val();
		content["D"]=$("#D").val();
		content["anwser"]=$("#anwser").val();
		}
	if(mark==1){
		showMessage("请完成题目的所有编辑内容后再提交！");
	}else{
	    //alert("测试2");
		$.ajax({
		    type : "POST",
		    url  : "/questionseditor",
		    data : {editor:$.param(content)},
		    //data : {wode:"ceshi"},
		    datatype : "json",
		    async : false,
		    success : function(data){
		         showMessage(data["msg"]);
		    
		    }
		    
		
		
		
		})
		}
	 //alert(content);
	//alert($("#course").val());
	})
	})
</script>

</head>

<body>
<div class="all">
<div id=header></div>
<div class="liu">课程选择：<select id="course">
               <option value=""></option>  
               <option value="过程控制">过程控制</option>
               <option value="计算机仿真技术">计算机仿真技术</option>
               <option value="微机原理">微机原理</option>
               <option value="电机与拖动">电机与拖动</option>
               
               </select>
</div> 
<div class="liu">实验选择：<select id="experiment">
             <option value=""></option>
             <option value="上水箱对象特性">上水箱对象特性</option>
             <option value="液位单闭环控制">液位单闭环控制</option>
             <option value="流量液位串级控制">流量液位串级控制</option>
             <option value="史密斯预估实验">史密斯预估实验</option>
             </select>
</div>                          
<div class="liu">题目编辑：
      <textarea cols="103" rows="5" id="question" overflow="scroll"></textarea>
</div>
<div class="liu">选项编辑：<br />
A.<textarea cols="100" rows="1" id="A" ></textarea><br />
B.<textarea cols="100" rows="1" id="B" ></textarea><br />
C.<textarea cols="100" rows="1" id="C" ></textarea><br />
D.<textarea cols="100" rows="1" id="D" ></textarea><br />
</div>

<div class="liu">正确答案：<select id="anwser">
             <option value=""></option> 
             <option value="A">A</option>
             <option value="B">B</option>
             <option value="C">C</option>
             <option value="D">D</option>
             </select>
</div>

<div class="si">
       <input type="button" id="button" class="button" value="提交"/>
</div>
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
