<?php
$DATABASE_HOST = 'localhost'; // Your database host (usually 'localhost')
$DATABASE_USER = 'root'; // Your database username
$DATABASE_PASS = ''; // Your database password
$DATABASE_NAME = 'lismoredb'; // Your database name

try {
    // Create a new PDO instance for database connection
    $pdo = new PDO(
        'mysql:host=' . $DATABASE_HOST . ';dbname=' . $DATABASE_NAME . ';charset=utf8',
        $DATABASE_USER,
        $DATABASE_PASS
    );
    // Set PDO attributes
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Query to select all images from the wildlifeimages table
    $stmt = $pdo->query('SELECT * FROM stphotoimages');
    $images = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Output the fetched images as JSON
    echo json_encode($images);
} catch (PDOException $exception) {
    // Log the error to a file for debugging
    error_log('Database error: ' . $exception->getMessage());
    exit('Failed to fetch images from database. Please check the server error logs.');
}
?>
