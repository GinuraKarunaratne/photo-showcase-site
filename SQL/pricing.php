<?php
require '../PHPMailer-6.8.0/src/Exception.php';
require '../PHPMailer-6.8.0/src/PHPMailer.php';
require '../PHPMailer-6.8.0/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "lismoredb";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $firstName = $_POST["first-name"];
    $lastName = $_POST["last-name"];
    $email = $_POST["email"];
    $nicNumber = $_POST["nic-number"];
    $contactNumber = $_POST["contact-num"]; // Corrected form field name
    $eventType = $_POST["event-type"];
    
    $sql = "INSERT INTO pricing (firstName, lastName, email, nic, contactNum, type)
            VALUES ('$firstName', '$lastName', '$email', '$nicNumber', '$contactNumber', '$eventType')";


    $response = array();

    if ($conn->query($sql) === TRUE) {
        $response["success"] = true;
        $response["message"] = "Booking successful! Thank you.";

        // Send confirmation email using PHPMailer
        try {
            $mail = new PHPMailer(true);

            // Configure SMTP settings here
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
            $mail->Subject = 'Booking Confirmation';
            $mail->Body = "
                <html>
                <head>
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
                        <h1>Booking Confirmation</h1>
                    </div>
                    <div class='content'>
                        <p>Hello $firstName,</p>
                        <p>Thank you for booking with Lismore's Lens! Here are the details of your package:</p>
                        <ul>
                            <li><strong>First Name:</strong> $firstName</li>
                            <li><strong>Last Name:</strong> $lastName</li>
                            <li><strong>NIC Number:</strong> $nicNumber</li>
                            <li><strong>Contact Number:</strong> $contactNumber</li>
                            <li><strong>Event Type:</strong> $eventType</li>
                            <!-- Add more package details here -->
                        </ul>
                        <p>We look forward to capturing your special moments!</p>
                        <p>Best regards,<br>The Lismore's Lens Team</p>
                    </div>
                </body>
                </html>
            ";

            $mail->send();

            $response["emailSent"] = true;
        } catch (Exception $e) {
            $response["emailSent"] = false;
            $response["emailError"] = "Error sending email: {$mail->ErrorInfo}";
        }
    } else {
        $response["success"] = false;
        $response["message"] = "Error: " . $sql . "<br>" . $conn->error;
    }

    echo json_encode($response);

    $conn->close();
}
?>
