<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <title>表格</title>
    <link href="js/LigerUI-1.3.2/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="js/LigerUI-1.3.2/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script> 
    <script src="js/LigerUI-1.3.2/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="js/LigerUI-1.3.2/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="js/LigerUI-1.3.2/lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
    <script src="js/LigerUI-1.3.2/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
     <script src="js/LigerUI-1.3.2/lib/ligerUI/js/plugins/ligerMenu.js" type="text/javascript"></script>
    <script src="js/LigerUI-1.3.2/lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="js/LigerUI-1.3.2/lib/ligerUI/js/plugins/ligerMenuBar.js" type="text/javascript"></script>
    <script src="js/LigerUI-1.3.2/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="js/LigerUI-1.3.2/lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
    <script src="js/LigerUI-1.3.2/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="js/LigerUI-1.3.2/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="js/LigerUI-1.3.2/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="js/LigerUI-1.3.2/lib/json2.js"></script>
    <script type="text/javascript">

        //先获取老师的ID
        %user=session.get("user")
        var userid='{{user["userid"]}}';
      
        var alert = function (content)
        {
            $.ligerDialog.alert(content);
        };
         var jsonObj={};
        var gridManager = null;
        
        $(function ()
        {
         //工具条
            $("#toptoolbar").ligerToolBar({ items: [
                //{ text: '增加', id:'add', click: itemclick },//添加记录链接到teachersettest页面
                { text: '修改', id:'modify', click: itemclick },
                { text: '删除', id:'delete', click: itemclick }
            ]
            });
           
     
			 $.ajax({
        		url :"/kechengxianshi",
        		data: {userid:userid},
        		type : "POST",
        		cache:false,   //不缓存该页面
        		async:false,          
        		dataType:"json",
        		success:function(data){ 
        		$.each(data,function(key,value){
        		   // alert(value);
        			jsonObj.Rows=value;
        			//alert(jsonObj.Rows)
        			$.each(value,function(indec,items){
        				
        				$.each(items,function(key,value){
        	
        				})
        			})
        		})
        		},
        })
        //alert(jsonObj.Rows);
            //表格
           g=manager= $("#maingrid").ligerGrid({
           
                columns: [
                { display: '课程名称', name: 'coursename', align: 'left', width: 100, minWidth: 60 },
                { display: '实验名称', name: 'experimentname', minWidth: 120 },
                { display: '实验内容', name: 'subexperimentname', minWidth: 140 },
                { display: '课程开始时间', name: 'setTime' },
                { display: '课程结束时间', name: 'endTime' },
                { display: '课程开放', name: 'zt' },
                { display: '实验开始时间', name: 'startTime' },
                { display: '实验结束时间', name: 'xiakeTime' },
                { display: '最大实验人数', name: 'maxnumber' },
                { display: '设备分配原则', name: 'eqrule' },
                { display: '设备编号', name: 'devicenum' },
                ], 
                data:jsonObj,
                checkbox : true,
                //应用灰色表头
                //cssClass: 'l-grid-gray', 
                heightDiff: -6
            });
             
           gridManager = $("#maingrid").ligerGetGridManager();

            $("#pageloading").hide();


        });

		function getData() //获取选中的数据
        { 
            var data = manager.getData();
            alert(JSON.stringify(data));
        }
		
        function itemclick(item)
        { 
            if(item.id)
            {
                switch (item.id)
                {
                    case "modify":   //每次只能修改一行
                        var row = manager.getSelectedRow();
            			if (!row) { alert('请选择行'); return; }
            			
                        else
                        	{
                        	alert(JSON.stringify(row));
                        	var coursename=row.coursename;
                        	var experimentname=row.experimentname;
                        	var subexperimentname=row.subexperimentname;
                        	var setTime=row.setTime;
                        	var endTime=row.endTime;
                        	var zt=row.zt;
                        	var startTime=row.startTime;
                        	var xiakeTime=row.xiakeTime;
                        	var maxnumber=row.maxnumber;
                        	var eqrule=row.eqrule;
                        	var devicenum=row.devicenum;
                           // alert(row.coursename)
                        	//var olddata=JSON.stringify(row);
                        	
                        	window.location.href="/modifycourse?coursename="+encodeURI(coursename)+"&experimentname="+experimentname+
                        	"&subexperimentname="+subexperimentname+"&setTime="+setTime+"&endTime="+endTime+"&zt="+zt+
                        	"&startTime="+startTime+"&xiakeTime="+xiakeTime+"&maxnumber="+maxnumber+"&eqrule="+eqrule+
                        	"&devicenum="+devicenum;
                        	
                        	}	
                           
                        return;
                    case "delete":
                        var data = gridManager.getCheckedRows();
                        if (data.length == 0)
                            alert('请选择行');
                        else
                        {
                            var checkedIds = [];
                            $(data).each(function ()
                            {
                            
                                checkedIds.push(this.coursename+','+this.experimentname+','+this.subexperimentname
                                +','+this.setTime+','+this.endTime+','+this.zt+','+this.startTime+','+this.xiakeTime
                                +','+this.maxnumber+','+this.eqrule+','+this.devicenum);
                           
                            });
                            
                            $.ligerDialog.confirm('确定删除' + checkedIds.join(',') +'?', function (yes)
                            {
                                 if(yes){
                                 	//获得该条记录所有值，传递到后台，然后通过delete删除数据库中记录
                              		 var data = manager.getSelectedRows();//获得要删除的数据
                               		//alert(JSON.stringify(data));
                               		//将删除的数据组合
                               		var deledata=JSON.stringify(data)
                               		//var coursename=checkedIds;
                               		//alert(coursename)
                               		
                               		$.ajax({
                               			url:"/kechengdelete",
                               			type:"POST",
                               			data:{"data":deledata},
                               			dataType:"json",
                               			async : false,
                               			success:function(data){
                               				alert(data["mesg"])
                               								}
                               				}) 
                               		
                                 		}
               
                           	 }); 
                        }
                        return;
                   
                }   
            }
            alert(item.text);
        }
    </script>
</head>
<body style="padding:0px; overflow:hidden;"> 
<div class="l-loading" style="display:block" id="pageloading"></div> 
  <form id="form1" runat="server"> 

  <div id="toptoolbar"></div> 

 <div id="maingrid" style="margin:0; padding:0"></div>

  </form>


  <div style="display:none;">
  
</div>
 
</body>
</html>
