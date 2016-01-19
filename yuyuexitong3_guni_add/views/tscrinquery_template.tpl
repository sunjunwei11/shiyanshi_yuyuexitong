<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="utf-8">
		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/jquery.dataTables.min.js"></script>
		<link rel="stylesheet" href="css/jquery.dataTables.min.css">

		<script>
			function filterGlobal () {
    $('#example').DataTable().search(
        $('#global_filter').val(),
        $('#global_regex').prop('checked'),
        $('#global_smart').prop('checked')
    ).draw();
}
 

 
$(document).ready(function() {
    %user = session.get("user")
    var userid = '{{user["userid"]}}';
    var position='{{user["position"]}}'
       //alert(userid)
       var scoredata=[]
      
    $('#ceshiscore').DataTable( {
        "ajax":{
        "url": "/ceshiscore",
        "data":{userid:userid,
               position:position},
        "type": "POST",
        "datatype":"json",
        "dataSrc": "scoredata"
        
        },
        "columns":[
            { "data": "studentid" },
            { "data": "studentname" },
            { "data": "coursename" },
            { "data": "subexperimentname" },
            { "data": "score" },
            { "data": "class" }
        ]
    } );
 
    $('input.global_filter').on( 'keyup click', function () {
        filterGlobal();
    } );
} );
</script>
	</head>
	<body class="full desktop">
	<table id="ceshiscore" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>课程</th>
                <th>实验名称</th>
                <th>实验成绩</th>
                <th>班级</th>
            </tr>
        </thead>
    </table>
	</body>
</html>