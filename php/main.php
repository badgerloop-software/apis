<?php

header('Access-Control-Allow-Origin: *');

/* this not actually doing anything? */
ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);
error_reporting(-1);

?>

<md-tabs md-dynamic-height md-stretch-tabs="always" md-center-tabs="true" style="padding-top:1em">
	<md-tab label="Member Data">
		<md-content md-whiteframe="9" class="pad">
			<?php require_once 'tiers.php'; ?><br><hr><br>
			<?php require_once 'members.php'; ?><br><hr><br>
			<?php require_once 'positions.php'; ?><br><hr><br>
			<?php require_once 'area.php'; ?><br><hr><br>
			<?php require_once 'team.php'; ?>
		</md-content>
	</md-tab>
	<md-tab label="Tab II">
		<md-content md-whiteframe="9" class="pad">
			Sample
		</md-content>
	</md-tab>
	<md-tab label="Tab III">
		<md-content md-whiteframe="9" class="pad">
			Sample
		</md-content>
	</md-tab>
</md-tabs>

