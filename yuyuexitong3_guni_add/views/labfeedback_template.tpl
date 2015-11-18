<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script language="javascript" type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
		<link href="/js/jquery-ui-1.8.19.custom.css" rel="stylesheet" type="text/css" />
		<link href="/js/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
		<script  language="javascript" type="text/javascript" src="/js/jquery.validate.js"></script>
		<script  language="javascript" type="text/javascript" src="/js/jquery.validatemessages_cn.js"></script>
		<script  language="javascript" type="text/javascript"
		src="/js/jquery-ui-1.8.19.custom.min.js"></script>
		<script  language="javascript" type="text/javascript" src="/js/jquery.autocomplete.js"></script>
		<style>
			.s {
				align: center;
				width: 792px;
				border-style: solid;
				border-color: #A4CFD5;
			}
			.s1 {
				display: block;
				background-color: #A4CFD5;
			}
			#button1 {
				color: #fff;
				font-size: 18px;
				margin: 0 5px;
				padding: 5px 10px;
				border: 1px;
				border-style: solid;
				background-color: #209ece;
			}

			body {
				background-image: "img/bg.jpg";
			}
		</style>
		<script>
			//以下是问卷调查
			$(document).ready(function() {
				$.ajax({
					type : "POST",
					url : "/if_submitted",
					data : {},
					dataType : "json",
					async : false,
					success : function(data) {
						//alert()
						if (data["msg"] == 1) {
							$("#div1").replaceWith("<p>你已提交实验反馈！</p>")
						}
					}
				})

				$("#button1").click(function() {
					
					%user = session.get('user')
					//alert({{user["userid"]}})
					var userid = "{{user["userid"]}}";
					//alert(userid)
					var a = {};
					for (var i = 0; i < 7; i++) {

						if ($(".select").eq(i).val() == "") {
							
							alert("没有填完");
							break;
						} else {
							a[i] = $(".select").eq(i).val()
							//alert($(".select").eq(i).val())
						}
					}
					//alert(a)

					var diaochaqbiao = {}
					var neirong0 = $("#answer0").val();
					var neirong1 = $("#answer1").val();
					var neirong2 = $("#answer2").val();
					diaochaqbiao["userid"] = userid;
					diaochaqbiao["data"] = a;
					diaochaqbiao["neirong0"] = neirong0;
					alert(diaochaqbiao["neirong0"])
					diaochaqbiao["neirong1"] = neirong1;
					alert(diaochaqbiao["neirong1"])
					diaochaqbiao["neirong2"] = neirong2;
					$.ajax({
						type : "POST",
						url : "/getdiaochabiao",
						data : {
							diaochabiaodata : $.param(diaochaqbiao)
						},
						dataType : "json",
						async : false,
						success : function(data) {
							alert(data["msg"])
							$("#div1").replaceWith("<p>你已提交实验反馈！</p>")

						}
					})
				})
			})

		</script>
	</head>
	<body>
		<div class="div_question" id="div1">
			<div align="center">
				<table style="width:792px" height="213px" cellpadding="5" cellspacing="0" background="/img/1header.gif">
					<tr>
						<td align="center" style="font-size: 50px;font-weight: bold ">实验内容问卷调查</td>
					</tr>

				</table>
				<table style=" width: 792px" cellpadding="10px"  bgcolor="white">
					<tr>
						<td class="s">肯定回答为10分，否定回答为0分，中间1-9分表示肯定或否定的程度，数字越大表示肯定的程度越大否定的程度越小。例如第一题：如果是十分有收获则评分为10，有点收获到有收获可以再6-9区间内打分，不确定为5分，非常收获到基本没收获分值为1-4分，完全没收获则评分为0分，请同学们根据自己的真实感受打分，感谢你的参与！ </td>
					</tr>
				</table>
			</div>
			<div id="questions" align="center" >
				<table style="width: 792px" border="0px" cellpadding="5" cellspacing="0" bgcolor="white">
					<thead>

						</tr>
						<tr>
							<th></th>
							<td align="center">评分</td>
						</tr>
					</thead>
					<tbody>
						<tr align="left" rowindex="0">
							<th class="rowth" align="left" style="border-bottom: 1px solid #efefef;"><span id="question1" class="s1">Q1.以前对做专业实验的感受。（有收获/无收获）</span></th>
							<td align="center" style="border-bottom: 1px solid #efefef;">
							<select class="select">
                                <option value="" ></option>
								<option value="0" >0</option>
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
							</select></td>
						</tr>
						<tr align="left" rowindex="1">
							<th class="rowth" align="left" style="border-bottom: 1px solid #efefef;"><span id="question2">Q2.做实验前进行相关理论预习有无帮助？（有帮助/无帮助）</span></th>
							<td align="center" style="border-bottom: 1px solid #efefef;">
							<select class="select">
                                <option value="" ></option>
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
							</select></td>
						</tr>
						<tr align="left" rowindex="2">
							<th class="rowth" align="left" style="border-bottom: 1px solid #efefef;"><span id="question3" class="s1">Q3.做实验前了解相关实验设备接线有无必要？（有必要/无必要）</span></th>
							<td align="center" style="border-bottom: 1px solid #efefef;">
							<select class="select">
                                <option value="" ></option>
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
							</select></td>
						</tr>
						<tr align="left" rowindex="3">
							<th class="rowth" align="left" style="border-bottom: 1px solid #efefef;"><span id="question4">Q4.查阅相关设备的使用说明书有益吗？（有益/无益）</span></th>
							<td align="center" style="border-bottom: 1px solid #efefef;">
							<select class="select">
                                <option value="" ></option>
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
							</select></td>
						</tr>
						<tr align="left" rowindex="4">
							<th class="rowth" align="left" style="border-bottom: 1px solid #efefef;"><span id="question5" class="s1">Q5.以小组形式进行实验好不好？（好/不好）</span></th>
							<td align="center" style="border-bottom: 1px solid #efefef;">
							<select class="select">
								<option value="" ></option>
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
							</select></td>
						</tr>
						<tr align="left" rowindex="5">
							<th class="rowth" align="left" style="border-bottom: 1px solid #efefef;"><span id="question6">Q6.小组内就实验内容进行讨论有无必要？（有必要/无必要）</span></th>
							<td align="center" style="border-bottom: 1px solid #efefef;">
							<select class="select">
								<option value="" ></option>
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
							</select></td>
						</tr>
						<tr align="left" rowindex="6">
							<th class="rowth" align="left" style="border-bottom: 1px solid #efefef;"><span id="question7" class="s1">Q7.做实验前看设置接线图有无帮助？（有帮助/无帮助）</span></th>
							<td align="center" style="border-bottom: 1px solid #efefef;">
							<select class="select">
								<option value="" ></option>
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
							</select></td>
						</tr>

						<tr>
							<td><h4 rowindex="7" class="rowth" align="left" tyle="border-bottom: 1px solid #efefef;"><span id="question8">Q8.自己写软件说明书有何感受？（100字以内）</span></h4>							<textarea cols="100" rows="10" id="answer0" overflow="scroll"></textarea></td>
						</tr>
						<tr>
							<td><h4 rowindex="8" class="rowth" align="left" style="border-bottom: 1px solid #efefef;"><span id="question9" class="s1">Q9.感觉这次做实验有何异同，说说感受？（100字以内）</span></h4>							<textarea  align="center" cols="100" rows="10" id="answer1" overflow="scroll" ></textarea>
						</tr></td>
						<tr>
							<td><h4 rowindex="9" class="rowth" align="left" style="border-bottom: 1px solid #efefef;"><span id="question10">Q10.对实验还有何要求和期望。（100字以内）</span></h4>							<textarea cols="100" rows="10" id="answer2" overflow="scroll" text-align="center"></textarea>
						</tr></td>

					</tbody>

			</div>

			</table>
			<div align="center">

				<input type="button" class="submit" id="button1" value="提交">
				</button>

			</div>

		</div>

	</body>
</html>

