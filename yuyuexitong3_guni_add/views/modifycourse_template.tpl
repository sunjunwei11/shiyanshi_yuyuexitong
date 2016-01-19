<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>老师设定</title>
		<script src="/js/jquery-1.10.2.js"></script>
		<link rel="stylesheet" type="text/css" href="/js/jquery-ui-1.8.22.css" />
		<link rel="stylesheet" type="text/css" href="/js/jquery.ptTimeSelect.css" />
		<script type="text/javascript" src="/js/jquery.ptTimeSelect.js"></script>

		<link rel="stylesheet" href="/js/jquery-ui-1.11.0/jquery-ui.css">
		<script src="/js/jquery-ui-1.11.0/jquery-ui.js"></script>
		<link rel="stylesheet" href="/css/style.css">

		<link rel="stylesheet" href="/js/zTree_v3/css/demo.css" type="text/css">
		<link rel="stylesheet" href="/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<!--<script type="text/javascript" src="/js/zTree_v3/js/jquery-1.4.4.min.js"></script>-->
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.exedit-3.5.js"></script>
		<!--<link rel="stylesheet" href="/js/validate/css/screen.css">
		<script src="/js/validate/jquery.js"></script>-->
		<script src="/js/validate/jquery.validate.js"></script>
		<style>
			.h {
				width: auto;
			}
			.ztree li span.button.add {
				margin-left: 2px;
				margin-right: -1px;
				background-position: -144px 0;
				vertical-align: top;
				*vertical-align: middle
			}
		</style>
		<script>
			var setting = {
				check : {
					enable : true,
					chkboxType : {
						"Y" : "ps",
						"N" : "ps"
					}
				},
				view : {
					selectedMulti : false
				},
				edit : {
					enable : true,
					editNameSelectAll : true,
					showRemoveBtn : false,
					showRenameBtn : false
				},
				data : {
					keep : {
						parent : true,
						leaf : true
					},
					simpleData : {
						enable : true
					}
				},
				async : {
					enable : true,
					url : "/getzTree",
					type : "post",
					autoParam : ["id=0", "name='自由设定'"],

					dataFilter : filter
				},
				callback : {
					beforeDrag : beforeDrag,
					beforeRemove : beforeRemove,
					beforeRename : beforeRename,
					onRemove : onRemove,
					onRename : onRename,
					onCheck : onCheck

				}
			};
			/*var zNodes = [{
			 id : 1,
			 pId : 0,
			 name : "默认111 ",
			 checked : true,
			 }, {
			 id : 11,
			 pId : 1,
			 name : "8:00-9:40",
			 }, {
			 id : 12,
			 pId : 1,
			 name : "10:00-11:40",
			 }, {
			 id : 13,
			 pId : 1,
			 name : "14:00-15:40",
			 }, {
			 id : 14,
			 pId : 1,
			 name : "16:00-17:40",
			 }, {
			 id : 15,
			 pId : 1,
			 name : "18:30-20:10",
			 }, {
			 id : 2,
			 pId : 0,
			 name : "自由设定",
			 open : true
			 }, {
			 id : 21,
			 pId : 2,
			 name : "00:00-00:00",
			 open : true
			 }];*/
			var setting2 = {
				check : {
					enable : true,
					chkboxType : {
						"Y" : "",
						"N" : ""
					}
				},
				view : {
					dblClickExpand : false,
					showLine : false,
					showIcon : showIconForTree

				},
				data : {
					simpleData : {
						enable : true
					}
				},
				async : {
					enable : true,
					//url : "/testserver4",
					//type : "post",
					//otherParam : ["choice4"],
					dataFilter : filter2
				},
				callback : {
					beforeClick : beforeClick,
					onCheck : onCheck2

				}
			};

			/*member的树形设置*/
			function beforeClick(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}

			function showIconForTree(treeId, treeNode) {
				return treeNode.isParent;
			}

			function onCheck2(e, treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo2"), nodes = zTree.getCheckedNodes(true), v = "";
				for (var i = 0, l = nodes.length; i < l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0)
					v = v.substring(0, v.length - 1);
				var cityObj = $("#citySel2");
				cityObj.attr("value", v);
			}

			function showMenu2() {
				var cityObj = $("#citySel2");
				var cityOffset = $("#citySel2").offset();
				$("#menuContent2").css({
					left : cityOffset.left + "px",
					top : cityOffset.top + cityObj.outerHeight() + "px"
				}).slideDown("fast");

				$("body").bind("mousedown", onBodyDown2);

			}

			function hideMenu2() {
				$("#menuContent2").fadeOut("fast");
				$("body").unbind("mousedown", onBodyDown);
			}

			function onBodyDown2(event) {
				if (!(event.target.id == "citySel2" || event.target.id == "menuContent2" || $(event.target).parents("#menuContent2").length > 0)) {
					hideMenu2();
				}
			}

			function createTree() {
				var zNodes;
				var classname1 = $("#classlist").val();
				//alert("aa")
				$.ajax({
					url : "/testserver4",
					type : "POST",
					data : {
						choice4 : classname1
					},
					dataType : "json",
					success : function(data) {
						zNodes = data["studentname1"];
						//alert(zNodes)
						$.fn.zTree.init($("#treeDemo2"), setting2, zNodes);
					}
				})

			}

			/*常规设置的树形结构设置*/
			function beforeDrag(treeId, treeNodes) {
				return false;
			}

			function beforeRemove(treeId, treeNode) {
				//className = (className === "dark" ? "" : "dark");
				return confirm("确认删除 节点 " + treeNode.name + " 吗？");
			}

			function onRemove(e, treeId, treeNode) {
				//showLog("[ " + getTime() + " onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			}

			function beforeRename(treeId, treeNode, newName) {
				if (newName.length == 0) {
					alert("节点名称不能为空.");
					var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					setTimeout(function() {
						zTree.editName(treeNode)
					}, 10);
					return false;
				}
				return true;

			}

			function onRename(event, treeId, treeNode, isCancel) {
				//alert("aa")
				//alert(treeNode.tId + ", " + treeNode.name);
				var re = /^(2[0-1]|1[0-9]|[0]?[89]):([0-5]?[0-9])-(2[0-1]|1[0-9]|[0]?[89]):([0-5]?[0-9])$/;
				//匹配8：00-21:59之间的时间
				var aa = treeNode.name.split("-");
				alert(treeNode.name)//拿到的是更改名称后的值
				alert(aa[0])
				alert(aa[1])
				if (!re.test(treeNode.name)) {
					alert("请按照hh:mm-hh:mm格式编辑（要求在8:00-22:00之间的时间段）")
					treeNode.name = "00:00-00:00";
					return false;

				} else {
					var bb = aa[0].split(":"), cc = aa[1].split(":");
					alert(bb[0])
					alert(cc[0])
					if ((bb[0] > cc[0]) || (bb[0] = cc[0] && bb[1] < cc[1])) {
						alert("请注意设置时间段的先后性")
						treeNode.name = "00:00-00:00";
					}
				}

				return true;

			}

			function onCheck(e, treeId, treeNode) {//用于捕获节点被点击的事件回调函数
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getCheckedNodes(true), v = "";
				for (var i = 0, l = nodes.length; i < l; i++) {
					v += nodes[i].name + ",";
					//alert(v)将选中的treenode值循环写入v中。
				}
				if (v.length > 0)
					v = v.substring(0, v.length - 1);
				//alert(v)
				var cityObj = $("#citySel");
				cityObj.attr("value", v);
			}

			function showMenu() {
				var cityObj = $("#citySel");
				var cityOffset = $("#citySel").offset();
				//
				$("#menuContent").css({
					left : cityOffset.left + "px",
					top : cityOffset.top + cityObj.outerHeight() + "px"
				}).slideDown("fast");

				$("body").bind("mousedown", onBodyDown);
			}

			function hideMenu() {
				$("#menuContent").fadeOut("fast");
				$("body").unbind("mousedown", onBodyDown);
			}

			function onBodyDown(event) {
				if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "add" || event.target.id == "edit" || event.target.id == "remove" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
					hideMenu();
				}
			}

			var newCount = 2;
			function add(e) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"), isParent = e.data.isParent, nodes = zTree.getNodeByParam("id", 2, null), treeNode = nodes;
				if (treeNode) {
					treeNode = zTree.addNodes(treeNode, {
						id : (20 + (newCount++)),
						pId : 2,
						//isParent : isParent,
						name : "00:00-00:00"
					});
					///newCount+=1;
					/*} else {
					treeNode = zTree.addNodes(null, {
					id : (100 + newCount),
					pId : 0,
					isParent : isParent,
					name : "00:00-00:00"
					});*/

				}

				if (treeNode) {
					zTree.editName(treeNode[0]);
				} else {
					alert("请先选择自由设定");
				}
			};
			function edit() {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getSelectedNodes(), treeNode = nodes[0];
				//var node = treeNode.getParentNode();
				if (nodes.length == 0) {
					alert("请先选择要编辑的对象");
					return;
				} else if (treeNode.getParentNode().isLastNode) {

					zTree.editName(treeNode);

				} else {
					//zTree.editName(treeNode);
					alert("只能修改自由设定选项下的时间点")
				}

			};
			function remove(e) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getSelectedNodes(), treeNode = nodes[0];
				var node = treeNode.getParentNode();
				if (nodes.length == 0) {
					alert("请先选择自由设定中要删除的对象");
					return;
				} else if (node.isLastNode && treeNode.id != 21) {

					zTree.removeNode(treeNode, beforeRemove);
				} else {
					//zTree.editName(treeNode);
					alert("只能删除自由设定选项下第二个以后的时间点")
				}

			};

			function savezTree(treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				var nodes = zTree.transformToArray(zTree.getNodes());
				alert(nodes)
				return nodes
			}

			function filter(treeId, parentNode, childNodes) {
				return childNodes["zTreedata1"];
			}

			function filter2(treeId, parentNode, childNodes) {
				return childNodes["studentname1"];
			}
			/*GetRequest()是获得其他页面传递过来的参数值*/
			function GetRequest() {   
   					var url = location.search; //获取url中"?"符后的字串   
   					var theRequest = new Object();   
   					if (url.indexOf("?") != -1) {   
     					var str = url.substr(1); 
     					alert(str)  
      					strs = str.split("&");   
      					for(var i = 0; i < strs.length; i ++) {   
         				theRequest[strs[i].split("=")[0]]=decodeURI(strs[i].split("=")[1]);   
      														}   
  											 }   
  					return theRequest;   
					}

			$(function() {
			
				$("#tabs").tabs({
					collapsible : true
				});
				/*以下是修改课程时自动填入旧的课程信息*/
				
     				var Request = new Object();
					var Request = GetRequest();
					var data={};
					data["coursename"] = Request["coursename"];
						//alert(data["coursename"])
					data["experimentname"] = Request["experimentname"];
					data["subexperimentname"] = Request["subexperimentname"];
					data["setTime"] = Request["setTime"];
					data["endTime"] = Request["endTime"];
					data["zt"] = Request["zt"];
					data["startTime"] = Request["startTime"];
					data["xiakeTime"] = Request["xiakeTime"];
					data["maxnumber"] = Request["maxnumber"];
					data["eqrule"] = Request["eqrule"];
					data["devicenum"] = Request["devicenum"];
				//var citySeldata=data["startTime"]+'-'+data["xiakeTime"];
				//alert(typeof(citySeldata))
				$("#Newcourse").val(data["coursename"]);
				$("#Newexperiments").val(data["experimentname"]);
				$("#Newcontent").val(data["subexperimentname"]);
				$("#from").val(data["setTime"]);
				$("#to").val(data["endTime"]);
				//$("#citySel").val(citySeldata);  //如果自动填入时间后，ztree树的时间编辑不能使用。
				$("#maxnum").val(data["maxnumber"]);
				$("#eqrule").val(data["eqrule"]);
				if(data["zt"]==1){
				//alert("radio")
				
				$('input:radio[name="zt"][value="开放"]').attr("checked",'true');
				};
				
				/*以上是修改课程时自动填入旧的课程信息*/
				
				
				$("#from").datepicker({
					dateFormat : "yy-mm-dd",
					defaultDate : "+1w",
					changeMonth : true,
					numberOfMonths : 1,
					onClose : function(selectedDate) {
						$("#to").datepicker("option", "minDate", selectedDate);
					}
				});
				$("#to").datepicker({
					dateFormat : "yy-mm-dd",
					defaultDate : "+1w",
					changeMonth : true,
					numberOfMonths : 1,
					onClose : function(selectedDate) {
						$("#from").datepicker("option", "maxDate", selectedDate);
					}
				});

				$("#datepicker3").datepicker({
					changeMonth : true, //显示下拉列表月份
					changeYear : true, //显示下拉列表年份
					yearRange : "c-5:c+3",
					dateFormat : "yy-mm-dd"

				});
				/*autocomplete功能*/
				$("#Newcourse,#Newcourse2").autocomplete({

					source : function(request, response) {
						$.ajax({
							url : "/kechengshezhi",
							datatype : "json",
							type : "post",
							success : function(data) {
								//alert(data)
								var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(request.term), "i")
								response($.grep(data["coursename"], function(item) {
									//alert("111")
									//alert(item.label)
									return matcher.test(item.abst);

								}));

							}
						});
					},
				})
				$('#PtTime1,#PtTime2').ptTimeSelect();

				$("#Newexperiments").autocomplete({
					minLength : 0,

					source : function(request, response) {
						var coursename1 = $("#Newcourse").val()

						//alert($("#Newcourse").val())
						$.ajax({
							url : "/testserver1",
							datatype : "json",
							data : {
								choice1 : coursename1
							},
							type : "post",
							success : function(data) {
								//alert(data)
								response($.map(data["coursename1"], function(item) {
									//alert("111")
									return {

										value : item.experimentname
									}

								}));

							}
						});
					},
				});
				$("#Newexperiments2").autocomplete({
					minLength : 0,

					source : function(request, response) {
						var coursename1 = $("#Newcourse2").val()

						//alert($("#Newcourse").val())
						$.ajax({
							url : "/testserver1",
							datatype : "json",
							data : {
								choice1 : coursename1
							},
							type : "post",
							success : function(data) {
								//alert(data)
								response($.map(data["coursename1"], function(item) {
									//alert("111")
									return {

										value : item.experimentname
									}

								}));

							}
						});
					},
				});
				$("#Newcontent").autocomplete({
					minLength : 0,

					source : function(request, response) {
						var coursename2 = {};
						coursename2["coursename"] = $("#Newcourse").val(), //alert($("#Newcourse").val())
						coursename2["subcoursename"] = $("#Newexperiments").val();
						alert($("#Newexperiments").val())
						$.ajax({
							url : "/testserver2",
							datatype : "json",
							data : {
								choice2 : $.param(coursename2)
							},
							type : "post",
							success : function(data) {
								//alert(data)
								response($.map(data["coursename2"], function(item) {
									//alert("111")
									return {

										value : item.content
									}

								}));

							}
						});
					},
				});
				$("#Newcontent2").autocomplete({
					minLength : 0,

					source : function(request, response) {
						var coursename2 = {};
						coursename2["coursename"] = $("#Newcourse2").val(), //alert($("#Newcourse").val())
						coursename2["subcoursename"] = $("#Newexperiments2").val();
						//alert($("#Newexperiments").val())
						$.ajax({
							url : "/testserver2",
							datatype : "json",
							data : {
								choice2 : $.param(coursename2)
							},
							type : "post",
							success : function(data) {
								//alert(data)
								response($.map(data["coursename2"], function(item) {
									//alert("111")
									return {

										value : item.content
									}

								}));

							}
						});
					},
				});
				$.fn.zTree.init($("#treeDemo"), setting);

				$("#add").bind("click", {
					isParent : false
				}, add);
				$("#edit").bind("click", edit);
				$("#remove").bind("click", remove);
				$("#ok").click(function() {
					var nodes1 = new Array();
					nodes1 = savezTree();
					//保存节点值
					var information = "";
					var items = ["id", "pId", "name"]
					for ( i = 7, l = nodes1.length; i < l; i++) {
						//alert(l)
						var nodesdata = {};
						//alert(nodes1[i].id)
						//nodesdata["id"]=nodes1[i].id;
						nodesdata[items["id"]] = nodes1[i].id;
						//alert(nodesdata[items["id"]])
						//alert(nodes1[i].pId)
						//nodesdata["pId"]=nodes1[i].pId;
						nodesdata[items["pId"]] = nodes1[i].pId;
						//alert(nodes1[i].name)
						//nodesdata["name"]=nodes1[i].name;
						nodesdata[items["name"]] = nodes1[i].name;
						information += nodes1[i].id + "&" + nodes1[i].pId + "&" + nodes1[i].name + ","
						//alert(information)
					}

					//alert("111")
					$.ajax({
						url : "/saveztreedata",
						type : "post",
						datatype : "json",
						data : {
							choice : information
						},
						success : function(data) {
							alert(data["msg"]);
						}
					})

					$("#citySel").val();
					alert($("#citySel").val())

				})

				$("#savemodcourseinfo").click(function() {
					var cinfo = {};
					var str_1 = $("#from").val().split("-"), str_2 = $("#to").val().split("-");
					if ((str_1[0] > str_2[0]) || (str_1[0] = str_2[0] && str_1[1] > str_2[1])) {
						alert("请注意时间间隔的前后性")
						$("#from").val("");
						$("#to").val("")
					} else {
						cinfo["setTime"] = $("#from").val();
						cinfo["endTime"] = $("#to").val();
					}
					cinfo["coursename"] = $("#Newcourse").val();
					if ($('input:radio[name="zt"]:checked').val() == "开放") {
						cinfo["zt"] = 1;
					} else {
						cinfo["zt"] = 0;
					}
					%user = session.get("user")
			        var userid = '{{user["userid"]}}';
					cinfo["experimentname"] = $("#Newexperiments").val();
					cinfo["subexperimentname"] = $("#Newcontent").val();
					cinfo["sxTime"] = $("#citySel").val();
					cinfo["maxnumber"] = $("#maxnum").val();
					cinfo["eqrule"] = $("#eqrule").val();

					$.ajax({
						url : "/savemodcinfo",
						dataType : "json",
						data : {
							userid :userid,
							savenewinfo : $.param(cinfo),
							saveoldinfo : $.param(data)
						},
						type : "POST",
						success : function(data) {
							alert(data);
							alert(data["msg"]);
						}
					})

				})
				$("#classlist").autocomplete({
					minLength : 0,
					source : function(request, response) {
						$.ajax({
							url : "/testserver3",
							datatype : "json",
							type : "post",
							success : function(data) {
								//alert(data)
								var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(request.term), "i")
								response($.grep(data["banjiname"], function(item) {
									//alert("111")
									//alert(item.label)
									return matcher.test(item.abst);

								}));

							}
						});

					},
				})
				function split(val) {
					return val.split(/,\s*/);
				}

				function extractLast(term) {
					return split(term).pop();
				}


				$("#member1")
				// 利用autocomplete插件显示多值的选择功能
				.bind("keydown", function(event) {
					if (event.keyCode === $.ui.keyCode.TAB && $(this).autocomplete("instance").menu.active) {
						event.preventDefault();
					}
				}).autocomplete({
					minLength : 0,
					source : function(request, response) {
						var classname1 = $("#classlist").val()
						alert($("#classlist").val())
						$.ajax({
							url : "/testserver4",
							datatype : "json",
							type : "post",
							data : {
								choice4 : classname1
							},
							success : function(data) {
								//alert(data)
								response($.map(data["studentname1"], function(item) {

									//alert("111")

									return {

										label : item.studentid + " " + item.studentname ,

									}

								}));

							}
						});

					},
					//focus : function() {
					// prevent value inserted on focus
					//return false;
					//},
					select : function(event, ui) {
						var terms = split(this.value);
						// remove the current input
						terms.pop();
						// add the selected item
						terms.push(ui.item.value);
						// add placeholder to get the comma-and-space at the end
						terms.push("");
						this.value = terms.join(", ");
						return false;
					}
				});

				$("#citySel2").click(function() {//利用ztree实现下列菜单多项可选。
					createTree();
					//var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					//zTree.setting.async.otherParam=$("#classlist").val();
					//alert("111")
					//$.fn.zTree.init($("#treeDemo2"), setting2);
					//member的树形设置部分

				})
			});
			function checkfrom2() {
				var coursename = $("#Newcourse2").val(), experimentname = $("#Newexperiments2").val(), subexperimentname = $("#Newcontent2").val(), ADate = $("#datepicker3").val(), StartTime = Timechange($("#PtTime1").val()), EndTime = Timechange($("#PtTime2").val()), classname = $("#classlist").val(), devicenum = $("#devicenum").val(), studentsname = $("#citySel2").val();
				//alert(coursename==""||experimentname==""||subexperimentname==""||ADate==""|| StartTime==""||EndTime==""||classname==""||studentsname=="")
				if (coursename == "" || experimentname == "" || subexperimentname == "" || ADate == "" || StartTime == "" || EndTime == "" || classname == "" || studentsname == "") {
					//alert("请检查有未填写项目")
					return false
				}
				return true

			};
			function Timechange(str_1) {
				var c;
				if (str_1.indexOf("PM") >= 0) {
					str_1 = str_1.split(" ")[0];

					a = parseInt(str_1.split(":")[0]) + 12;
					a = a.toString();
					b = str_1.split(":")[1];
					c = a + ":" + b;

				} else {

					c = str_1.split(" ")[0];
				}

				return c
			}


			$(document).ready(function() {
				/*$("#form2").validate({
				 自定义验证规则
				 rules : {
				 Newcourse2 : "required",
				 Newexperiments2 : "required",
				 Newcontent2 : "required",
				 datepicker3 : "required",
				 PtTime1 : {
				 required : true,
				 },
				 PtTime2 : {
				 required : true,
				 },
				 classlist : {
				 required : true,
				 },
				 member1 : {
				 required : true,
				 },
				 citySel2:"required"

				 },
				 messages : {
				 Newcourse2 : "请输入课程名称",
				 Newexperiments2 : "请输入实验项目名称",
				 Newcontent2 : "请输入实验名称",
				 datepicker3 : "请输入实验日期",
				 PtTime1 : "请输入实验开始时间",
				 PtTime2 : "请选择实验结束时间",
				 classlist : "请选择实验班级",
				 citySel2:"请选择实验人员"
				 }
				 });*/
				$("#saveTappoint").click(function() {

					var appointinf = {};
					/*验证功能*/
					//是否要验证老师指定的实验日期在该实验设置的实验时间段内（验证：则只能在设置的时间段内实验，超期不能做；不验证：则可以方便超过时间的同学完成实验。）
					//是否要验证老师指定的人员数应<=设置课程实验的的最大实验人数（验证：规定实验人数后就不能改变，不验证：方便没有做实验的人数比最大容量人数多一两个，具有较大的随意性）
					//验证开始时间在结束时间之前
					var aa = $("#PtTime1").val(), bb = $("#PtTime2").val(), a1, b1;
					alert(aa)
					aa = aa.split(" ");
					//alert(aa[1])
					bb = bb.split(" ");
					a1 = aa[0].split(":");
					//alert(a1[0])
					b1 = bb[0].split(":");
					a1[0] = parseInt(a1[0]);
					//alert(a1[0])
					a1[1] = parseInt(a1[1]);
					//alert(a1[1])
					b1[0] = parseInt(b1[0]);
					//alert(b1[0])
					b1[1] = parseInt(b1[1]);
					//alert(b1[1])
					//alert(a1[0]<b1[0])
					//alert(a1[1]<b1[1])
					//alert((8 <= a1[0])&&((a1[0] < b1[0])||(a1[0]==b1[0]&&a1[1]<b1[1])))
					//alert((b1[0]<=9)&&((a1[0] < b1[0])||(a1[0]==b1[0]&&a1[1]<b1[1])))
					if (aa[1] > bb[1]) {
						alert("111请注意时间先后性-请设置时间在8：00 AM 到9:55 PM")
						$("#PtTime1").val("");
						$("#PtTime2").val("");
					} else if (aa[1] == 'AM' && bb[1] == 'AM') {
						if (((8 <= a1[0]) && (a1[0] < b1[0])) || (8 <= (a1[0] == b1[0]) && a1[1] < b1[1])) {
							appointinf["StartTime"] = Timechange($("#PtTime1").val());
							appointinf["EndTime"] = Timechange($("#PtTime2").val());
							alert("AM11")

						} else {
							alert("222请注意检查时间是否在8:00AM到9:55PM之间")
							$("#PtTime1").val("");
							$("#PtTime2").val("");
						}
					} else if (aa[1] == 'PM' && bb[1] == 'PM') {
						if ((b1[0] <= 9) && ((a1[0] < b1[0]) || (a1[0] == b1[0] && a1[1] < b1[1]))) {
							appointinf["StartTime"] = Timechange($("#PtTime1").val());
							appointinf["EndTime"] = Timechange($("#PtTime2").val());
							alert("PM11")
						} else {
							alert("333请注意检查时间是否在8:00AM到9:55PM之间")
							$("#PtTime1").val("");
							$("#PtTime2").val("");
						}
					} else {
						if (a1[0] >= 8 && b1[0] <= 9) {
							appointinf["StartTime"] = Timechange($("#PtTime1").val());
							appointinf["EndTime"] = Timechange($("#PtTime2").val());
							alert("8：00AM到9:55PM之间")
						} else {
							alert("请注意检查时间是否在8：00AM到9:55PM之间")
							$("#PtTime1").val("");
							$("#PtTime2").val("");
						}
					}
					;

					/*保存功能*/
					if (checkfrom2()) {
						appointinf["coursename"] = $("#Newcourse2").val();
						appointinf["experimentname"] = $("#Newexperiments2").val();
						appointinf["subexperimentname"] = $("#Newcontent2").val();
						appointinf["ADate"] = $("#datepicker3").val();
						//appointinf["StartTime"] = Timechange($("#PtTime1").val());
						//appointinf["EndTime"] = Timechange($("#PtTime2").val());
						appointinf["classname"] = $("#classlist").val();
						appointinf["devicenum"] = $("#devicenum").val();
						appointinf["path"] = 1;
						appointinf["studentsname"] = $("#citySel2").val();
						//检查字典中的值是否有空值，有则提示有未填写项，没有则正常提交
						$.ajax({
							url : "/saveTappoint",
							dataType : "json",
							type : "post",
							data : {
								choice : $.param(appointinf)
							},
							success : function(data) {
								alert(data["msg"]);

							}
						})
					} else {
						alert("请填写完整的表单")
					}
				})
			});

		</script>
	</head>
	<body>

		<div id="tabs">
			<ul>
				<li id="tabs_1_li">
					<a href="#tabs-1">课程设置部分</a>
				</li>
				<li id="tabs_2_li">
					<a href="#tabs-2">老师单独指定部分</a>
				</li>

			</ul>
			<div id="tabs-1">
				<form id="form1" name="form1" method="post" action="">
					<div class="teacherset" align="left">
						<table class="setcourse">
							<tr>
								<td>课程设置
								<input type="text" id="Newcourse" size="30"/>
								</td>
							</tr>

							<tr>
								<td><label for="radio">开放</label>
								<input name="zt" type="radio" class="h" id="kaifan" value="开放"  />
								<label for="radio">关闭</label>
								<input name="zt" type="radio" class="h" id="guanbi" value="关闭" />
								</td>
							</tr>
							<tr>
								<td><label >实验项目</label>
								<input type="text" id="Newexperiments" size="30"/>
								</td>
							</tr>
							<tr>
								<td><label >实验内容</label>
								<input type="text" id="Newcontent" size="30"/>
								</td>
							</tr>
							<tr>
								<td>时间设置 <label for="from">From</label>
								<input type="text" id="from" name="from" size="9.5">
								<label for="to">to</label>
								<input type="text" id="to" name="to" size="9.5">
								</td>
							</tr>
							<tr>
								<!--常规设置的树形部分-->
								<td>常规设置
								<input id="citySel" type="text" readonly value="" style="width:256px;" onclick="showMenu();" />
								<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
									<ul id="treeDemo" class="ztree" style="margin-top:0; width:256px; height: 300px;"></ul>
								</div>
								</td><td>
								<div class="right">
									<input id="add" type="button" value="增加" onclick="return false;"/>
									<input id="edit" type="button" value="编辑名称" onclick="return false;"/>
									<input id="remove" type="button" value="删除" onclick="return false;" />
									<input id="ok" type="button" value="确定(保存)" />
								</div></td>
							</tr>
							<tr>
								<td><label>实验人数</label>
								<input type="text" id="maxnum" size="30"/>
								
							</tr>
							<tr>
								<td>设备分配原则
								<select name="eqrule" id="eqrule" style="width:220px">
									<option value=""></option>
									<option value="设备平均">设备平均</option>
									<option value="设备节约">设备节约</option>
								</select></td>

							</tr>

							<tr>
								<td>
								<input name="课程修改提交" type="button" class="h" id="savemodcourseinfo" value="课程修改提交" />
								<input name="重写" type="reset" class="h" id="resetcourseinfo" value="重写" />
								</td>
							</tr>

						</table>
					</div>

				</form>
			</div>
			<div id="tabs-2">
				<form id="form2" name="form2" method="post" action="">
					<div class="courseset" align="left">
						<table class="course">
							<tr>
								<td>实验课程
								<input type="text" id="Newcourse2" name="Newcourse2" size="30"/>
								</td>
							</tr>
							<tr>
								<td>实验项目
								<input type="text" id="Newexperiments2" name="Newexperiments2" size="30"/>
								</td>
							</tr>
							<tr>
								<td>实验内容
								<input type="text" id="Newcontent2" name="Newcontent2" size="30"/>
								</td>
							</tr>
							<tr>
								<td>实验日期
								<input type="text" id="datepicker3" name="datepicker3" size="30"/>
								</td>
							</tr>
							<tr>
								<td>开始时间
								<input id="PtTime1" name="PtTime1" type="text" value="" size="30"/>
								</td>
							</tr>
							<tr>
								<td>结束时间
								<input id="PtTime2" name="PtTime2"  type="text" value="" size="30"/>
								</td>

							</tr>
							<tr>
								<td>实验设备
								<select name="maxnum" id="devicenum" style="width:256px">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select></td>
							</tr>
							<tr>
								<td>指定班级
								<input type="text" id="classlist" name="classlist" value=""  size="30"/>
								</td>
							</tr>
							<tr>
								<td>具体人员
								<input id="citySel2" name="citySel2" type="text" readonly value="" style="width:257px;" onclick="showMenu2();"/>
								<!--member的树形部分
								<ul class="list">
								<li class="title">
								<input id="citySel2" type="text" readonly value="" style="width:255px;" onclick="showMenu2();"/>
								</li>
								</ul>-->
								<div id="menuContent2" class="menuContent" style="display:none; position: absolute;">
									<ul id="treeDemo2" class="ztree" style="margin-top:0; width:240px;"></ul>
								</div></td>
							</tr>
							<tr>
								<td>
								<input name="特别设置保存" type="button" id="saveTappoint" value="老师指定预约实验" />
								</td>
							</tr>

						</table>
					</div>

				</form>

			</div>

		</div>

	</body>
</html>