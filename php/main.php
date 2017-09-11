<?php
ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);
error_reporting(-1);
include 'database.php';
?>
<md-tabs md-dynamic-height md-stretch-tabs="always" md-center-tabs="true" style="padding-top:1em">
	<md-tab label="Member Data">
		<md-content md-whiteframe="9" class="pad">
			<?php include 'members.php'; ?>
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

