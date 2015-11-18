<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学生信息录入</title>
    <link href="js/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="js/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" /> 
    <link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" />
    <script src="js/ligerUI/lib/jquery/jquery-1.3.2.min.js"></script>
    <script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script> 
    <script src="js/ligerUI/js/plugins/ligerForm.js"></script>
    <script src="js/ligerUI/lib/json2.js" type="text/javascript"></script>
    <link href="js/ligerUI/lib/style.css" rel="stylesheet" />
     <style type="text/css">
        .middle input {
            display: block;width:30px; margin:2px;
        }
    </style>
    
     
</head>
<body style="padding:0px;">   
  <div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; "> 
        <div position="center"  title="学生信息录入" id="designPanel"> 
            <div id="btnSelectFields" style="margin:5px; float:left;"></div>
            <div id="btnSaveToFile" style="margin:5px; float:left;"></div>
            <div id="formDesign" style="clear:both;">
            	<!--<label name="学号" width="170px" labelWidth="90" group="基本信息", groupicon="ICONS.Group"></label>
            	<input id="studentid" type="text" width="170px"/>-->
         
            </div>
        </div>
         
    </div> 

    <div id="fieldsSelector" style="display:none;">
        <div style="margin:4px;float:left;">
             <div id="listbox1"></div>  
         </div>
         <div style="margin:4px;float:left;" class="middle"> 
              <input type="button" onclick="moveToRight()" value=">" /> 
             <input type="button" onclick="moveAllToRight()" value=">>" />
              <input type="button" onclick="moveToLeft()" value="<" />
              <input type="button" onclick="moveAllToLeft()" value="<<" />
         </div>
        <div style="margin:4px;float:left;">
            <div id="listbox2"></div> 
        </div>  
    </div>

    <script type="text/javascript">
        var ICONS = {
            Group: "js/ligerUI/lib/images/group.gif"
        };
        
        var dragging = false;
        var contextMenu = null; 
        var fieldReplaceStatue = null;
        var options = { 
            labelCss: 'labelcontainer',
            fieldCss: 'fieldcontainer',
            fields: [],
            onAfterSetFields: function ()
            {
                var g = this, p = this.options; 
                setTimeout(function ()
                { 
                    $(".l-group")
                       .width($("#designPanel").width() * 0.95)
                       .find(".togglebtn").remove();
                    $(".l-group").append("<div class='togglebtn'></div>");
                      
                }, 20);
            }
        };
        


        $("#layout1").ligerLayout({ 
            rightWidth: 250,
            height: '100%',
            heightDiff: -4,
            space: 4 
        }); 
      
        var formDesign = $("#formDesign").ligerForm(options);
       
        var btnSaveToFile = $("#btnSaveToFile").ligerButton({
            click: f_saveToFile, text: '保存'
        }); 
        var btnSelectFields = $("#btnSelectFields").ligerButton({
            click: showFieldsSelector, text: '显示/隐藏字段',width:100
        });
        
       

        f_loadFile();
        function showFieldsSelector()
        {
            var fields = formDesign.get('fields');
            if (window.winFieldsSelector)
            {
                window.winFieldsSelector.show();
            } else
            {
                window.winFieldsSelector = $.ligerDialog.open({
                    target: $("#fieldsSelector"),
                    isResize: true,
                    title: '选择字段',
                    width: 400,
                    height: 270,
                    buttons: [
                        {
                            text: '确定', onclick: f_selectFields
                        },
                        {
                            text: '取消', onclick: function () { winFieldsSelector.hide() }
                        }
                    ]
                });
                $("#listbox1,#listbox2").ligerListBox({
                    isShowCheckBox: true,
                    isMultiSelect: true,
                    height: 190
                });
            }
          
            var data1 = [], data2 = [];
            $(fields).each(function (i, field)
            {
                var o = {
                    text: field.name,
                    id: field.name,
                    field : field
                }; 
                if (field.type == "hidden") data1.push(o);
                else data2.push(o);
            }); 
            liger.get("listbox1").setData(data1);
            liger.get("listbox2").setData(data2);
        }
        function f_selectFields()
        {
            var selecteds = liger.get("listbox2").data;
            var fields = formDesign.get('fields');
            var isChanged = false;
            $(fields).each(function (i, field)
            {
                if (find(field))
                {
                    if (field.type == "hidden")
                    {
                        field.type = field.oldtype || "text";
                        isChanged = true;
                    }
                } else
                {
                    if (field.type != "hidden")
                    {
                        field.oldtype = field.type;
                        field.type = "hidden";
                        isChanged = true;
                    }
                }
            });
            if (isChanged)
            {
                formDesign.set('fields', fields);
            }
            winFieldsSelector.hide();

            function find(field)
            {
                for (var i = 0, l = selecteds.length; i < l; i++)
                {
                    if (selecteds[i].field == field) return selecteds[i];
                }
                return null;
            }
        }
      
        function moveToLeft()
        {
            var box1 = liger.get("listbox1"), box2 = liger.get("listbox2");
            var selecteds = box2.getSelectedItems();
            if (!selecteds || !selecteds.length) return;
            box2.removeItems(selecteds);
            box1.addItems(selecteds);
        }
        function moveToRight()
        {
            var box1 = liger.get("listbox1"), box2 = liger.get("listbox2");
            var selecteds = box1.getSelectedItems();
            if (!selecteds || !selecteds.length) return;
            box1.removeItems(selecteds);
            box2.addItems(selecteds);
        }
        function moveAllToLeft()
        { 
            var box1 = liger.get("listbox1"), box2 = liger.get("listbox2");
            var selecteds = box2.data;
            if (!selecteds || !selecteds.length) return;
            box1.addItems(selecteds);
            box2.removeItems(selecteds); 
        }
        function moveAllToRight()
        { 
            var box1 = liger.get("listbox1"), box2 = liger.get("listbox2");
            var selecteds = box1.data;
            if (!selecteds || !selecteds.length) return;
            box2.addItems(selecteds);
            box1.removeItems(selecteds);
           
        }

        function f_loadFile()
        {
            formDesign.set({
                inputWidth: 170,
                labelWidth: 90,
                space: 40,
                fields: [ 
                { label: "学号",name: "学号", id: "studentid", width: 170, labelWidth: 90, space: 40,  type: "text", group: "基本信息", groupicon: ICONS.Group },
                {label: "姓名",name: "姓名", id: "studentname", width: 170, labelWidth: 90, space: 40, type: "text"}, 
                {label: "密码",name: "密码", id:"password",width: 170, labelWidth: 90, space: 40,  type: "text"},
                {label: "类别",name: "类别", id:"position",width: 170, labelWidth: 90, space: 40,  type: "select",editor:{data:[{id:1,text:"学生"},{id:2,text:"老师"},{id:3,text:"管理员"}]}},
                {label:"专业",name:"专业",id:"zhuangye",width: 170, labelWidth: 90, space: 40,  type: "select",editor:{data:[{id:"zdh",text:"自动化"},{id:"dianqi",text:"电气"},{id:"cheliang",text:"车辆"}]}},
                {label:"班级",name:"班级",id:"banji",width: 170, labelWidth: 90, space: 40,  type: "select",editor:{data:[{id:"bj1001",text:"1001"},{id:"bj1002",text:"1002"},{id:"bj1003",text:"1003"}]}},
                {label:"院系",name:"院系",id:"xueyuan",width: 170, labelWidth: 90, space: 40,  type: "select",editor:{data:[{id:"xy1",text:"自动化学院"},{id:"xy2",text:"计算机学院"},{id:"xy3",text:"汽车学院"}]}},
                {label:"是否转专业",name:"是否转专业",id:"changezy",width: 170, labelWidth: 90, space: 40,  type: "select",editor:{data:[{id:"rad_1",text:"是"},{id:"rad_2",text:"否"}]}, group: "备注信息", groupicon: ICONS.Group},
                {label:"新专业",name:"新专业",id:"newzhuangye",width: 170, labelWidth: 90, space: 40,  type: "select",editor:{data:[{id:"zdh",text:"自动化"},{id:"dianqi",text:"电气"},{id:"cheliang",text:"车辆"}]}},
                {label:"新班级",name:"新班级",id:"newbanji",width: 170, labelWidth: 90, space: 40,  type: "select",editor:{data:[{id:"bj1001",text:"1001"},{id:"bj1002",text:"1002"},{id:"bj1003",text:"1003"}]}},
                {label:"性别",name:"性别",id:"sex",width: 170, labelWidth: 90, space: 40,  type: "select",editor:{data:[{id:"radx_1",text:"男"},{id:"radx_2",text:"女"}]}},
                /*{
                    label: "供应商2", name: "SupplierID2", width: 170, labelWidth: 90, space: 40, newline: false, type: "popup", textField: "CompanyName2", editor: {
                        data: demoData, grid: demoGrid, selectBoxWidth: 400, selectBoxHeight: 200
                    }
                },
                { label: "日期 ", name: "AddTime", width: 170, labelWidth: 90, space: 40, newline: true, type: "date" },
                { label: "折扣", name: "QuantityPerUnit", width: 170, labelWidth: 90, space: 40, newline: false, type: "number" },
                { label: "单价", name: "UnitPrice", width: 170, labelWidth: 90, space: 40, newline: true, type: "number" },
                { label: "库存量", name: "UnitsInStock", width: 170, labelWidth: 90, space: 40, newline: true, type: "digits", group: "库存", groupicon: ICONS.Group },
                { label: "订购量", name: "UnitsOnOrder", width: 170, labelWidth: 90, space: 40, newline: false, type: "digits" },
                { label: "备注", name: "Remark", labelWidth: 90, space: 40, newline: true, type: "textarea", width: 470 },
                { label: "产品名称", name: "ProductName", width: 170, labelWidth: 90, space: 40, newline: true, type: "text", group: "基础信息 ", groupicon: ICONS.Group }
                */]
            });
            //$.ajax({
            //    type: "GET",
            //    url: "data.json",
            //    dataType: "json",
            //    success: function (data)
            //    { 
            //        if (!data || !data.Fields) return;
            //        var fields = convertToFields(data.Fields);
            //        formDesign.set({
            //            labelWidth: data.LabelWidth,
            //            inputWidth: data.InputWidth,
            //            space: data.Space,
            //            fields: fields
            //        });
            //    },
            //    error: function ()
            //    {
            //    }
            //});
        }
        
        function f_saveToFile()
        {
        	var a=formDesign.get('fields #studentid');
        	var b=JSON.stringify(formDesign.get('fields'))
        	alert(a)
           alert(b)
       }

        
     </script> 
   
</body>
</html>
