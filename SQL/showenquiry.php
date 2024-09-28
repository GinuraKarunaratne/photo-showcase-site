<?php
// Database configuration
$host = 'localhost';
$dbName = 'lismoredb';
$username = 'root';
$password = '';

$conn = new mysqli($host, $username, $password, $dbName);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch all enquiries from the database
$sql = "SELECT * FROM enquiries ORDER BY event_date DESC"; // Orders by event_date in descending order
$result = $conn->query($sql);

$enquiries = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $enquiries[] = $row;
    }
}

$conn->close();

// Encode enquiries data as JSON and echo it
echo json_encode($enquiries);
?>
