-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2024 at 01:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lismoredb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bwimages`
--

CREATE TABLE `bwimages` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `filepath` text DEFAULT NULL,
  `uploaded_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bwimages`
--

INSERT INTO `bwimages` (`id`, `title`, `description`, `filepath`, `uploaded_date`) VALUES
(1, 'penguin', 'Black and White Penguin', './bw/penguin.webp', '2023-08-13 14:53:45'),
(2, 'birds', 'Monochrome Birds', './bw/birds.webp', '2023-08-13 14:53:45'),
(3, 'girl', 'Black and White Portrait of a Girl', './bw/girl.webp', '2023-08-13 14:53:45'),
(4, 'dolphin', 'Monochrome Dolphin', './bw/dolphin.webp', '2023-08-13 14:53:45'),
(5, 'window', 'Black and White Window', './bw/window.webp', '2023-08-13 14:53:45'),
(6, 'fly', 'Monochrome Flying Insect', './bw/fly.webp', '2023-08-13 14:53:45'),
(7, 'kiss', 'Black and White Kiss', './bw/kiss.webp', '2023-08-13 14:53:45'),
(8, 'girl 2', 'Monochrome Portrait of Another Girl', './bw/girl 2.webp', '2023-08-13 14:53:45'),
(9, 'hallway', 'Black and White Hallway', './bw/hallway.webp', '2023-08-13 14:53:45'),
(10, 'car', 'Monochrome Car', './bw/car.webp', '2023-08-13 14:53:45'),
(11, 'mirror', 'Black and White Mirror', './bw/mirror.webp', '2023-08-13 14:53:45'),
(12, 'love', 'Monochrome Love', './bw/love.webp', '2023-08-13 14:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `firstName`, `lastName`, `email`, `password`, `country`) VALUES
(1, 'Idirimuni Ginura', 'Karunaratne', 'iamginurakarunaratne@gmail.com', '$2y$10$1rw', 'Sri Lanka'),
(2, 'Kavindu', 'Layan', 'kavindulayan24@gmail.com', '$2y$10$wCD', 'Sri Lanka'),
(3, 'Kavindu', 'Layan', 'kavindulayan24@gmail.com', '$2y$10$z.g', 'Sri Lanka'),
(4, 'Vinuka', 'Karunaratne', 'karunaratnevinuka@gmail.com', '$2y$10$KI9', 'Sri Lanka'),
(5, 'Azy', 'Boom', 'myuutwo69@gmail.com', '$2y$10$xIV', 'Sri Lanka'),
(6, '.', '.', 'nethminijayakody02@gmail.com', '$2y$10$7CW', 'Sri Lanka'),
(7, 'Rizzley', 'dot', 'anonhasley@gmail.com', '$2y$10$WVp', 'Sri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `event_duration` time NOT NULL,
  `event_date` date NOT NULL,
  `services` varchar(100) NOT NULL,
  `style` varchar(100) NOT NULL,
  `venue_restrictions` text DEFAULT NULL,
  `locations` text DEFAULT NULL,
  `image_delivery` varchar(100) NOT NULL,
  `budget` varchar(100) NOT NULL,
  `referral` varchar(100) NOT NULL,
  `contact_method` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `name`, `email`, `phone`, `nic`, `event_duration`, `event_date`, `services`, `style`, `venue_restrictions`, `locations`, `image_delivery`, `budget`, `referral`, `contact_method`) VALUES
(3, 'Vinuka Karunaratne', 'karunaratnevinuka@gmail.com', '0723044440', '20034838654', '02:30:00', '2023-10-15', 'posed', 'documentary', 'None', 'None', 'digital', '700', 'None', 'phone'),
(4, '', '', '', '', '00:00:00', '0000-00-00', '', '', '', '', '', '', '', ''),
(6, '', '', '', '', '00:00:00', '0000-00-00', '', '', '', '', '', '', '', ''),
(7, '', '', '', '', '00:00:00', '0000-00-00', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `landscapeimages`
--

CREATE TABLE `landscapeimages` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `filepath` text NOT NULL,
  `uploaded_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `landscapeimages`
--

INSERT INTO `landscapeimages` (`id`, `title`, `description`, `filepath`, `uploaded_date`) VALUES
(1, 'boat', 'Boat on the Water', './Landscape/boat.webp', '2023-08-13 14:45:10'),
(2, 'bridge', 'Bridge Over River', './Landscape/bridge.webp', '2023-08-13 14:45:10'),
(3, 'carve', 'Carved Rock Formation', './Landscape/carve.webp', '2023-08-13 14:45:10'),
(4, 'mountain', 'Majestic Mountain', './Landscape/mountain.webp', '2023-08-13 14:45:10'),
(5, 'nlights', 'Night Lights', './Landscape/nlights.webp', '2023-08-13 14:45:10'),
(6, 'river', 'Riverside View', './Landscape/river.webp', '2023-08-13 14:45:10'),
(7, 'rocks', 'Rocky Terrain', './Landscape/rocks.webp', '2023-08-13 14:45:10'),
(8, 'sunset', 'Spectacular Sunset', './Landscape/sunset.webp', '2023-08-13 14:45:10'),
(9, 'tent', 'Camping by the Tent', './Landscape/tent.webp', '2023-08-13 14:45:10'),
(10, 'tropic', 'Tropical Paradise', './Landscape/tropic.webp', '2023-08-13 14:45:10'),
(11, 'waterfall', 'Picturesque Waterfall', './Landscape/waterfall.webp', '2023-08-13 14:45:10'),
(12, 'winter', 'Winter Wonderland', './Landscape/winter.webp', '2023-08-13 14:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(20) NOT NULL,
  `subname` varchar(40) NOT NULL,
  `features` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `price`, `subname`, `features`) VALUES
(2, 'PORTRAITS', 500, 'PERSONALIZED PORTRAIT SESSIONS', '1-hour session\r\n10 high-resolution photos\r\nOnline gallery access\r\nPrint and digital release'),
(3, 'SPECIAL EVENTS', 599, 'PROFESSIONAL EVENT PHOTOGRAPHY SERVICES', '4 hours of coverage\r\n50 high-resolution photos\r\nOnline gallery access\r\nPrint and digital release'),
(5, 'WEDDINGS', 1999, 'WEDDING PHOTOGRAPHY PACKAGE', 'Full-day coverage\r\n500 high-resolution photos\r\nOnline gallery and album\r\nPrint and digital release'),
(8, 'Divorce', 420, 'Athareema', 'dwdwdwd');

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `nic` int(11) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `contactNum` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`id`, `firstName`, `lastName`, `nic`, `email`, `contactNum`, `type`) VALUES
(1, 'Idirimuni Ginura', 'Karunaratne', 2006804638, 'iamginurakarunaratne@gmail.com', 721983695, 0),
(2, 'Vinuka', 'Karunaratne', 2147483647, 'karunaratnevinuka@gmail.com', 723044440, 0),
(3, 'Idirimuni Ginura', 'Karunaratne', 2147483647, 'iamginurakarunaratne@gmail.com', 714374332, 0),
(4, 'Idirimuni Ginura', 'Karunaratne', 2147483647, 'iamginurakarunaratne@gmail.com', 714374332, 0),
(5, '.', '.', 755244867, 'nethminijayakody02@gmail.com', 0, 0),
(6, '.', '.', 780762152, 'nethminijayakody02@gmail.com', 0, 0),
(7, '.', '.', 724578532, 'nethminijayakody02@gmail.com', 0, 0),
(8, 'Idirimuni Ginura', 'Karunaratne', 2147483647, 'iamginurakarunaratne@gmail.com', 714374332, 0),
(9, 'Suwina', 'dwd', 52625622, 'suwinarashmika65@gmail.com', 5252562, 0),
(10, 'Rizzley', 'dot', 1122578812, 'anonhasley@gmail.com', 721852363, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stphotoimages`
--

CREATE TABLE `stphotoimages` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `filepath` text DEFAULT NULL,
  `uploaded_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stphotoimages`
--

INSERT INTO `stphotoimages` (`id`, `title`, `description`, `filepath`, `uploaded_date`) VALUES
(1, 'riding', 'Riding Through the Streets', './stphoto/riding.webp', '2023-08-13 14:50:05'),
(2, 'tokyo', 'Cityscape of Tokyo', './stphoto/tokyo.webp', '2023-08-13 14:50:05'),
(3, 'work', 'Busy at Work', './stphoto/work.webp', '2023-08-13 14:50:05'),
(4, 'crossing', 'Pedestrian Crossing', './stphoto/crossing.webp', '2023-08-13 14:50:05'),
(5, 'old', 'Old Architecture', './stphoto/old.webp', '2023-08-13 14:50:05'),
(6, 'lake', 'Tranquil Lake', './stphoto/lake.webp', '2023-08-13 14:50:05'),
(7, 'town', 'Charming Town', './stphoto/town.webp', '2023-08-13 14:50:05'),
(8, 'colours', 'Vibrant Colours', './stphoto/colours.webp', '2023-08-13 14:50:05'),
(9, 'street', 'Street View', './stphoto/street.webp', '2023-08-13 14:50:05'),
(10, 'chinatown', 'Chinatown Ambiance', './stphoto/chinatown.webp', '2023-08-13 14:50:05'),
(11, 'dog', 'Adorable Dog', './stphoto/dog.webp', '2023-08-13 14:50:05'),
(12, 'stairs', 'Staircase', './stphoto/stairs.webp', '2023-08-13 14:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `weddingimages`
--

CREATE TABLE `weddingimages` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `filepath` text DEFAULT NULL,
  `uploaded_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weddingimages`
--

INSERT INTO `weddingimages` (`id`, `title`, `description`, `filepath`, `uploaded_date`) VALUES
(1, 'setting 2', 'Wedding Setting', './Weddings/setting 2.webp', '2023-08-13 14:58:56'),
(2, 'flowe', 'Wedding Flowers', './Weddings/flowe.webp', '2023-08-13 14:58:56'),
(3, 'caps', 'Wedding Caps', './Weddings/caps.webp', '2023-08-13 14:58:56'),
(4, 'decos', 'Wedding Decorations', './Weddings/decos.webp', '2023-08-13 14:58:56'),
(5, 'happy', 'Happy Wedding', './Weddings/happy.webp', '2023-08-13 14:58:56'),
(6, 'bw', 'Black and White Wedding', './Weddings/bw.webp', '2023-08-13 14:58:56'),
(7, 'flowers', 'Wedding Flowers', './Weddings/flowers.webp', '2023-08-13 14:58:56'),
(8, 'happy 2', 'Joyful Wedding', './Weddings/happy 2.webp', '2023-08-13 14:58:56'),
(9, 'setting', 'Wedding Setting', './Weddings/setting.webp', '2023-08-13 14:58:56'),
(10, 'couple', 'Wedding Couple', './Weddings/couple.webp', '2023-08-13 14:58:56'),
(11, 'boat', 'Wedding on a Boat', './Weddings/boat.webp', '2023-08-13 14:58:56'),
(12, 'sakura', 'Sakura-Themed Wedding', './Weddings/sakura.webp', '2023-08-13 14:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `wildlifeimages`
--

CREATE TABLE `wildlifeimages` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `filepath` text NOT NULL,
  `uploaded_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wildlifeimages`
--

INSERT INTO `wildlifeimages` (`id`, `title`, `description`, `filepath`, `uploaded_date`) VALUES
(3, 'Deer', 'Deer', './Wildlife/fox.webp', '2023-08-13 14:15:23'),
(4, 'Goat', 'Goat', './Wildlife/goat.webp', '2023-08-13 14:16:20'),
(5, 'Dolphin', 'Dolphin', './Wildlife/dolphin.webp', '2023-08-13 14:16:41'),
(6, 'Penguin', 'Penguin', './Wildlife/pingu.webp', '2023-08-13 14:17:21'),
(7, 'Monkey', 'Monkey', './Wildlife/monkey.webp', '2023-08-13 14:17:41'),
(8, 'Tiger', 'Tiger', './Wildlife/tiger.webp', '2023-08-13 14:17:57'),
(9, 'Lion', 'Lion', './Wildlife/lion.webp', '2023-08-13 14:18:15'),
(10, 'Seal', 'Seal', './Wildlife/seal.webp', '2023-08-13 14:18:50'),
(11, 'Ostrich', 'Ostrich', './Wildlife/ostrich.webp', '2023-08-13 14:19:06'),
(12, 'Deer', 'Deer', './Wildlife/deer.webp', '2023-08-13 14:19:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bwimages`
--
ALTER TABLE `bwimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landscapeimages`
--
ALTER TABLE `landscapeimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stphotoimages`
--
ALTER TABLE `stphotoimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weddingimages`
--
ALTER TABLE `weddingimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wildlifeimages`
--
ALTER TABLE `wildlifeimages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bwimages`
--
ALTER TABLE `bwimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `landscapeimages`
--
ALTER TABLE `landscapeimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stphotoimages`
--
ALTER TABLE `stphotoimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `weddingimages`
--
ALTER TABLE `weddingimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wildlifeimages`
--
ALTER TABLE `wildlifeimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
