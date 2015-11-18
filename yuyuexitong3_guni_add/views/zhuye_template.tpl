<!doctype html>


<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=1024" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <title>impress.js | presentation tool based on the power of CSS3 transforms and transitions in modern browsers | by Bartek Szopka @bartaz</title>
    
    <meta name="description" content="impress.js is a presentation tool based on the power of CSS3 transforms and transitions in modern browsers and inspired by the idea behind prezi.com." />
    <meta name="author" content="Bartek Szopka" />

    <!--<link href="http://fonts.googleapis.com/css?family=Open+Sans:regular,semibold,italic,italicsemibold|PT+Sans:400,700,400italic,700italic|PT+Serif:400,700,400italic,700italic" rel="stylesheet" />-->

  
    <link href="css/impress-demo.css" rel="stylesheet" />
    
    <link rel="shortcut icon" href="img/favicon.png" />
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png" />
</head>


<body class="impress-not-supported">


<div class="fallback-message">
    <p>Your browser <b>doesn't support the features required</b> by impress.js, so you are presented with a simplified version of this presentation.</p>
    <p>For the best experience please use the latest <b>Chrome</b>, <b>Safari</b> or <b>Firefox</b> browser.</p>
</div>


<div id="impress">
 <div id="overview" class="step" data-x="3000" data-y="1500" data-scale="10">
    </div>

 <div id="ing" class="step" data-x="0" data-y="0" data-scale="4">
        <p style="font-size:xxxx-large">欢迎</br>
		<b class="positioning" style="color:#CCFF00">来到</b></br>
		<b class="rotating" style="color:#990000">过程控制</b></br>
		<b class="scaling" style="color:#33CCFF">实验室</b> .</p>
    </div>
  
    

   
    <div id="its" class="step" data-x="850" data-y="3000" data-rotate="90" data-scale="5">
        <p>实验按照<strong style="color:#CCFF00">系统框图</strong> <br/>
        分为<br/>
        <strong style="color:#0000FF">四种类型</strong>的实验.</p>
    </div>

    <div id="big" class="step" data-x="3500" data-y="2100" data-rotate="180" data-scale="6">
        <p style="color:#330099">对象特性实验</br>
		<img src="img/1.jpg" width="300" height="300" align="center" ></p>
    </div>

    
    <div id="tiny" class="step" data-x="2825" data-y="2325" data-z="-3000" data-rotate="300" data-scale="1">
        <p style="color:#000000">单回路控制实验</br>
		<img src="img/2.jpg" width="300" height="300" align="center"></p>
    </div>
	
<div id="title" class="step" data-x="3500" data-y="-2000" data-rotate="270" data-scale="6">
        <p style="color:#CC0099">串级控制实验</br>
		<img src="img/3.jpg" width="300" height="300" align="center"></p>
    </div>
   

    <div id="imagination" class="step" data-x="6700" data-y="-300" data-scale="6">
        <p style="color:#33FF33">史密斯预估控制实验</br>
		<img src="img/4.jpg" width="300" height="300" align="center"></p>
    </div>

    <div id="source" class="step" data-x="6300" data-y="2000" data-rotate="20" data-scale="4">
        <p>对象特性实验包含</br>
		<b style="color:#00FF00">调节阀特性实验</b></br> 
		上水箱特性实验</br>
		<b style="color:#00CC99">下水箱特性实验</b>.</p>
       
    </div>
	
	<div id="bored" class="step slide" data-x="-1000" data-y="-1500">
        <p style="color:#FF66CC">串级控制实验包含</br>
		<b>流量单闭环实验</b></br> 
		液位单闭环实验</br>
		<b style="color:#00FF00">温度单闭环实验</b>锅炉不加盘管</br>
		温度单闭环实验，锅炉加盘管.</p>
    </div>
	
	<div class="step slide" data-x="0" data-y="-1500">
        <q>串级控制实验</br>
		<strong style="color:#FF0000">只有</strong> 一个实验<strong></br>
		不包含其他</strong>.</q>
    </div>
	
	 <div class="step slide" data-x="1000" data-y="-1500">
        <q>史密斯预估实验包含</br>
		<strong style="color:#CC0000">锅炉不加盘管，冷却管加水实验</strong></br> 
		和</br>
	    <strong style="color:#CCFF00">锅炉加盘管，冷却管不加水实验</strong> .</q>
    </div>


    <div id="one-more-thing" class="step" data-x="6000" data-y="4000" data-scale="2">
        <p>实验更多精彩内容...</p>
    </div>

   
    <div id="its-in-3d" class="step" data-x="6200" data-y="4300" data-z="-100" data-rotate-x="-40" data-rotate-y="10" data-scale="2">
        <p><span class="have">请</span> <span class="you">参见</span> <span class="noticed">网站</span> <span class="its">具体的</span> <span class="in">实验</span> <b>步骤<sup>等...</sup></b> </p>
        <span class="footnote">*</span>
    </div>

  
   
</div>

<div class="hint">
    <p>Use a spacebar or arrow keys to navigate</p>
</div>
<script>
if ("ontouchstart" in document.documentElement) { 
    document.querySelector(".hint").innerHTML = "<p>Tap on the left or right to navigate</p>";
}
</script>


<script src="js/impress.js"></script>
<script>impress().init();</script>


</body>
</html>

