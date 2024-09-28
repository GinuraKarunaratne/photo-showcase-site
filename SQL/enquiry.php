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

    $name = $_POST["name"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $nic = $_POST["nic"];
    $eventDuration = $_POST["event-duration"];
    $eventDate = $_POST["event-date"];
    $services = $_POST["services"];
    $style = $_POST["style"];
    $venueRestrictions = $_POST["venue-restrictions"];
    $locations = $_POST["locations"];
    $imageDelivery = $_POST["image-delivery"];
    $budget = $_POST["budget"];
    $referral = $_POST["referral"];
    $contactMethod = $_POST["contact-method"];

    $sql = "INSERT INTO enquiries (`name`, `email`, `phone`, `nic`, `event_duration`, `event_date`, `services`, `style`, `venue_restrictions`, `locations`, `image_delivery`, `budget`, `referral`, `contact_method`)
    VALUES ('$name', '$email', '$phone', '$nic', '$eventDuration', '$eventDate', '$services', '$style', '$venueRestrictions', '$locations', '$imageDelivery', '$budget', '$referral', '$contactMethod')";

    $response = array();

    if ($conn->query($sql) === TRUE) {
        $response["success"] = true;
        $response["message"] = "Enquiry successfully submitted! Thank you.";

        // Send confirmation email using PHPMailer
        try {
            $mail = new PHPMailer(true);

            // Configure SMTP settings here
            $mail->isSMTP();
            $mail->Host = 'smtp.example.com'; // Your SMTP server
            $mail->SMTPAuth = true;
            $mail->Username = 'myuutwo69@gmail.com'; // SMTP username
            $mail->Password = 'ddzrfcnvuffwcict'; // SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Enable TLS encryption
            $mail->Port = 587; // TCP port to connect to

            // Recipients
            $mail->setFrom('myuutwo69@gmail.com', 'Lismore\'s Lens');
            $mail->addAddress($email); // Add recipient email address

            // Content
            $mail->isHTML(true);
            $mail->Subject = 'Enquiry Confirmation';
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
                        ul {
                            list-style-type: none;
                            padding-left: 0;
                        }
                        li {
                            margin-bottom: 10px;
                        }
                        strong {
                            font-weight: bold;
                        }
                    </style>
                </head>
                <body>
                    <div class='header'>
                        <h1>Your Enquiry with Lismore's Lens</h1>
                    </div>
                    <div class='content'>
                        <p>Hello $name,</p>
                        <p>Thank you for your enquiry with Lismore's Lens! Here are the details:</p>
                        <ul>
                            <li><strong>Name:</strong> $name</li>
                            <li><strong>Email:</strong> $email</li>
                            <li><strong>Phone:</strong> $phone</li>
                            <li><strong>NIC:</strong> $nic</li>
                            <li><strong>Event Duration:</strong> $eventDuration</li>
                            <li><strong>Event Date:</strong> $eventDate</li>
                            <li><strong>Services:</strong> $services</li>
                            <li><strong>Style:</strong> $style</li>
                            <li><strong>Venue Restrictions:</strong> $venueRestrictions</li>
                            <li><strong>Locations:</strong> $locations</li>
                            <li><strong>Image Delivery:</strong> $imageDelivery</li>
                            <li><strong>Budget:</strong> $budget</li>
                            <li><strong>Referral:</strong> $referral</li>
                            <li><strong>Contact Method:</strong> $contactMethod</li>
                        </ul>
                        <p>We will get back to you soon with more details.</p>
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