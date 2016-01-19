<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>下载文件</title>
<style>
a {
	display:block;
	margin-top:30px;
	margin-bottom:30px;
	width:250px;
	height:50px;
	background-color:#C0C2C3;
	font-size:20px;
	}
li{
	list-style:none;
	text-align:left;
	margin-left:15px;
	padding-top:9px;
	}
</style>
</head>

<body style="background-color:#D4CDD4;">
<div style="height:60px;background-color:#74739A;;color:white;font-size:36px;text-align:center; padding-top:20px;">文件下载系统</div>
<div style="height:40px;background-color:#D9D7DA;color:#803D3D;font-size:18px;text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;file download system</div>

% i = int(file_number/8)
% yushu = file_number%8
% for k in range(i):
<div style="width=350px;float:left;">
     <ul>
         %for t in range(8):
         <a href="/download/{{file_lists[8*k+t]}}"><li>{{file_lists[8*k+t]}}</li></a>   
         %end
     </ul>
</div>
%end
<div style="width=350px;float:left;">
     <ul>
         %for s in range(yushu):
         <a href="/download/{{file_lists[8*i+s]}}"><li>{{file_lists[8*i+s]}}</li></a>   
         %end
     </ul>
</div>




</body>
</html>
