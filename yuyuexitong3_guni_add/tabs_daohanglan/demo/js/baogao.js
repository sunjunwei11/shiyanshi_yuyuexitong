// JavaScript Document
$(function(){
	$(".tab_close").live({//鼠标放在和离开选项卡关闭按钮上显示的样式
		mouseenter:
		function(){
		   $(this).css("background","url(/tabs_daohanglan/demo/img/icon/icon-close-over.gif)");
	},
	     mouseleave:
	     function(){
		    $(this).css("background","url(/tabs_daohanglan/demo/img/icon/icon-close.gif)");
		}
	});
	$(".tab_close").live("click",function(event){//点击关闭选项卡按钮是执行的操作
		$(this).parent().remove();//移除该选项卡
		event.stopPropagation();//阻止冒泡行为，防止触发点击选项卡的动作
		var the_tab_class= $(this).parent().attr("class");//获得此选项卡的class
		if(the_tab_class.indexOf("tab-current") >= 0 ){ //如果class中有tab-current，说明此选项卡处于正被选中的状态      
                the_need_class = the_tab_class.substring(0,the_tab_class.indexOf("tab-current")-1);//获取唯一标识该选项卡的class 例如guokong_shangshuixang1
                //alert('class里面含有tab-current'); 
                $("#main").siblings("."+the_need_class).remove();//移除该选项卡对应的聊天界面
                $("#browser #"+the_need_class).attr("biaozhi","0");//文件树立对应的导航biaozhi设置为0，表示该聊天界面未被打开
                tabs_first_class = $(".tabs nav ul li:first").attr("class");//将第一个选项卡的样式设为被选中，并显示该选项卡对应的聊天界面
                $(".tabs nav ul li:first").addClass("tab-current");
                $("#main").siblings("."+tabs_first_class).show();
            } 
        else{
            //alert('class里面不含有tab-current1'+the_tab_class+'1');
            $("#main").siblings("."+the_tab_class).remove();//移除该选项卡对应的聊天界面
            $("#browser #"+the_tab_class).attr("biaozhi","0");
            }
		/*var the_length = the_tab_class.length;
		var the_need_class = the_tab_class.substring(0,the_length-12);
		$(".baogao_content").hide();
		$("#main").siblings("."+the_need_class).show();*/
		});
	$(".tabs nav ul li ").live("click",function(){//点击选项卡时执行的操作
		$(".tabs nav ul li ").removeClass("tab-current");//将所有选项卡的样式设为未被选中
		$(this).addClass("tab-current");//将点击的选项卡的样式设为选中
		var the_tab_class= $(this).attr("class");//获取该选项卡的class
		var the_length = the_tab_class.length;
		var the_need_class = the_tab_class.substring(0,the_length-12);//获取该选项卡class唯一标识的class属性
		$(".baogao_content").hide();//隐藏所有聊天界面
		$("#main").siblings("."+the_need_class).show();//显示该选项卡所对应的聊天界面
		});
	$("#browser li a").live("click",function(){//点击文件树导航栏时的行为
	    str1 = $(this).find("span:first").html();
	    str2 = $(this).attr("id");
	    str3 = str2.substr(0,3)
	    str4= str2.substr(3,4)
	    //alert(str2);
	    var biaozhi = $(this).attr("biaozhi");//设定一个标志位，若该位为0则说明该链接未被打开，为1则说明已被打开
	    //alert("biaozhi: "+biaozhi);
	    if (biaozhi == "0"){//biaozhi为0，则说明未打开该讨论组，点击的时候打开，将所有选项卡的状态显示为未被选中，然后添加该组选项卡，并设选项卡class为tab-current使其显示为被选中状态
	                        //再添加聊天界面frame，并显示
	        $(".tabs nav ul li ").removeClass("tab-current");//将原先选项卡显示的样式先去掉
	    	$(".tabs-style-iconbox nav ul").append(tabHtml(str1));
	        function tabHtml(str1){
		       var str='<li class="'+str2+' tab-current"><a href="#section-iconbox-7" ><span>'+str2+'</span></a><div class="tab_close"></div></li>';
		       return str;
		        }
		    $("body").append(content_Html);//添加该链接所对应的聊天界面
		    function content_Html(){
		        var str='<div class="baogao_content '+str2+'"><iframe class="liantian_jiemian1" style="display:block" src="'+'http://10.141.114.83:90/first_project/kindeditor-4.1.10/jsp/laoshichakan.jsp?studentname='+str3+'&coursename='+str4+'"></iframe></div>'
		        return str;
		    } 
		    $(this).attr("biaozhi","1") ;
		    //alert($(this).attr("biaozhi"));
		    $(".baogao_content").hide();
		    $("#main").siblings("."+str2).show(); 
	    }
	    else {//标志不为0则说明该页面以被打开，则只要将该页面和对应的选项卡显示出来
	        $(".tabs nav ul li ").removeClass("tab-current");
	        replace_class = ".tabs nav ul .li";
	        replace_class2 = replace_class.replace("li",str2);
	        //alert(replace_class2);
	        $(replace_class2).addClass("tab-current");
	        $(".baogao_content").hide();
		    $("#main").siblings("."+str2).show(); 
	    }
   
  
		
		    
		});
	});