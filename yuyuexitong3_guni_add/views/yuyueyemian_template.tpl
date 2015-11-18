<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>实验预约</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel='stylesheet' href='css/fullcalendar.css'>
		<script type='text/javascript' src='js/jquery.js'></script>
		<script type='text/javascript' src='js/ui.core.js'></script>
		<script type='text/javascript' src='js/fullcalendar.js'></script>
		
		<script type='text/javascript'>
			var aa = new Array();
			var bb = new Array();
			var cc = new Array();
			var dd = new Array();
			var ee = new Array();
			
			var m = new Array();
			var zz = new Array();
			var num = new Number();
			var j = 0;
			
			//var d = date.getDate();
			//var m = date.getMonth();
			//var y = date.getFullYear();
			var count = new Array();
			function getquerystring(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return decodeURI(r[2]);
				return null;

			}
            
			
			%user = session.get("user")
			var studentname = '{{user["username"]}}';
		
			var studentid='{{user["userid"]}}';
			var coursename = getquerystring("couname");
			var subexperimentname = getquerystring("subname");
			
			eventColor = ["eventColor0", "eventColor1", "eventColor2", "eventColor3", "eventColor4", "eventColor5"];
            $(function() {
			//$(document).ready(function() {
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
			     });           
	                        var value0=new Array(); 
	                        var key0=new Array(); 
	                        value0[0]=coursename;         //课程名称
	                        value0[1]=subexperimentname;        //实验类
	                        key0[0]="coursename";         //课程名称
	                        key0[1]="subexperimentname";        //实验类
	                        var experimrnt={};
	                        
	  for(var s=0;s<2;s++){
		experimrnt[key0[s]]=value0[s];
		                   }
	
		$.ajax({
			type:"POST",                            
			url:"/show",            //发送请求的地址
			cache:false,           //不缓存该页面
			dataType:"json", //预期服务器返回的数据类型。若不指定，jQuery 将自动根据 HTTP 包 MIME 信息来判断，比如XML MIME类型就被识别为XML
			data:experimrnt,
			success:function(data){
            $.each(data,function(key,value){ 
                   var j=0;
              $.each(value,function(indec,items){        
                  aa[j]=items;
                  j=j+1;
                  var i=0;
                $.each(items,function(key,value){  
                      bb[i]=value;
                      i=i+1;
                                                })
                    
                             })  
              
                
                 var setTime = new Array(); 
                 var endTime = new Array();
                 var startTime = new Array();
                 var xiakeTime = new Array();
                 var maxnumber = new Array();
                 var eqrule = new Array();
                 var dateArray = new Array();
                 var dateArray1 = new Array();
                 var h=0;
                 
                 
                 
                 for(l=0;l<j;l++)
                 {
                 //alert(aa[l]);
                 ee[l]=aa[l];
                 setTime[l]=ee[l].setTime; 
                 endTime[l]=ee[l].endTime; 
                 startTime[l]=ee[l].startTime;            
                 xiakeTime[l]=ee[l].xiakeTime;
                 maxnumber[l]=ee[l].maxnumber;
                 eqrule[l]=ee[l].eqrule;
            
                      function GetDateDiff(startDate,endDate) 
							{ 
							var startTime = new Date(Date.parse(startDate.replace(/-/g, "/"))).getTime(); 
							var endTime = new Date(Date.parse(endDate.replace(/-/g, "/"))).getTime(); 
							var dates = Math.abs((startTime - endTime))/(1000*60*60*24);
							return dates;
							}           
                        m[l]=GetDateDiff(setTime[l],endTime[l]); 
                       
                            
							   function getDate(str)
							   {
							   var tempDate=new Date();
							   var list=str.split("-");
							   tempDate.setFullYear(list[0]);
							   tempDate.setMonth(list[1]-1);
							   tempDate.setDate(list[2]);
							   return tempDate;
							   }
							                          
							                          
							                          
							  var date1=getDate(setTime[l]);
							  var date2=getDate(endTime[l]);
							  //alert(date2);
							  if(date1>date2)
							  {
							   var tempDate=date1;
							   date1=date2;
							   date2=tempDate;
							   }
							 
							  dd[l]=new Array();
							  for(var d=0;d<= m[l];d++)
							  {
							  date=date1.getFullYear()+"-"+(date1.getMonth()+1)+"-"+date1.getDate()
							  var Str=date.split("-");
							  var day = parseInt(Str[2]);
							  var month = parseInt(Str[1]);
							  if(day<10)
								day="0"+day;
							  if(month<10)
							    month="0"+month; 
							   dd[l][d]=date1.getFullYear()+"-"+month+"-"+day                      				 
							   date1.setDate(date1.getDate()+1);
							 if(d==(m[l]-1))
							    dateArray1[l]=dd
							   }
							    dateArray=dd;	
							                 
              
          }
          
          
         
                       // alert(dateArray);
                       // alert(m);
                        //alert(setTime);
                        var value1=new Array();
                        var key1=new Array();
          
                        value1[0]=subexperimentname;       //实验
	                    value1[1]=dateArray;      //实验日期
	                    value1[2]=startTime;      //起始时间点
	                    value1[3]=xiakeTime;      //结束时间点
	                   
		               
		                
		                key1[0]="subexperimentname"; 
		                key1[1]="date";
		                key1[2]="startTime";
		                key1[3]="xiakeTime";
		          
          
          
	       //value1[l+j+j]=subexperimentname;
	       //key1[l+j+j]="subexperimentname";
	       //alert(value1[l+j+j]);
	                            var appinf1={};    //将实验信息封装成字典
				                for(var s=0;s<(l+j+j+1);s++){
				                  
			                        appinf1[key1[s]]=value1[s];
			                        
		                                            }
		               $.ajax({                                 //获取每天已选状态
			
										type:"POST",
										async:false,
										dataType:"json",
										url:"/state",			
										data:appinf1, //发送至服务器的 key/value 数据。
										success: function(data){ 
										     var c=0; 
										     $.each(data,function(key,value){
										                
										                count[c]=value;  //已选人数
										                //alert(count[c]);
										                
										                c=c+1
										                                    }) 
										               
			                                               },
		                                    });
	     
	     var h=0;
	    for(l=0;l<j;l++)
        {  
           dd=dateArray[l]
                 
	       for(var d=0;d<= m[l];d++){  
	                 //alert(xiakeTime[l])          
                     var copiedEventObject =new Object();  
                     if(count[d+h]==maxnumber[l])
                     copiedEventObject.className='eventColor';
                     else
                     {
                     if(l<=5)
                     c=l;
                     else
                     c=l%5;
                     copiedEventObject.className=eventColor[c];
                     }
                     //copiedEventObject.url='http://www.so.com/s?ie=utf-8&src=hao_search_a1004&shb=1&q=fullcalender中事件的颜色';
                     copiedEventObject.start = dd[d]+" "+startTime[l];  //开始时间 
					 copiedEventObject.title = startTime[l]+'--'+xiakeTime[l]+' '+count[d+h]+"/"+maxnumber[l];  //标题 
					 copiedEventObject.id=eqrule[l]+subexperimentname+maxnumber[l]; 
					 //alert(copiedEventObject.id);
					 copiedEventObject.end = dd[d]+" "+xiakeTime[l];  //结束时间
					 //alert(copiedEventObject.end);
					 $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);  //核心的插入代码    
                                }
		                                    
		      h=h+m[l]+1; 
		                                
		  }
                 
            
                      }) 
                
			                      },
			
			 
	 
                 });
		
		$('#calendar').fullCalendar({
		
			header: {
				left: '',
				center:'title',
				right: 'prev,next today'
			},
		  
		   monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
           monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
           dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
           dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
           buttonText: {
                today: '本月',
                prev: '上月',
                next: '下月'
                       },
          
		   eventClick:function (calEvent, jsEvent, view){//事件被点击
		                      
		                        
		                       //$(this).css('border-color', 'red');
		                         var fstart = $.fullCalendar.formatDate(calEvent.start,"yyyy-MM-dd HH:mm");
				                 var fend = $.fullCalendar.formatDate(calEvent.end, "yyyy-MM-dd HH:mm");
				                 var ftitle = calEvent.title;  //事件title
				               
				                 var eqrule= calEvent.id;
				                 eqrule3=eqrule.replace(/\D/g, "");
				                 var m=eqrule.indexOf(eqrule3);
				                 
				                 eqrule1=eqrule.substring(0,4);
				                 eqrule2=eqrule.substring(4,m);
				                
				                 
				                 len=ftitle.length;  //事件title长度
				                
				              
				                 ftitle1=ftitle.substring(13,14);//获取点击事件的title中实验名称
				                
				                 date1=fstart.substring(0,10);    //实验所在的日期
				                 stime=fstart.substring(11,16);   //实验开始时间
				                 etime=fend.substring(11,16);    //实验结束时间
				                 
				              
				                var value=new Array();
				                value[0]=coursename;         //课程名称
				                value[1]=bb[9];        //实验类
				                value[2]=eqrule2;       //实验
	                            value[3]=date1;      //实验日期
	                            value[4]=stime;      //起始时间点
	                            value[5]=etime;      //结束时间点
	                            value[6]=eqrule3;     //最多数量
	                            value[7]=eqrule1;    //设备原则
	                            value[8]=studentname;
	                            value[9]=studentid;
	                            //alert(eqrule)
				                var key=new Array();
				                key[0]="coursename";
				                key[1]="experimentname";
				                key[2]="subexperimentname"; 
				                key[3]="date";
				                key[4]="startTime";
				                key[5]="xiakeTime";
				                key[6]="maxnumber"
				                key[7]="eqrule"
				                key[8]="studentname"
				                key[9]="studentid"
				                var appinf={};    //将实验信息封装成字典
				                for(var s=0;s<10;s++){
			                        appinf[key[s]]=value[s];
		                                            }
		                   
		                                
                                                var today=new Date();
                                                var year=today.getFullYear();
                                                month=today.getMonth()+1;
                                                date2=today.getDate();
                                                hour=today.getHours();
                                                startTime1=parseInt(stime);
                                                var today=year+'-'+month+'-'+date2;
                                                var Today=new Date();
                                                var Date1=new Date(date1); 
                                                                        
                                 if(Date1>=Today)
                                    {
                                       if(Date1>Today||hour<startTime1)
                                        {
		                         var r=confirm("是否确定选择该时段该实验？");
		                         if (r==true) 
		                         {		                   
		                             var t=7;
								     $.ajax({     
			
										type:"POST",
										async:false,
										dataType:"json",
										url:"/choose",			
										data:appinf, //发送至服务器的 key/value 数据。
										success: function(data){  //success请求之后调用。传入返回后的数据，以及包含成功代码的字符串
									       $.each(data,function(key,value){
									                  
										                
										                 cc[t]=value;	      //点击的时段已经被选了的数目									                 
										                 t=t+1;
										                                    })       //cc[8]指分配给该同学的实验设备号
										            //alert(eqrule3);
										          if(cc[7]!="未完成测试")
										          {  
										            if (cc[7]<eqrule3)	
										            {
										              if (cc[9]=="选择实验时间冲突")
										              {
										                if(cc[8]=='重复选择实验')
										                   showMessage("预约失败,请勿重复预约！");
										                else
										                   showMessage('你所选择实验时间与你其它的实验时间有冲突，请重新选择！')
										              }
										           
										              else{	
										            							            
										            //window.location.reload();						            						         
										            showMessage(cc[9]+'同学你已经成功的预约了：'+date1+'  '+stime+'--'+etime+'，在'+cc[8]+'上做'+coursename+'——'+eqrule2+'实验，请您准时参加！');
										            $.ajax({     
													type:"POST",
													async:false,
													dataType:"json",
													url:"/upstate",			
													data:{"yuyuewancheng":"预约完成","studentid":studentid,"subexperimentname":eqrule2}, //发送至服务器的 key/value 数据。
													        });
															
										                  }
										            }else								         
  									               showMessage('该时段实验人数已满，请选择其它时段！');
  									               }
  									               else
  									               showMessage("你还不能预约实验，请先完成测试环节！");
										               
			                                               },
		                                    });
	
				                                             
		                         }
		        }
                       else
                        showMessage('此时间已经过期，请选择其它时间！');
                 }
                    else
                        showMessage('此日期已经过期，请选择其它时间！');
		                                               },
		    eventMouseover:function(event){
		                   //$("calendar").fullCalendar('gotoDate', 2015,09,09);
		                      
				              $(this).css('color', 'red');
				              //$(this).css({color: "#A9A9A9", background: "blue" });
				              	
				                          }, 
				                     
			eventMouseout:function(event){
				               $(this).css('color', 'black');
				                          },
         	
		});
   	});
</script>
<style type='text/css'>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}

	#calendar {
		width: 750px;
		margin: 0 auto;
		}
   .aaa{
	    background-color:#9900FF;
	    font-size: 20px;
	    }
   .eventColor,
   .fc-agenda .eventColor .fc-event-time,
   .eventColor a {
     background-color: red; /* background color */
     border-color: red;     /* border color */
     color:white;        
     }
     
   .eventColor0,
   .fc-agenda .eventColor0 .fc-event-time,
   .eventColor0 a {
     background-color: #E6E6FA; /* background color */
     border-color: #E6E6FA;     /* border color */
             
     }
  
  
  .eventColor1,
   .fc-agenda .eventColor1 .fc-event-time,
   .eventColor1 a {
     background-color: #E0FFFF; /* background color */
     border-color: #E0FFFF;     /* border color */
            
     } 
     
	  .eventColor2,
   .fc-agenda .eventColor2 .fc-event-time,
   .eventColor2 a {
     background-color: #AFEEEE; /* background color */
     border-color: #AFEEEE;     /* border color */
              
     }
     
     
   .eventColor3,
   .fc-agenda .eventColor3 .fc-event-time,
   .eventColor3 a {
     background-color: #B0C4D4; /* background color */
     border-color: #B0C4D4;     /* border color */
              
     }
   
   .eventColor4,
   .fc-agenda .eventColor4 .fc-event-time,
   .eventColor4 a {
     background-color: #B0E0E6; /* background color */
     border-color: #B0E0E6;     /* border color */         
     }
   
    .eventColor5,
   .fc-agenda .eventColor5 .fc-event-time,
   .eventColor5 a {
    background-color: #B0C4DE; /* background color */
    border-color: #B0C4DE;     /* border color */
    }   
    .dialog{width:360px;border:solid 5px #CCDDFF;position:absolute;display:none;z-index:999;}
        .dialog .title{background-color:#CCDDFF;padding:10px 10px 10px 30px;;font-weight:bold;}
        .dialog .title img{float:right;}
        .dialog .content{background-color:#fff;padding:10px 25px 10px 10px;height:60px;}
        
        .dialog .content span{padding-top:10px;padding-left:5px;font-size:15px;}
        .dialog .bottom{text-align:center;padding:10px 10px 10px 10px;background-color:#FFFFFF;}
        .btn{height:25px;width:70px;border-radius:15px;background-color:#BBFFEE;font-size:15px;}
        .mask{width:100%;height:500%;background-color:#DCDCDC;position:absolute;top:0px;left:0px;opacity:0.8;display:none;z-index:50;}
</style>
</head>
<body>
<div id='calendar'></div>
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
