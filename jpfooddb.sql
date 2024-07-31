-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2024 at 02:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jpfooddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `image`, `status`) VALUES
(19, 'SuShi', 'sushi.jpg', 1),
(20, 'Sashimi', 'sashimi.jpg', 1),
(22, 'Ramen', 'ramen.jpg', 1),
(23, 'Tempura', 'Tempura.jpg', 1),
(24, 'Yakitori', 'yakitori.jpg', 1),
(25, 'Donburi', 'donburi.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 ẩn 1 hiện',
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `date`, `status`, `user_id`, `product_id`) VALUES
(10, 'Hello, sản phẩm này rất tốt!!!', '2024-06-25 17:02:36', 1, 8, 34);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetails_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(98, 49, 38, 1, 12890000),
(99, 50, 37, 1, 14390000),
(100, 51, 37, 1, 14390000),
(101, 52, 40, 1, 10990000),
(102, 52, 41, 2, 16490000),
(103, 53, 40, 1, 10990000),
(104, 54, 40, 2, 10990000),
(105, 55, 51, 1, 140000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `total`, `address`, `phone`, `note`, `status`) VALUES
(49, 8, '2024-06-25 13:35:20', 12890000, 'Cần Thơ', '0336216559', '', 1),
(50, 8, '2024-06-25 13:36:28', 14390000, 'Hai Phong', '0973636322', '', 1),
(51, 8, '2024-06-25 13:36:31', 14390000, 'Hai Phong', '0973636322', '', 4),
(52, 8, '2024-06-25 16:54:08', 43970000, 'Quốc Oai', '0829936692', 'Quốc Oai', 1),
(53, 8, '2024-06-25 16:55:16', 10990000, 'Quốc Oai', '0829936692', 'Quốc Oai', 3),
(54, 8, '2024-06-27 14:52:10', 21980000, 'Phú Thọ', '0966979662', 'Ok', 1),
(55, 16, '2024-07-09 19:35:33', 140000, 'Thai Nguyen', '0842500198', 'giao nhanh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `category_id`, `title`, `image`, `author`, `content`, `views`, `status`, `created_at`, `updated_at`) VALUES
(13, 2, 'Đồ ăn Nhật ngon tại Hà Nội', '438197511_2112230992492342_5139834510169953804_n.jpg', 'Thái Việt Hoàn', '<p>HTML, CSS, JS</p>', 0, 1, '2024-07-09 19:41:11', '2024-07-09 19:41:11');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`) VALUES
(1, 'Chưa có chuyên mục'),
(2, 'Tác giả nổi tiếng'),
(9, 'Giới thiệu sách');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL DEFAULT 0,
  `details` text NOT NULL,
  `short_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `price`, `sale_price`, `create_date`, `views`, `details`, `short_description`, `status`) VALUES
(34, 19, 'Nigiri Sushi', 'nigiri-sushi.jpg', 10, 200000, 179000, '2024-07-09 12:56:23', 10, '<h2>Hình ảnh</h2><p><img src=\"./upload/nigiri-sushi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/nigiri-sushi-2.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Cá</td></tr><tr><td>Khối lượng</td><td>200gram</td></tr></tbody></table></figure>', 1),
(35, 19, 'Maki Sushi', 'maki-sushi.jpg', 20, 150000, 130000, '2024-06-25 13:06:38', 5, '<h2>Hình ảnh</h2><p><img src=\"./upload/maki-sushi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/maki-sushi-2.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Cá, rong biển</td></tr><tr><td>Khối lượng</td><td>200gram</td></tr></tbody></table></figure>', 1),
(36, 19, 'Sashimi Sushi', 'sashimi-sushi.jpg', 20, 250000, 199000, '2024-06-25 13:09:29', 1, '<h2>Hình ảnh</h2><p><img src=\"./upload/sashimi-sushi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/sashimi-sushi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Cá</td></tr><tr><td>Khối lượng</td><td>300gram</td></tr></tbody></table></figure>', 1),
(37, 19, 'Sushi-Trứng cá hồi', 'sushi-trungcahoi.jpg', 23, 300000, 250000, '2024-06-25 13:12:10', 1, '<h2>Hình ảnh</h2><p><img src=\"./upload/sushi-trungcahoi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/sushi-trungcahoi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Trứng cá hồi</td></tr><tr><td>Khối lượng</td><td>200gram</td></tr></tbody></table></figure>', 1),
(38, 20, 'Maguro Sashimi', 'maguro-sashimi.jpg', 22, 170000, 149000, '2024-06-25 13:14:11', 2, '<h2>Hình ảnh</h2><p><img src=\"./upload/maguro-sashimi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/maguro-sashimi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Cá ngừ</td></tr><tr><td>Khối lượng</td><td>400gram</td></tr></tbody></table></figure>', 1),
(39, 20, 'Sake Sashimi', 'sake-sashimi.jpg', 22, 300000, 250000, '2024-06-25 14:34:43', 0, '<h2>Hình ảnh</h2><p><img src=\"./upload/sake-sashimi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/sake-sashimi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Cá hồi</td></tr><tr><td>Khối lượng</td><td>200gram</td></tr></tbody></table></figure>', 1),
(40, 20, 'Tai Sashimi', 'tai-sashimi.jpg', 44, 400000, 320000, '2024-06-25 14:36:26', 3, '<h2>Hình ảnh</h2><p><img src=\"./upload/tai-sashimi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/tai-sashimi-1.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Cá trắng</td></tr><tr><td>Khối lượng</td><td>200gram</td></tr></tbody></table></figure>', 1),
(41, 22, 'Shoyu Ramen', 'shoyu-ramen.jpg', 33, 270000, 250000, '2024-06-25 14:38:12', 5, '<h2>Hình ảnh</h2><p><img src=\"./upload/shoyu-ramen.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/shoyu-ramen.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Ramen, đậu nành, xương, thịt lợn</td></tr><tr><td>Khối lượng</td><td>700gram</td></tr></tbody></table></figure>', 1),
(42, 22, 'Shio Ramen', 'shio-ramen.jpg', 15, 150000, 140000, '2024-06-25 16:58:59', 1, '<h2>Hình ảnh</h2><p><img src=\"./upload/shio-ramen.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/shio-ramen.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Ramen, trứng, cá, măng</td></tr><tr><td>Khối lượng</td><td>700gram</td></tr></tbody></table></figure>', 1),
(44, 22, 'Miso Ramen', 'miso-ramen.jpg', 30, 250000, 230000, '2024-07-08 18:03:10', 4, '<h2>Hình ảnh</h2><p><img src=\"./upload/miso-ramen.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/miso-ramen.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Ramen, nấm miso</td></tr><tr><td>Khối lượng</td><td>700gram</td></tr></tbody></table></figure>', 1),
(45, 23, 'Ebi Tempura', 'ebi-tempura.jpg', 13, 250000, 179000, '2024-07-09 18:07:37', 0, '<h2>Hình ảnh</h2><p><img src=\"./upload/ebi-tempura.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/ebi-tempura.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Tôm</td></tr><tr><td>Khối lượng</td><td>200gram</td></tr></tbody></table></figure>', 1),
(46, 23, 'Vegetable Tempura', 'vegetable-tempura.jpg', 13, 300000, 199000, '2024-07-03 18:08:47', 0, '<h2>Hình ảnh</h2><p><img src=\"./upload/vegetable-tempura.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/vegetable-tempura.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Tôm</td></tr><tr><td>Khối lượng</td><td>200gram</td></tr></tbody></table></figure>', 1),
(47, 23, 'Kakiage Tempura', 'kakiage-tempura.jpg', 13, 250000, 199000, '2024-07-03 18:10:37', 0, '<h2>Hình ảnh</h2><p><img src=\"./upload/kakiage-tempura.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/kakiage-tempura.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Tôm</td></tr><tr><td>Khối lượng</td><td>200gram</td></tr></tbody></table></figure>', 1),
(48, 24, 'Negima', 'negima.jpg', 15, 50000, 45000, '2024-07-03 18:13:06', 0, '<h2>Hình ảnh</h2><p><img src=\"./upload/negima.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/negima.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Gà, măng tây</td></tr><tr><td>Khối lượng</td><td>200gram</td></tr></tbody></table></figure>', 1),
(49, 24, 'Tsukune', 'tsukune.jpg', 30, 60000, 55000, '2024-07-04 18:14:53', 0, '<h2>Hình ảnh</h2><p><img src=\"./upload/tsukune.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/tsukune.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Bóp thịt viên gà nướng</td></tr><tr><td>Khối lượng</td><td>200gram</td></tr></tbody></table></figure>', 1),
(50, 25, 'Katsudon', 'katsudon.jpg', 23, 120000, 100000, '2024-07-03 18:15:59', 0, '<h2>Hình ảnh</h2><p><img src=\"./upload/katsudon.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/katsudon.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Thịt lợn chiên</td></tr><tr><td>Khối lượng</td><td>500gram</td></tr></tbody></table></figure>', 1),
(51, 25, 'Oyakodon', 'oyakodon.jpg', 22, 150000, 140000, '2024-07-04 18:19:25', 0, '<h2>Hình ảnh</h2><p><img src=\"./upload/oyakodon.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/oyakodon.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Gà, trứng</td></tr><tr><td>Khối lượng</td><td>500gram</td></tr></tbody></table></figure>', 1),
(52, 25, 'Tendon', 'tendon.jpg', 33, 170000, 140000, '2024-07-03 18:20:39', 0, '<h2>Hình ảnh</h2><p><img src=\"./upload/tendon.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p><p><img src=\"./upload/tendon.jpg\" alt=\"sushi\" width=\"665\" height=\"374\"></p>', '<h2>Thông tin</h2><figure class=\"table\"><table><tbody><tr><td>Nguyên liệu</td><td>Tôm</td></tr><tr><td>Khối lượng</td><td>500gram</td></tr></tbody></table></figure>', 1),
(53, 19, 'Hoan', 'katsudon.jpg', 12, 1000000, 900000, '2024-07-09 19:30:37', 3, '<p>123</p>', '<p>abc</p>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL COMMENT 'Họ tên',
  `image` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là khách hàng 1 là nhân viên',
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `image`, `email`, `phone`, `address`, `role`, `active`) VALUES
(8, 'admin', '$2y$10$zwNwMKly8otZrxWr6BTTxuRdX5eGj/2FbZT3wI3TfQ6Io8/jgAlLC', 'Admin', 'user-default.png', 'kimngansv0305@gmail.com', '0368072396', 'Thái Nguyên', 1, 1),
(16, 'hoandk189', '$2y$10$HCm2W2YBNqp7Og4wNqRSl.7Ouy0hLqNIq2noBp4XL0vga/KPQSmoC', 'Thái Việt Hoàn', 'user-default.png', 'hoandk189@gmail.com', '0842500198', 'Thai Nguyen', 0, 1),
(18, 'hoandk203', '$2y$10$fbI9HsAXGR1aMcP9UCkwjesXkrpJyl4UzDXM6OzEqohVEjUA0f.b.', 'Thái Việt Hoàn', 'user-default.png', 'admin@gmail.com', '0842500197', 'Pho Yen', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
