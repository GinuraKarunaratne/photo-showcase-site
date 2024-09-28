<?php
// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $adminEmail = "admin123@gmail.com";
    $adminPassword = "admin123";

    $submittedEmail = $_POST["email"];
    $submittedPassword = $_POST["password"];

    if ($submittedEmail == $adminEmail && $submittedPassword == $adminPassword) {
        // Successful login, redirect to home.html
        header("Location: adminpricing.html");
        exit;
    } else {
        $error = "Invalid email or password.";
    }
}
?>