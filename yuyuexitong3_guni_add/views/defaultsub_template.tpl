<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>jQuery UI Dialog - Modal form</title>
		<link rel="stylesheet" href="css/jquery-ui.css">
		<script src="js/jquery-1.10.2.js"></script>
		<script src="js/jquery-ui.js"></script>
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
	</head>
	<body>
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
	</body>
</html>
