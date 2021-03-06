<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Badgerloop APIs</title>
		<meta charset="UTF-8">
		<meta name="description" content="Hyperloop Pod Competition Team Website">
		<meta name="author" content="Badgerloop Software Team">
		<meta name="keywords" content="BadgerLoop, Wisconsin, Madison, Badgers, Hyperloop, SpaceX, Tesla, Elon Musk, Train"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- favicons -->
		<link rel="favicon" href="im/favicon.png">
		<link rel="shortcut icon" href="im/favicon.png">
		<link rel="apple-touch-icon" sizes="any" href="im/favicon.png">

		<!-- fonts -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Montserrat" rel="stylesheet" />

		<!-- CSS Dependencies -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.1.1/angular-material.min.css" rel="stylesheet" />

		<!-- Custom CSS -->
		<link rel="stylesheet" href="css/main.css" />
	</head>

	<body ng-app="badgerloop-apis">
		<div layout="column" id="main_container" ng-cloak>
			<badgerloop-navbar></badgerloop-navbar>
			<div flex="grow" layout="column" id="ng-view-parent">
				<hr md-colors="{borderColor: 'primary-900', backgroundColor: 'primary-900'}">
				<div flex="grow" id="ng-view-container" ng-view>
					<?php include 'php/main.php'; ?>
				</div>
				<hr md-colors="{borderColor: 'primary-900', backgroundColor: 'primary-900'}">
			</div>
			<badgerloop-footer></badgerloop-footer>
		</div>
	</body>

	<!-- Javascript Dependencies -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-aria.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.8/angular-animate.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-messages/1.5.8/angular-messages.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angular_material/1.1.1/angular-material.min.js"></script>

	<!-- Application Setup -->
	<script src="js/main.js"></script>
	<script src="js/directives.js"></script>

	<!-- View Controllers -->
	<script src="js/controllers/home.js"></script>
</html>

