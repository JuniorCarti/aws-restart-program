<?php

// Function to get IMDSv2 token
function getIMDSToken() {
    $url = "http://169.254.169.254/latest/api/token";
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['X-aws-ec2-metadata-token-ttl-seconds: 21600']); // Token valid for 6 hours
    $token = curl_exec($ch);
    curl_close($ch);
    return $token;
}

// Fetch metadata using IMDSv2 token
function getMetaData($token, $path) {
    $urlRoot = "http://169.254.169.254/latest/meta-data/";
    $url = $urlRoot . $path;
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["X-aws-ec2-metadata-token: $token"]);
    $data = curl_exec($ch);
    curl_close($ch);
    return $data;
}

// Get IMDSv2 token
$token = getIMDSToken();

echo "<table class='table table-bordered'>";
echo "<tr><th>Meta-Data</th><th>Value</th></tr>";

// Instance ID
$instanceId = getMetaData($token, 'instance-id');
echo "<tr><td>InstanceId</td><td><i>" . htmlspecialchars($instanceId) . "</i></td><tr>";

// Availability Zone
$availabilityZone = getMetaData($token, 'placement/availability-zone');
echo "<tr><td>Availability Zone</td><td><i>" . htmlspecialchars($availabilityZone) . "</i></td><tr>";

echo "</table>";

?>
