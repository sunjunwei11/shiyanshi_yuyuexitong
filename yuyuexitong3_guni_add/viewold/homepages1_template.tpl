<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <style type="text/css">
  body {background-color:#6CC}
  .title{color:#03C;font-size:28px;}
  .a{float:left;width:650px;height:300px;color:#F69;background:#9F9;}
  .b{float:right;width:650px;height:300px;color:#CF6;background:#F69;}
  .c{height:35px;color:#606;background:#FF9;}
  .d{height:35px;color:#606;background:#939;}
  .e{height:35px;color:#606;background:#03C;}
  .divFrame{width:1200px}
  .divFrame h3{padding: 5px;font-size:12px;border:solid 1px #ccc;background-color:#eee}
  .divFrame .divOpt{padding: 5px;border: solid 1px #ccc}
 
  </style>
  
  
  <title>实验室网页1</title>
  <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
  <script type="text/javascript" src="js/jquery-ui-1.10.4.js"></script>
  <script type="text/javascript" src="js-pub/jquery.ui.css"></script>
  <script type="text/javascript" src="js/jquery.ui.js"></script>
  <script type="text/javascript" src="js-pub/jquery.ui.accordion.js"></script>	
  <script type="text/javascript" src="js-pub/jquery.ui.core.js"></script>
  <script type="text/javascript" src="js-pub/jquery.ui.widget.js"></script>
 
  <script type="text/javascript">
  $(function(){
    $("#accordion").accordion({
    	
		});
	});
  </script>
</head>

<body>
<div id="mainwrapper">
  <div>
    <div id="headwrapper">
      <div style="background-image:url('/images/1.jpg');width:auto;height:150px;"><p class="title">武汉理工大学自动化实验室</p></div>
        
        <!--<img src="file:///D|/myWedFiles/pictures/3.jpg" alt="这是一种花卉" width="500" height="200"/>-->
    </div>
  <div>
</div>
</div>
  <div id="win7fenge" style="background:#FFF;height:300px;">
    <div class="a">zhe这是图片展示区</div>
    <div class="b">这是这是metro ui 瓷砖风格部</div>
  </div>
  <div class="divFrame">
   <div id="accordion">
    <h3><a herf="#">Section 1</a></h3>
    <div class="divOpt">
      <p>这是折叠效果框1</p>
    </div>
    <h3><a herf="#">Section 2</a></h3>
    <div>
      <div class="divOpt"><p>新闻二</p></div>
    </div>
    <h3><a herf="#">Section 3</a></h3>
    <div>
      <p>这是列表框</p>
      <ul>
      <li>list item one</li>
      <li>list item two</li>
      <li>list item three</li>
      </ul>
    </div>
   <h3><a herf="#">Section 4</a></h3>
    <div>
      <div class="divOpt"><p>这是折叠效果4</p></div>
      <div class="divOpt">新闻4</div>
    </div>
    
  </div>
  </div>
  <div id="dibu" style="background:#3FF;height:150px;">
  版权信息部分
  </div>

</div>

</body>
</html>
