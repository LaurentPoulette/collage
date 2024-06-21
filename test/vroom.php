<?php
$content=file_get_contents('vroom2.json');
$url="http://solver.vroom-project.org/";
$ch = curl_init( $url );
# Setup request to send json via POST.
//$payload = json_encode( array( "customer"=> $data ) );
$payload=$content;
curl_setopt( $ch, CURLOPT_POSTFIELDS, $payload );
curl_setopt( $ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
# Return response instead of printing.
curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
# Send request.
$result = curl_exec($ch);
curl_close($ch);
# Print response.
echo "<pre>$result</pre>";
?>