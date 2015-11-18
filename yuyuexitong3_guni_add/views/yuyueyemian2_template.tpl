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
			var num = new Number();
			var j = 0;
			var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();
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
			//alert(studentid)
			var coursename = getquerystring("couname");
			//alert(coursename)
			var subexperimentname = getquerystring("subname");
			//alert(subexperimentname)
			//coursename="微机原理";
			//subexperimentname="键盘输入并显示实验";
			eventColor = ["eventColor0", "eventColor1", "eventColor2", "eventColor3", "eventColor4", "eventColor5"];

			$(document).ready(function() {
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
                 num=key;
                 //alert(num);
                 //alert($.isArray(value));
                 var j=0;
              $.each(value,function(indec,items){
                 //alert(indec) ;
                 
                 var i=0;
                 $.each(items,function(key,value){
		                      //alert(item) ;
		                      //alert(value);
		                      bb[i]=value;
		                     
		                      
		                      i=i+1;
                      
                                                  })
                      //alert(bb);
                      //aa[j]=bb
                      //alert(aa[j])
                      //alert(bb[4]);
                      var st=bb[4];
                      var en=bb[7];
            
                      function GetDateDiff(startDate,endDate) 
							{ 
							var startTime = new Date(Date.parse(startDate.replace(/-/g, "/"))).getTime(); 
							var endTime = new Date(Date.parse(endDate.replace(/-/g, "/"))).getTime(); 
							var dates = Math.abs((startTime - endTime))/(1000*60*60*24);
							return dates;
							}           
                       var m=GetDateDiff(st,en); 
                       
                      
							  var getDate=function(str){
							   var tempDate=new Date();
							   var list=str.split("-");
							   tempDate.setFullYear(list[0]);
							   tempDate.setMonth(list[1]-1);
							   tempDate.setDate(list[2]);
							   return tempDate;
							                          }
							  var date1=getDate(en);
							  var date2=getDate(st);
							  if(date1>date2){
							   var tempDate=date1;
							   date1=date2;
							   date2=tempDate;
							                }
							 
							  for(var d=0;d<= m;d++){
							  date=date1.getFullYear()+"-"+(date1.getMonth()+1)+"-"+date1.getDate()
							  var Str=date.split("-");
							  var day = parseInt(Str[2]);
							  var month = parseInt(Str[1]);
							  if(day<10)
								day="0"+day;
							  if(month<10)
							    month="0"+month; 
							   dd[d]=date1.getFullYear()+"-"+month+"-"+day                      				 
							   date1.setDate(date1.getDate()+1);
							                         }
							
                       
                                         
                     //alert(m);
                      var str = bb[4].split('-');      //将日期段转换为一天天的日期
                      var yearStr = str[0];
                      var monthStr = str[1];
                      var dayStr = str[2];
                      var day = parseInt(dayStr);
                      var date = new Date(yearStr, monthStr, dayStr);
                      //alert(dayStr);
                     
	                 
	                    var value1=new Array();
		                
		                value1[0]=subexperimentname;       //实验
	                    value1[1]=dd;      //实验日期
	                    value1[2]=bb[5];      //起始时间点
	                    value1[3]=bb[8];      //结束时间点
	                    //value1[4]=bb[0];      
	                    //alert(value1[2]) 
		                var key1=new Array();
		                
		                key1[0]="subexperimentname"; 
		                key1[1]="date";
		                key1[2]="startTime";
		                key1[3]="xiakeTime";
		                //key1[4]="maxnumber";
		                
		                var appinf1={};    //将实验信息封装成字典
				                for(var s=0;s<5;s++){
			                        appinf1[key1[s]]=value1[s];
			                        //alert(appinf1[key1[s]]);
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
		 
		 for(var d=0;d<= m;d++){
		             
										                
                     var copiedEventObject =new Object();  
                     if(count[d]==bb[0])
                     copiedEventObject.className='eventColor';
                     else
                     copiedEventObject.className=eventColor[j];
                     //copiedEventObject.url='http://www.so.com/s?ie=utf-8&src=hao_search_a1004&shb=1&q=fullcalender中事件的颜色';
                     copiedEventObject.start = dd[d]+" "+bb[5];  //开始时间 
					 copiedEventObject.title=bb[5]+'--'+bb[8]+' '+count[d]+"/"+bb[0];  //标题 
					 copiedEventObject.id=bb[1]+bb[3]+bb[0]; 
					 //alert(copiedEventObject.id);
					 copiedEventObject.end = dd[d]+" "+bb[8];  //结束时间
					 $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);  //核心的插入代码
					    
	                     
                                }
                     
                     j=j+1
                     
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
          
		   eventClick:function (calEvent, jsEvent, view){//事件被点击
		                        //alert('你好');
		                        
		                       //$(this).css('border-color', 'red');
		                         var fstart = $.fullCalendar.formatDate(calEvent.start,"yyyy-MM-dd HH:mm");
				                 var fend = $.fullCalendar.formatDate(calEvent.end, "yyyy-MM-dd HH:mm");
				                 var ftitle = calEvent.title;  //事件title
				                 //alert(ftitle);
				                 var eqrule= calEvent.id;
				                 //alert(eqrule);
				                 //var n = eqrule.replace(/\D/g, ""); 
				                 //alert(n)
				                 
				                 eqrule3=eqrule.replace(/\D/g, "");
				                 var m=eqrule.indexOf(eqrule3);
				                 //alert(m)
				                 eqrule1=eqrule.substring(0,4);
				                 eqrule2=eqrule.substring(4,m);
				                
				                 //alert(eqrule2);
				                  
				                 //alert(eqrule3);
				                 //alert(eqrule2);
				                 len=ftitle.length;  //事件title长度
				                 //alert(fstart);
				              
				                 ftitle1=ftitle.substring(13,14);//获取点击事件的title中实验名称
				                 //alert(ftitle1); 
				                 date1=fstart.substring(0,10);    //实验所在的日期
				                 stime=fstart.substring(11,16);   //实验开始时间
				                 etime=fend.substring(11,16);    //实验结束时间
				                 
				                 //alert(stime);
				                //alert(etime);
				                //alert(date1);
				                //alert(fstart+fend);
				                
				                var value=new Array();
				                value[0]=bb[2];         //课程名称
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
		                         //alert('你好');
		                        
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
										            if (cc[7]<eqrule3)	
										            {
										              if (cc[9]=="选择实验时间冲突")
										              {
										                if(cc[8]=='重复选择实验')
										                   alert("预约失败,请勿重复预约");
										                else
										                   alert('你所选择实验时间与你其它的实验时间有冲突，请重新选择')
										              }
										           
										              else{								            
										            window.location.reload();						            						         
										            alert(cc[9]+'同学你已经成功的选择了：\n'+date1+'  '+stime+'--'+etime+',在'+cc[8]+'\n上做'+bb[2]+'--'+eqrule2+',\n请您准时参加！');		
										                  }
										            }
										            else									         
  									                alert('该时段该实验已选满，请选择其它');
										               
			                                               },
		                                    });
	
				                                             
		                         }
				                 
		  
		                                               },
		    eventMouseover:function(event){
		                      //$("#calendar").fullCalendar('gotoDate',2014,11,17);
				              $(this).css('color', 'white');
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
  
</style>
</head>
<body>
<div id='calendar'></div>
</body>
</html>