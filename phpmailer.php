<?php

$to = 'info@bridesbutler.ca';
$subject = 'BridesButler.ca Contact Us Page';
	
	# process form
if (!empty($_POST)) {
	$message = "Name: ".$_POST['name']."\n";
	$message .= "Email: ".$_POST['email']."\n";
	$message .= "Daytime Phone: ".$_POST['dayphone']."\n";
	$message .= "Who Referred You: ".$_POST['referredfrom']."\n";
	$message .= "If Other: ".$_POST['other']."\n";

}
	
header('Location: http://bridesbutler.ca/about.html');	
	



?>