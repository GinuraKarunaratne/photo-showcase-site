<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "lismoredb";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$response = array("message" => "No action performed");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'];

    if ($action === 'add') {
        // Insert package
        $name = $_POST['name'];
        $price = $_POST['price'];
        $subname = $_POST['subname'];
        $features = $_POST['features'];

        $sql = "INSERT INTO packages (name, price, subname, features) VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sdss", $name, $price, $subname, $features);
    } elseif ($action === 'update') {
        // Update package
        $id = $_POST['id'];
        $name = $_POST['name'];
        $price = $_POST['price'];
        $subname = $_POST['subname'];
        $features = $_POST['features'];

        $sql = "UPDATE packages SET name = ?, price = ?, subname = ?, features = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssdsd", $name, $price, $subname, $features, $id);
    } elseif ($action === 'delete') {
        // Delete package
        $id = $_POST['id'];
        $sql = "DELETE FROM packages WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("d", $id);
    }

    if ($stmt->execute()) {
        $response = array("message" => "Operation successful");
    } else {
        $response = array("message" => "Error: " . $conn->error);
    }

    $stmt->close();
}

$conn->close();

header('Content-Type: application/json');
echo json_encode($response);
?>