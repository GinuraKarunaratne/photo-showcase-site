<?php
$db_host = 'localhost';
$db_user = 'root';
$db_pass = '';
$db_name = 'lismoredb';

$conn = new mysqli($db_host, $db_user, $db_pass, $db_name);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['add'])) {
    $title = $_POST['title'];
    $description = $_POST['description'];
    $filepath = $_POST['filepath'];

    $sql = "INSERT INTO wildlifeimages (title, description, filepath) VALUES ('$title', '$description', '$filepath')";
    if ($conn->query($sql) === TRUE) {
        echo "Image added successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

if (isset($_POST['delete'])) {
    $titleToDelete = $_POST['delete_title'];

    $sql = "DELETE FROM wildlifeimages WHERE title='$titleToDelete'";
    if ($conn->query($sql) === TRUE) {
        echo "Image deleted successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://fonts.googleapis.com/css2?family=Comfortaa&display=swap"
            rel="stylesheet" />
        <link
            href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap"
            rel="stylesheet" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer" />
        <link rel="stylesheet" type="text/css" href="admingallery.css"/>
        <title>Gallery</title>
    </head>
    <body>
        <div class="head">
            <h1>Wildlife</h1>
        </div>
        <nav class="navbar9">
            <ul>
                <li><a href="adminwildlife.php">Wildlife</a></li>
                <li><a href="adminlandscape.php">Landscape</a></li>
                <li><a href="adminstphoto.php">S.T Photography</a></li>
                <li><a href="adminbw.php">B & W</a></li>
                <li><a href="adminwedding.php">Wedding</a></li>
                <li class="log"><a href="../home.html">Client view</a></li>
            </ul>
        </nav>

        <div class="container5">
        <form method="post">
            <input type="text" name="title" placeholder="Title" required>
            <input type="text" name="description" placeholder="Description" required>
            <input type="text" name="filepath" placeholder="Filepath" required>
            <button type="submit" name="add">Add Image</button>
        </form>

        <form method="post">
            <input type="text" name="delete_title" placeholder="Title to Delete" required>
            <button type="submit" name="delete">Delete Image</button>
        </form>
        </div>

    </body>
</html>
