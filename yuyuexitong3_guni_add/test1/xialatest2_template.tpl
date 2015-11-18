<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<script type="text/javascript" src="js-pub/jquery-ui.css"></script>
		<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="js/jquery-ui.js"></script>
		<link rel="stylesheet" href="css/style.css">
		<style type="text/css">
			#accordion {
				margin: auto;
			}
			.ui-accordion .ui-accordion-header {
				display: block;
				cursor: pointer;
				position: relative;
				margin-top: 2px;
				padding: .5em .5em .5em .7em;
				min-height: 0;
			}
			.ui-helper-reset {
				margin: 0;
				outline: 0;
				line-height: 1.3;
				text-decoration: none;
				font-size: 100%;
				list-style: none;
			}
			h3 {

				-webkit-margin-before: 1em;
				-webkit-margin-after: 1em;
				-webkit-margin-start: 0px;
				-webkit-margin-end: 0px;
			}
			.ui-accordion .ui-accordion-icons {
				padding-left: 2.2em;
			}
			.ui-widget {
				font-family: Verdana, Arial, sans-serif;
				font-size: 1.1em;
			}

			.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
				border: 1px solid #d3d3d3;
				background: #e6e6e6 url(images/ui-bg_glass_75_e6e6e6_1x400.png) 50% 50% repeat-x;
				font-weight: normal;
				color: #555555;
			}

			.ui-widget-content {
				border: 1px solid #aaaaaa;
				background: #ffffff url(images/ui-bg_flat_75_ffffff_40x100.png) 50% 50% repeat-x;
				color: #222222;
			}
		</style>

		<script>
			$(function() {
				$("#accordion").accordion({
					collapsible : true
				});
			});
		</script>
	</head>
	<body>
		<div id="accordion">
			<h3>Section 1</h3>
			<div>
				<p>
					Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
				</p>
			</div>
			<h3>Section 2</h3>
			<div>
				<p>
					Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
				</p>
			</div>
			<h3>Section 3</h3>
			<div>
				<p>
					Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
				</p>
				<ul>
					<li>
						List item one
					</li>
					<li>
						List item two
					</li>
					<li>
						List item three
					</li>
				</ul>
			</div>
			<h3>Section 4</h3>
			<div>
				<p>
					Cras dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia mauris vel est.
				</p>
				<p>
					Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
				</p>
			</div>
			<h3 class="ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-accordion-header-active ui-state-active ui-corner-top" role="tab" id="ui-accordion-accordion-header-0" aria-controls="ui-accordion-accordion-panel-0" aria-selected="true" aria-expanded="true" tabindex="0"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span> Section 5 </h3>
			<div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" id="ui-accordion-accordion-panel-0" aria-labelledby="ui-accordion-accordion-header-0" role="tabpanel" aria-hidden="false" style="display: block; height: 148px;">
				<p>
					Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
				</p>

			</div>

		</div>
	</body>
