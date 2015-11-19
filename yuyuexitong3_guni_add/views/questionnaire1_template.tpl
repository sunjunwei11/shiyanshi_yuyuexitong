<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="utf-8">
<title>调查问卷</title>
<head>
<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
<style>

:root{background-color:#DCDCDC;text-align:center;}
body{font-size:20px;text-align:left;width:1000px;margin:0 auto;padding:10px;font-family:STSong;background-color:white;}
table{display:none;font-family:STSong;width:1000px;padding:10px;}
.td1{width:800px;padding:5px;}
.td2{width:200px;text-align:center;padding:5px;}
ul{ display:none;list-style:none;margin:0px;padding:0px;}
li{ display:inline;}
.com1{margin:0 auto;text-align:center;}
#header{width:1000px;hight:200px;}
.com2{margin:0 auto;text-align:center;}
.start{width:300px;height:50px;border-radius:45px;-moz-border-radius:45px;background-color:#550088;font-size:20px;}
.done{width:300px;height:50px;border-radius:45px;-moz-border-radius:45px;background-color:#550088;display:none;font-size:20px;}
.done1{width:300px;height:50px;border-radius:45px;-moz-border-radius:45px;background-color:#DCDCDC;border:1px solid #FFFFFF;font-size:20px;}
.img{width:1000px;width:expression(document.body.clientWidth>600?"600px":"auto");overflow:hidden;} 
p{font-size:18px;padding:10px;}
.select{width:80px;height:30px;text-align:center;}
.mouse_color{background-color:#DCDCDC;}
textarea{resize:none;}
.dialog{width:360px;border:solid 5px #CCDDFF;position:absolute;display:none;z-index:999;}
.dialog .title{background-color:#CCDDFF;padding:10px 10px 10px 30px;;font-weight:bold;}
.dialog .title img{float:right;}
.dialog .content{background-color:#fff;padding:10px 25px 10px 10px;height:60px;}
.dialog .content img{float:left;}
.dialog .content span{float:left;padding-top:10px;padding-left:5px;font-size:15px;}
.dialog .bottom{text-align:center;padding:10px 10px 10px 10px;background-color:#FFFFFF;}
.btn{height:25px;width:70px;border-radius:15px;background-color:#BBFFEE;font-size:15px;}
.mask{width:100%;height:500%;background-color:#DCDCDC;position:absolute;top:0px;left:0px;opacity:0.8;display:none;z-index:50;}
</style>
<script>
$(function() {
var setDate = new Date();
setDate.setFullYear(2015,10,25);
var today = new Date();
if (today < setDate){
    //alert("success.");
    $("#title").hide();
    $("#start").replaceWith("<p><b>问卷调查（实验后）2015年11月25日开放！</b></p>");
}else{
    //alert("failed.");

//alert(setDate);
$('.select').val("");  
$('#anwser8').val("");
$('#anwser9').val("");
$('#anwser10').val("");
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
 /* $.ajax({
					type : "POST",
					url : "/state_enquiry",
					data : {},
					dataType : "json",
					async : false,
					success : function(data) {
						//alert()
						if (data["msg"] == 0) {
							$("#start").replaceWith("<p><b>你还未完成实验，请在完成实验后再来完成本份调查问卷！</b></p>");
						}
					}
				})
 $.ajax({
					type : "POST",
					url : "/if_submitted",
					data : {},
					dataType : "json",
					async : false,
					success : function(data) {
						//alert()
						if (data["msg"] == 1) {
							$("#start").replaceWith("<p><b>你已提交实验反馈！</b></p>");
						}
					}
				})*/
  var type="questionnaire2";
  $.ajax({
			type:"POST",                            
			url:"/questions",            //发送请求的地址
			//cache:false,           //不缓存该页面
			async:false,
			data:{type:type},
			dataType:"json", //预期服务器返回的数据类型。若不指定，jQuery 将自动根据 HTTP 包 MIME 信息来判断，比如XML MIME类型就被识别为XML
			success:function(data){
			   $.each(data,function(key,value){			
			     $.each(value,function(key1,value1){
			          question1=value["1"];
			          question2=value["2"];
			          question3=value["3"];
			          question4=value["4"];
			          question5=value["5"];
			          question6=value["6"];
			          question7=value["7"];
			          question8=value["8"];
			          question9=value["9"];
			          question10=value["10"];
			          });               
                   });
			    }

     });	

  $("#start").click(function() {
    $("#start").hide()
    $("#table").show()
    $("#test111").show().html("1." + question1)
    $("#test112").show().html("2." + question2) 
    $("#test113").show().html("3." + question3)
    $("#test114").show().html("4." + question4)
    $("#test115").show().html("5." + question5)
    $("#test116").show().html("6." + question6)
    $("#test117").show().html("7." + question7)
    $("#test118").show().html("8." + question8) 
    $("#test119").show().html("9." + question9) 
    $("#test110").show().html("10." + question10)
    $("#done").show()
                                  });
  /* $("ul li input[type="radio"]").each(function(index){
                               if(this.checked){
                                alert(this.val);
                                };   
                                }); */
  $("#done").click(function(){
        var A = {};
        %user = session.get('user')
					
	    var userid = "{{user["userid"]}}";
        var biaozhi=0;
        for(var i=0;i<8;i++){
          if ($(".select").eq(i).val() == "" || $("#anwser8").val()=="" || $("#anwser9").val()=="" || $("#anwser10").val()=="") {
				//alert("你还没有完成答题，不能提交！");
				biaozhi=1;
				break;
		  }else{
		      A["type"] = type;
		      A[i] = $(".select").eq(i).val();		      
		      A["7"]=$("#anwser8").val();
			  A["8"]=$("#anwser9").val();
			  A["9"]=$("#anwser10").val();
		      }
			}  
		if (biaozhi==1){
		     showMessage("你还没有完成答题，不能提交！");
		}else{	  			  
			  $.ajax({
						type : "POST",
						url : "/saveanwser",
						data : {anwser:$.param(A)},
						dataType : "json",
						async : false,
						success : function(data) {
							showMessage(data["msg"]);
							$("#done").attr("disabled",true).removeClass("done").addClass("done1");

						}
					})
			   }
		   }) 
		  
   /*   var val1=$('input:radio[name="q1"]:checked').val();
        var val2=$('input:radio[name="q2"]:checked').val();
        var val3=$('input:radio[name="q3"]:checked').val();
        var val4=$('input:radio[name="q4"]:checked').val();
        if (val1 && val2 && val3 && val4){
             a[0]=val1;
             a[1]=val2;
             a[2]=val3;
             a[3]=val4; 
             alert(a);
             $('input:radio:checked').removeAttr("checked");
        }else {
             alert("你还没有完成答题，不能提交！");
            }  */
                                         
   
   $("#table tr").mouseover(function(){
    $(this).find("td").addClass("mouse_color");
    });
   $("#table tr").mouseout(function(){
    $(this).find("td").removeClass("mouse_color");
    });
   }
}); 
</script>
</head>
<body>
    <div id=header><img class="img" src="/images/questionnaire/questionnaire11.jpg"/></div>
    
    <div id="title"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp肯定回答为10分，否定回答为0分，中间1-9分表示肯定或否定的程度，数字越大表示肯定的程度越大否定的程度越小。例如第一题：如果是十分有收获则评分为10，有点收获到有收获可以再6-9区间内打分，不确定为5分，非常收获到基本没收获分值为1-4分，完全没收获则评分为0分，请同学们根据自己的真实感受打分，感谢你的参与！</p></div>
    <div style="width:1000px;height:1px;margin:0px auto;padding:0px;background-color:#D5D5D5;overflow:hidden;"></div><br />
    <div class="com1"><input id="start" type="submit" class="start" value="开始" /></div>
 
    <table id="table">
	  <tr>
	  
	  	    <td class="td1"><span id="test111"></span></td>
	  	    <td class="td2"><a class="a1"><select class="select" >
                                <option value="" display=none></option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
		   </select></a></td>
	  </tr>
	
	  <tr>
	  	<td class="td1"><span id="test112"></span></td>
	  	    <td class="td2"><a class="a1"><select class="select" >
                                <option value="" display=none></option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
		   </select></a></td>
	  </tr>
	 
      <tr>
	  	<td class="td1"><span id="test113"></span></td>
	  	    <td class="td2"><a class="a1"><select class="select" >
                                <option value="" display=none></option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
		   </select></a></td>
	  </tr>
	  <tr>
	  	<td class="td1"><span id="test114"></span></td>
	  	    <td class="td2"><a class="a1"><select class="select" >
                                <option value="" display=none></option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
		   </select></a></td>
	  </tr>
	  <tr>
	  	<td class="td1"><span id="test115"></span></td>
	  	    <td class="td2"><a class="a1"><select class="select" >
                                <option value="" display=none></option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
		   </select></a></td>
	  </tr>
	  <tr>
	  	<td class="td1"><span id="test116"></span></td>
	  	    <td class="td2"><a class="a1"><select class="select" >
                                <option value="" display=none></option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
		   </select></a></td>
	  </tr>
	  <tr>
	  	<td class="td1"><span id="test117"></span></td>
	  	    <td class="td2"><a class="a1"><select class="select" >
                                <option value="" display=none></option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
		   </select></a></td>
	  </tr>
	  <tr>
	  <td class="td1"><span id="test118"></span>
	  <textarea cols="100" rows="6" id="anwser8" overflow="scroll"></textarea></td>
	  </tr>
	  <tr>
	  <td class="td1"><span id="test119"></span>
	  <textarea cols="100" rows="6" id="anwser9" overflow="scroll"></textarea></td>
	  </tr>
	  <tr>
	  <td class="td1"><span id="test110"></span>
	  <textarea cols="100" rows="6" id="anwser10" overflow="scroll"></textarea></td>
	  </tr>
	  </table>
      <div class="com2"><input id="done" type="submit" class="done" value="提交" /></div>
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

