<body>
    <?php

    $servername = "localhost";
    $username = "root";
    $password = "";

    //create db
    $con = new mysqli($servername, $username, $password);

    //check con
    if($con-> connect_error){
        die("Connection Failed: "). $con-> connect_error;
    }
    echo "Connected Succesfully"

    ?>
</body>