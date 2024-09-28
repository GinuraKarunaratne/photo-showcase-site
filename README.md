# Lismore Photography Showcase Website

![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=flat&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=flat&logo=css3&logoColor=white) ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=flat&logo=javascript&logoColor=%23F7DF1E) ![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=flat&logo=php&logoColor=white) 

## Features
- **Homepage**: Overview of the website and easy navigation.
- **About Page**: Info about Malcolm and his photography.
- **Pricing Page**: Detailed service pricing.
- **Gallery**: Display of photography work.
- **Enquiry Form**: Allows users to submit booking inquiries.
- **Admin Panel**: Manage gallery and inquiries (admin access only).

## Admin Credentials
- **Email**: `admin123@gmail.com`
- **Password**: `admin123`

## Setup Instructions

### Prerequisites
Ensure you have the following installed:
- [XAMPP or WAMP](https://www.apachefriends.org/index.html) (Apache, PHP, MySQL)
- **.NET Desktop Runtime v6.0.33**  
  [Download here](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-6.0.33-windows-x64-installer?cid=getdotnetcore)

### Step 1: Install XAMPP/WAMP
Download and install [XAMPP](https://www.apachefriends.org/index.html) or [WAMP](https://www.wampserver.com/en/).

### Step 2: Clone the Repository
Clone the repository and move the files to the `htdocs` (XAMPP) or `www` (WAMP) folder:

```bash
git clone https://github.com/yourusername/photo-showcase-site.git
```

### Step 3: Import Database

1. Start Apache and MySQL from the control panel.
2. Open [http://localhost/phpmyadmin/](http://localhost/phpmyadmin/) in your browser.
3. Create a new database named `lismoredb`.
4. Import `lismoredb.sql` from the project folder using the **Import** tab.

### Step 4: Configure Database
Update `signup.php` and `login.php` with the following database connection details:

```php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "lismoredb";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
```

### Step 5: Run the Website

1. Start Apache and MySQL from the control panel.
2. Visit `http://localhost/photo-showcase-site/home.html` in your browser.
3. Access the admin panel at `http://localhost/photo-showcase-site/login.html`.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
