<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>实验预约查询与取消</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel='stylesheet' href='css/fullcalendar.css'>
<script type='text/javascript' src='js/jquery.js'></script>
<script type='text/javascript' src='js/ui.core.js'></script>
<script type='text/javascript' src='js/fullcalendar.js'></script>
<script type='text/javascript'>
var information=new Array();
var bb=new Array();
var cc=new Array();
var dd=new Array();
var num=new Number();
var date = new Date();
var d = date.getDate();
var m = date.getMonth();
var y = date.getFullYear();
var count=new Array();
//user1 = '陈万委';
//studentid="0120911360303";

%user = session.get("user")
var user1 = '{{user["username"]}}';
		
var studentid='{{user["userid"]}}';
eventColor=["eventColor0","eventColor1","eventColor2","eventColor3","eventColor4","eventColor5"];
	$(document).ready(function() {
	  var value0=new Array(); 
	  var key0=new Array(); 
	  value0[0]=user1;         //用户名
	  value0[1]=studentid;
	  key0[0]="user1";         
	  key0[1]="studentid";
	  var user_exp={};
	  user_exp[key0[0]]=value0[0];
	  user_exp[key0[1]]=value0[1];
		$.ajax({
			type:"POST",                            
			url:"/chaxun",            //发送请求的地址
			cache:false,           //不缓存该页面
			dataType:"json", //预期服务器返回的数据类型。若不指定，jQuery 将自动根据 HTTP 包 MIME 信息来判断，比如XML MIME类型就被识别为XML
			data:user_exp,
			success:function(data){
			$.each(data,function(key,value){
			 //alert(value);
			var i=0;
			$.each(value,function(indec,items){
			 //alert(items);
			 var j=0;
			$.each(items,function(key,value){
		          
		          information[j]=value;
		          //alert(information);
		          j=j+1;
                                              }) 
                                              
                  //alert(information); 
                 
                  var copiedEventObject =new Object();
                 copiedEventObject.start = information[4]+" "+information[6]; //开始时间 
			     copiedEventObject.className=eventColor[i];			     
			     copiedEventObject.title=information[7]+information[6]+'--'+information[2]+information[5];  //标题 
			     copiedEventObject.id=information[4]+information[6]+information[2]
			     copiedEventObject.end =information[4]+" "+information[2];  //结束时间					 
			   $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);  //核心的插入代码
			    
			    if(i<5)
			    i=i+1;
			    else
			    i=0;
			                              })
			                                  
			
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
           eventMouseover:function(event){
				              $(this).css('color', 'white');
				              //$(this).css({color: "#A9A9A9", background: "blue" });
				                          }, 
		   eventMouseout:function(event){
				               $(this).css('color', 'black');
				                          },
		   eventClick:function (calEvent, jsEvent, view){//事件被点击
		                        //alert('你好');
		                        
		                       //$(this).css('border-color', 'red');
		                         var fstart = $.fullCalendar.formatDate(calEvent.start,"yyyy-MM-dd HH:mm");
				                 var fend = $.fullCalendar.formatDate(calEvent.end, "yyyy-MM-dd HH:mm");				               
				                 var quxiao= calEvent.id;
				                 //alert(quxiao);
				                 date=quxiao.substring(0,10);
				                 //alert(date);
				                 startTime=quxiao.substring(10,15);				                 
				                 endTime=quxiao.substring(15,20);
				                 //alert(endTime);				            
				                 //len=ftitle.length;  //事件title长度				               
				              
				                var value1=new Array();
				                value1[0]=studentid;         //学号
				                value1[1]=date;        //实验日期
				                value1[2]=startTime;       //实验
	                            value1[3]=endTime;      
	                          
	                           
				                var key1=new Array();
				                key1[0]="studentid";
				                key1[1]="date";
				                key1[2]="startTime"; 
				                key1[3]="endTime";
				               
				                var xinxi={};    //将实验信息封装成字典
				                for(var s=0;s<4;s++){
			                        xinxi[key1[s]]=value1[s];
		                                            }
		                        
		                        
		                         var r=confirm("确定取消该实验？？");
		                         if (r==true) 
		                         {		                   
		                            
								     $.ajax({     			
										type:"POST",
										async:false,
										dataType:"json",
										url:"/delete",			
										data:xinxi, //发送至服务器的 key/value 数据。
										success: function(data){     //success请求之后调用。传入返回后的数据，以及包含成功代码的字符串
				                            $.each(data,function(key,value){   
			                                 alert(key);
			                                 $('#calendar').fullCalendar('removeEvents', [quxiao]);                          
			                                                               })
			                                              },
		                                    });
		                             
	                                   
				                                             
		                         }
				                
				                
				                 
		  
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
  
  
 
</style>
</head>
<body>
<div id='calendar'></div>
</body>
</html>