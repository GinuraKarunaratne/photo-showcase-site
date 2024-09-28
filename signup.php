<?php
require 'PHPMailer-6.8.0/src/Exception.php';
require 'PHPMailer-6.8.0/src/PHPMailer.php';
require 'PHPMailer-6.8.0/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get form data
    $firstName = $_POST["firstname"];
    $lastName = $_POST["lastname"];
    $email = $_POST["email"];
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT); // Hash the password
    $country = $_POST["country"];

    // Database connection
    $servername = "localhost";
    $username = "root";
    $passwordDb = "";
    $dbname = "lismoredb";

    $conn = new mysqli($servername, $username, $passwordDb, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Insert data into the 'client' table
    $sql = "INSERT INTO client (firstname, lastname, email, password, country) VALUES ('$firstName', '$lastName', '$email', '$password', '$country')";

    if ($conn->query($sql) === TRUE) {
        // Data inserted successfully, send confirmation email using PHPMailer
        try {
            $mail = new PHPMailer(true);

            // Server settings
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com'; // SMTP server
            $mail->SMTPAuth = true;
            $mail->Username = 'myuutwo69@gmail.com'; // SMTP username (your Gmail address)
            $mail->Password = 'ddzrfcnvuffwcict'; // SMTP password (your Gmail password)
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Enable TLS encryption
            $mail->Port = 587; // TCP port to connect to

            // Recipients
            $mail->setFrom('myuutwo69@gmail.com', 'Lismore\'s Lens');
            $mail->addAddress($email); // Add recipient email address

            // Content
            $mail->isHTML(true);
            $mail->Subject = 'Account Created Successfully';
            $mail->Body = "
                <!DOCTYPE html>
                <html lang='en'>
                <head>
                    <meta charset='UTF-8'>
                    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
                    <style>
                        body {
                            font-family: Arial, sans-serif;
                            margin: 0;
                            padding: 20px;
                        }
                        .header {
                            background-color: #f7f7f7;
                            padding: 10px;
                        }
                        .content {
                            padding: 20px;
                            border: 1px solid #000;
                        }
                    </style>
                </head>
                <body>
                    <div class='header'>
                        <h1>Account Created Successfully</h1>
                    </div>
                    <div class='content'>
                        <p>Hello $firstName,</p>
                        <p>Thank you for creating an account with Lismore's Lens.</p>
                        <p>We're excited to have you as part of our community. With your new account, you'll have access to a variety of features and services that will help you capture and preserve your special moments.</p>
                        <p>If you have any questions or need assistance, feel free to reach out to our support team. We're here to help!</p>
                        <p>Best regards,<br>The Lismore's Lens Team</p>
                    </div>
                </body>
                </html>
            ";


            $mail->send();
            
            // Redirect to homepage after successful sign-up
            header("Location: home.html");
            exit();
        } catch (Exception $e) {
            echo "Error sending email: {$mail->ErrorInfo}";
        }
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>
