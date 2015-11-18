<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="utf-8">
<title>测试</title>
<head>
<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.msgbox.js"></script>
<script type="text/javascript" src="../js/jquery.dragndrop.min.js"></script>
<link rel="stylesheet" href="css/jquery.msgbox.css">
<style>
:root{background-color:#DCDCDC;text-align:center;}
body{font-size:20px;text-align:left;width:1000px;margin:0 auto;font-family:STSong;background-color:white;padding:10px;}
#done{display:none;}
.hide{display:none;}
div{padding:10px;}
.done, .start{width:300px;height:50px;border-radius:45px;-moz-border-radius:45px;background-color:#FF5555;font-size:20px;}
.done1{width:300px;height:50px;border-radius:45px;-moz-border-radius:45px;background-color:#DCDCDC;border:1px solid #FFFFFF;font-size:20px;}
#done, .startdiv{margin:0 auto;text-align:center;}
.header{background-color:#FF5555;}
.header p{color:black;}
p{font-size:17px;}
.dialog{width:360px;border:solid 5px #CCDDFF;position:absolute;display:none;z-index:999;padding:0px;}
.dialog .title{background-color:#CCDDFF;padding:10px 10px 10px 30px;;font-weight:bold;}
.dialog .title img{float:right;}
.dialog .content{background-color:#fff;padding:10px 25px 10px 10px;height:60px;}

.dialog .content span{padding-top:10px;padding-left:5px;font-size:15px;}
.dialog .bottom{text-align:center;padding:10px 10px 10px 10px;background-color:#FFFFFF;}
.btn{height:25px;width:70px;border-radius:15px;background-color:#BBFFEE;font-size:15px;}
.mask{width:100%;height:500%;background-color:#DCDCDC;position:absolute;top:0px;left:0px;opacity:0.8;display:none;z-index:50;}
</style>
<script type="text/javascript">
$(function(){
       function getquerystring(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return decodeURI(r[2]);
				return null;
			}     
            %user = session.get("user")
			var studentid = '{{user["userid"]}}';
			var studentname='{{user["username"]}}';
			var couname = getquerystring("couname");
			//alert(couname)
			var subname = getquerystring("subname");
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
                }) 
         $("#Dialogbutton").click(function(){
                $(".dialog").hide();
                $(".mask").hide();
                })
	     $.ajax({
                 url:"/if_havedone",
                 type:"POST",
                 dataType:"json",
                 data:{subname:subname},
                 success:function(data){
                   // alert(data.msg);
                    if(data.msg==0){
                       $(".start").replaceWith("<p><b>你已完成测试！</b></p>"); 
                    }
                 
                 }   
	        })  
      

       $.ajax({
					url : "/yuxijiancha",
					type : "POST",
					dataType : "json",
					data : {
						studentid : studentid,
						studentname:studentname,
						couname : couname,
						subname : subname
					     },
					success : function(data) {
					   if (data["row1"] == "预习") {
					        $(".start").replaceWith("<p><b>请先完成预习！</b></p>");
					      }
					      
					     }
					   })   

		 
var array={};
function showQuestion(j,obj){
            var i=j+1;
            var optionA=obj["optionA"];
            var optionB=obj["optionB"];
            var optionC=obj["optionC"];
            var optionD=obj["optionD"];
            var question=obj["question"];
            $("#"+i).html(i+"."+question)
                      .append("<p>"+'<input type="radio" value="A" name='+i+' />'+"A."+optionA+"</p>")
                      .append("<p>"+'<input type="radio" value="B" name='+i+' />'+"B."+optionB+"</p>")
                      .append("<p>"+'<input type="radio" value="C" name='+i+' />'+"C."+optionC+"</p>")
                      .append("<p>"+'<input type="radio" value="D" name='+i+' />'+"D."+optionD+"</p>")
                      .css("display","none")
                     } 
   $.ajax({
		 type : "POST",
		 url : "/testingquestions",
		 data : {subname : subname},
		 dataType : "json",
		 async : false,
		 success : function(data) {
		   $.each(data,function(key,value){
		       $.each(value,function(index,content){
		        question=content.question;
		        //alert(question1);
		        optionA=content.optionA;
		        //alert(optionA);
		        optionB=content.optionB;
		        optionC=content.optionC;
		        optionD=content.optionD;
		        array["question"]=question;
		        array["optionA"]=optionA;
		        array["optionB"]=optionB;
		        array["optionC"]=optionC;
		        array["optionD"]=optionD;
		        showQuestion(index,array);
		           })
		   })			  	
		}
		
	})
 $(".start").click(function() {
    $(".start").hide()
    $("#1").show()
    $("#2").show()
    $("#3").show()
    $("#4").show()
    $("#5").show()
    $("#6").show()
    $("#7").show()
    $("#8").show()
    $("#9").show()
    $("#10").show()
    $("#done").show()
    })
 $(".done").click(function(){
       var anwser={};
       var B=0;
       for(var i=1;i<11;i++){
          if ($('input:radio[name='+i+']:checked').val() == undefined) {
               //alert("你还没有完成答题，不能提交！");              
               B=1;
          }else{
               anwser[i-1]=$('input:radio[name='+i+']:checked').val();
               //alert(anwser);
            }
        }
        if(B==1){
            //alert("你还没有完成答题，不能提交！");
            showMessage("你还没有完成答题，不能提交！");
        }
       /* var anwser2=$('input:radio[name="2"]:checked').val();
        var anwser3=$('input:radio[name="3"]:checked').val();
        var anwser4=$('input:radio[name="4"]:checked').val();
        var anwser5=$('input:radio[name="5"]:checked').val();
        var anwser6=$('input:radio[name="6"]:checked').val();
        var anwser={};
        if(anwser1 && anwser2 && anwser3 && anwser4 && anwser5){
        anwser["0"]=anwser1;
        anwser["1"]=anwser2;
        anwser["2"]=anwser3;
        anwser["3"]=anwser4;
        anwser["4"]=anwser5;
        anwser["5"]=anwser6;*/
  /*  $.ajax({     
		type:"POST",
		async:false,
		dataType:"json",
		url:"/upstate",			
		data:{"yuyuewancheng":"测试完成","studentid":studentid,"subexperimentname":subname}
			});		*/
										    

    $.ajax({
	   type : "POST",
	   url : "/getscore",
	   //data : {"anwser":anwser},
	   data : {anwser:$.param(anwser),
	            subname : subname },
	   dataType : "json",
	   async : false,
	   success : function(data) {
	   $.each(data,function(key,value){
	      $.each(value,function(index,content){
	         //alert(content.msg);
	         //showMessage("你的成绩为"+content.score);
	         
	         if(content.score>60){
	           $(".done").attr("disabled",true).removeClass("done").addClass("done1");
	           showMessage("你的成绩为"+content.score+"。"+"测试通过，可进行实验预约！");
	          
	           $.ajax({     
		          type:"POST",
		          async:false,
		          dataType:"json",
		          url:"/upstate",			
		          data:{"yuyuewancheng":"测试完成","studentid":studentid,"subexperimentname":subname}
			         });	
	          }else{
	           //alert("测试未通过！");
	           showMessage("你的成绩为"+content.score+"。"+"测试未通过，请重新测试！");
	         }
	         })
	       })
	   //$(".done").attr("disabled",true);
			}
		}) 
		
    })
 
})
</script>
<body>
  <div class="header"><h1>Testing</h1>
  <div><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp测试部分用来检测你是否已完全掌握做本次实验所需要的知识，测试的内容来自本次实验的预习部分，测试完成后点击提交按钮即可得到本次测试的成绩。测试成绩合格为70分，只有成绩达到合格方可进行实验预约，成绩不合格需再次进行实验预习。</p></div>
  </div><br />
  <div style="width:1000px;height:1px;margin:0px auto;padding:0px;background-color:#D5D5D5;overflow:hidden;"></div><br />
  <div class="startdiv"><input type="button" value="开始" class="start" /></div>
  <div id="1"></div>
  <div id="2"></div>
  <div id="3"></div>
  <div id="4"></div>
  <div id="5"></div>
  <div id="6"></div>
  <div id="7"></div>
  <div id="8"></div>
  <div id="9"></div>
  <div id="10"></div>
  <div id="done"><input class="done" type="submit" value="提交"></input></div>
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
</head>
</html>