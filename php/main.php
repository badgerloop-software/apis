<?php

header('Access-Control-Allow-Origin: *');

ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);
error_reporting(-1);

$no_header = true;

?>

<md-tabs md-dynamic-height md-stretch-tabs="always" md-center-tabs="true" style="padding-top:1em">
	<md-tab label="Member Data">
		<md-content md-whiteframe="9" class="pad">
			<h2>Tiers</h2>
			<?php require_once 'tiers.php'; ?><br><hr><br>
			<h2>Members</h2>
			<?php require_once 'members.php'; ?><br><hr><br>
			<h2>Positions</h2>
			<?php require_once 'positions.php'; ?><br><hr><br>
			<h2>Areas</h2>
			<?php require_once 'area.php'; ?><br><hr><br>
			<h2>Team</h2>
			<?php require_once 'team.php'; ?>
			<h2>Sponsors</h2>
			<?php require_once 'sponsors.php'; ?>
		</md-content>
	</md-tab>
	<md-tab label="Tab II">
		<md-content md-whiteframe="9" class="pad">
			Test commit.
		</md-content>
	</md-tab>
	<md-tab label="Tab III">
		<md-content md-whiteframe="9" class="pad">
			Sample
		</md-content>
	</md-tab>
</md-tabs>
