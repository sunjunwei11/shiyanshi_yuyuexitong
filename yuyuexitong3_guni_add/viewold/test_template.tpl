<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>jQuery UI Dialog - Modal form</title>
		<link rel="stylesheet" href="js/jquery-ui-1.11.0-beta.2/jquery-ui.css">
		<script src="js/jquery-1.11.0-beta2.js"></script>
		<script src="js/jquery-ui-1.11.0-beta.2/jquery-ui.js"></script>
		<link rel="stylesheet" href="css/style.css">
		<style>
			body {
				font-size: 62.5%;
			}
			label, input {
				display: block;
			}
			input.text {
				margin-bottom: 12px;
				width: 95%;
				padding: .4em;
			}
			fieldset {
				padding: 0;
				border: 0;
				margin-top: 25px;
			}
			h1 {
				font-size: 1.2em;
				margin: .6em 0;
			}
			div#users-contain {
				width: 350px;
				margin: 20px 0;
			}
			div#users-contain table {
				margin: 1em 0;
				border-collapse: collapse;
				width: 100%;
			}
			div#users-contain table td, div#users-contain table th {
				border: 1px solid #eee;
				padding: .6em 10px;
				text-align: left;
			}
			.ui-dialog .ui-state-error {
				padding: .3em;
			}
			.validateTips {
				border: 1px solid transparent;
				padding: 0.3em;
			}
		</style>
		<script>
						$(function(){

			var name = $("#name"), email = $("#email"), password = $("#password"), allFields = $([]).add(name).add(email).add(password), tips = $(".validateTips");

			$("#dialog-form").dialog({
			autoOpen : false,
			height : 300,
			width : 350,
			modal : true,
			buttons : {

			Ok : function() {
			alert("111")

			//window.location.href = "/defaultsub"
			alert("777")
			$("#users tbody").append("<tr>" + "<td>" + name.val() + "</td>" + "<td>" + email.val() + "</td>" + "<td>" + password.val() + "</td>" + "</tr>");
			alert("333")

			alert(name.val())
			alert("444")

			userid=name.val()
			password=password.val()

			$.ajax({
			url:"/resign",
			type:"post",
			data:{userid:userid,
			password:password},
			datatype:"json",
			async:false,
			success:function(data){
			if (data["meg"]){

			name.val(userid)
			password.val("")
			
			}
			else{
				alert("hehehe")
			window.location.href="/defaultsub"}
			alert("hehehe2")

			}

			})
			

		

		$(this).dialog("close");

		}
		 },
		});

		$("#create-user").button().click(function() {
		$("#dialog-form").dialog("open");
		});
		});
		</script>
	</head>
	<body>
		<div id="dialog-form" title="Create new user">

			<form>
				<fieldset>
					<label for="name">Name</label>
					<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all">
					<label for="email">Email</label>
					<input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all">
					<label for="password">Password</label>
					<input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all">
				</fieldset>
			</form>
		</div>
		<div id="users-contain" class="ui-widget">
			<h1>Existing Users:</h1>
			<table id="users" class="ui-widget ui-widget-content">
				<thead>
					<tr class="ui-widget-header ">
						<th>Name</th>
						<th>Email</th>
						<th>Password</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>John Doe</td>
						<td>john.doe@example.com</td>
						<td>johndoe1</td>
					</tr>
				</tbody>
			</table>
		</div>

		<button id="create-user">
			Create new user
		</button>

	</body>
</html>