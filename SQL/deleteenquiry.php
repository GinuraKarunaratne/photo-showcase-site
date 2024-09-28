<?php
$host = 'localhost';
$dbName = 'lismoredb';
$username = 'root';
$password = '';

$conn = new mysqli($host, $username, $password, $dbName);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $enquiryId = $_POST["enquiryId"];

    $sql = "DELETE FROM enquiries WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $enquiryId);
    if ($stmt->execute()) {
        $response = array("success" => true);
        echo json_encode($response);
    } else {
        $response = array("success" => false);
        echo json_encode($response);
    }

    $stmt->close();
}

$conn->close();
?>
