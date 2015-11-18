<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />

		<link rel="stylesheet" type="text/css" href="js/Drop-Down Lists/css/style5.css" />
		<script src="js/Drop-Down Lists/js/modernizr.custom.63321.js"></script>
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="js/Drop-Down Lists/js/jquery.dropdown.js"></script>
		<style>
			.container {
				float: left;
				margin: auto;
				padding: 0px;
			}
			ul {
				margin: 0;
				padding: 0;
			}
			li {
				float: left;
				text-align: center;
			}
			ul{ list-style: none; }
		</style>
		<script type="text/javascript">
			$(function() {

				$('#cd-dropdown1').dropdown({
					gutter : 5,
					stack : false,
					slidingIn : 100
				});
				$('#cd-dropdown2').dropdown({
					gutter : 5,
					stack : false,
					slidingIn : 100
				});
				$('#cd-dropdown3').dropdown({
					gutter : 5,
					stack : false,
					slidingIn : 100
				});
				$('#cd-dropdown4').dropdown({
					gutter : 5,
					stack : false,
					slidingIn : 100
				});
				$('#cd-dropdown5').dropdown({
					gutter : 5,
					stack : false,
					slidingIn : 100
				});

			});

		</script>
	</head>
	<body>
		<div class="container">

			<section class="main clearfix">

				<div class="fleft">
					<ul>
						<li>
							<select id="cd-dropdown1" class="cd-select">
								<option value="-1" selected>过程控制实验</option>
								<option value="1" class="icon-chrome">Chrome</option>
								<option value="2" class="icon-safari">Safari</option>
								<option value="3" class="icon-IE">Internet Explorer</option>
								<option value="4" class="icon-firefox">Firefox</option>
								<option value="5" class="icon-opera">Opera</option>
							</select>
						</li>
						<li>
							<select id="cd-dropdown2" class="cd-select">
								<option value="-1" selected>电机拖动实验</option>
								<option value="1" class="icon-chrome">Chrome</option>
								<option value="2" class="icon-safari">Safari</option>
								<option value="3" class="icon-IE">Internet Explorer</option>
								<option value="4" class="icon-firefox">Firefox</option>
								<option value="5" class="icon-opera">Opera</option>
							</select>
						</li>
						<li>
							<select id="cd-dropdown3" class="cd-select">
								<option value="-1" selected>电机拖动实验</option>
								<option value="1" class="icon-chrome">Chrome</option>
								<option value="2" class="icon-safari">Safari</option>
								<option value="3" class="icon-IE">Internet Explorer</option>
								<option value="4" class="icon-firefox">Firefox</option>
								<option value="5" class="icon-opera">Opera</option>
							</select>
						</li>
						<li>
							<select id="cd-dropdown4" class="cd-select">
								<option value="-1" selected>电机拖动实验</option>
								<option value="1" class="icon-chrome">Chrome</option>
								<option value="2" class="icon-safari">Safari</option>
								<option value="3" class="icon-IE">Internet Explorer</option>
								<option value="4" class="icon-firefox">Firefox</option>
								<option value="5" class="icon-opera">Opera</option>
							</select>
						</li>
						<li>
							<select id="cd-dropdown5" class="cd-select">
								<option value="-1" selected>电机拖动实验</option>
								<option value="1" class="icon-chrome">Chrome</option>
								<option value="2" class="icon-safari">Safari</option>
								<option value="3" class="icon-IE">Internet Explorer</option>
								<option value="4" class="icon-firefox">Firefox</option>
								<option value="5" class="icon-opera">Opera</option>
							</select>
						</li>
					</ul>

				</div>
			</section>
			<!--<section class="main clearfix">

			<div class="fleft">
			<select id="cd-dropdown2" class="cd-select">
			<option value="-1" selected>电机拖动实验</option>
			<option value="1" class="icon-chrome">Chrome</option>
			<option value="2" class="icon-safari">Safari</option>
			<option value="3" class="icon-IE">Internet Explorer</option>
			<option value="4" class="icon-firefox">Firefox</option>
			<option value="5" class="icon-opera">Opera</option>
			</select>
			</div>
			</section>
			<section class="main clearfix">

			<div class="fleft">
			<select id="cd-dropdown3" class="cd-select">
			<option value="-1" selected>微机原理实验</option>
			<option value="1" class="icon-chrome">Chrome</option>
			<option value="2" class="icon-safari">Safari</option>
			<option value="3" class="icon-IE">Internet Explorer</option>
			<option value="4" class="icon-firefox">Firefox</option>
			<option value="5" class="icon-opera">Opera</option>
			</select>
			</div>
			</section>
			<section class="main clearfix">

			<div class="fleft">
			<select id="cd-dropdown4" class="cd-select">
			<option value="-1" selected>计算机仿真实验</option>
			<option value="1" class="icon-chrome">Chrome</option>
			<option value="2" class="icon-safari">Safari</option>
			<option value="3" class="icon-IE">Internet Explorer</option>
			<option value="4" class="icon-firefox">Firefox</option>
			<option value="5" class="icon-opera">Opera</option>
			</select>
			</div>
			</section>
			<section class="main clearfix">

			<div class="fleft">
			<select id="cd-dropdown5" class="cd-select">
			<option value="-1" selected>PLC实验</option>
			<option value="1" class="icon-chrome">Chrome</option>
			<option value="2" class="icon-safari">Safari</option>
			<option value="3" class="icon-IE">Internet Explorer</option>
			<option value="4" class="icon-firefox">Firefox</option>
			<option value="5" class="icon-opera">Opera</option>
			</select>
			</div>
			</section>-->
		</div><!-- /container -->

	</body>
</html>
