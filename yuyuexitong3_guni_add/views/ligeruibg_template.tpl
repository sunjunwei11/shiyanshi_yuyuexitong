<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>表格</title>
		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/jquery.dataTables.min.js"></script>
		<link rel="stylesheet" href="css/jquery.dataTables.min.css" />
		
		<script>
		function filterGlobal () {
    $('#example').DataTable().search(
        $('#global_filter').val(),
        $('#global_regex').prop('checked'),
        $('#global_smart').prop('checked')
    ).draw();
}
 

 
$(document).ready(function() {
      var scoredata=[]
     %user = session.get("user")
	 var userid = '{{user["userid"]}}'; 
    $('#maingrid').DataTable( {
        "ajax":{
        "url": "/bg",
        "type": "POST",
        "data":{userid :userid},
        "datatype":"json",
        "cache":"false",
        "async":"false",
        "dataSrc": "resul_len"
        
        },
        "columns":[
            { "data": "studentid" },
            { "data": "studentname" },
            { "data": "coursename" },
            { "data": "experimentname" },
            { "data": "subexperimentname" },
            { "data": "date" },
            { "data": "startTime" },
            { "data": "xiakeTime" },
            { "data": "equipment" },
        ]
    } );
 
    $('input.global_filter').on( 'keyup click', function () {
        filterGlobal();
    } );
} );
		</script>
	</head>

	<body class="full desktop">
	<table id="maingrid" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>课程</th>
                <th>实验</th>
                <th>实验名称</th>
                <th>实验日期</th>
                <th>实验开始时间</th>
                <th>实验结束时间</th>
                <th>设备号</th>
            </tr>
        </thead>
    </table>
	</body>
</html>