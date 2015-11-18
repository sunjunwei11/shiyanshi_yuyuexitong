/*********************************************************/
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>时间插件测试页</title>

		<head>
			<script src="/js/jquery-1.10.2.js"></script>
			<link rel="stylesheet" type="text/css" href="/js/jquery-ui-1.8.22.css" />

			<link rel="stylesheet" type="text/css" href="/js/jquery.ptTimeSelect.css" />
			<script type="text/javascript" src="/js/jquery.ptTimeSelect.js"></script>

		</head>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#PtTime1,#PtTime2').ptTimeSelect();
				//alert(jQuery.ptTimeSelect._doCheckMouseClick)
				
			});
		</script>
	</head>
	<body>

		<div class="ui-widget">
			<label>start：</label>
			<input id="PtTime1" name="time" value="" />
			<label>end：</label>
			<input id="PtTime2" name="time" value="" />


		</div>

	</body>
</html>
/*********************************************************/
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>jQuery UI Autocomplete - Multiple values</title>
		
		<script src="/js/jquery-1.10.2.js"></script>
		<link rel="stylesheet" href="/js/jquery-ui-1.11.0/jquery-ui.css">
		<script src="/js/jquery-ui-1.11.0/jquery-ui.js"></script>
		<link rel="stylesheet" href="/css/style.css">
		
		<script>
			$(function() {
				
				function split(val) {
					return val.split(/,\s*/);
				}

				function extractLast(term) {
					return split(term).pop();
				}


				$("#tags")
				// don't navigate away from the field on tab when selecting an item
				.bind("keydown", function(event) {
					if (event.keyCode === $.ui.keyCode.TAB && $(this).autocomplete("instance").menu.active) {
						event.preventDefault();
					}
				}).autocomplete({
					minLength : 0,
					source : function(request, response) {
						$.ajax({
							url : "/kechengshezhi",
							datatype : "json",
							type : "post",
							success : function(data) {
								//alert(data)
								response($.map(data["coursename"], function(item) {
									//alert("111")
									return {
										label : item.label,
										value : item.value
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
			});
		</script>
	</head>
	<body>

		<div class="ui-widget">
			<label for="tags">Tag programming languages: </label>
			<input id="tags" size="50">
		</div>

	</body>
</html>
/*********************************************************/
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>jQuery UI Autocomplete 含有自动搜索首字母功能</title>
		
		<script src="/js/jquery-1.10.2.js"></script>
		<link rel="stylesheet" href="/js/jquery-ui-1.11.0/jquery-ui.css">
		<script src="/js/jquery-ui-1.11.0/jquery-ui.js"></script>
		<link rel="stylesheet" href="/css/style.css">
		
		<script>
			$(function() {
				
				$("#Newcourse").autocomplete({

					source : function(request, response) {
						$.ajax({
							url : "/kechengshezhi",
							datatype : "json",
							type : "post",
							success : function(data) {
								//alert(data)
								var matcher=new RegExp("^"+ $.ui.autocomplete.escapeRegex(request.term), "i")
								response($.grep(data["coursename"], function(item) {
									//alert("111")
									//alert(item.label)
									return matcher.test(item.abst);
									

								}));

							}
						});
					},
				})
			});
		</script>
	</head>
	<body>

		<div class="ui-widget">
			<label for="Newcourse">Tag programming languages: </label>
			<input id="Newcourse" size="50">
		</div>

	</body>
</html>
/*********************************************************/
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>tree型测试（未成功）</title>

		<head>
			<link href="/js/dwz/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
			<link href="/js/dwz/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
			<link href="/js/dwz/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
			<script src="/js/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
			<script src="/js/dwz/js/jquery.cookie.js" type="text/javascript"></script>
			<script src="/js/dwz/js/jquery.validate.js" type="text/javascript"></script>
			<script src="/js/dwz/js/jquery.bgiframe.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.core.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.util.date.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.validate.method.js" type="text/javascript"></script>

			<script src="/js/dwz/js/dwz.barDrag.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.drag.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.tree.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.accordion.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.ui.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.theme.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.switchEnv.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.alertMsg.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.contextmenu.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.navTab.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.tab.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.resize.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.dialog.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.dialogDrag.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.sortDrag.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.cssTable.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.stable.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.taskBar.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.ajax.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.pagination.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.database.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.datepicker.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.effects.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.panel.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.checkbox.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.history.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.combox.js" type="text/javascript"></script>
			<script src="/js/dwz/js/dwz.print.js" type="text/javascript"></script>
			<!--
			<script src="bin/dwz.min.js" type="text/javascript"></script>
			-->
			<script src="/js/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
			
		</head>
		<script type="text/javascript">
			function kkk() {
				var json = arguments[0], result = "";
				//	alert(json.checked);

				$(json.items).each(function(i) {
					result += "<p>name:" + this.name + " value:" + this.value + " text: " + this.text + "</p>";
				});
				$("#resultBox").html(result);

			}
		</script>

		<!--<script type="text/javascript">
			$(document).ready(function() {

			});
		</script>-->
	</head>
	<body>

		<div id="resultBox"></div>

		<div style=" float:left; display:block; margin:10px; overflow:auto; width:200px; height:200px; overflow:auto; border:solid 1px #CCC; line-height:21px; background:#FFF;">
			
			<form method="post" action="demo/common/ajaxDone.html" class="pageForm required-validate" onsubmit="return validateCallback(this)">
				<ul class="tree treeFolder treeCheck expand" oncheck="kkk">
					<li>
						<a >框架面板</a>
						<ul>
							<li>
								<a tname="name" tvalue="value1" checked="true">我的主页</a>
							</li>
							<li>
								<a tname="name" tvalue="value2">页面一</a>
							</li>
							<li>
								<a tname="name" tvalue="value3">替换页面一</a>
							</li>
							<li>
								<a tname="name" tvalue="value4">页面二</a>
							</li>
							<li>
								<a tname="name" tvalue="value5">页面三</a>
							</li>
						</ul>
					</li>

					<li>
						<a tname="name" tvalue="test1">Test 1</a>
						<ul>
							<li>
								<a tname="name" tvalue="test1.1">Test 1.1</a>
								<ul>
									<li>
										<a tname="name" tvalue="test1.1.1" checked="true">Test 1.1.1</a>
									</li>
									<li>
										<a tname="name" tvalue="test1.1.2" checked="false">Test 1.1.2</a>
									</li>
								</ul>
							</li>
							<li>
								<a tname="name" tvalue="test1.2" checked="true">Test 1.2</a>
							</li>
						</ul>
					</li>
					<li>
						<a tname="name" tvalue="test2" checked="true">Test 2</a>
					</li>
				</ul>

				<input type="submit" value="Submit"/>
			</form>
		</div>

	</body>
</html>
/*********************************************************/
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>tree型菜单----checkbox / radio 共存</title>

		<link rel="stylesheet" href="/js/zTree_v3/css/demo.css" type="text/css">
		<link rel="stylesheet" href="/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="/js/zTree_v3/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
		
		<style type="text/css">
			.radioBtn {
				height: 16px;
				vertical-align: middle;
			}
			.checkboxBtn {
				vertical-align: middle;
				margin-right: 2px;
			}
		</style>
		<script type="text/javascript">
			var setting1 = {
				check : {
					enable : true,
					chkboxType : {
						"Y" : "ps",
						"N" : "ps"
					}
				},
				view : {
					dblClickExpand : false
				},
				data : {
					simpleData : {
						enable : true
					}
				},
				callback : {
					beforeClick : beforeClick,
					onCheck : onCheck
				}
			};

			var zNodes1 = [{ id:1, pId:0, name:"默认 ", checked:true,},
			{ id:11, pId:1, name:"上午8：00--9：40",},
			{ id:12, pId:1, name:"上午10：00--9：40"},
			{ id:13, pId:1, name:"下午14：00--15：40"},
			{ id:14, pId:1, name:"下午16：00--17：40",},
			{ id:15, pId:1, name:"晚上18：30--20：10"},
			
			{ id:2, pId:0, name:"自由设定", open:true},
			{ id:21, pId:2, name:"开始时间"},
			{ id:211, pId:21, name:"随意勾选 2-2-1", },
			{ id:212, pId:21, name:"随意勾选 2-2-2"},
			{ id:22, pId:2, name:"结束时间", open:true},
			{ id:221, pId:22, name:"随意勾选 2-2-1", },
			{ id:222, pId:22, name:"随意勾选 2-2-2"},
			{ id:23, pId:2, name:"随意勾选 2-3"}];

			function beforeClick(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}

			function onCheck(e, treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getCheckedNodes(true), v = "";
				for (var i = 0, l = nodes.length; i < l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0)
					v = v.substring(0, v.length - 1);
				var cityObj = $("#citySel");
				cityObj.attr("value", v);
			}

			function showMenu() {
				var cityObj = $("#citySel");
				var cityOffset = $("#citySel").offset();
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
				if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
					hideMenu();
				}
			}


			$(document).ready(function() {
				$.fn.zTree.init($("#treeDemo"), setting1, zNodes1);
			});
		</script>
		<script type="text/javascript">
			var IDMark_A = "_a";
			var setting2 = {
				view : {
					addDiyDom : addDiyDom
				},
				data : {
					simpleData : {
						enable : true
					}
				}
			};

			var zNodes2 = [{
				id : 1,
				pId : 0,
				name : "父节点 1",
				open : true
			}, {
				id : 11,
				pId : 1,
				name : "叶子节点 1-1"
			}, {
				id : 12,
				pId : 1,
				name : "叶子节点 1-2"
			}, {
				id : 13,
				pId : 1,
				name : "叶子节点 1-3"
			}, {
				id : 2,
				pId : 0,
				name : "父节点 2",
				open : true
			}, {
				id : 21,
				pId : 2,
				name : "叶子节点 2-1"
			}, {
				id : 22,
				pId : 2,
				name : "叶子节点 2-2"
			}, {
				id : 23,
				pId : 2,
				name : "叶子节点 2-3"
			}, {
				id : 3,
				pId : 0,
				name : "父节点 3",
				open : true
			}, {
				id : 31,
				pId : 3,
				name : "叶子节点 3-1"
			}, {
				id : 32,
				pId : 3,
				name : "叶子节点 3-2"
			}, {
				id : 33,
				pId : 3,
				name : "叶子节点 3-3"
			}];

			function addDiyDom(treeId, treeNode) {
				var aObj = $("#" + treeNode.tId + IDMark_A);
				if (treeNode.level == 0) {
					var editStr = "<input type='checkbox' class='checkboxBtn' id='checkbox_" + treeNode.id + "' onfocus='this.blur();'></input>";
					aObj.before(editStr);
					var btn = $("#checkbox_" + treeNode.id);
					if (btn)
						btn.bind("change", function() {
							checkAccessories(treeNode, btn);
						});
				} else if (treeNode.level == 1) {
					var editStr = "<input type='radio' class='radioBtn' id='radio_" + treeNode.id + "' name='radio_" + treeNode.getParentNode().id + "' onfocus='this.blur();'></input>";
					aObj.before(editStr);
					var btn = $("#radio_" + treeNode.id);
					if (btn)
						btn.bind("click", function() {
							checkBrand(treeNode, btn);
						});
				}
			}

			function checkAccessories(treeNode, btn) {
				var checkedRadio = getCheckedRadio("radio_" + treeNode.id);
				if (btn.attr("checked")) {
					if (!checkedRadio) {
						$("#radio_" + treeNode.children[0].id).attr("checked", true);
					}
				} else {
					checkedRadio.attr("checked", false);
				}
			}

			function checkBrand(treeNode, btn) {
				if (btn.attr("checked")) {
					var pObj = $("#checkbox_" + treeNode.getParentNode().id);
					if (!pObj.attr("checked")) {
						pObj.attr("checked", true);
					}
				}
			}

			function getCheckedRadio(radioName) {
				var r = document.getElementsByName(radioName);
				for (var i = 0; i < r.length; i++) {
					if (r[i].checked) {
						return $(r[i]);
					}
				}
				return null;
			}


			$(document).ready(function() {
				$.fn.zTree.init($("#treeDemo"), setting2, zNodes2);
			});
		</script>
	</head>
	<body>

		
		<div class="content_wrap">
			<div class="zTreeDemoBackground left">
				<ul class="list">
					
					<li class="title">
						&nbsp;&nbsp;常规设置:
						<input id="citySel" type="text" readonly value="" style="width:120px;" onclick="showMenu();" />
						&nbsp;<a id="menuBtn" href="#" onclick="showMenu(); return false;">select</a>
					</li>
				</ul>
			</div>
			
		</div>

		<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
		</div>
		
	</body>
</html>
/*********************************************************/
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>tree型菜单----高级功能增删改</title>
		/*$("#ok").click(function(){})中由于无法将多个{"startTime":值1,"xiakeTime":值2}组合成一个大字典传入后台，故未完成交互功能
		 进一步设想直接将数据拿到后传到后台，由后台处理后在写入数据库中*/

		<link rel="stylesheet" href="/js/zTree_v3/css/demo.css" type="text/css">
		<link rel="stylesheet" href="/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="/js/zTree_v3/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.exedit-3.5.js"></script>
		<style type="text/css">
			.ztree li span.button.add {
				margin-left: 2px;
				margin-right: -1px;
				background-position: -144px 0;
				vertical-align: top;
				*vertical-align: middle
			}
		</style>
		<script type="text/javascript">
			var setting = {
				check : {
					enable : true,
					chkboxType : {
						"Y" : "ps",
						"N" : "ps"
					}
				},
				view : {
					addHoverDom : addHoverDom,//用于当鼠标移动到节点上时，显示用户自定义控件，显示隐藏状态同 zTree 内部的编辑、删除按钮
					removeHoverDom : removeHoverDom,//用于当鼠标移出节点时，隐藏用户自定义控件，显示隐藏状态同 zTree 内部的编辑、删除按钮
					selectedMulti : false//设置是否允许同时选中多个节点
				},
				edit : {
					enable : true,//设置 zTree 是否处于编辑状态
					editNameSelectAll : true,//节点编辑名称 input 初次显示时,设置 txt 内容是否为全选状态
					showRemoveBtn : showRemoveBtn,//设置是否显示删除按钮
					showRenameBtn : showRenameBtn//设置是否显示编辑名称按钮
				},
				data : {
					simpleData : {
						enable : true//确定 zTree 初始化时的节点数据、异步加载时的节点数据、或 addNodes 方法中输入的 newNodes 数据是否采用简单数据模式 (Array)
					},
					keep: {
			            parent: true,
			            leaf:true
				          }
				},
				callback : {
					beforeDrag : beforeDrag,//用于捕获节点被拖拽之前的事件回调函数，并且根据返回值确定是否允许开启拖拽操作
					beforeEditName : beforeEditName,//用于捕获节点编辑按钮的 click 事件，并且根据返回值确定是否允许进入名称编辑状态
					beforeRemove : beforeRemove,//用于捕获节点被删除之前的事件回调函数，并且根据返回值确定是否允许删除操作
					beforeRename : beforeRename,//用于捕获节点编辑名称结束（Input 失去焦点 或 按下 Enter 键）之后，更新节点名称数据之前的事件回调函数，并且根据返回值确定是否允许更改名称的操作
					onRemove : onRemove,//用于捕获删除节点之后的事件回调函数.如果用户设置了 beforeRemove 回调函数，并返回 false，将无法触发 onRemove 事件回调函数
					onRename : onRename//用于捕获节点编辑名称结束之后的事件回调函数.
				}
			};

			var zNodes = [{
				id : 1,
				pId : 0,
				name : "parent node 1",
				open : true
			}, {
				id : 11,
				pId : 1,
				name : "leaf node 1-1"
			}, {
				id : 12,
				pId : 1,
				name : "leaf node 1-2"
			}, {
				id : 13,
				pId : 1,
				name : "leaf node 1-3"
			}, {
				id : 14,
				pId : 1,
				name : "leaf node 1-4"
			}, {
				id : 15,
				pId : 1,
				name : "leaf node 1-5"
			}, {
				id : 2,
				pId : 0,
				name : "parent node 2",
				open : true
			},{
				id : 21,
				pId : 2,
				name : "leaf node 2-1",
				open : true
			}];
			var log, className = "dark";
			function beforeDrag(treeId, treeNodes) {//用于捕获节点被拖拽之前的事件回调函数，并且根据返回值确定是否允许开启拖拽操作
				return false;//如果返回 false，zTree 将终止拖拽
			}

			function beforeEditName(treeId, treeNode) {//用于捕获节点编辑按钮的 click 事件，并且根据返回值确定是否允许进入名称编辑状态
				className = (className === "dark" ? "" : "dark");
				//showLog("[ " + getTime() + " beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.selectNode(treeNode);
				return confirm("Start node '" + treeNode.name + "' editorial status?");
			}

			function beforeRemove(treeId, treeNode) {//用于捕获节点被删除之前的事件回调函数，并且根据返回值确定是否允许删除操作
				className = (className === "dark" ? "" : "dark");
				//showLog("[ " + getTime() + " beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.selectNode(treeNode);
				return confirm("Confirm delete node '" + treeNode.name + "' it?");
			}

			function onRemove(e, treeId, treeNode) {//用于捕获删除节点之后的事件回调函数.如果用户设置了 beforeRemove 回调函数，并返回 false，将无法触发 onRemove 事件回调函数
				//showLog("[ " + getTime() + " onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			}

			function beforeRename(treeId, treeNode, newName, isCancel) {//用于捕获节点编辑名称结束（Input 失去焦点 或 按下 Enter 键）之后，更新节点名称数据之前的事件回调函数，并且根据返回值确定是否允许更改名称的操作
				className = (className === "dark" ? "" : "dark");
				//showLog(( isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + ( isCancel ? "</span>" : ""));
				if (newName.length == 0) {//可以利用正则表达式限制输入的节点名称
					alert("Node name can not be empty.");
					var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					setTimeout(function() {
						zTree.editName(treeNode)
					}, 10);
					return false;
				}
				return true;
			}

			function onRename(e, treeId, treeNode, isCancel) {//用于捕获节点编辑名称结束之后的事件回调函数
				//showLog(( isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + ( isCancel ? "</span>" : ""));
			}

			function showRemoveBtn(treeId, treeNode) {//设置是否显示删除按钮。[setting.edit.enable = true 时生效]
				return !treeNode.isParent;
			}

			function showRenameBtn(treeId, treeNode) {//设置是否显示编辑名称按钮
				return !treeNode.isParent;
			}

			/*function showLog(str) {
				if (!log)
					log = $("#log");
				log.append("<li class='" + className + "'>" + str + "</li>");
				if (log.children("li").length > 8) {
					log.get(0).removeChild(log.children("li")[0]);
				}
			}

			function getTime() {
				var now = new Date(), h = now.getHours(), m = now.getMinutes(), s = now.getSeconds(), ms = now.getMilliseconds();
				return (h + ":" + m + ":" + s + " " + ms);
			}*/

			var newCount = 1;
			function addHoverDom(treeId, treeNode) {//用于当鼠标移动到节点上时，显示用户自定义控件，显示隐藏状态同 zTree 内部的编辑、删除按钮
				var sObj = $("#" + treeNode.tId + "_span");//editNameFlag用于记录节点是否处于编辑名称状态
				if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0)
					return;
				var addStr = "<span class='button add' id='addBtn_" + treeNode.tId + "' title='add node' onfocus='this.blur();'></span>";
				sObj.after(addStr);
				//if(tId>7||tId==7)
				var btn = $("#addBtn_" + treeNode.tId);
				//alert(treeNode.tId)
				if (bth)
					btn.bind("click", function() {
						var zTree = $.fn.zTree.getZTreeObj("treeDemo");
						zTree.addNodes(treeNode, {
							id : (100 + newCount),
							pId : treeNode.id,
							name : "00:00 - 00:00",
						});//增加新的节点
						return false;
					});
			};
			
			/*var newCount=1;
			function addHoverDom(treeId, treeNode) {//用于当鼠标移动到节点上时，显示用户自定义控件，显示隐藏状态同 zTree 内部的编辑、删除按钮
				var sObj = $("#" + treeNode.tId + "_span");//editNameFlag用于记录节点是否处于编辑名称状态
				if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0)
					return;
				var addStr = "<span class='button add' id='addBtn_" + treeNode.tId + "' title='add node' onfocus='this.blur();'></span>";
				sObj.after(addStr);
				var btn = $("#addBtn_" + treeNode.tId);
				if (btn)
					btn.bind("click", function() {
						var zTree = $.fn.zTree.getZTreeObj("treeDemo");
						zTree.addNodes(treeNode, {
							id : (100 + newCount),
							pId : treeNode.id,
							name : "new node" + (newCount++)
						});//增加新的节点
						return false;
					});
			}; */
			function removeHoverDom(treeId, treeNode) {//用于当鼠标移出节点时，隐藏用户自定义控件，显示隐藏状态同 zTree 内部的编辑、删除按钮
				$("#addBtn_" + treeNode.tId).unbind().remove();
			};
			function selectAll() {//editNameSelectAll节点编辑名称 input 初次显示时,设置 txt 内容是否为全选状态
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
			}


			$(document).ready(function() {
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				$("#selectAll").bind("click", selectAll);
			});
		</script>
	</head>
	<body>

		<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	
</div>

	</body>
</html>
/*********************************************************/
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>tree型菜单----增删改</title>

		<link rel="stylesheet" href="/js/zTree_v3/css/demo.css" type="text/css">
		<link rel="stylesheet" href="/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="/js/zTree_v3/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.exedit-3.5.js"></script>
		<style type="text/css">
			.ztree li span.button.add {
				margin-left: 2px;
				margin-right: -1px;
				background-position: -144px 0;
				vertical-align: top;
				*vertical-align: middle
			}
		</style>
		<script type="text/javascript">
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
					editNameSelectAll: true,
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
				callback : {
					beforeDrag : beforeDrag,
					beforeRemove : beforeRemove,
					beforeRename : beforeRename,
					onRemove : onRemove,
					onCheck : onCheck
					
				}
			};
			var zNodes = [{
				id : 1,
				pId : 0,
				name : "默认 ",
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
			}];
			var className = "dark";
			function beforeDrag(treeId, treeNodes) {
				return false;
			}

			function beforeRemove(treeId, treeNode) {
				className = (className === "dark" ? "" : "dark");
				return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
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
				else if(newName.length>0){
					var re=/^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])-(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$/;
					if(!re.test(newName)){
						alert("请按照hh:mm-hh:mm格式编辑")
					    
						return false;
						
					}
					
					
				    return true;	
				}
				
			}
			
			

			function onCheck(e, treeId, treeNode) {//用于捕获节点被点击的事件回调函数
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getCheckedNodes(true), v = "";
				for (var i = 0, l = nodes.length; i < l; i++) {
					v += nodes[i].name + ",";
					//alert(v)将treenode值循环写入v中。
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
				if (!(event.target.id == "menuBtn" || event.target.id == "citySel"|| event.target.id == "add"|| event.target.id == "edit"|| event.target.id == "remove" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
					hideMenu();
				}
			}


			var newCount = 1;
			function add(e) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"), isParent = e.data.isParent, nodes = zTree.getNodeByParam("id", 2, null), treeNode = nodes;
				if (treeNode) {
					treeNode = zTree.addNodes(treeNode, {
						id : (100 + newCount),
						pId : 2,
						//isParent : isParent,
						name : "00:00-00:00"
					});
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
				var node = treeNode.getParentNode();
				if (nodes.length == 0) {
					alert("请先选择要编辑的对象");
					return;
				}
				else if(node.isLastNode){
					
					
					zTree.editName(treeNode);
				}
				
				else{
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
				}
				else if(node.isLastNode){
					
					
					zTree.removeNode(treeNode);
				}
				
				else{
					//zTree.editName(treeNode);
					alert("只能删除自由设定选项下的时间点")
				}

				

			};

			$(document).ready(function() {
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);

				$("#add").bind("click", {
					isParent : false
				}, add);
				$("#edit").bind("click", edit);
				$("#remove").bind("click", remove);
				$("#ok").click(function(){
					var re=/^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])-(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$/;
					var str1=$("#citySel").val().split(",");
					alert(str1.length)
					for(i=0;i<str1.length;i++){
						alert(str1[i])
						if(re.test(str1[i])){
							var str2=str1[i].split("-");
							var cinfo={},cinfo1={};
							cinfo["startTime"]=str2[0];
							alert(cinfo1["startTime"]=str2[0])
							cinfo["xiakeTime"]=str2[1];
							alert(cinfo1["startTime"]=str2[1])
							cinfo["i"]=cinfo1
							
							alert("11")
							
						}
						
						}
					
					
				})
				
				

			});
		</script>
	</head>
	<body>

		<div class="content_wrap">
			<div class="zTreeDemoBackground left">
				<ul class="list">

					<li class="title">
						&nbsp;&nbsp;常规设置:
						<input id="citySel" type="text" readonly value="" style="width:120px;" onclick="showMenu();" />
						&nbsp;<a id="menuBtn" href="#" onclick="showMenu(); return false;">select</a>
					</li>
				</ul>
				
			</div>
			<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
			    <ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
		   </div>
			<div class="right">

				<input id="add" type="button" value="增加" onclick="return false;"/>
				<input id="edit" type="button" value="编辑名称" onclick="return false;"/>
				<input id="remove" type="button" value="删除" onclick="return false;" />
                <input id="ok" type="button" value="确定" />
			</div>
		</div>

	

	</body>
</html>
/*********************************************************/
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>zTree的异步加载节点</title>

		<link rel="stylesheet" href="/js/zTree_v3/css/demo.css" type="text/css">
		<link rel="stylesheet" href="/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="/js/zTree_v3/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.exedit-3.5.js"></script>
		<style type="text/css">
			.ztree li span.button.add {
				margin-left: 2px;
				margin-right: -1px;
				background-position: -144px 0;
				vertical-align: top;
				*vertical-align: middle
			}
			.radioBtn {
				height: 16px;
				vertical-align: middle;
			}
			.checkboxBtn {
				vertical-align: middle;
				margin-right: 2px;
			}
		</style>
		<script type="text/javascript">
			var setting1 = {
				check : {
					enable : true,
					chkboxType : {
						"Y" : "ps",
						"N" : "ps"
					}
				},
				view : {
					dblClickExpand : true,
					//addHoverDom : addHoverDom,//用于当鼠标移动到节点上时，显示用户自定义控件，显示隐藏状态同 zTree 内部的编辑、删除按钮
					//removeHoverDom : removeHoverDom,//用于当鼠标移出节点时，隐藏用户自定义控件，显示隐藏状态同 zTree 内部的编辑、删除按钮
					selectedMulti : false//设置是否允许同时选中多个节点
					
				},
				edit: {
				enable: true,
				showRemoveBtn: false,
				showRenameBtn: false
			    },
				data : {
					keep: {
					parent:true,
					leaf:true
				    },
					simpleData : {
						enable : true
					}
				},
				async: {
				enable: true,
				url:"/getzTree",
				type:"post",
				autoParam:["id=0", "name='自由设定'"],
				
				dataFilter: filter
			},
				callback : {
					//beforeDrag: beforeDrag,
				   // beforeRemove: beforeRemove,
				    //beforeRename: beforeRename,
				    //onRemove: onRemove,
					beforeClick : beforeClick,
					onCheck : onCheck,
					
				}
			};

			/*var zNodes1 = [{
				id : 1,
				pId : 0,
				name : "默认 ",
				checked : true,
			}, {
				id : 11,
				pId : 1,
				name : "上午8：00--9：40",
			}, {
				id : 12,
				pId : 1,
				name : "上午10：00--11：40"
			}, {
				id : 13,
				pId : 1,
				name : "下午14：00--15：40"
			}, {
				id : 14,
				pId : 1,
				name : "下午16：00--17：40",
			}, {
				id : 15,
				pId : 1,
				name : "晚上18：30--20：10"
			}, {
				id : 2,
				pId : 0,
				name : "自由设定",
				"nocheck":true
			},
			{
				id : 21,
				pId : 2,
				name : "自由设定2-1",
				
			},];*/

			function beforeClick(treeId, treeNode) {//用于捕获单击节点之前的事件回调函数，并且根据返回值确定是否允许单击操作
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}

			function onCheck(e, treeId, treeNode) {//用于捕获节点被点击的事件回调函数
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getCheckedNodes(true), v = "",
				nodes1=zTree.getNodesByParam("name", "自由设定", null);
				alert(nodes1.name)
				for (var i = 0, l = nodes.length; i < l; i++) {
					v += nodes[i].name + ",";
					//alert(v)将treenode值循环写入v中。
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
				if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
					hideMenu();
				}
			}
			function filter(treeId, parentNode, childNodes) {
			//alert(childNodes["zTreedata1"])	
			//alert(childNodes["zTreedata1"].length)
			
			
			//for (var i=0,l=childNodes["zTreedata1"].length;i<l;i++){
				
			//}
			//if (!childNodes["zTreedata1"]) return null;
			//alert(childNodes["zTreedata1"])
			//for (var i=0, l=childNodes["zTreedata1"].length; i<l; i++) {
				//alert("22")
				//childNodes["zTreedata1"][i].name = childNodes["zTreedata1"][i].name.replace(/\.n/g, '.');
			//}
			//alert("333")
			return childNodes["zTreedata1"];
		}


			$(document).ready(function() {
				$.fn.zTree.init($("#treeDemo"), setting1);
			});
		</script>
		
	</head>
	<body>

		<div class="content_wrap">
			<div class="zTreeDemoBackground left">
				<ul class="list">

					<li class="title">
						&nbsp;&nbsp;常规设置:
						<input id="citySel" type="text" readonly value="" style="width:120px;" onclick="showMenu();" />
						&nbsp;<a id="menuBtn" href="#" onclick="showMenu(); return false;">select</a>
					</li>
				</ul>
			</div>

		</div>

		<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
		</div>

	</body>
</html>
/*********************************************************/
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>tree型菜单----通过otherParam传递静态参数进行下拉菜单的异步加载功能</title>
        <!--功能说明：异步加载ztree的节点时，可以通过otherParam传递不变的静态参数到后台，后台根据参数选择合适的数据传送到前台-->
		<link rel="stylesheet" href="/js/zTree_v3/css/demo.css" type="text/css">
		<link rel="stylesheet" href="/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="/js/zTree_v3/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.exedit-3.5.js"></script>
		<style type="text/css">
			.ztree li span.button.add {
				margin-left: 2px;
				margin-right: -1px;
				background-position: -144px 0;
				vertical-align: top;
				*vertical-align: middle
			}
		</style>
		<script type="text/javascript">
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
					url : "/testserver4",
					type : "post",
					otherParam : {
						"choice4" : "自动化1001"
					},

					dataFilter : filter2
				},
				callback : {
					beforeClick : beforeClick,
					onCheck : onCheck2
				}
			};

			/*var zNodes = [{
				id : 1,
				pId : 0,
				name : "北京"
			}, {
				id : 2,
				pId : 0,
				name : "天津"
			}, {
				id : 3,
				pId : 0,
				name : "上海"
			}, {
				id : 4,
				pId : 0,
				name : "重庆"
			}, {
				id : 5,
				pId : 0,
				name : "石家庄"
			}, {
				id : 6,
				pId : 0,
				name : "保定"
			}, {
				id : 7,
				pId : 0,
				name : "邯郸"
			}, {
				id : 8,
				pId : 0,
				name : "承德"
			}];*/

			function beforeClick(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
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

				$("body").bind("mousedown", onBodyDown);
			}

			function hideMenu2() {
				$("#menuContent2").fadeOut("fast");
				$("body").unbind("mousedown", onBodyDown);
			}

			function onBodyDown2(event) {
				if (!( event.target.id == "citySel2" || event.target.id == "menuContent2" || $(event.target).parents("#menuContent2").length > 0)) {
					hideMenu2();
				}
			}
			
			function filter2(treeId, parentNode, childNodes) {
				return childNodes["studentname1"];
			}
			
			function showIconForTree(treeId, treeNode) {
				return treeNode.isParent;
			}


			$(document).ready(function() {
				$.fn.zTree.init($("#treeDemo2"), setting2);
			});
		</script>
	</head>
	<body>

		<div class="content_wrap">
			<div class="zTreeDemoBackground left">
				<ul class="list">
					
					<li class="title">
						&nbsp;&nbsp;Test:
						<input id="citySel2" type="text" readonly value="" style="width:360px;" onclick="showMenu2();" />
						
					</li>
				</ul>
			</div>
			<div id="menuContent2" class="menuContent" style="display:none; position: absolute;">
				<ul id="treeDemo2" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
		</div>

	</body>
</html>
/*********************************************************/
<!--功能说明：根据前一文本框中输入的条件，通过ztree的异步加载模式，将前一文本框中条件传到后台筛选符合条件的数据填充到后一文本框中的下拉菜单中-->
/*********************************************************/
/*********************************************************/
/*********************************************************/
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>ztree型菜单----增删改功能与异步加载的结合功能</title>
        <!--功能说明：增删改节点后点击“确定”会将此时tree中自由设定下的节点保存到后台，下次打开tree时自动加载到树上-->
		<link rel="stylesheet" href="/js/zTree_v3/css/demo.css" type="text/css">
		<link rel="stylesheet" href="/js/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="/js/zTree_v3/js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="/js/zTree_v3/js/jquery.ztree.exedit-3.5.js"></script>
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

		<script type="text/javascript">
			var setting1 = {
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
					onRename:onRename,
					onCheck : onCheck

				}
			};
			/*var zNodes = [{
			 id : 1,
			 pId : 0,
			 name : "默认 ",
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
			var className = "dark";
			function beforeDrag(treeId, treeNodes) {
				return false;
			}

			function beforeRemove(treeId, treeNode) {
				className = (className === "dark" ? "" : "dark");
				return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
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
				} //else if (newName.length > 0) {
					//var re = /^(2[0-1]|1[0-9]|[0]?[89]):([0-5]?[0-9])-(2[0-1]|1[0-9]|[0]?[89]):([0-5]?[0-9])$/;//匹配8：00-21:59之间的时间
					//if (!re.test(newName)) {
						//alert("请按照hh:mm-hh:mm格式编辑（要求在8:00-22:00之间的时间段）")

						//return false;

					//}

					return true;
				//}

			}
			
			function onRename(event, treeId, treeNode, isCancel){
				//alert("aa")
				//alert(treeNode.tId + ", " + treeNode.name);
				var re = /^(2[0-1]|1[0-9]|[0]?[89]):([0-5]?[0-9])-(2[0-1]|1[0-9]|[0]?[89]):([0-5]?[0-9])$/;//匹配8：00-21:59之间的时间
				var aa=treeNode.name.split("-");
					alert(treeNode.name)//拿到的是更改名称后的值
					alert(aa[0])
					alert(aa[1])
				if (!re.test(treeNode.name)) {
					alert("请按照hh:mm-hh:mm格式编辑（要求在8:00-22:00之间的时间段）")
                    treeNode.name="00:00-00:00";
					return false;

				}
				else {
					var bb=aa[0].split(":"),
						cc=aa[1].split(":");
						 alert(bb[0])
						 alert(cc[0])
				     if((bb[0]>cc[0])||(bb[0]=cc[0]&&bb[1]<cc[1])){
						   alert("请注意设置时间段的先后性")
						    treeNode.name="00:00-00:00";
						    }
					}

					return true;
				
			}

			function onCheck(e, treeId, treeNode) {//用于捕获节点被点击的事件回调函数
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getCheckedNodes(true), v = "";
				for (var i = 0, l = nodes.length; i < l; i++) {
					v += nodes[i].name + ",";
					//alert(v)将treenode值循环写入v中。
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
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"),nodes = zTree.getSelectedNodes(), treeNode = nodes[0];alert(nodes[0].name)
				var node = treeNode.getParentNode();
				    
				if (nodes.length == 0) {
					alert("请先选择自由设定中要删除的对象");
					return;
				} else if (node.isLastNode&&treeNode.id!=21) {

					zTree.removeNode(treeNode);
				} else {
					//zTree.editName(treeNode);
					alert("只能删除自由设定选项下新增的时间点")
				}

			};
			function savezTree(){
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				var nodes = zTree.transformToArray(zTree.getNodes());
				alert(nodes)
				return nodes
				
				
			}
			
			function filter(treeId, parentNode, childNodes) {
				return childNodes["zTreedata1"];
			}


			$(document).ready(function() {
				$.fn.zTree.init($("#treeDemo"), setting1);
				$("#add").bind("click", {
					isParent : false
				}, add);
				$("#edit").bind("click", edit);
				$("#remove").bind("click", remove);
				$("#ok").click(function() {
					/*var re=/^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])-(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$/;
					 var str1=$("#citySel").val().split(",");
					 alert(str1.length)
					 for(i=0;i<str1.length;i++){
					 alert(str1[i])
					 if(re.test(str1[i])){
					 var str2=str1[i].split("-");
					 var cinfo={},cinfo1={};
					 cinfo["startTime"]=str2[0];
					 alert(cinfo1["startTime"]=str2[0])
					 cinfo["xiakeTime"]=str2[1];
					 alert(cinfo1["startTime"]=str2[1])
					 cinfo["i"]=cinfo1

					 alert("11")

					 }

					 }*/
					alert("222")
					var nodes1=new Array();
					nodes1=savezTree();
					
					
					//alert(nodes1)
					var information="";
					var items=["id","pId","name"]
					for(i=7,l=nodes1.length;i<l;i++){
						//alert(l)
						var nodesdata={};
						//alert(nodes1[i].id)
						//nodesdata["id"]=nodes1[i].id;
						nodesdata[items["id"]]=nodes1[i].id;
						//alert(nodesdata[items["id"]])
						//alert(nodes1[i].pId)
						//nodesdata["pId"]=nodes1[i].pId;
						nodesdata[items["pId"]]=nodes1[i].pId;
						//alert(nodes1[i].name)
						//nodesdata["name"]=nodes1[i].name;
						nodesdata[items["name"]]=nodes1[i].name;
						information+=nodes1[i].id+"&"+nodes1[i].pId+"&"+nodes1[i].name+","
						//alert(information)
					}
					
					alert("111")
					$.ajax({
						url:"/saveztreedata",
						type:"post",
						datatype:"json",
						data:{choice:information},
						success:function(data){
							alert(data)
							alert(data["msg"]);
						}
						
					})
				

					$("#citySel").val();
					alert($("#citySel").val())

				})
			});
		</script>

	</head>
	<body>

		<div class="content_wrap">
			<div class="zTreeDemoBackground left">
				<ul class="list">

					<li class="title">
						&nbsp;&nbsp;常规设置:
						<input id="citySel" type="text" readonly value="" style="width:120px;" onclick="showMenu();" />
						&nbsp;<a id="menuBtn" href="#" onclick="showMenu(); return false;">select</a>
					</li>
				</ul>

			</div>
			<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
				<ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
			<div class="right">

				<input id="add" type="button" value="增加" onclick="return false;"/>
				<input id="edit" type="button" value="编辑名称" onclick="return false;"/>
				<input id="remove" type="button" value="删除" onclick="return false;" />
				<input id="ok" type="button" value="确定" />
			</div>
		</div>
	</body>
</html>
/*********************************************************/
<html>
	<head>
		<meta charset="utf-8">
		<title>teachersettest初始编写程序代码</title>
		<!--时间设置插件-->
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

		<script type="text/javascript">
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

			$(function() {
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
				$("#Newcourse").autocomplete({

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
				$("#Newcontent").autocomplete({
					minLength : 0,

					source : function(request, response) {
						var coursename2 = {};
						coursename2["coursename"] = $("#Newcourse").val(), alert($("#Newcourse").val())
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

				$("#savecourseinfo").click(function() {
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

					cinfo["experimentname"] = $("#Newexperiments").val();
					cinfo["subexperimentname"] = $("#Newcontent").val();
					cinfo["sxTime"] = $("#citySel").val();
					cinfo["maxnumber"] = $("#maxnum").val();
					cinfo["eqrule"] = $("#eqrule").val();

					$.ajax({
						url : "/savecinfo",
						dataType : "json",
						data : {
							saveinfo : $.param(cinfo)
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
				function Timechange(str_1) {
					var c;
					if (str_1.indexOf("PM") >= 0) {
						str_1 = str_1.split(" ")[0];
						
						a = parseInt(str_1.split(":")[0]) + 12;
						a = a.toString();
						b = str_1.split(":")[1];
						c = a + ":" + b;
						
					} else  {
						
						c = str_1.split(" ")[0];
					} 

					
					return c
				}


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
					alert(a1[0])
					b1 = bb[0].split(":");
					a1[0]=parseInt(a1[0]);
					alert(a1[0])
					a1[1]=parseInt(a1[1]);
					alert(a1[1])
					b1[0]=parseInt(b1[0]);
					alert(b1[0])
					b1[1]=parseInt(b1[1]);
					alert(b1[1])
					if (aa[1] > bb[1]) {
						alert("111请注意时间先后性-请设置时间在8：00 AM 到9:55 PM")
						$("#PtTime1").val("");
						$("#PtTime2").val("");
					}
					else if (aa[1]==bb[1]) {
						if((aa[1]==bb[1]=='AM')&&((8<=a1[0]<b1[0])||(8<=a1[0]==b1[0]&&a1[1]<b1[1]))){
							appointinf["StartTime"] = Timechange($("#PtTime1").val());
						    appointinf["EndTime"] = Timechange($("#PtTime2").val());
							
						}
						else if((aa[1]==bb[1]=='PM')&&((a1[0]<b1[0]<=9)||(a1[0]==b1[0]<=9&&a1[1]<b1[1]))){
							appointinf["StartTime"] = Timechange($("#PtTime1").val());
						    appointinf["EndTime"] = Timechange($("#PtTime2").val());
							
						}
						else{
							alert("请注意检查时间是否在8：0:0AM到9:55PM之间")
							$("#PtTime1").val("");
						    $("#PtTime2").val("");
						}
					}
					else {
						if(a1[0]>=8&&b1[0]<=9){
							appointinf["StartTime"] = Timechange($("#PtTime1").val());
						    appointinf["EndTime"] = Timechange($("#PtTime2").val());
						}
						else{
							alert("请注意检查时间是否在8：0:0AM到9:55PM之间")
							$("#PtTime1").val("");
						    $("#PtTime2").val("");
						}
					};
					
						
						
						//if ((a1[0] > b1[0]) || (a1[0] ==b1[0] && a1[1] > b1[1])) {
							//alert("222请注意时间先后性-请设置时间在8：00 AM 到9:55 PM")
							//$("#PtTime1").val("");
							//$("#PtTime2").val("");
						//}
						//else{
							//alert("1")
						    //appointinf["StartTime"] = Timechange($("#PtTime1").val());
						    //alert("2")
						    //appointinf["EndTime"] = Timechange($("#PtTime2").val());
						    
						    
						//}

					 //else {
						//alert("3")
						//appointinf["StartTime"] = Timechange($("#PtTime1").val());
						//alert("4")
						//appointinf["EndTime"] = Timechange($("#PtTime2").val());
						//alert("aaa")
					//}

					/*保存功能*/
					
					appointinf["coursename"] = $("#Newcourse").val();
					appointinf["experimentname"] = $("#Newexperiments").val();
					appointinf["subexperimentname"] = $("#Newcontent").val();
					appointinf["ADate"] = $("#datepicker3").val();
					//appointinf["StartTime"] = Timechange($("#PtTime1").val());
					//appointinf["EndTime"] = Timechange($("#PtTime2").val());
					appointinf["classname"] = $("#classlist").val();
					appointinf["devicenum"] = $("#devicenum").val();
					appointinf["path"] = 1;
					appointinf["studentsname"] = $("#citySel2").val();
					//检查字典中的值是否有空值，有则提示有未填写项，没有则正常提交
					//$.each(appointinf, function(key, value) {
						//if (value = " ") {
							//alert("还有未填写完的项")
						//} else {
                           // alert("确认提交吗？")
						//}
					//})

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
				})
			})

		</script>

	</head>
	<body>
		<div>
			<div id="tabs_1">
				<form id="form1" name="form1" method="post" action="">
					<div class="teacherset" align="left">
						<table class="setcourse">
							<tr>
								<td><label >课程设置</label>
								<input type="text" id="Newcourse" size="30"/>
								</td>

								<td>时间设置 <label for="from">From</label>
								<input type="text" id="from" name="from">
								<label for="to">to</label>
								<input type="text" id="to" name="to">
								</td>

							</tr>
							<tr>
								<td>开放
								<input name="zt" type="radio" class="h" id="kaifan" value="开放"  />
								<label for="radio"></label>关闭
								<input name="zt" type="radio" class="h" id="guanbi" value="关闭" />
								</td>
							</tr>
							<tr>
								<td><label >实验项目</label>
								<input type="text" id="Newexperiments" size="30"/>
								</td>
								<td><label >实验内容</label>
								<input type="text" id="Newcontent" size="30"/>
								</td>
								<td><label>实验人数</label>
								<select name="maxnum" id="maxnum">
									<option value="0"></option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
								</select></td>
								<td><label>设备分配原则</label>
								<select name="eqrule" id="eqrule">
									<option value=""></option>
									<option value="设备平均原则">设备平均原则</option>
									<option value="设备节约原则">设备节约原则</option>
								</select></td>

							</tr>

							<tr>
								<td>
								<input name="课程设置提交" type="button" class="h" id="savecourseinfo" value="课程设置提交" />
								<input name="重写" type="reset" class="h" id="resetcourseinfo" value="重写" />
								</td>
							</tr>

						</table>
					</div>
					<div class="content_wrap">
						<!--常规设置的树形部分-->
						<div class="zTreeDemoBackground left">
							<ul class="list">

								<li class="title">
									&nbsp;&nbsp;常规设置:
									<input id="citySel" type="text" readonly value="" style="width:120px;" onclick="showMenu();" />
									&nbsp;<a id="menuBtn" href="#" onclick="showMenu(); return false;">select</a>
								</li>
							</ul>

						</div>
						<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
							<ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
						</div>
						<div class="right">

							<input id="add" type="button" value="增加" onclick="return false;"/>
							<input id="edit" type="button" value="编辑名称" onclick="return false;"/>
							<input id="remove" type="button" value="删除" onclick="return false;" />
							<input id="ok" type="button" value="确定" />
						</div>
					</div>

				</form>
				<form id="form2" name="form2" method="post" action="">
					<p>
						特殊设置部分
					</p>
					<p>
						实验日期：
						<input type="text" id="datepicker3" name="datetime" />
						实验设备：
						<select name="maxnum" id="devicenum">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>

					</p>
					<p>
						start：
						<input id="PtTime1" name="time" value="" />
						end：
						<input id="PtTime2" name="time" value="" />
					</p>
					<p>
						指定班级：
						<input type="text" id="classlist" value="" />
						具体人员：
						<input type="text" id="member1" size="50" value="" />

					</p>
					<div class="content_wrap">
						<!--member的树形部分-->
						<div class="zTreeDemoBackground left">
							<ul class="list">

								<li class="title">
									&nbsp;&nbsp;指定人员：
									<input id="citySel2" type="text" readonly value="" style="width:255px;" onclick="showMenu2();"/>

								</li>
							</ul>
						</div>
						<div id="menuContent2" class="menuContent" style="display:none; position: absolute;">
							<ul id="treeDemo2" class="ztree" style="margin-top:0; width:240px;"></ul>
						</div>

						<p>
							<input name="特别设置保存" type="button" id="saveTappoint" value="老师指定预约实验" />
						</p>
				</form>

			</div>

		</div>

	</body>
</html>
/*********************************************************/
<!DOCTYPE html>

<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="Description" content="Easily create Windows 8 Metro UI-style websites with this templating framework. Many features like live-tiles, slideshows and sidebars."/>
		<meta name="keywords" content="template, windows 8, website, design, download, metro ui, metro template"/>
		<link rel="icon" type="image/ico" href="/favicon.ico"/>
		<meta name="viewport" content="width=device-width,initial-scale=1.00, minimum-scale=1.00">
		<title>武汉理工大学自动化学院(学metro ui风格桌面测试版)</title>

		<link rel="stylesheet" type="text/css" href="css/layout.css" />
		<link rel="stylesheet" type="text/css" href="css/nav.css" />
		<link rel="stylesheet" type="text/css" href="css/tiles.css" />
		<link rel="stylesheet" type="text/css" href="themes/theme_default/theme.css" />
		<link rel="stylesheet" type="text/css" href="plugins/accordion/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/autozoom/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/custom/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/panels/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/plugintemplate/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tileflip/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tilefliptext/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tilemosaic/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tileslide/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tileslidefx/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tileslideshow/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tiletemplate/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tiletwitter/plugin.css" />
		<link rel="stylesheet" type="text/css" href="plugins/tileweather/plugin.css" />
		<style>
			html {
				background-color: #0F6D32;
			}

			#bgImage {
				position: fixed;
				top: 0;
				left: 0;
				z-index: -4;
				min-width: 115%;
				min-height: 100%;
				-webkit-transition: margin-left 450ms linear;
				-moz-transition: margin-left 450ms linear;
				-o-transition: margin-left 450ms;
				-ms-transition: margin-left 450ms;
				transition: margin-left 450ms;
			}
			.tile {
				-webkit-transition-property: box-shadow, margin-left, margin-top;
				-webkit-transition-duration: 0.25s, 0.5s, 0.5s;
				-moztransition-property: box-shadow, margin-left, margin-top;
				-moz-transition-duration: 0.25s, 0.5s, 0.5s;
				-o-transition-property: box-shadow, margin-left, margin-top;
				-o-transition-duration: 0.25s, 0.5s, 0.5s;
				-ms-transition-property: box-shadow, margin-left, margin-top;
				-ms-transition-duration: 0.25s, 0.5s, 0.5s;
				transition-property: box-shadow, margin-left, margin-top;
				transition-duration: 0.25s, 0.5s, 0.5s;
			}

			#headerTitles h1 a {
				color: #FFF;
				font-size: 42px;
				text-decoration: none;
				font-weight: 100;
				font-family: Segoe UI Light, "Opens Sans", sans-serif;
			}
		</style>

		<!--[if IE]>
		<script src="js/html5.js"></script>
		<![endif]-->
		<!--[if lt IE 9]>
		<script type="text/javascript" language="javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="js/html5.js"></script>
		<![endif]-->
		<!--[if gte IE 9]><!-->
		<script src="js/jquery-2.0.3.min.js"></script>
		<script src="js/html5.js"></script>

		<!--[if !IE]>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<![endif]-->

		<script type="text/javascript">
			window.jQuery || document.write('<\/script><script type="text/javascript" src="js/jquery1102.js"><\/script>')
		</script>
		<script type="text/javascript" src="js/plugins.js"></script>
		<script>
			scale = 145;
			spacing = 10;
			theme = 'theme_default';
			$group.titles = ["Home", "Download", "Support"];
			$group.spacingFull = [5, 5, 5];
			$group.inactive.opacity = "1";
			$group.inactive.clickable = "1";
			$group.showEffect = 0;
			$group.direction = "horizontal";

			mouseScroll = "1";

			siteTitle = '武汉理工大学自动化学院';
			siteTitleHome = 'Home';
			showSpeed = 400;
			hideSpeed = 300;
			scrollSpeed = 550;

			device = "desktop";
			scrollHeader = "1";
			disableGroupScrollingWhenVerticalScroll = "";

			/*For background image*/
			bgMaxScroll = "130";
			bgScrollSpeed = "450";

			/*For responsive */
			autoRearrangeTiles = "1";
			autoResizeTiles = "1";
			rearrangeTreshhold = 3;

			/*Locale */
			lang = "en";
			l_pageNotFound = "404 - Page not Found";
			l_pageNotFoundDesc = "<h2 class='margin-t-0'>404 - Page not Found</h2>We're sorry, the page you're looking for is not found.";
			l_menu = "Menu";
			l_goToFullSiteRedirect = "You'll be redirected to the full site";
			panelDim = '0.6';
			hidePanelOnClick = '1';
			panelGroupScrolling = '';
			/*pageTitles = new Array();
			pageTitles['labreport_template.tpl'] = 'labreport';
			pageTitles['changelog.php'] = 'Changelog and Bugs';
			pageTitles['features.php'] = 'Features';
			pageTitles['about.php'] = 'About';
			pageTitles['tutorials.php'] = 'Docs and Tutorials';
			pageTitles['contact.php'] = 'Contact';
			pageTitles['download.php'] = 'Download';
			pageTitles['buytemplate.php'] = 'Buy the Metro UI Template';
			pageTitles['demo.php'] = 'Demo sites and examples';
			pageTitles['download-full.php'] = 'Download the full Metro UI template';
			pageTitles['download-lite.php'] = 'Download the lite Metro UI template';
			pageURL = new Array();
			pageURL['labreport_template.tpl'] = 'labreport11';
			pageURL['changelog.php'] = 'bugs';
			pageURL['features.php'] = 'Features';
			pageURL['about.php'] = 'about';
			pageURL['tutorials.php'] = 'tutorials';
			pageURL['contact.php'] = 'Contact';
			pageURL['download.php'] = 'Download';
			pageURL['download-full.php'] = 'download full';
			pageURL['download-lite.php'] = 'download lite';
			pageURL['buytemplate.php'] = 'buy';
			pageURL['demo.php'] = 'demo';*/
		</script><script type="text/javascript" src="plugins/accordion/plugin.js"></script>
		<script type="text/javascript" src="plugins/autozoom/plugin.js"></script>
		<script type="text/javascript" src="plugins/panels/desktop.js"></script><script type="text/javascript" src="plugins/plugintemplate/plugin.js"></script>
		<script type="text/javascript" src="plugins/tileflip/plugin.js"></script>
		<script type="text/javascript" src="plugins/tilefliptext/plugin.js"></script>
		<script type="text/javascript" src="plugins/tilemedia/plugin.js"></script>
		<script type="text/javascript" src="plugins/tilemosaic/plugin.js"></script>
		<script type="text/javascript" src="plugins/tileslide/plugin.js"></script>
		<script type="text/javascript" src="plugins/tileslidefx/plugin.js"></script>
		<script type="text/javascript" src="plugins/tileslideshow/plugin.js"></script>
		<script type="text/javascript" src="plugins/tiletemplate/plugin.js"></script>
		<script type="text/javascript" src="plugins/tiletwitter/plugin.js"></script>
		<script type="text/javascript" src="plugins/tileweather/plugin.js"></script>
		<script type="text/javascript" src="js/functions.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
		<script type="text/javascript" src="plugins/tilemedia/jquery.media.js"></script>
		<script type="text/javascript" src="plugins/tilemedia/jquery.metadata.js"></script>
		<script type="text/javascript" src="plugins/tileweather/jquery.simpleWeather-2.1.2.min.js"></script>
		<style>
			#catchScroll {
				background: rgb(30,30,30);
				-ms-filter: 'progid:DXImageTransform.Microsoft.Alpha(Opacity=00)';
				filter: alpha(opacity=00);
				-moz-opacity: 0;
				-khtml-opacity: 0;
				opacity: 0;
			}
		</style>
		<noscript>
			<style>
				#tileContainer {
					display: block
				}
			</style>
		</noscript>
	</head>
	<body class="full desktop">
		<img src='img/bg/metro_green_angular_low_res.jpg' alt='background-image' id='bgImage'/>
		<header>
			<div id="headerWrapper">
				<div id="headerCenter">
					<div id="headerTitles">
						<h1><a href="#!">过程控制实验</a></h1>
						<h2>guo cheng kong zhi shi yan</h2>
					</div>
					<nav>
						<a id="group0"> <img src="img/icons/home.png" alt="Home"/> 基础部分 </a>
						<a id="group1"> <img src="img/icons/download_s.png" alt="Download"/> 提高部分 </a>
						<a id="group2"> <img src="img/icons/questionmark.png" alt="Support"/> 功能部分 </a>
					</nav>
				</div>
			</div>
		</header>
		<div id="wrapper">
			<div id="centerWrapper">
				<div id="tileContainer">
					<img id='arrowLeft' class="navArrows" src='themes/theme_default/img/primary/arrowLeft.png' onClick="javascript:$group.goLeft();" alt="left arrow"/>
					<img id='arrowRight' class="navArrows" src='themes/theme_default/img/primary/arrowRight.png' onClick="javascript:$group.goRight();" alt="right arrow"/>
					<a href="#&amp;home" id="groupTitle0" class="groupTitle" style="margin-left:0px; margin-top:0px" onclick="javascript:$group.goTo(0);"><h3>基础部分</h3></a>
					<a href="#&amp;download" id="groupTitle1" class="groupTitle" style="margin-left:775px; margin-top:0px" onclick="javascript:$group.goTo(1);"><h3>提高部分</h3></a>
					<a href="#&amp;support" id="groupTitle2" class="groupTitle" style="margin-left:1550px; margin-top:0px" onclick="javascript:$group.goTo(2);"><h3>功能部分</h3></a>
					<a  href="/preknowledge" class="tile tileCenteredSlide left group0 " style="
					margin-top:45px; margin-left:0px;
					width:300px; height:145px;
					background:rgb(80, 150, 1);"  data-pos='45-0-300' 	>
					<div class="container1">
						<h3><img title='' alt='' style='margin-top:0px;margin-left:0px;'
						src='img/icons/box_info.png' height="60" width="60"/> 实验预习</h3>
					</div>
					<div class="container2">
						<h5>This is a templating framework to build websites based on the Windows 8 Metro UI style.是实验部分</h5>
					</div> </a>
					<a  href='/basictest' id="tileSlideshow0-2-0" class="tile tileSlideshow group0 " style="
					margin-top:45px; margin-left:310px;
					width:300px; height:145px;
					background:#6950ab;"  data-pos='45-310-300'  data-n=0>
					<div class='imgWrapperBack' style="width: 302px; height:147px"><img src='empty' alt='' />
					</div>
					<div class='imgWrapper' style="width: 302px; height:147px"><img src='img/features/tiles.png' alt='' />
					</div>
					<div class='imgText'>
						测试部分1
					</div>
					<script>
						slideshowTiles["tileSlideshow0-2-0"] = [["img\/features\/tiles.png", "img\/features\/modern.png", "img\/features\/seo.png", "img\/features\/devices.png"], ["", "", "", ""], ["这是测试1", "这是测试2", "这是测试3", "这是测试4"], "slide-right, slide-up, slide-down,slide-left", 4000]
					</script>
					<div class='tileLabelWrapper top' style='border-top-color:#FF8000;'>
						<div class='tileLabel top' >
							这是测试环节
						</div>
					</div> </a>
					<a  href='/labreport' class="tile tileFlipText vertical group0 " style="
					margin-top:200px; margin-left:310px;
					width:300px; height:145px;"  data-pos='200-310-300' >
					<div class='flipContainer'>
						<div class='flipFront' style="background:#FF8000;">
							<h3><img title='' alt='' style='margin-top:0px;margin-left:0px;'
							src='img/icons/pen.png' height="60" width="60"/> 实验报告 </h3>
						</div>
						<div class='flipBack' style="background:
						#FF3C00;">
							<h5>
							<div style="font-weight: 300;font-size: 36px;padding:0 0 8px 0;color:#FFF;font-family: 'Just Another Hand', cursive;">
								<img title="" alt="" style="position: relative;vertical-align: middle;top:0px;margin-right:10px;" src="img/icons/pen2.png" height="50" width="50">
								实验报告
							</div></h5>
						</div>

					</div> </a>
					<a  href='/labappoint' class="tile tileSlideFx group0 " style="
					margin-top:200px; margin-left:0px;
					width:300px; height:145px;
					background:#333;"  data-pos='200-0-300' >
					<div class='slideText' style=''>
						实验预约部分
					</div>
					<div class='imgWrapper'>
						<img src='img/metro_slide_300x150.png' alt="" title="" />
					</div>
					<div class='tileLabelWrapper bottom'>
						<div class='tileLabel bottom' style='border-bottom-color:rgb(80,150,1);'>
							预约环节
						</div>
					</div> </a>
					<a  href='/innovation' class="tile tileCentered group1 " style="
					margin-top:45px; margin-left:775px;
					width:300px; height:145px;background:#11528f;"
					data-pos='45-775-300' 	>
					<div class="container" style="background:#11528f;"
					onMouseOver="javascript:$(this).css('background','#00BFFF')"
					onMouseOut="javascript:$(this).css('background','#11528f')"
					>
						<h3 style='color:#FFF'

						onMouseOver="javascript:$(this).css('color','#11528f')"
						onMouseOut="javascript:$(this).css('color','#FFF')"
						><img title='' alt='' style='margin-top:0px;margin-left:0px;'
						src='img/icons/box_download.png' height="60" width="60"/> 综合创新 </h3>

					</div> </a>
					<a  href='/interestgroup' class="tile tileSlide up group1 " style="
					margin-top:200px; margin-left:775px;
					width:300px; height:145px;
					background:#00BFFF; padding:0;"  data-pos='200-775-300'  data-doslide="1">
					<div class='slideText' style='
					height:145px; width:100%;top:145px;    '>
						<div style='background-color:#11528f;width:100%;height:100%;position:relative;padding-top:60px;'>
							<h3 class='margin-t-0'>资源上传与下载</h3>
						</div>
					</div>
					<div class="imageWrapper">
						<div class="imageCenterer" style="width:300px; height:145px;line-height:143px;">
							<img src='img/bug.png' alt="" title="" style="width:105px;" />
						</div>
						<div class='tileLabelWrapper top' style='border-top-color:#11528f;'>
							<div class='tileLabel top' >
								Bugs&nbsp;&nbsp;
							</div>
						</div>
					</div> </a>
					<a  href='/researchsubject' class="tile tileCentered group1 " style="
					margin-top:45px; margin-left:1085px;
					width:300px; height:145px;background:#FFF;"
					data-pos='45-1085-300' 	>
					<div class="container" style="background:#FFF;"
					onMouseOver="javascript:$(this).css('background','#00BFFF')"
					onMouseOut="javascript:$(this).css('background','#FFF')"
					>
						<h3 style='color:#11528f'

						onMouseOver="javascript:$(this).css('color','#FFF')"
						onMouseOut="javascript:$(this).css('color','#11528f')"
						><img title='' alt='' style='margin-top:0px;margin-left:0px;'
						src='img/icons/box_download_blue.png' height="60" width="60"/> 导师课题 </h3>

					</div> </a>
					<a  href='/upload' id="tileScroll1_2-1" class="tile tileScroll group1 " style="
					margin-top:200px; margin-left:1085px;
					width:145px; height:145px;
					background:#11528F;"  data-pos='200-1085-145' >
					<div class='tileTitle' style='margin-left:10px;'>
						<span style='font-size:24px;'>申请项目板块</span>
					</div>
					<div class='divScroll' style='margin-left:12px;'>
						下载
					</div>
					<script>
						scrollTile("1_2-1", ["jQuery", "JSminPlus", "ACE editor", "Categorizr"], 2000, 0)
					</script> </a>
					<a  target='_blank' href='/download' class="tile tileImg group1 bottom endGroup" style="
					margin-top:200px; margin-left:1240px;
					width:145px; height:145px;
					background:#509601;"   data-pos='200-1240-145' > <img title='' alt='' src='img/v3.png' width="145" style='margin-left:-72.5px; margin-top: -72.5px; max-height:145px;'/>
					<div class='tileLabelWrapper bottom'>
						<div class='tileLabel bottom' style='border-bottom-color:#FFF;'>
							<span style='color:#11528f;'>预约查询</span>
						</div>
						<div class='imgDesc' style='display:none;'>
							预约查询模块
						</div>
					</div> </a>
					<a  href='/information' class="tile group2 align-center" style="
					margin-top:45px; margin-left:1550px;
					width:455px; height:145px;
					background:#FF8000;"  data-pos='45-1550-455' >
					<div style='line-height:30px;margin-top:40px;padding:5px;text-aling:center;'>
						<span style='font-size:60px;letter-spacing:0px;font-weight:300;'>个人信息</span>
						<div style='font-size:20px;letter-spacing:2px;font-weight:bold;'>
							& information
						</div>
					</div>
					<div class='tileLabelWrapper top' style='border-top-color:rgb(205, 88, 0);'>
						<div class='tileLabel top' >
							Get started or get further
						</div>
					</div> </a>
					<a  href='/forum' class="tile tileFlip horizontal group2 " style="
					margin-top:200px; margin-left:1550px;
					width:145px; height:145px;"  data-pos='200-1550-145' >
					<div class='flipContainer'>
						<div class='flipFront' style="background:#c82345;">
							<div class='flipImgCenterer'>
								<img src="img/forum.png" alt="" title="" style="
								width:103.5px;
								"/>
							</div>
						</div>
						<div class='flipBack' style="background:#c82345;">
							<h5><span style='font-size:22px;'>讨论组</span></h5>
						</div>

					</div> </a>
					<a  href='/labfeedback' class="tile tileFlip horizontal group2 " style="
					margin-top:200px; margin-left:1705px;
					width:145px; height:145px;"  data-pos='200-1705-145' >
					<div class='flipContainer'>
						<div class='flipFront' style="background:#dea317;">
							<div class='flipImgCenterer'>
								<img src="img/icons/mail.png" alt="" title="" style="
								width:103.5px;
								"/>
							</div>
						</div>
						<div class='flipBack' style="background:#dea317;">
							<h5><span style='font-size:22px;'>问卷调查</span></h5>
						</div>

					</div> </a>
					<a  class="tile tileMosaic group2 noClick" style="
					margin-top:200px; margin-left:1860px;
					width:146px; height:145px;
					background:#90D444;"  data-pos='200-1860-146' >
					<div id='f_container' class='f_container9'><img id='tileMosaic9_1' src='img/chars/a.png'><img id='tileMosaic9_2' src='img/chars/b.png'><img id='tileMosaic9_3' src='img/chars/c.png'><img id='tileMosaic9_4' src='img/chars/d.png'><img id='tileMosaic9_5' src='img/chars/e.png'><img id='tileMosaic9_6' src='img/chars/f.png'><img id='tileMosaic9_7' src='img/chars/g.png'><img id='tileMosaic9_8' src='img/chars/h.png'><img id='tileMosaic9_9' src='img/chars/i.png'>
					</div>
					<div id='b_container' class='b_container9'>
						<div id='tileMosaic9_1b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_2b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_3b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_4b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_5b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_6b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_7b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_8b'  style='background-image:url(img/chars/a_color.png)'></div><div id='tileMosaic9_9b'  style='background-image:url(img/chars/a_color.png)'></div>
					</div>
					<script>
						setTimeout(function() {
							tileMosaicFlip(10, 0, 9, []);
						}, 2000);
					</script> </a>
				</div>
				<div id="subNavWrapper"></div>
				<div id="contentWrapper" >
					<div id="content"></div>
				</div>
			</div>
			
		</div>
		<!--<div id="catchScroll"></div>
		<div id='panel' style='max-width:400px;right:-400px;background-color:#444;'>
			<img id='panelArrow' src='themes/theme_default/img/panels/arrow.png' onClick='javascript:hidePanel();' alt='hide panel'>
			<img id='panelLoader' src='themes/theme_default/img/panels/loader.gif' alt='Loading...'>
			<div id='panelContent'></div>
			<div class='preloadedPanel' id='panel_themes_php'>
				<h1>Themes</h1>
				<div class='sidebar sidebar-left' style='width:315px'>
					<a  target='_blank' href='demo/standard/' class="tile tileSlide up group0 demoBorder" style="
					margin-top:45px; margin-left:0px;
					width:300px; height:145px;
					background:#509601; padding:0;"  data-pos='45-0-300'  data-doslide="">
					<div class='slideText' style='
					height:36.25px; width:100%;bottom:0;    '>
						<div style='font-weight:300;font-size:24px;'>
							Default
						</div>
					</div>
					<div class="imageWrapper">
						<div class="imageCenterer" style="width:300px; height:145px;line-height:143px;">
							<img src='img/demos/std.png' alt="" title="" style="width:300px;" />
						</div>
					</div> </a>
					<a  target='_blank' href='demo/classic/' class="tile tileSlide up group0 demoBorder" style="
					margin-top:200px; margin-left:0px;
					width:300px; height:145px;
					background:#509601; "  data-pos='200-0-300'  data-doslide="">
					<div class='slideText' style='
					height:36.25px; width:100%;bottom:0;    '>
						<div style='font-weight:300;font-size:24px;'>
							Classic
						</div>
					</div>
					<div class="imageWrapper">
						<div class="imageCenterer" style="width:300px; height:145px;line-height:143px;">
							<img src='img/demos/classic.png' alt="" title="" style="width:300px;" />
						</div>
					</div> </a>
					<a  target='_blank' href='demo/tech/' class="tile tileSlide up group0 demoBorder" style="
					margin-top:355px; margin-left:0px;
					width:300px; height:145px;
					background:#509601; "  data-pos='355-0-300'  data-doslide="">
					<div class='slideText' style='
					height:36.25px; width:100%;bottom:0;    '>
						<div style='font-weight:300;font-size:24px;'>
							Tech
						</div>
					</div>
					<div class="imageWrapper">
						<div class="imageCenterer" style="width:300px; height:145px;line-height:143px;">
							<img src='img/demos/tech.png' alt="" title="" style="width:300px;" />
						</div>
					</div> </a>
					<a  target='_blank' href='demo/modernlight/' class="tile tileSlide up group0 demoBorder" style="
					margin-top:510px; margin-left:0px;
					width:300px; height:145px;
					background:#509601; "  data-pos='510-0-300'  data-doslide="">
					<div class='slideText' style='
					height:36.25px; width:100%;bottom:0;    '>
						<div style='font-weight:300;font-size:24px;'>
							Modern
						</div>
					</div>
					<div class="imageWrapper">
						<div class="imageCenterer" style="width:300px; height:145px;line-height:143px;">
							<img src='img/demos/modernlight.png' alt="" title="" style="width:300px;" />
						</div>
					</div> </a>
				</div>
				<style>
					#content {
						margin-left: 0px;
					}
					.sidebar-left {
						margin-left: 0px;
					}
				</style>
				<noscript>
					<style>
						.sidebar > * {
							position: relative;
							top: 0;
							margin: 5px !important;
							display: inline-block;
						}
					</style>
				</noscript>
				<script>
					/* Fix height of sidebar for layout */
					sbDown = 0;
					$("#content, #panelContent").children('.sidebar').children(".tile").each(function() {
						if ( typeof $(this).attr("href") != "undefined") {
							$(this).attr("href", $(this).attr("href").replace("?p=", "#!/"));
						}
						var thisDown = parseInt($(this).css("margin-top")) + $(this).height();
						if (thisDown > sbDown) {
							sbDown = thisDown;
						}
					});
					$('#contentWrapper, .sidebar').css("min-height", sbDown + 20 + "px");

					/* Responsive sidebar position */
					$.plugin($toColumn, {
						sidebarAfter : function() {
							$("#content").children(".sidebar").appendTo("#centerWrapper").css("top", 20).css("margin-left", 0);
						}
					});
					$.plugin($toSmall, {
						sidebarBefore : function() {
							$("#centerWrapper").children(".sidebar").prependTo("#content").css("top", 0).css("margin-left", $(".sidebar").css("width"));
						}
					});
					$.plugin($toFull, {
						sidebarBefore : function() {
							$toSmall.sidebarBefore();
						}
					});
					$.plugin($beforeSubPageShow, {
						checkSidebar : function() {
							switch($page.layout) {
								case "column":
									$toColumn.sidebarAfter();
									break;
								case "small":
									$toSmall.sidebarBefore();
									break;
								case "full":
									$toSmall.sidebarBefore();
									break;
							}
						}
					});
					$events.sidebarShow();
				</script>
		</div>-->
		</div>
	</body>
</html>
/*********************************************************/
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>liger ui的左侧tree的异步加载功能</title>
		
		<!--<script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>-->
		<link rel="stylesheet" type="text/css" href="js/ligerUI/skins/Aqua/css/ligerui-all.css">
		<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerTab.js" type="text/javascript"></script>
		<script src="js/ligerUI/lib/jquery.cookie.js"></script>
		<script src="js/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
		<!--<script src="js/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerAccordion.js" type="text/javascript"></script>
		<script src="js/ligerUI/js/plugins/ligerCheckBox.js"></script>
		<script src="js/ligerUI/js/plugins/ligerCheckBoxList.js"></script>
		<script src="js/ligerUI/js/plugins/ligerTree.js"></script>-->
		<script src="js/ligerUI/lib/json2.js"></script>
		<script type="text/javascript">
			var mytab;
			var tab = null;
			var accordion = null;
			//var tree = null;
			var tabItems = [];
			
			/*var indexdata = 
[
    { text: '基础',isexpand:false, children: [ 
		{url:"demos/base/resizable.htm",text:"改变大小"},
		{url:"demos/base/drag.htm",text:"拖动"},
		{url:"demos/base/drag2.htm",text:"拖动2"},
		{url:"demos/base/dragresizable.htm",text:"拖动并改变大小"},
		{url:"demos/base/tip.htm",text:"气泡"},
		{url:"demos/base/tip2.htm",text:"气泡2"}
	]
    },
    { text: '过滤器', isexpand: false, children: [
		{ url: "demos/filter/filter.htm", text: "自定义查询" },
		{ url: "demos/filter/filterwin.htm", text: "在窗口显示" },
		{ url: "demos/filter/grid.htm", text: "配合表格" } 
	]
    }, 
	{ text: '弹窗',isexpand:false, children: [ 
		{ url: "demos/dialog/dialogAll.htm", text: "弹出框" },
        { url: "demos/dialog/dialogParent.htm", text: "子窗口传参" },
		{url:"demos/dialog/dialogTarget.htm",text:"载入目标DIV"},
		{url:"demos/dialog/dialogUrl.htm",text:"窗口"}, 
		{url:"demos/dialog/tip.htm",text:"右下角的提示"}, 
		{url:"demos/dialog/window.htm",text:"可最小化"}
	]}]*/
			/*data.push({
				id : 3,
				pid : 1,
				text : '预习ppt'
			});
			data.push({
				id : 4,
				pid : 1,
				text : '实验演示视频'
			});
			data.push({
				id : 5,
				pid : 1,
				text : '测试'
			});
			data.push({
				id : 6,
				pid : 1,
				text : '预约'
			});
			data.push({
				id : 7,
				pid : 1,
				text : '实验讨论'
			});

			data.push({
				id : 1,
				pid : 0,
				text : '对象特性实验'
			});
			data.push({
				id : 2,
				pid : 0,
				text : '实验问卷调查'
			});*/
			
			

			$(function() {
				$("#layout1").ligerLayout({
					leftWidth : 190,
					height : '100%',
					heightDiff : -34,
					space : 4,
					onHeightChanged : f_heightChanged
				});
				
				
				var height = $(".l-layout-center").height();
				
				//Tab
				$("#framecenter").ligerTab({
					height : height,
					showSwitchInTab : true,
					showSwitch : true,
					onAfterAddTabItem : function(tabdata) {
						tabItems.push(tabdata);
						saveTabStatus();
					},
					onAfterRemoveTabItem : function(tabid) {
						for (var i = 0; i < tabItems.length; i++) {
							var o = tabItems[i];
							if (o.tabid == tabid) {
								tabItems.splice(i, 1);
								saveTabStatus();
								break;
							}
						}
					},
					onReload : function(tabdata) {
						var tabid = tabdata.tabid;
						addFrameSkinLink(tabid);
					}
				});

				$("#accordion1").ligerAccordion({
					height : height - 24,
					speed : null
				});
				
				$("#tree1").ligerTree({
					data:createdata("过程控制"),
					checkbox : false,
					slide:false,
					nodeWidth:300,
					
					//data:indexdata,
					//data:createdata1("jisuanji"),
					
					
				});
				$("#tree2").ligerTree({
					nodeWidth:300,
					data:createdata("计算机仿真技术"),
					//data:indexdata,
					//data:createdata1("jisuanji"),
					checkbox : false,
					slide:false,
					
				});
				$("#tree3").ligerTree({
					nodeWidth:300,
					data:createdata("微机原理"),
					//data:indexdata,
					//data:createdata1("jisuanji"),
					checkbox : false,
					slide:false,
					
				});
				$("#tree4").ligerTree({
					nodeWidth:300,
					data:createdata("电机与拖动"),
					//data:indexdata,
					//data:createdata1("jisuanji"),
					checkbox : false,
					slide:false,
					
				});
				
				//tab = liger.get("framecenter");
                //accordion = liger.get("accordion1");
                //tree = liger.get("tree1");
                
                function createdata1(e){
                	
                	
                	if(e=="过程控制"){
                		var indexdata = 
[
    { text: '基础',isexpand:false, children: [ 
		{url:"demos/base/resizable.htm",text:"改变大小"},
		{url:"demos/base/drag.htm",text:"拖动"},
		{url:"demos/base/drag2.htm",text:"拖动2"},
		{url:"demos/base/dragresizable.htm",text:"拖动并改变大小"},
		{url:"demos/base/tip.htm",text:"气泡"},
		{url:"demos/base/tip2.htm",text:"气泡2"}
	]
    },
    { text: '过滤器', isexpand: false, children: [
		{ url: "demos/filter/filter.htm", text: "自定义查询" },
		{ url: "demos/filter/filterwin.htm", text: "在窗口显示" },
		{ url: "demos/filter/grid.htm", text: "配合表格" } 
	]
    }, 
	{ text: '弹窗',isexpand:false, children: [ 
		{ url: "demos/dialog/dialogAll.htm", text: "弹出框" },
        { url: "demos/dialog/dialogParent.htm", text: "子窗口传参" },
		{url:"demos/dialog/dialogTarget.htm",text:"载入目标DIV"},
		{url:"demos/dialog/dialogUrl.htm",text:"窗口"}, 
		{url:"demos/dialog/tip.htm",text:"右下角的提示"}, 
		{url:"demos/dialog/window.htm",text:"可最小化"}
	]}]
                		
                	}
                	else{
                		var data={},temp=new Array();
                		 data["subexperimentname1"]="zheshiceshi1";
                		 data["subexperimentname2"]="zheshiceshi2";
                		 data["subexperimentname3"]="zheshiceshi3";
                		 data["subexperimentname4"]="zheshiceshi4";
                		 /*temp[0]={text:data["subexperimentname1"]};
                		 temp[1]={text:data["subexperimentname2"]};
                		 temp[2]={text:data["subexperimentname3"]};
                		 temp[3]={text:data["subexperimentname4"]};
                		 temp.push({text:data["subexperimentname1"]});
                		temp.push({text:data["subexperimentname2"]});
                		temp.push({text:data["subexperimentname3"]});
                		temp.push({text:data["subexperimentname4"]});
                		
                		 var temp1={text:"zheshiceshi1"};
                		var temp2={text:"zheshiceshi2"};
                		var temp3={text:"zheshiceshi3"};
                		var temp4={text:"zheshiceshi4"};
                		 var indexdata = 
[
    temp1,
    temp2,temp3,temp4]*/
                     var data1=[];
                     for(i=0;i<4;i++){
                     	temp[i]={text:data["subexperimentname1"]};
                     
                     	data1.push(temp[i])
                     	alert("temp"+i)
                     	alert("11")
                     }
                     //var indexdata=data1;
                	}
                	
	
	//return indexdata;
	return data1
                	
                }
                
              
				
				function createdata(e){	
				var newdata={},leftdata=new Array();
				var temp=new Array(),data1=[];	
				var chdata=[{url:"",text:"预习"},{url:"",text:"测试"},{url:"",text:"预约"},{url:"",text:"实验报告"}]	
				$.ajax({
					url:"/shiyandata",
					type:"POST",
					dataType:"json",
					async:false,
					data:{"name":e},
					success:function(data){
						//alert("请求实验内容数据成功")
						data=data["shiyandata1"]
						//alert("1")
						//var hasChildren = true;
						//alert(data.length)
						newdata=data;
						
						//var chdata=[{url:"",text:"预习"},{url:"",text:"测试"},{url:"",text:"预约"}，{url:"",text:"实验报告"}]
						
						
			
						/*var leftdata1=new Array(),leftdata2=new Array(),leftdata3=new Array(),leftdata4=new Array(),
							newdata1={},newdata2={},newdata3={},newdata4={};
						for(var i=0;i<data.length;i++){
							var a=data[i]["coursename"],b=data[i]["subexperimentname"];
							
							if(a=="过程控制"){
								alert(b)
								newdata1["text"]=b;
								newdata1["isexpend"]=false;
								//newdata1["children"]=[{},{}]
								leftdata1.push(newdata1);
								alert(leftdata1.length)
								
								
								
								
								//alert("过程控制")
								
								
							
						}else if(a=="计算机仿真技术"){
							    alert(b)
							    //var o={text:b}
							    //alert("计算机仿真技术")
							    newdata2["text"]=b;
								newdata2["isexpend"]=false;
								//newdata2["children"]=[{},{}]
								leftdata2.push(newdata2);
								alert(leftdata2.length)
							    
						}
						else if(a=="微机原理"){
							alert(b)
							    //var o={text:b}
							    //alert("微机原理")
							    newdata3["text"]=b;
								newdata3["isexpend"]=false;
								//newdata3["children"]=[{},{}]
								leftdata3.push(newdata3);
								alert(leftdata3.length)
							    
						}
						else if(a=="电机与拖动"){
							alert(b)
							//var o={text:b}
							    //alert("电机与拖动")
							    //alert("111")
							    newdata4["text"]=b;
								newdata4["isexpend"]=false;
								//newdata4["children"]=[{},{}]
								leftdata4.push(newdata4);
								alert(leftdata4.length)
							
						}
						
						   
							   
						}*/
						
						
						
					}
				
				})
				
			for(var i=0;i<newdata.length;i++){
							temp[i]={text:newdata[i]["subexperimentname"],isExpand:false,children:chdata};
							/*alert(newdata["text"])
							newdata["isexpand"]=false;
							leftdata.push(newdata);*/
						    data1.push(temp[i]);
							//alert(temp["text"])
							//a=leftdata.push(temp);
					
						}
						
		
			return  data1;		
			
			};
			


			})
			/*function f_load(e){
				alert("000")
				var data = createData(e);
				alert("111")
				var op = {
                isExpand:false,
                
            };  
            tree.set(op);
            tree.set('data', data);
            alert("222")
            tree.load(data)
			}*/
			function opentab(id, arg) {
				mytab.addTabItem({
					tabid : id,
					url : arg,
					text : "页面一"
				});
			}

			function f_heightChanged(options) {
				if (tab)
					tab.addHeight(options.diff);
				if (accordion && options.middleHeight - 24 > 0)
					accordion.setHeight(options.middleHeight - 24);
			}

			function f_addTab(tabid, text, url) {
				tab.addTabItem({
					tabid : tabid,
					text : text,
					url : url,
					callback : function() {
						addShowCodeBtn(tabid);
						addFrameSkinLink(tabid);
					}
				});
			}
		</script>
		<style type="text/css">
			body {
				padding: 0px;
				margin: 0;
				overflow: hidden;
			}
			.l-layout-top {
				background: #102A49;
				color: #000033
			}
			.l-topmenu-welcome {
				position: absolute;
				height: 24px;
				line-height: 24px;
				right: 30px;
				top: 2px;
				color: #070A0C;
			}
			.l-topmenu-welcome a {
				color: #E7E7E7;
				text-decoration: underline
			}
			.body-gray2014 #framecenter {
				margin-top: 3px;
			}
			.viewsourcelink {
				background: #B3D9F7;
				display: block;
				position: absolute;
				right: 10px;
				top: 3px;
				padding: 6px 4px;
				color: #333;
				text-decoration: underline;
			}
			.viewsourcelink-over {
				background: #81C0F2;
			}
			.l-topmenu-welcome label {
				color: white;
			}
			#skinSelect {
				margin-right: 6px;
			}

		</style>
	</head>

	<body style="padding:0px;background:#EAEEF5;">
		<div id="pageloading"></div>
		<div id="topmenu" class="l-topmenu" style="background-color:#000033">
			<img src="images/logo.png" width="66" height="66" style=" position:absolute;top:1%;left:5%;"/>
			<span style="color:#FFFF00; margin-left: 150px;width:94px;font-size:50px; font-style:italic">武汉理工大学过程控制实验室</span>
			<!--<div class="l-topmenu-welcome">
			<label> 皮肤切换：</label>
			<select id="skinSelect">
			<option value="aqua">默认</option>
			<option value="silvery">Silvery</option>
			<option value="gray">Gray</option>
			<option value="gray2014">Gray2014</option>
			</select>
			<a href="index.aspx" class="l-link2">服务器版本</a>
			<span class="space">|</span>
			<a href="https://me.alipay.com/daomi" class="l-link2" target="_blank">捐赠</a>
			<span class="space">|</span>
			<a href="http://bbs.ligerui.com" class="l-link2" target="_blank">论坛</a>
			</div>-->
			<div>
				<p align="right" style="margin-bottom:0;margin-top:6px">
					% user=session.get('user')
				</p>
			</div>
			<div class="l-topmenu-welcome">
				<a>姓名:{{user["username"]}}</a>
				<span class="space">|</span>
				<a href="/logout">安全退出</a>

			</div>
		</div>
		<div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; ">
			<div position="left" title="实验列表" id="accordion1" >
				<div title="过程控制" class="l-scroll">
					 <ul id="tree1" style="margin-top:3px;"></ul>
				</div>
				<div title="计算机仿真技术" class="l-scroll">
					<ul id="tree2" style="margin-top:3px;"></ul>
				</div>
				<div title="微机原理" class="l-scroll">
					<ul id="tree3" style="margin-top:3px;"></ul>
				</div>
				<div title="电机与拖动" class="l-scroll">
					<ul id="tree4" style="margin-top:3px;"></ul>
				</div>
				<div title="实验预约查询">
					
				</div>
				
			</div>
			<div position="center" id="framecenter">
				<div tabid="home" title="实验主页">
					<iframe frameborder="0" name="home" id="home" src="/zhuye"></iframe>
				</div>
			</div>
		</div>
		<div  style="height:32px; line-height:32px; text-align:center;">
			Copyright © 武汉理工大学自动化学院
		</div>
		<div style="display:none"></div>
	</body>
</html>
/*********************************************************/
<!DOCTYPE html>  
<html lang="en">
	<head>
		<title>实验预习部分代码</title>
		<meta charset="UTF-8" />
		<script src="js/jquery-2.0.3.min.js"></script>
		<script>
			function getquerystring(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return decodeURI(r[2]);
				return null;

			}

			//先取studentid，coursename,subexperimentname通过ajax传到后台
			
			%user = session.get("user")
			var studentid = '{{user["userid"]}}';
			var studentname='{{user["username"]}}'
			var couname = getquerystring("couname");
			//alert(couname)
			var subname = getquerystring("subname");
			var sta = true;

			$(function() {

				//alert(studentid)
				//先做一个检查，如果第一次点击预习，则在processbiao中填预习，不是第一次且预习未完成状态不变，若预习完成则调用存储过程改变状态。
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
							alert("继续进行预习")
							$("#button1").click(function() {
								if (sta == true) {
									var stytime = 20;
									alert("sta=false")
									if (stytime < 20) {
										alert("未达到规定预习时间请继续预习")
									} else {
										alert("准备提交")
										var action = 0;
										$.ajax({
											url : "/yuxibufen",
											type : "POST",
											dataType : "json",
											data : {
												studentid : studentid,
												couname : couname,
												subname : subname,
												action : action
											},
											success : function(data) {
												alert("1111")

											}
										})

									}
									//执行ajax
									sta = false;
								} else {
									alert("已完成预习部分111")
								}

							})
						} else {
							alert("您已完成预习部分")

						}
					}
				})

			})
			function btn1click(studentid, couname, subname) {
				

			}

			var isFinished = false;
			function btnclick() {
				alert("111")
				var a = 2;
				if (a == "1") {
					alert("false")
					//isFinished = false;

				} else {
					alert("true")
					//isFinished = true;
					$("#button2").attr("disabled", true)
				}
			}

		</script>

	</head>
	<body>

		<div class="wrapper">
			<p>
				这是上水箱特性实验预习页面tpl页面
			</p>
			<input type="button" id="button1" value="完成预习" />
			<input type="button" id="button2" value="测试按钮" onclick="btnclick();this.diabled='1'" />

		</div>
	</body>
</html>

/*********************************************************/
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>上水箱对象特性实验测试页面</title>
		<meta charset="UTF-8" />
		<script src="js/jquery-2.0.3.min.js"></script>
		<script>
			function getquerystring(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return decodeURI(r[2]);
				return null;

			}

			//先取studentid，coursename,subexperimentname通过ajax传到后台
			
			%user = session.get("user")
			var studentid = '{{user["userid"]}}';
			var studentname='{{user["username"]}}';
			//alert(studentname)
			var couname = getquerystring("couname");
			//alert(couname)
			var subname = getquerystring("subname");
			var sta = true;

			$(function() {

				//alert(studentid)
				//先做一个检查，如果第一次点击预习，则在processbiao中填预习，不是第一次且预习未完成状态不变，若预习完成则调用存储过程改变状态。
				$.ajax({
					url : "/ceshijiancha",
					type : "POST",
					dataType : "json",
					data : {
						studentid : studentid,
						studentname:studentname,
						couname : couname,
						subname : subname
					},
					success : function(data) {
						if (data["resul"] == "预习完成") {
							alert("继续进行测试")
							$("#button1").click(function() {
								if (sta == true) {
									var styscope = 80;
									alert("sta=false")
									if (styscope < 80) {
										alert("未达到规定测试分数，请继续测试")
									} else {
										alert("准备提交")
										var action = 0;
										$.ajax({
											url : "/ceshibufen",
											type : "POST",
											dataType : "json",
											data : {
												studentid : studentid,
												couname : couname,
												subname : subname,
												action : action
											},
											success : function(data) {
												alert("msg")

											}
										})

									}
									//执行ajax
									sta = false;
								} else {
									alert("已完成测试部分111")
								}

							})
						} 
						else if(data["resul"]=="预习"||data["resul"]==""){
							alert("请先完成预习部分")
							
						}
						else {
							alert("您已完成测试部分")

						}
					}
				})

			})
		
			
			

		</script>

	</head>
	<body>

		<div class="wrapper">
			<p>
				这是上水箱特性实验测试页面tpl页面
			</p>
			<input type="button" id="button1" value="完成测试" />
			

		</div>
	</body>
</html>

/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************//*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
/*********************************************************/
