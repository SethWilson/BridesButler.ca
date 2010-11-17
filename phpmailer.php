<?php

$to = 'info@bridesbutler.ca';
$subject = 'BridesButler.ca Contact Us Page';
	
	# process form
if (!empty($_POST)) {
	$message = "Name: ".$_POST['name']."\n";
	$message .= "Email: ".$_POST['email']."\n";
	$message .= "Daytime Phone: ".$_POST['dayphone']."\n";
	$message .= "Event Date: ".$_POST['event_date']."\n";
	$message .= "Event Type: ".$_POST['eventtype']."\n";
	$message .= "Who Referred You: ".$_POST['referredfrom']."\n";
	$message .= "If Other: ".$_POST['other']."\n";
	
		mail($to, $subject, $message);
}
	
header('Location: http://bridesbutler.ca/about.html');	
	



?>