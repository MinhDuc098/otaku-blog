-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2023 at 06:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `otaku-forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(14, 'One shot'),
(15, 'Shoujo'),
(16, 'Adventure'),
(17, 'Ác Quỷ'),
(18, 'Fantasy'),
(19, 'Chuyển sinh'),
(20, 'Võ thuật'),
(21, 'Shoujo Ai'),
(23, 'Trinh thám'),
(24, 'Shounen'),
(25, 'Tragedy'),
(26, 'Harem'),
(27, 'Học đường'),
(28, 'Shounen Ai'),
(29, 'Mecha'),
(30, 'Drama '),
(31, 'Lịch sử'),
(32, 'Ma thuật'),
(33, 'Ẩm thực'),
(34, 'Âm nhạc'),
(35, 'tình cảm'),
(36, 'Quan điểm - tranh luận'),
(37, 'tự sáng tác'),
(38, 'News'),
(39, 'Thể thao'),
(40, 'Adult'),
(41, '18+');

-- --------------------------------------------------------

--
-- Table structure for table `category_seq`
--

CREATE TABLE `category_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_seq`
--

INSERT INTO `category_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `cate_post`
--

CREATE TABLE `cate_post` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cate_post`
--

INSERT INTO `cate_post` (`post_id`, `category_id`) VALUES
(1, 15),
(2, 15),
(52, 15),
(503, 15),
(503, 16),
(552, 14),
(652, 14),
(702, 31),
(702, 36),
(702, 41),
(752, 14),
(752, 37);

-- --------------------------------------------------------

--
-- Table structure for table `chatroom`
--

CREATE TABLE `chatroom` (
  `chat_room_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chatroom`
--

INSERT INTO `chatroom` (`chat_room_id`, `sender_id`, `receiver_id`, `created_at`) VALUES
(1, 53, 1, '2023-06-17 15:43:25'),
(2, 53, 402, '2023-06-17 15:48:28'),
(3, 53, 53, '2023-06-17 16:32:13'),
(52, 1, 1, '2023-06-20 21:43:58'),
(53, 1, 152, '2023-06-20 21:44:01'),
(54, 1, 202, '2023-06-20 21:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `chatroom_seq`
--

CREATE TABLE `chatroom_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chatroom_seq`
--

INSERT INTO `chatroom_seq` (`next_val`) VALUES
(151);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment_content` text DEFAULT NULL,
  `comment_parrent` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_content`, `comment_parrent`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(352, 'test comment\r\n', NULL, 53, 1, '2023-04-15 20:33:26', NULL),
(402, 'hello', NULL, 1, 1, '2023-04-18 16:00:53', '2023-04-18 16:00:53'),
(452, 'dasda', NULL, 1, 1, '2023-04-18 16:03:05', NULL),
(602, 'hello', NULL, 1, 552, '2023-04-25 10:15:07', NULL),
(652, 'that a good one', NULL, 1, 2, '2023-04-28 07:24:35', NULL),
(702, 'something', NULL, 1, 503, '2023-04-28 17:43:03', NULL),
(752, 'hello', NULL, 152, 503, '2023-04-30 07:30:34', NULL),
(802, 'test nofitication sort', NULL, 1, 503, '2023-04-30 07:41:02', NULL),
(852, 'hello ', NULL, 53, 2, '2023-05-08 15:28:26', NULL),
(902, 'so beautiful', NULL, 53, 652, '2023-05-08 15:54:06', NULL),
(903, 'avdfdfdfg', NULL, 202, 1, '2023-05-08 16:01:34', NULL),
(952, 'hello admin', NULL, 53, 1, '2023-05-13 16:14:02', NULL),
(1002, 'comment', NULL, 53, 1, '2023-05-13 16:17:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment_seq`
--

CREATE TABLE `comment_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_seq`
--

INSERT INTO `comment_seq` (`next_val`) VALUES
(1101);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `user_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL,
  `follow_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`user_id`, `follower_id`, `follow_id`) VALUES
(53, 1, 952);

-- --------------------------------------------------------

--
-- Table structure for table `follow_seq`
--

CREATE TABLE `follow_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `follow_seq`
--

INSERT INTO `follow_seq` (`next_val`) VALUES
(1051);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_content` varchar(5000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `chat_room_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `message_content`, `created_at`, `chat_room_id`, `sender_id`) VALUES
(1, 'hello', '2023-06-17 00:00:00', 1, 53),
(2, 'hi how are you', '2023-06-17 00:00:00', 1, 1),
(1052, 'hi', '2023-06-20 22:32:44', 1, 1),
(1053, 'hello', '2023-06-20 22:33:30', 1, 1),
(1054, 'hi', '2023-06-20 22:33:35', 1, 53),
(1055, 'fuck you bitch', '2023-06-20 22:33:59', 1, 1),
(1056, 'fuck con me may', '2023-06-20 22:39:37', 1, 53),
(1057, 'chửi cái con cặc', '2023-06-20 22:40:17', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `message_seq`
--

CREATE TABLE `message_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message_seq`
--

INSERT INTO `message_seq` (`next_val`) VALUES
(1151);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `notification_content` varchar(10000) DEFAULT NULL,
  `notification_receiver_id` int(11) DEFAULT NULL,
  `notification_link` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `user_relate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_content`, `notification_receiver_id`, `notification_link`, `created_at`, `user_relate`) VALUES
(602, 'người dùng duc đã upvote bài viết First Blog OF Tak của bạn', 152, './viewBlog?id=652', '2023-05-08 22:53:58', 53),
(603, 'người dùng duc đã bình luận vào bài viết First Blog OF Tak của bạn', 152, './viewBlog?id=652', '2023-05-08 22:54:06', 53),
(1053, 'người dùng admin đã upvote bài viết Test version 2 của bạn', 1, './viewBlog?id=2', '2023-06-09 00:39:38', 1),
(1102, 'người dùng duc đã upvote bài viết Thuyết Tương Đối và lời giải thích về TRỌNG LỰC của Einstein | SAMURICE của bạn', 53, './viewBlog?id=752', '2023-06-09 16:48:26', 53),
(1152, 'người dùng admin đã upvote bài viết Thuyết Tương Đối và lời giải thích về TRỌNG LỰC của Einstein | SAMURICE của bạn', 53, './viewBlog?id=752', '2023-06-09 18:25:48', 1),
(1253, 'người dùng Minh Đức đã upvote bài viết Test1 của bạn', 1, './viewBlog?id=1', '2023-06-20 22:43:16', 53);

-- --------------------------------------------------------

--
-- Table structure for table `notification_seq`
--

CREATE TABLE `notification_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification_seq`
--

INSERT INTO `notification_seq` (`next_val`) VALUES
(1351);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(225) DEFAULT NULL,
  `post_content` mediumtext DEFAULT NULL,
  `up_vote` int(11) DEFAULT 0,
  `down_vote` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `summary` text DEFAULT NULL,
  `post_img` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `post_title`, `post_content`, `up_vote`, `down_vote`, `user_id`, `created_at`, `updated_at`, `summary`, `post_img`) VALUES
(1, 'Test1', 'The blog_posts table has columns to store the title, author, publication date, and category of each blog post. The id column is an auto-incrementing primary key that uniquely identifies each blog post. The category_id column is a foreign key that references the id column of the categories table (assuming you have a separate table to store the categories that each blog post belongs to). The blog_content table has columns to store the actual content of each blog post, including any images. The id column is an auto-incrementing primary key that uniquely identifies each row in the table. The post_id column is a foreign key that references the id column of the blog_posts table, indicating which blog post the content belongs to. The content column stores the actual content of the blog post, including any HTML code for images or other media.', 2, 1, 1, '2023-04-10 09:56:21', '2023-04-10 09:56:21', 'something to test', '/img/tohsaka.jpg'),
(2, 'Test version 2', '<div>B&agrave;i tiểu luận bắt đầu bằng một tr&iacute;ch dẫn của Feynman rằng &ocirc;ng ấy vẫn cảm thấy bất an về sự thiếu trực quan rằng tại sao cơ chế lượng tử lại nhất qu&aacute;n - nhưng cũng mường tượng rằng sau 2 thế hệ, con người sẽ cảm thấy thoải m&aacute;i hơn về cơ chế lượng tử, nhận ra rằng sự nhất qu&aacute;n đ&oacute; l&agrave; hiển nhi&ecirc;n. Chắc chắn l&agrave; t&ocirc;i đ&atilde; hiểu được điều đ&oacute;.</div>\r\n<div>Giờ th&igrave;, như những g&igrave; t&ocirc;i đ&atilde; từng l&agrave;m rất nhiều lần trước đ&acirc;y, Nielsen kh&ocirc;ng đồng &yacute; với việc khẳng định rằng \"sự chồng chấp lượng tử của 2 trạng th&aacute;i c&oacute; nghĩa l&agrave; vật thể đồng thời tồn tại ở 2 trạng th&aacute;i đ&oacute;\". Trong v&iacute; dụ nổi tiếng nhất, con m&egrave;o của Schr&ouml;dinger thường được hiểu rằng n&oacute; \"vừa sống vừa (v&agrave;) chết\". Đ&oacute; l&agrave; thứ m&agrave; Nielsen gọi l&agrave; \"c&aacute;ch hiểu kiểu salad từ về cơ chế lượng tử\", một cụm từ m&agrave; g&acirc;y ra thiệt hại c&ograve;n lớn hơn c&aacute;i gi&aacute; phải trả để bạn c&oacute; thể đọc được b&agrave;i viết của &ocirc;ng ấy.</div>\r\n<div>Trong thực tế, con m&egrave;o của Schr&ouml;dinger vẫn chỉ \"sống HOẶC chết\", từ \"HOẶC\" (OR) vẫn ch&iacute;nh x&aacute;c hơn nhiều so với từ \"V&Agrave;\", trong khi đ&oacute; cơ chế lượng tử gi&uacute;p ch&uacute;ng ta dự đo&aacute;n được x&aacute;c suất của \"sống\" v&agrave; \"chết\" cũng như c&aacute;c gi&aacute; trị kh&aacute;c c&oacute; thể quan s&aacute;t được m&agrave; kh&ocirc;ng li&ecirc;n quan tới lượng tử nhị nguy&ecirc;n sống/chết. \"HOẶC\" ch&iacute;nh x&aacute;c hơn \"V&Agrave;\" - nhưng bạn phải loại bỏ c&aacute;i suy nghĩ rằng việc sử dụng từ \"HOẶC\" đồng nghĩa với sự tồn tại của một thực tế kh&aacute;ch quan (v&agrave; c&acirc;u trả lời kh&aacute;ch quan cho c&acirc;u hỏi về sống/chết) trong mọi khoảnh khắc.</div>\r\n<div>Thay v&agrave;o đ&oacute;, \"HOẶC\" l&agrave; một dạng ph&eacute;p cộng logic n&agrave;o đ&oacute;, một ph&eacute;p t&iacute;nh c&oacute; khuynh hướng cộng th&ecirc;m gi&aacute; trị sự thật (0/1) hoặc x&aacute;c suất (x&aacute;c suất chỉ l&agrave; gi&aacute; trị kỳ vọng của gi&aacute; trị sự thật). Khi c&oacute; một số gi&aacute; trị c&oacute; x&aacute;c suất kh&aacute;c 0, điều đ&oacute; c&oacute; nghĩa l&agrave; người quan s&aacute;t kh&ocirc;ng biết c&acirc;u trả lời ch&iacute;nh x&aacute;c.</div>\r\n<div>Cụ thể l&agrave;, Nielsen đ&atilde; nhận định ch&iacute;nh x&aacute;c rằng c&aacute;ch hiểu th&ocirc;ng dụng kia thường được diễn giải cho người mới nhập m&ocirc;n nhưng ngay cả những nh&agrave; vật l&yacute; học chuy&ecirc;n nghiệp cũng hiểu diều đ&oacute; theo \"đ&uacute;ng nghĩa đen\", mặc d&ugrave; c&aacute;ch hiểu đ&oacute; kh&ocirc;ng ch&iacute;nh x&aacute;c cũng như kh&ocirc;ng đ&uacute;ng về mặt đạo đức. C&aacute;ch hiểu kh&ocirc;ng ch&iacute;nh x&aacute;c ở đ&acirc;y c&oacute; nghĩa l&agrave; sự kh&ocirc;ng ch&iacute;nh x&aacute;c của những kết luận cụ thể được đưa ra th&ocirc;ng qua c&aacute;ch nghĩ đ&oacute;.</div>', 2, 0, 1, '2023-04-10 09:56:22', '2023-04-10 09:56:22', NULL, '/img/tohsaka.jpg'),
(52, 'Test version 3', '<div>với tổng tr&ecirc;n <em>x&nbsp;</em>đi qua tất cả c&aacute;c nh&aacute;nh đường của \"người b&aacute;n h&agrave;ng\" cho ph&eacute;p cơ chế lượng tử giải \"b&agrave;i to&aacute;n người b&aacute;n h&agrave;ng\" (b&agrave;i to&aacute;n chọn đường đi ngắn nhất đi qua tất cả c&aacute;c th&agrave;nh phố: tham khảo <a href=\"https://spiderum.com/\" target=\"_blank\" rel=\"noopener noreferrer\">kaggle.com</a> để t&igrave;m hiểu về một cuộc thi đang diễn ra c&oacute; dạng như vậy) một c&aacute;ch nhanh ch&oacute;ng.</div>\r\n<div>Theo c&aacute;ch n&agrave;y, những người hiểu theo kiểu salad từ tưởng rằng, trạng th&aacute;i lượng tử chứa \"nhiều th&ocirc;ng tin cổ điển hơn\" trạng th&aacute;i cổ điển của ch&iacute;nh vật đ&oacute;. V&agrave; một người c&oacute; thể sử dụng &iacute;t ph&eacute;p t&iacute;nh hơn - v&iacute; dụ, nếu <em>f(x)</em> được chọn theo độ d&agrave;i của nh&aacute;nh đường, ch&uacute;ng ta c&oacute; thể nhấn mạnh những th&agrave;nh phần của h&agrave;m số s&oacute;ng tương đương với con đường ngắn nhất - v&agrave; do đ&oacute; giải b&agrave;i to&aacute;n người b&aacute;n h&agrave;ng với tốc độ nhanh lũy thừa cứ như thể m&aacute;y t&iacute;nh lượng tử giống như m&aacute;y t&iacute;nh song song.</div>\r\n<div>Nhưng Nielsen rất hiểu về t&iacute;nh to&aacute;n lượng tử - đ&oacute; l&agrave; v&igrave; sao &ocirc;ng ấy kh&ocirc;ng chỉ c&oacute; thể n&oacute;i bạn rằng điều đ&oacute; l&agrave; bất khả thi m&agrave; c&ograve;n cho bạn một <a href=\"https://arxiv.org/abs/quant-ph/9701001\" target=\"_blank\" rel=\"nofollow noopener noindex noreferrer\">b&agrave;i nghi&ecirc;n cứu cực k&igrave; chi tiết</a> diễn giải sự bất khả thi của việc \"sử dụng m&aacute;y t&iacute;nh lượng tử như một hệ thống m&aacute;y t&iacute;nh song song\".</div>\r\n<div>Những b&agrave;i nghi&ecirc;n cứu nặng chuy&ecirc;n m&ocirc;n như vậy c&oacute; thể sẽ rất th&uacute; vị nhưng t&ocirc;i tin rằng sai lầm của những người hiểu theo kiểu salad từ c&oacute; t&iacute;nh chất cơ bản hơn rất nhiều. Họ đơn giản l&agrave; tưởng rằng h&agrave;m số s&oacute;ng l&agrave; s&oacute;ng cổ điển - v&igrave; vậy tất cả bi&ecirc;n độ x&aacute;c suất phức (hệ số của c&aacute;c số hạng kh&aacute;c nhau trong h&agrave;m số s&oacute;ng) l&agrave; một dạng \"dữ liệu cổ điển kh&aacute;ch quan\" n&agrave;o đ&oacute;. C&oacute; một số lượng lũy thừa c&aacute;c số hạng như thế - với <em>N</em> qubits, bạn c&oacute; <em>2^N</em> bi&ecirc;n độ phức - v&agrave; ch&uacute;ng c&oacute; thể được biến đổi như thể một số lượng lũy thừa c&aacute;c dữ liệu cổ điển. V&agrave; đ&oacute; l&agrave; v&igrave; sao bạn c&oacute; thể thử tất cả c&aacute;c nh&aacute;nh đường c&ugrave;ng một l&uacute;c v&agrave; giải quyết b&agrave;i to&aacute;n một c&aacute;ch hiệu quả.</div>\r\n<div>Ngoại trừ việc l&agrave; bạn kh&ocirc;ng thể l&agrave;m điều đ&oacute;. Đơn giản l&agrave; việc cho rằng bi&ecirc;n độ x&aacute;c suất phức l&agrave; \"dữ liệu cổ điển kh&aacute;ch quan\" hoặc, tương đương rằng, h&agrave;m số s&oacute;ng l&agrave; một s&oacute;ng cổ điển, l&agrave; sai lầm. Cụ thể l&agrave;, theo định nghĩa của ch&uacute;ng, những bi&ecirc;n độ x&aacute;c suất đ&oacute; gần gũi với những x&aacute;c suất b&igrave;nh thường trong ph&acirc;n phối x&aacute;c suất m&agrave; đ&atilde; tồn tại trong vật l&yacute; cổ điển hơn rất nhiều, khi m&agrave; c&oacute; sự bất định tồn tại.</div>\r\n<div>V&agrave; việc x&aacute;c suất m&atilde; h&oacute;a sự thiếu th&ocirc;ng tin của ch&uacute;ng ta về trạng th&aacute;i của một vật hoặc một hệ thống vật l&yacute; rất kh&aacute;c so với \"dữ liệu cổ điển m&agrave; ch&uacute;ng ta nắm r&otilde;\". Cụ thể l&agrave;, sự khai triển của dữ liệu cổ điển dường như ho&agrave;n to&agrave;n l&agrave; chủ quan. Nếu như bạn m&ocirc; tả một h&agrave;nh tinh theo h&agrave;m số tọa độ của ch&uacute;ng <em>x_j(t)</em>, th&igrave; c&oacute; thể hiểu được rằng vũ trụ đ&atilde; khai triển h&agrave;m số theo thời gian đ&oacute; theo phương tr&igrave;nh vi ph&acirc;n, gần như kh&ocirc;ng phải tuyến t&iacute;nh, tổng qu&aacute;t nhất - sự khai triển đ&oacute; c&ograve;n thậm ch&iacute; c&oacute; thể tổng qu&aacute;t hơn cả thứ được gọi l&agrave; phương tr&igrave;nh vi ph&acirc;n.</div>', 2, 0, 1, '2023-04-10 08:27:40', '2023-04-10 08:27:40', NULL, '/img/tohsaka.jpg'),
(252, 'Phải chăng bạn đang hiểu sai về vật lý lượng tử?', '<div>B&agrave;i tiểu luận bắt đầu bằng một tr&iacute;ch dẫn của Feynman rằng &ocirc;ng ấy vẫn cảm thấy bất an về sự thiếu trực quan rằng tại sao cơ chế lượng tử lại nhất qu&aacute;n - nhưng cũng mường tượng rằng sau 2 thế hệ, con người sẽ cảm thấy thoải m&aacute;i hơn về cơ chế lượng tử, nhận ra rằng sự nhất qu&aacute;n đ&oacute; l&agrave; hiển nhi&ecirc;n. Chắc chắn l&agrave; t&ocirc;i đ&atilde; hiểu được điều đ&oacute;.</div>\r\n<div>Giờ th&igrave;, như những g&igrave; t&ocirc;i đ&atilde; từng l&agrave;m rất nhiều lần trước đ&acirc;y, Nielsen kh&ocirc;ng đồng &yacute; với việc khẳng định rằng \"sự chồng chấp lượng tử của 2 trạng th&aacute;i c&oacute; nghĩa l&agrave; vật thể đồng thời tồn tại ở 2 trạng th&aacute;i đ&oacute;\". Trong v&iacute; dụ nổi tiếng nhất, con m&egrave;o của Schr&ouml;dinger thường được hiểu rằng n&oacute; \"vừa sống vừa (v&agrave;) chết\". Đ&oacute; l&agrave; thứ m&agrave; Nielsen gọi l&agrave; \"c&aacute;ch hiểu kiểu salad từ về cơ chế lượng tử\", một cụm từ m&agrave; g&acirc;y ra thiệt hại c&ograve;n lớn hơn c&aacute;i gi&aacute; phải trả để bạn c&oacute; thể đọc được b&agrave;i viết của &ocirc;ng ấy.</div>\r\n<div>Trong thực tế, con m&egrave;o của Schr&ouml;dinger vẫn chỉ \"sống HOẶC chết\", từ \"HOẶC\" (OR) vẫn ch&iacute;nh x&aacute;c hơn nhiều so với từ \"V&Agrave;\", trong khi đ&oacute; cơ chế lượng tử gi&uacute;p ch&uacute;ng ta dự đo&aacute;n được x&aacute;c suất của \"sống\" v&agrave; \"chết\" cũng như c&aacute;c gi&aacute; trị kh&aacute;c c&oacute; thể quan s&aacute;t được m&agrave; kh&ocirc;ng li&ecirc;n quan tới lượng tử nhị nguy&ecirc;n sống/chết. \"HOẶC\" ch&iacute;nh x&aacute;c hơn \"V&Agrave;\" - nhưng bạn phải loại bỏ c&aacute;i suy nghĩ rằng việc sử dụng từ \"HOẶC\" đồng nghĩa với sự tồn tại của một thực tế kh&aacute;ch quan (v&agrave; c&acirc;u trả lời kh&aacute;ch quan cho c&acirc;u hỏi về sống/chết) trong mọi khoảnh khắc.</div>\r\n<div>Thay v&agrave;o đ&oacute;, \"HOẶC\" l&agrave; một dạng ph&eacute;p cộng logic n&agrave;o đ&oacute;, một ph&eacute;p t&iacute;nh c&oacute; khuynh hướng cộng th&ecirc;m gi&aacute; trị sự thật (0/1) hoặc x&aacute;c suất (x&aacute;c suất chỉ l&agrave; gi&aacute; trị kỳ vọng của gi&aacute; trị sự thật). Khi c&oacute; một số gi&aacute; trị c&oacute; x&aacute;c suất kh&aacute;c 0, điều đ&oacute; c&oacute; nghĩa l&agrave; người quan s&aacute;t kh&ocirc;ng biết c&acirc;u trả lời ch&iacute;nh x&aacute;c.</div>\r\n<div>Cụ thể l&agrave;, Nielsen đ&atilde; nhận định ch&iacute;nh x&aacute;c rằng c&aacute;ch hiểu th&ocirc;ng dụng kia thường được diễn giải cho người mới nhập m&ocirc;n nhưng ngay cả những nh&agrave; vật l&yacute; học chuy&ecirc;n nghiệp cũng hiểu diều đ&oacute; theo \"đ&uacute;ng nghĩa đen\", mặc d&ugrave; c&aacute;ch hiểu đ&oacute; kh&ocirc;ng ch&iacute;nh x&aacute;c cũng như kh&ocirc;ng đ&uacute;ng về mặt đạo đức. C&aacute;ch hiểu kh&ocirc;ng ch&iacute;nh x&aacute;c ở đ&acirc;y c&oacute; nghĩa l&agrave; sự kh&ocirc;ng ch&iacute;nh x&aacute;c của những kết luận cụ thể được đưa ra th&ocirc;ng qua c&aacute;ch nghĩ đ&oacute;.</div>\r\n<hr>\r\n<div><em>--- Phần nặng l&yacute; thuyết, bạn đọc c&oacute; thể bỏ qua (ND) ---</em></div>\r\n<div>Cụ thể, nhiều người tưởng rằng trạng th&aacute;i của định dạng</div>\r\n<div>\r\n<figure class=\"aligncenter\"><img class=\"fr-fic fr-dib\" src=\"https://images.spiderum.com/sp-images/ec2c8f107aa011e9a8a54dcdf1030b63.gif\" alt=\"img_1\">\r\n<figcaption class=\"image-description\" contenteditable=\"false\"></figcaption>\r\n</figure>\r\n</div>\r\n<div>với tổng tr&ecirc;n <em>x&nbsp;</em>đi qua tất cả c&aacute;c nh&aacute;nh đường của \"người b&aacute;n h&agrave;ng\" cho ph&eacute;p cơ chế lượng tử giải \"b&agrave;i to&aacute;n người b&aacute;n h&agrave;ng\" (b&agrave;i to&aacute;n chọn đường đi ngắn nhất đi qua tất cả c&aacute;c th&agrave;nh phố: tham khảo <a href=\"https://spiderum.com/\" target=\"_blank\" rel=\"noopener noreferrer\">kaggle.com</a> để t&igrave;m hiểu về một cuộc thi đang diễn ra c&oacute; dạng như vậy) một c&aacute;ch nhanh ch&oacute;ng.</div>\r\n<div>Theo c&aacute;ch n&agrave;y, những người hiểu theo kiểu salad từ tưởng rằng, trạng th&aacute;i lượng tử chứa \"nhiều th&ocirc;ng tin cổ điển hơn\" trạng th&aacute;i cổ điển của ch&iacute;nh vật đ&oacute;. V&agrave; một người c&oacute; thể sử dụng &iacute;t ph&eacute;p t&iacute;nh hơn - v&iacute; dụ, nếu <em>f(x)</em> được chọn theo độ d&agrave;i của nh&aacute;nh đường, ch&uacute;ng ta c&oacute; thể nhấn mạnh những th&agrave;nh phần của h&agrave;m số s&oacute;ng tương đương với con đường ngắn nhất - v&agrave; do đ&oacute; giải b&agrave;i to&aacute;n người b&aacute;n h&agrave;ng với tốc độ nhanh lũy thừa cứ như thể m&aacute;y t&iacute;nh lượng tử giống như m&aacute;y t&iacute;nh song song.</div>\r\n<div>Nhưng Nielsen rất hiểu về t&iacute;nh to&aacute;n lượng tử - đ&oacute; l&agrave; v&igrave; sao &ocirc;ng ấy kh&ocirc;ng chỉ c&oacute; thể n&oacute;i bạn rằng điều đ&oacute; l&agrave; bất khả thi m&agrave; c&ograve;n cho bạn một <a href=\"https://arxiv.org/abs/quant-ph/9701001\" target=\"_blank\" rel=\"nofollow noopener noindex noreferrer\">b&agrave;i nghi&ecirc;n cứu cực k&igrave; chi tiết</a> diễn giải sự bất khả thi của việc \"sử dụng m&aacute;y t&iacute;nh lượng tử như một hệ thống m&aacute;y t&iacute;nh song song\".</div>\r\n<div>Những b&agrave;i nghi&ecirc;n cứu nặng chuy&ecirc;n m&ocirc;n như vậy c&oacute; thể sẽ rất th&uacute; vị nhưng t&ocirc;i tin rằng sai lầm của những người hiểu theo kiểu salad từ c&oacute; t&iacute;nh chất cơ bản hơn rất nhiều. Họ đơn giản l&agrave; tưởng rằng h&agrave;m số s&oacute;ng l&agrave; s&oacute;ng cổ điển - v&igrave; vậy tất cả bi&ecirc;n độ x&aacute;c suất phức (hệ số của c&aacute;c số hạng kh&aacute;c nhau trong h&agrave;m số s&oacute;ng) l&agrave; một dạng \"dữ liệu cổ điển kh&aacute;ch quan\" n&agrave;o đ&oacute;. C&oacute; một số lượng lũy thừa c&aacute;c số hạng như thế - với <em>N</em> qubits, bạn c&oacute; <em>2^N</em> bi&ecirc;n độ phức - v&agrave; ch&uacute;ng c&oacute; thể được biến đổi như thể một số lượng lũy thừa c&aacute;c dữ liệu cổ điển. V&agrave; đ&oacute; l&agrave; v&igrave; sao bạn c&oacute; thể thử tất cả c&aacute;c nh&aacute;nh đường c&ugrave;ng một l&uacute;c v&agrave; giải quyết b&agrave;i to&aacute;n một c&aacute;ch hiệu quả.</div>\r\n<div>Ngoại trừ việc l&agrave; bạn kh&ocirc;ng thể l&agrave;m điều đ&oacute;. Đơn giản l&agrave; việc cho rằng bi&ecirc;n độ x&aacute;c suất phức l&agrave; \"dữ liệu cổ điển kh&aacute;ch quan\" hoặc, tương đương rằng, h&agrave;m số s&oacute;ng l&agrave; một s&oacute;ng cổ điển, l&agrave; sai lầm. Cụ thể l&agrave;, theo định nghĩa của ch&uacute;ng, những bi&ecirc;n độ x&aacute;c suất đ&oacute; gần gũi với những x&aacute;c suất b&igrave;nh thường trong ph&acirc;n phối x&aacute;c suất m&agrave; đ&atilde; tồn tại trong vật l&yacute; cổ điển hơn rất nhiều, khi m&agrave; c&oacute; sự bất định tồn tại.</div>', 0, 0, 1, '2023-04-10 08:27:44', '2023-04-10 08:27:44', '1 chút về vật lý lượng tử', '/img/tohsaka.jpg'),
(503, 'test đăng ảnh', '<p>i gonna paste an img here</p>\r\n<p><img src=\"https://gamek.mediacdn.vn/133514250583805952/2020/7/4/1-15938427791521331665841.jpg\" alt=\"\" width=\"333\" height=\"444\"></p>', 3, 0, 53, '2023-04-10 16:07:45', NULL, 'songoku', 'https://gamek.mediacdn.vn/133514250583805952/2020/7/4/1-15938427791521331665841.jpg'),
(552, 'red hair girl', '<p style=\"padding-left: 80px;\"><img src=\"https://cdnb.artstation.com/p/assets/images/images/059/044/559/large/alexey-dmitriev-schicksal-makima-anime-style-red-hair-girl-makima-anime-anime-g-55391e7b-c997-4973-bebc-933401d12e10.jpg?1675511061\" alt=\"\" width=\"419\" height=\"419\"></p>', 3, 0, 53, '2023-04-20 11:35:38', NULL, 'red girl', 'https://cdnb.artstation.com/p/assets/images/images/059/044/559/large/alexey-dmitriev-schicksal-makima-anime-style-red-hair-girl-makima-anime-anime-g-55391e7b-c997-4973-bebc-933401d12e10.jpg?1675511061'),
(652, 'First Blog OF Tak', '<p>hello very one</p>\r\n<p><img src=\"https://cdn.moviefone.com/image-assets/831544/v7jL66Z6me4gjsEEnTiOgGvN76G.jpg?d=360x540&amp;q=60\" alt=\"\" width=\"360\" height=\"540\"></p>', 1, 0, 152, '2023-05-08 15:53:16', NULL, 'không có', 'https://cdn.moviefone.com/image-assets/831544/v7jL66Z6me4gjsEEnTiOgGvN76G.jpg?d=360x540&amp;q=60'),
(702, 'đôi nét về ngành mại dâm thời việt nam cộng hòa', '<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Qua ch&iacute;nh nguồn tư liệu từ s&aacute;ch b&aacute;o, nghi&ecirc;n cứu của học giả, ph&oacute;ng vi&ecirc;n nước ngo&agrave;i viết về x&atilde; hội miền Nam thười VNCH cho thấy, kinh tế dựa chủ yếu v&agrave;o viện trợ từ nước ngo&agrave;i, một trong nguồn thu nhập chủ yếu lại từ g&aacute;i mại d&acirc;m phục vụ l&iacute;nh Mỹ.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Trong giai đoạn 1960-1975, h&agrave;ng triệu l&iacute;nh viễn chinh Mỹ &agrave;o ạt đổ bộ v&agrave;o Việt Nam v&agrave;o thời chiến tranh Việt Nam. Từ đ&oacute; nở rộ c&aacute;c những chủ thầu cung cấp h&agrave;ng h&oacute;a v&agrave; dịch vụ cho l&iacute;nh Mỹ, những người l&agrave;m sở Mỹ&hellip; đến bọn ma c&ocirc;, g&aacute;i điếm, g&aacute;i nhảy, g&aacute;i tắm hơi&hellip; Sự ph&acirc;n h&oacute;a về kinh tế đ&oacute; dẫn tới sự đảo lộn c&aacute;c gi&aacute; trị đạo đức truyền thống. Người miền Nam thời đ&oacute; c&oacute; c&acirc;u v&egrave;: &ldquo;Thứ nhất sở Mỹ, thứ nh&igrave; g&aacute;i đĩ, thứ ba ma c&ocirc;, thứ tư tướng t&aacute;&rdquo;. Sỹ quan Việt Nam Cộng H&ograve;a trở th&agrave;nh kẻ ma c&ocirc; chở g&aacute;i ra chiến trường phục vụ tướng lĩnh.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Để &ldquo;gi&uacute;p vui&rdquo; cho đạo qu&acirc;n viễn chinh, Mỹ &ndash; Thiệu cho ph&eacute;p mở cửa h&agrave;ng loạt snack bars, ph&ograve;ng tắm hơi, hộp đ&ecirc;m, tiệm nhảy v&agrave; nhất l&agrave; nh&agrave; chứa, nhan nhản khắp S&agrave;i G&ograve;n, đặc biệt l&agrave; xung quanh c&aacute;c cư x&aacute; Mỹ. Thị trường mại d&acirc;m, gọi một c&aacute;ch n&ocirc;m na l&agrave; &ldquo;chợ heo&rdquo;, được Mỹ &ndash; Thiệu c&ocirc;ng khai h&oacute;a v&agrave; hợp ph&aacute;p h&oacute;a. Ước t&iacute;nh to&agrave;n miền Nam năm 1975 c&oacute; tr&ecirc;n 200.000 g&aacute;i b&aacute;n d&acirc;m. So với số g&aacute;i b&aacute;n d&acirc;m tr&ecirc;n to&agrave;n Việt Nam v&agrave;o năm 2012 th&igrave; con số n&agrave;y cao gấp 7 lần, nếu x&eacute;t về tỉ lệ d&acirc;n số th&igrave; gấp 30 lần. Một quan chức S&agrave;i G&ograve;n c&ograve;n c&ocirc;ng khai ph&aacute;t biểu: &ldquo;Người Mỹ cần g&aacute;i, ch&uacute;ng ta cần đ&ocirc;la. Tại sao ch&uacute;ng ta phải hạn chế, đ&oacute; l&agrave; nguồn thu đ&ocirc;la v&ocirc; tận&rdquo;</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Năm 1966, từ S&agrave;i G&ograve;n về, Thượng nghị sĩ Mỹ William Fulbright nhận x&eacute;t: &ldquo;Mỹ đ&atilde; biến S&agrave;i G&ograve;n th&agrave;nh một ổ điếm&rdquo;. C&acirc;u n&oacute;i đ&oacute; tuy c&oacute; x&uacute;c phạm đến thể diện v&agrave; danh tiếng của th&agrave;nh phố, song đ&atilde; phản &aacute;nh một thực tế đau l&ograve;ng. Một tạp ch&iacute; xuất bản ở S&agrave;i G&ograve;n m&ocirc; tả: &ldquo;Tại chợ heo đ&oacute;, hằng ng&agrave;y c&oacute; hai ba trăm người con g&aacute;i Việt Nam đứng sắp h&agrave;ng&hellip; cho l&iacute;nh Mỹ đến chọn dắt đi. Với một nắm đ&ocirc;la trong tay, l&iacute;nh Mỹ thật l&agrave; nhiều tự do: tự do ph&aacute; hoại văn h&oacute;a Việt Nam&rdquo;.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Học giả Nguyễn Hiến L&ecirc; nhận x&eacute;t: sự tha h&oacute;a của đạo đức x&atilde; hội l&agrave; một trong c&aacute;c nguy&ecirc;n nh&acirc;n khiến chế độ Việt Nam Cộng h&ograve;a ng&agrave;y c&agrave;ng mất l&ograve;ng d&acirc;n, cuối c&ugrave;ng sụp đổ ho&agrave;n to&agrave;n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Nguồn :</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">+J. William Fulbright, Vietnam, and the Search for a Cold War Foreign Policy. By Randall Bennett Woods. Cambridge University Press, 1998. ISBN 0521588006. P. 126</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">+Francoeur et al tr. 1352</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">+The Vietnam War 1956-1975 By Andy Wiest, Page 85</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">một số h&igrave;nh ảnh minh h</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://1.bp.blogspot.com/-UdIjD8oY0WY/XUWHSBHg4mI/AAAAAAAABnY/zr3wgDYTu9Q24oIltT2EvNx-6Fewwg6OgCLcBGAs/s640/67369938_133467581224108_1599633184683720704_n.jpg\" alt=\"img_0\" width=\"353\" height=\"290\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<h3 id=\"_chum-nh-gai-im--0\" class=\"ce-header ce-header--left\">CH&Ugrave;M ẢNH G&Aacute;I ĐIẾM Ở MIỀN NAM VIỆT NAM TRƯỚC 1975 QUA ỐNG K&Iacute;NH QUỐC&nbsp;TẾ</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Posted by&nbsp;<a href=\"https://36hn.wordpress.com/author/36hn/\" target=\"_blank\" rel=\"nofollow noopener noindex noreferrer\">36hn</a>&nbsp;on Th&aacute;ng T&aacute;m 3, 2016 &middot;&nbsp;<a href=\"https://36hn.wordpress.com/2016/08/03/chum-anh-gai-diem-o-mien-nam-viet-nam-truoc-1975-qua-ong-kinh-quoc-te/#respond\" target=\"_blank\" rel=\"nofollow noopener noindex noreferrer\">Gửi b&igrave;nh luận</a>&nbsp;</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Những cuộc t&igrave;nh chớp nho&aacute;ng của l&iacute;nh Mỹ với g&aacute;i điếm Việt thường bắt đầu tại qu&aacute;n bar do qu&acirc;n đội bảo k&ecirc;. Sau m&agrave;n l&agrave;m quen bằng bia rượu, họ sẽ đưa c&aacute;c c&ocirc; g&aacute;i về kh&aacute;ch sạn hoặc về nh&agrave; trọ&hellip;</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">S.T</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Loạt ảnh do c&aacute;c ph&oacute;ng vi&ecirc;n quốc tế thực hiện ở miền Nam Việt Nam trước 1975:</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-01.jpg?w=363&amp;h=550\" alt=\"img_1\" width=\"363\" height=\"550\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Ch&acirc;n dung một c&ocirc; g&aacute;i trẻ l&agrave;m nghề b&aacute;n d&acirc;m thời chiến tranh Việt Nam, S&agrave;i G&ograve;n th&aacute;ng 9/1967. Ảnh: Gilles Caron.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-02.jpg?w=363&amp;h=550\" alt=\"img_2\" width=\"363\" height=\"550\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Cảnh t&igrave;nh tứ giữa người l&iacute;nh Mỹ da đen v&agrave; nh&acirc;n t&igrave;nh trong một qu&aacute;n bar ở S&agrave;i G&ograve;n, th&aacute;ng 9/1967. Ảnh: Gilles Caron.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-03.jpg?w=550&amp;h=361\" alt=\"img_3\" width=\"550\" height=\"361\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Trong g&oacute;c của qu&aacute;n bar, một l&iacute;nh Mỹ da trắng đang &ocirc;m eo c&ocirc; g&aacute;i Việt. Ảnh: Gilles Caron.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-04.jpg?w=550&amp;h=348\" alt=\"img_4\" width=\"550\" height=\"347\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Khu&ocirc;n mặt được trang điểm kh&aacute; cẩn thận của một g&aacute;i l&agrave;ng chơi. Ảnh chụp trong qu&aacute;n bar, S&agrave;i G&ograve;n th&aacute;ng 9/1967. Ảnh: Gilles Caron.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-05.jpg?w=550&amp;h=356\" alt=\"img_5\" width=\"550\" height=\"355\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Những cuộc t&igrave;nh chớp nho&aacute;ng của l&iacute;nh Mỹ thường bắt đầu tại c&aacute;c qu&aacute;n bar. Sau m&agrave;n &ldquo;l&agrave;m quen&rdquo; bằng bia rượu, họ sẽ đưa c&aacute;c c&ocirc; g&aacute;i Việt về kh&aacute;ch sạn hoặc về nh&agrave; trọ&hellip; Ảnh: Gilles Caron.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/redsvn-vung-tau-laurie-smith-11.jpg?w=550&amp;h=412\" alt=\"img_6\" width=\"550\" height=\"411\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Một c&ocirc; g&aacute;i điếm khoe th&acirc;n mời ch&agrave;o kh&aacute;ch trong qu&aacute;n bar ở Vũng T&agrave;u năm 1970. Ảnh: Laurie Smith</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-06.jpg?w=367&amp;h=550\" alt=\"img_7\" width=\"367\" height=\"550\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Một c&ocirc; g&aacute;i b&aacute;n d&acirc;m c&ugrave;ng đứa con tại địa điểm h&agrave;nh nghề l&agrave; một khu nh&agrave; lỗ chỗ vết thủng do bom đạn, S&agrave;i G&ograve;n th&aacute;ng 1/1968. Ảnh: Mondatori.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-07.jpg?w=367&amp;h=550\" alt=\"img_8\" width=\"367\" height=\"550\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">C&ocirc; g&aacute;i n&agrave;y chuẩn bị &ldquo;tiếp kh&aacute;ch&rdquo; tr&ecirc;n chiếc giường trong một căn ph&ograve;ng tồi t&agrave;n, S&agrave;i G&ograve;n th&aacute;ng 1/1968. Ảnh: Getty Images. Ảnh: Mondatori.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-08.jpg?w=550&amp;h=366\" alt=\"img_9\" width=\"550\" height=\"365\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">&ldquo;T&uacute; b&agrave;&rdquo; mỉm cười nh&igrave;n một nh&acirc;n vi&ecirc;n trong gi&agrave;n &ldquo;g&aacute;i dịch vụ&rdquo; của m&igrave;nh, th&aacute;ng 1/1970. Ảnh: LIFE.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-09.jpg?w=378&amp;h=550\" alt=\"img_10\" width=\"378\" height=\"549\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Người l&iacute;nh Mỹ c&ugrave;ng bạn g&aacute;i của m&igrave;nh ở Vũng T&agrave;u, th&aacute;ng 4/1969. L&iacute;nh Mỹ đ&oacute;ng qu&acirc;n tại c&aacute;c đ&ocirc; thị ở miền Nam Việt Nam thường t&igrave;m kiếm nh&acirc;n t&igrave;nh tại c&aacute;c qu&aacute;n bar. C&aacute;c mối quan hệ kiểu n&agrave;y được duy tr&igrave; bằng tiền v&agrave; mang t&iacute;nh c&ocirc;ng khai. Ảnh: Ullstein Bild.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-10.jpg?w=550&amp;h=355\" alt=\"img_11\" width=\"550\" height=\"354\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Cuộc trao đổi k&iacute;n đ&aacute;o giữa người l&iacute;nh Mỹ v&agrave; hai c&ocirc; g&aacute;i &ldquo;b&aacute;n hoa&rdquo;. Ảnh: Mondatori</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-15.jpg?w=550&amp;h=367\" alt=\"img_12\" width=\"550\" height=\"366\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Khi rảnh rỗi, l&iacute;nh Mỹ đ&oacute;ng tại c&aacute;c đ&ocirc; thị miền Nam trước 1975 thường t&igrave;m kiếm lạc th&uacute; trong c&aacute;c tụ điểm mại d&acirc;m n&uacute;p b&oacute;ng qu&aacute;n bar, kh&aacute;ch sạn. H&igrave;nh ảnh n&agrave;y chụp tại Cần Thơ năm 1970. Ảnh: Philip Jones Griffiths.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-12.jpg?w=397&amp;h=550\" alt=\"img_13\" width=\"397\" height=\"550\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Những c&ocirc; g&aacute;i b&aacute;n d&acirc;m phục vụ l&iacute;nh Mỹ kh&ocirc;ng h&agrave;nh nghề tự do m&agrave; thường l&agrave; nh&acirc;n vi&ecirc;n của c&aacute;c qu&aacute;n bar. C&ocirc; g&aacute;i n&agrave;y l&agrave;m việc ở qu&aacute;n bar Venus, Cần Thơ năm 1970. Ảnh: Philip Jones Griffiths.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-13.jpg?w=550&amp;h=372\" alt=\"img_14\" width=\"550\" height=\"371\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">B&ecirc;n ngo&agrave;i qu&aacute;n bar Mai Kim ở Cần Thơ, 1970. Ph&iacute;a sau c&aacute;c qu&aacute;n bar phục vụ l&iacute;nh Mỹ l&agrave; sự bảo k&ecirc; từ giới chức qu&acirc;n đội S&agrave;i G&ograve;n. Ảnh: Philip Jones Griffiths.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-14.png?w=392&amp;h=550\" alt=\"img_15\" width=\"392\" height=\"550\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">G&aacute;i l&agrave;ng chơi ph&iacute;a ngo&agrave;i một qu&aacute;n bar ở Cần Thơ, 1970. Ảnh: Philip Jones Griffiths.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-16.jpg?w=550&amp;h=370\" alt=\"img_16\" width=\"550\" height=\"370\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Một c&ocirc; g&aacute;i điếm chờ kh&aacute;ch tại nh&agrave; thổ gần s&acirc;n bay T&acirc;n Sơn Nhất, điểm đến quen thuộc của l&iacute;nh Mỹ, 1973. Ảnh: Ren&eacute; Burri.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-11.jpg?w=550&amp;h=375\" alt=\"img_17\" width=\"550\" height=\"375\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">L&iacute;nh Mỹ m&acirc;y mưa với g&aacute;i nhảy sau một buổi diễn phục vụ qu&acirc;n Mỹ ở Nh&agrave; B&egrave;, ngoại &ocirc; S&agrave;i G&ograve;n 1970. Ảnh: Philip Jones Griffiths</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-17.jpg?w=366&amp;h=550\" alt=\"img_18\" width=\"366\" height=\"550\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Ch&acirc;n dung một g&aacute;i b&aacute;n hoa ở miền Nam Việt Nam năm 1970. Ảnh: Philip Jones Griffiths.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-18.jpg?w=640\" alt=\"img_19\" width=\"353\" height=\"529\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">L&iacute;nh Mỹ đ&ugrave;a giỡn với g&aacute;i điếm trong một t&ograve;a nh&agrave; đổ n&aacute;t ở ngoại &ocirc; S&agrave;i G&ograve;n. Ảnh: Nik Wheeler.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-19.jpg?w=384&amp;h=550\" alt=\"img_20\" width=\"384\" height=\"549\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">L&iacute;nh Mỹ cặp k&egrave; với g&aacute;i nhảy trong một hộp đ&ecirc;m ở S&agrave;i G&ograve;n, th&aacute;ng 3/1968. Ảnh: Warin Vietnam Tumblr.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-20.jpg?w=372&amp;h=550\" alt=\"img_21\" width=\"372\" height=\"550\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">B&ecirc;n cạnh g&aacute;i bar, g&aacute;i nhảy tại c&aacute;c c&aacute;c hộp đ&ecirc;m, vũ trường ở miền Nam trước 1975 cũng l&agrave; đối tượng sẵn s&agrave;ng chiều l&iacute;nh Mỹ tới bến.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://36hn.files.wordpress.com/2016/08/vietnam-war-prostitute-21.jpg?w=367&amp;h=550\" alt=\"img_22\" width=\"367\" height=\"550\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Một c&ocirc; g&aacute;i b&aacute;n hoa với m&aacute;i t&oacute;c d&agrave;i, S&agrave;i G&ograve;n 1968. Ảnh: Mondatori.</div>\r\n</div>\r\n</div>', 0, 0, 1, '2023-05-22 02:58:40', NULL, 'đôi nét về nghành \" mại dâm thời việt nam cộng hòa \"\r\n\r\n', 'https://1.bp.blogspot.com/-UdIjD8oY0WY/XUWHSBHg4mI/AAAAAAAABnY/zr3wgDYTu9Q24oIltT2EvNx-6Fewwg6OgCLcBGAs/s640/67369938_133467581224108_1599633184683720704_n.jpg');
INSERT INTO `post` (`post_id`, `post_title`, `post_content`, `up_vote`, `down_vote`, `user_id`, `created_at`, `updated_at`, `summary`, `post_img`) VALUES
(752, 'Thuyết Tương Đối và lời giải thích về TRỌNG LỰC của Einstein | SAMURICE', '<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Sau những b&agrave;i viết trước, ch&uacute;ng ta đ&atilde; biết rằng con người c&oacute; thể mở rộng địa b&agrave;n v&agrave; trở th&agrave;nh nền văn minh bậc cao bằng c&aacute;ch n&agrave;o. Nhưng đồng thời ta cũng biết rằng c&aacute;i kết ở cuối chặng đường l&agrave; giới hạn về độ gi&atilde;n nở của vũ trụ. Tốc độ &aacute;nh s&aacute;ng l&agrave; giới hạn của vạn vật nhưng kh&ocirc;ng gian đang nở ra với tốc độ c&ograve;n cao hơn thế, cơ hội để lo&agrave;i người c&oacute; thể thực sự chu du khắp mu&ocirc;n nơi kh&ocirc;ng phải l&agrave; khả thi nữa.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<blockquote class=\"cdx-block cdx-pull-quote ng-star-inserted\">\r\n<div class=\"cdx-input cdx-pull-quote__text\" style=\"text-align: center;\"><span style=\"font-size: 14pt;\"><strong>Nhưng c&oacute; đ&uacute;ng kh&ocirc;ng nhỉ?</strong></span></div>\r\n</blockquote>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<h2 id=\"_trng-lc-o-nh-c-0\" class=\"ce-header ce-header--center\" style=\"text-align: center;\"><span style=\"font-size: 14pt;\">Trọng lực - Ảo ảnh của vũ trụ</span></h2>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Trọng lực l&agrave; một kh&aacute;i niệm v&ocirc; c&ugrave;ng quan trọng trong sự tồn tại của vạn vật. Tiếng Việt gọi được th&igrave; n&oacute; c&oacute; nghĩa l&agrave; đ&uacute;ng v&agrave; được mọi người c&ugrave;ng c&ocirc;ng nhận. Kết quả l&agrave; Newton đ&atilde; đ&uacute;ng, c&ocirc;ng thức t&iacute;nh trọng lực của &ocirc;ng c&oacute; thể &aacute;p dụng v&agrave;o mọi thứ v&agrave; sai số gần như kh&ocirc;ng đ&aacute;ng kể. C&ocirc;ng thức trọng lực của Newton đ&uacute;ng tới mức n&oacute; c&ograve;n gi&uacute;p thế giới ph&aacute;t hiện ra sự tồn tại của Neptune v&agrave;o năm 1821.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Tr&iacute; tuệ của Newton l&agrave; kh&ocirc;ng thể b&aacute;c bỏ, sự lỗi lạc đ&oacute; đ&atilde; gi&uacute;p thế giới t&iacute;nh to&aacute;n vũ Trọng Lực với &yacute; niệm như một lực t&aacute;c động trong vật l&yacute;. Nhưng thực tế m&agrave; n&oacute;i, Trọng Lực kh&ocirc;ng phải l&agrave; Lực, v&agrave; trong ph&uacute;t chốc nữa c&aacute;c bạn sẽ hiểu v&igrave; sao.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Được liệt k&ecirc; v&agrave;o danh s&aacute;ch 4 tương t&aacute;c cơ bản của vũ trụ, được định nghĩa l&agrave; c&aacute;c tương t&aacute;c kh&ocirc;ng thể n&agrave;o tối giản hơn trong vũ trụ, Trọng Lực hay Gravity v&agrave; c&aacute;c tương t&aacute;c kh&aacute;c như Điện từ Electromagnetic v&agrave; cặp đ&ocirc;i Tương t&aacute;c mạnh v&agrave; yếu của Hạt Nh&acirc;n l&agrave; xương sống cho vũ trụ. Trong đ&oacute;, Trọng Lực được coi l&agrave; tương t&aacute;c yếu nhất nhưng lại c&oacute; gi&aacute; trị lớn nhất trong hệ quy chiếu vĩ đại của vũ trụ.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Trọng lực l&agrave; chất kết d&iacute;nh đưa cả vũ trụ lại với nhau. N&oacute; l&agrave; thứ gi&uacute;p c&aacute;c h&agrave;nh tinh lơ lửng quanh c&aacute;c ng&ocirc;i sao, l&agrave; thứ gi&uacute;p ch&uacute;ng xoay, l&agrave; thứ gi&uacute;p thủy triều tr&ecirc;n Tr&aacute;i Đất tồn tại v&agrave; ở mức cơ bản nhất, n&oacute; l&agrave; thứ gi&uacute;p Tr&aacute;i Đất đẩy bạn l&ecirc;n&hellip;v&acirc;ng, bạn kh&ocirc;ng bị Tr&aacute;i Đất h&uacute;t, bạn bị Tr&aacute;i Đất đẩy.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Nhưng sao lại l&agrave; đẩy? Chẳng phải Trọng Lực vừa được m&ocirc; tả l&agrave; chất keo d&iacute;nh, nghĩa l&agrave; lực k&eacute;o mọi thứ lại với nhau sao? Hmmm, ban đầu ai cũng nghĩ vậy đ&oacute;. Thậm ch&iacute; l&agrave; Newton cũng vậy, nhưng &ocirc;ng c&oacute; c&aacute;i nh&igrave;n rộng mở hơn rất nhiều về thứ &ldquo;lực&rdquo; n&agrave;y.</div>\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">&nbsp;</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"cdx-block image-tool image-tool--filled image-tool--expanded ng-star-inserted\">\r\n<div class=\"image-tool__image\"><img class=\"image-tool__image-picture ng-star-inserted\" src=\"https://images.spiderum.com/sp-images/8b1361d0068e11eeb2ba3bf3c992df4f.png\" alt=\"img_0\" width=\"1280\" height=\"720\" loading=\"lazy\">\r\n<div class=\"cdx-input image-tool__caption ng-star-inserted\" contenteditable=\"false\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-delimiter cdx-block ng-star-inserted\">&nbsp;</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<h3 id=\"_trng-lc-ca-newt-1\" class=\"ce-header ce-header--center\">&ldquo;Trọng lực&rdquo; của Newton</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">V&agrave;o năm 1684, nh&agrave; To&aacute;n học ki&ecirc;m Vật L&yacute; học Isaac Newton đ&atilde; đề xuất một giải th&iacute;ch về chuyển động của c&aacute;c h&agrave;nh tinh. Trong đ&oacute; Newton đ&atilde; giải th&iacute;ch trọng lực như một &ldquo;LỰC&rdquo; v&agrave; cụ thể th&igrave; đ&oacute; l&agrave; lực hấp dẫn giữa 2 vật c&oacute; trọng lượng dựa tr&ecirc;n khoảng c&aacute;ch giữa 2 vật. Dễ hiểu hơn th&igrave; điều đ&oacute; c&oacute; nghĩa l&agrave; chỉ cần 2 vật c&oacute; c&acirc;n nặng th&igrave; n&oacute; sẽ h&uacute;t nhau, v&agrave; h&uacute;t mạnh hay nhẹ t&ugrave;y v&agrave;o sức nặng của n&oacute; v&agrave; khoảng c&aacute;ch giữa ch&uacute;ng. V&iacute; dụ: Một vật cực kỳ nặng th&igrave; sẽ h&uacute;t mạnh hơn vật cực kỳ nhẹ. Nhưng nếu vật cực kỳ nặng đ&oacute; đứng xa qu&aacute; th&igrave; cũng h&uacute;t vừa vừa th&ocirc;i.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Như mọi l&yacute; thuyết khoa học kh&aacute;c, nếu &aacute;p dụng v&agrave;o thực tế v&agrave; c&oacute; thể t&iacute;nh to&aacute;n ch&iacute;nh x&aacute;c trụ rất ch&iacute;nh x&aacute;c trong hơn 200 năm về sau. Nhưng nếu Newton đ&uacute;ng, Trọng lực l&agrave; một &ldquo;LỰC&rdquo; th&igrave; ch&uacute;ng ta ở đ&acirc;y để l&agrave;m g&igrave;?</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Chuyện l&agrave; c&ocirc;ng thức của Newton đ&uacute;ng, rất đ&uacute;ng&hellip; cho tới khi n&oacute; kh&ocirc;ng đ&uacute;ng nữa. Từ đ&acirc;y, ch&uacute;ng ta đến với b&aacute;c học thứ 2, Einstein.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"cdx-block embed-tool ng-star-inserted\" style=\"text-align: center;\"><iframe class=\"embed-tool__content\" src=\"https://www.youtube.com/embed/IMSiNTK8FeQ\" height=\"320\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe>\r\n<div>&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-delimiter cdx-block ng-star-inserted\">&nbsp;</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<h3 id=\"_einstein-amp-thuy-2\" class=\"ce-header ce-header--center\" style=\"text-align: center;\">Einstein &amp; Thuyết tương đối</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">C&ocirc;ng thức t&iacute;nh trọng lực của Newton đ&uacute;ng với hầu hết mọi thứ trong phạm vi Tr&aacute;i Đất, nhưng khi đưa l&ecirc;n vũ trụ v&agrave; t&iacute;nh đến tương t&aacute;c giữa c&aacute;c h&agrave;nh tinh, c&aacute;c ng&ocirc;i sao, một ch&uacute;t sai số bắt đầu xuất hiện.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Khi c&aacute;c nh&agrave; thi&ecirc;n văn học nh&igrave;n v&agrave;o quỹ đạo của Thủy Tinh, họ thấy c&oacute; sự dịch chuyển bất thường. Trong khi c&aacute;c h&agrave;nh tinh đều c&oacute; quỹ đạo h&igrave;nh Elip quanh Mặt Trời, Thủy Tinh c&oacute; quỹ đạo h&igrave;nh Elip, nhưng quỹ đạo đ&oacute; lại xoay dần theo từng thế kỷ.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">C&aacute;c nh&agrave; khoa học tranh c&atilde;i nhau suốt cả thập kỷ để t&igrave;m c&acirc;u trả lời nhưng kh&ocirc;ng thể c&oacute; được lời giải đ&aacute;p ho&agrave;n thiện nhất. Sau đ&oacute;, Einstein bắt đầu suy nghĩ.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Năm 1905, Einstein đề xuất một giả thuyết mới về tương t&aacute;c trong vũ trụ v&agrave; giả thuyết đ&oacute; c&oacute; t&ecirc;n l&agrave; Thuyết Tương Đối, c&oacute; thể hiểu l&agrave; giả thuyết về tương t&aacute;c giữa c&aacute;c vật c&oacute; trọng lượng trong vũ trụ.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Tại thời điểm đ&oacute;, Einstein vẫn chỉ l&agrave; một nh&agrave; khoa học v&ocirc; danh tiểu tốt, nhưng như c&aacute;ch c&ocirc;ng thức của Newton được đưa v&agrave;o thử th&aacute;ch v&agrave; &aacute;p dụng, l&yacute; thuyết của Einstein cũng thế. V&agrave; dần dần, đại đa số c&aacute;c nh&agrave; khoa học đều phải c&ocirc;ng nhận rằng, Einstein đ&atilde; đ&uacute;ng v&agrave; Thuyết Tương Đối c&ograve;n c&oacute; gi&aacute; trị cao hơn hẳn so với động lực học trong vũ trụ.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<blockquote class=\"cdx-block cdx-pull-quote ng-star-inserted\">\r\n<div class=\"cdx-input cdx-pull-quote__text\">Vậy l&agrave; Einstein đ&uacute;ng v&agrave; Newton sai sao?</div>\r\n<div class=\"cdx-input cdx-pull-quote__caption\">&nbsp;</div>\r\n</blockquote>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Kh&ocirc;ng hẳn. C&ocirc;ng thức của Einstein c&oacute; thể coi l&agrave; phần mở rộng của Newton v&agrave; cũng l&agrave; c&acirc;u trả lời m&agrave; Newton đau đ&aacute;u t&igrave;m kiếm trong suốt đời của &ocirc;ng.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Chuyện l&agrave; khi tạo ra c&ocirc;ng thức tương t&aacute;c trọng lực, Newton vẫn chưa c&oacute; c&aacute;ch để giải th&iacute;ch cặn kẽ nguồn gốc của thứ &ldquo;LỰC&rdquo; m&agrave; &ocirc;ng vừa kh&aacute;m ph&aacute; ra. Theo &ocirc;ng th&igrave; mọi thứ c&oacute; trọng lượng đều hấp dẫn nhau. Nhưng tại sao n&oacute; lại hấp dẫn nhau? C&acirc;u trả lời nằm trong thuyết tương đối của Einstein.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-delimiter cdx-block ng-star-inserted\">&nbsp;</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<h2 id=\"_trng-lc-amp-tac-3\" class=\"ce-header ce-header--center\" style=\"text-align: center;\">Trọng lực &amp; T&aacute;c động với Thời Kh&ocirc;ng</h2>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">C&aacute;ch hiểu dễ nhất về Trọng Lực theo l&yacute; thuyết của Einstein th&igrave; đ&oacute; l&agrave; độ &ldquo;L&Uacute;N&rdquo; của Thời Kh&ocirc;ng khi chịu t&aacute;c động của vật c&oacute; trọng lượng. C&aacute;c bạn nhớ c&aacute;c th&iacute; nghiệm căng một tấm bạt l&ecirc;n rồi để c&aacute;c quả b&oacute;ng nặng v&agrave;o giữa chứ? Đ&oacute; l&agrave; c&aacute;ch Einstein giải th&iacute;ch cho trọng lực. N&oacute; kh&ocirc;ng phải l&agrave; Lực, n&oacute; l&agrave; độ cong, độ l&uacute;n, hoặc độ gi&atilde;n nở của thời kh&ocirc;ng khi bị vật nặng đ&egrave; l&ecirc;n.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Ok, n&oacute;i vậy th&ocirc;i chứ đ&oacute; l&agrave; c&aacute;ch hiểu n&ocirc;m na chứ kh&ocirc;ng hề ch&iacute;nh x&aacute;c 100%. Nhưng c&aacute;c bạn c&oacute; thể d&ugrave;ng c&aacute;ch hiểu đ&oacute; l&agrave;m nền tảng cho c&aacute;c giải th&iacute;ch sau. Bởi v&igrave; kh&aacute;i niệm Thời Kh&ocirc;ng vừa dễ hiểu nhưng lại vừa phức tạp. V&agrave; Einstein d&ugrave;ng n&oacute; l&agrave;m nền tảng để l&yacute; giải cho trọng lực.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Vậy n&ecirc;n để hiểu trọng lực, ch&uacute;ng ta cần hiểu Thời Kh&ocirc;ng. V&agrave; để hiểu Thời Kh&ocirc;ng, ch&uacute;ng ta cần đi v&agrave;o n&atilde;o của Einstein v&agrave; chứng kiến c&aacute;ch &ocirc;ng suy nghĩ khi chứng kiến c&aacute;ch thế giới hoạt động.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">H&atilde;y đặt mọi thứ ch&uacute;ng ta biết l&ecirc;n mặt b&agrave;n đ&atilde; nh&eacute;.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Đầu ti&ecirc;n, theo luật 1 của Newton, mọi thứ c&oacute; trọng lượng đều muốn giữ vững vị tr&iacute; c&acirc;n bằng của n&oacute;. Nghĩa l&agrave; vật đang đứng y&ecirc;n sẽ muốn đứng y&ecirc;n, vật đang di chuyển sẽ muốn giữ vận tốc. Mọi thứ sẽ kh&ocirc;ng di chuyển hoặc thay đổi vận tốc nếu kh&ocirc;ng bị t&aacute;c động bởi lực b&ecirc;n ngo&agrave;i. Đ&acirc;y l&agrave; nền tảng cho qu&aacute;n t&iacute;nh.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Vật c&agrave;ng nặng th&igrave; qu&aacute;n t&iacute;nh c&agrave;ng cao v&agrave; cần nhiều lực để c&oacute; thể di chuyển. Với Newton, một vật kh&ocirc;ng thể bị chuyển động nếu kh&ocirc;ng c&oacute; lực b&ecirc;n ngo&agrave;i t&aacute;c động. Nhưng với Einstein, điều đ&oacute; l&agrave; c&oacute; thể.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Cầm một vật, để l&ecirc;n cao, n&oacute; sẽ c&oacute; thế năng, v&agrave; khi thả ra, kh&ocirc;ng c&oacute; lực n&agrave;o t&aacute;c động l&ecirc;n th&igrave; n&oacute; vẫn cứ rơi. Sự &ldquo;rơi&rdquo; n&agrave;y ch&iacute;nh l&agrave; c&aacute;ch một vật t&igrave;m lại thế c&acirc;n bằng của n&oacute; theo luật của Newton. Nếu rơi m&agrave; kh&ocirc;ng chạm đất, n&oacute; sẽ tiếp tục rơi với vận tốc kh&ocirc;ng đổi, vẫn theo luật của Newton. Nhưng vật n&agrave;y rơi l&agrave; v&igrave; ta thả ra.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<blockquote class=\"cdx-block cdx-pull-quote ng-star-inserted\">\r\n<div class=\"cdx-input cdx-pull-quote__text\">Vậy c&aacute;c h&agrave;nh tinh th&igrave; rơi kiểu g&igrave;?</div>\r\n<div class=\"cdx-input cdx-pull-quote__caption\">&nbsp;</div>\r\n</blockquote>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Quay về v&iacute; dụ về việc căng bạt v&agrave; c&aacute;c quả b&oacute;ng nặng. Khi ch&uacute;ng ta để quả b&oacute;ng nặng v&agrave;o giữa, c&aacute;c quả b&oacute;ng nhẹ kh&aacute;c sẽ bị h&uacute;t v&agrave;o đ&oacute;. C&aacute;c quả b&oacute;ng đang nằm y&ecirc;n tr&ecirc;n bạt bỗng dưng bị h&uacute;t v&agrave;o quả b&oacute;ng nặng hơn m&agrave; kh&ocirc;ng hề c&oacute; lực t&aacute;c động. Vậy l&agrave; vật đứng y&ecirc;n cũng bị di chuyển m&agrave; kh&ocirc;ng cần lực. Vậy vật đang di chuyển muốn giữ vững vận tốc th&igrave; sao? Nếu lấy một quả b&oacute;ng v&agrave; lia tr&ecirc;n tấm bạt đ&atilde; l&uacute;n, ch&uacute;ng ta c&oacute; thể thấy n&oacute; sẽ đi một đường cong h&igrave;nh &ecirc;-l&iacute;p quanh độ l&uacute;n ở giữa.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Th&ocirc;ng qua tương t&aacute;c giữa c&aacute;c quả b&oacute;ng tr&ecirc;n tấm bạt, ch&uacute;ng ta c&oacute; thể hiểu ngay to&agrave;n bộ nguy&ecirc;n l&yacute; di chuyển của c&aacute;c h&agrave;nh tinh v&agrave; c&aacute;c v&igrave; sao trong vũ trụ. Mọi thứ kh&ocirc;ng bị h&uacute;t, v&agrave; n&oacute; cũng chẳng h&uacute;t c&aacute;i g&igrave; kh&aacute;c. N&oacute; thực ra chỉ đang bị &ldquo;rơi&rdquo; về ph&iacute;a vật c&oacute; trọng lượng lớn hơn m&agrave; th&ocirc;i.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Newton kh&ocirc;ng hề sai, chỉ l&agrave; c&ocirc;ng thức của &ocirc;ng kh&ocirc;ng c&oacute; tấm bạt bị căng ra m&agrave; th&ocirc;i. Einstein l&agrave; người đ&atilde; nghĩ tới tấm bạt v&agrave; từ đ&oacute; mọi thứ đ&atilde; được giải th&iacute;ch một c&aacute;ch rất cặn kẽ.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Nhưng chả nhẽ ch&uacute;ng ta sẽ dừng lại ở đ&acirc;y? Để kết luận l&agrave; Newton được Einstein bổ sung v&agrave; giải th&iacute;ch cho thế giới về trọng lực? Kh&ocirc;ng, ch&uacute;ng ta ở đ&acirc;y để kh&aacute;m ph&aacute; thời kh&ocirc;ng m&agrave;, phải kh&ocirc;ng n&agrave;o?</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Vậy th&igrave; tất cả những điều tr&ecirc;n về trọng lực th&igrave; li&ecirc;n quan g&igrave; đến THỜI KH&Ocirc;NG?</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Thực ra, tất cả đều li&ecirc;n quan.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-delimiter cdx-block ng-star-inserted\">&nbsp;</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ng-star-inserted\">\r\n<h2 id=\"_tm-bt-thi-khong-4\" class=\"ce-header ce-header--center\" style=\"text-align: center;\">&ldquo;Tấm bạt&rdquo; Thời Kh&ocirc;ng</h2>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Như ch&uacute;ng ta vừa b&agrave;n ở tr&ecirc;n, mọi vật c&oacute; trọng lượng đều t&aacute;c động l&ecirc;n kh&ocirc;ng gian xung quanh, tạo ra hiệu ứng m&agrave; ta gọi l&agrave; Trọng lực. Điều đ&oacute; c&oacute; nghĩa l&agrave; trong kh&ocirc;ng gian với nhiều vật nặng khổng lồ như c&aacute;c ng&ocirc;i sao, c&aacute;c h&agrave;nh tinh, kh&ocirc;ng gian sẽ lồi l&otilde;m kh&ocirc;ng ngừng nghỉ.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<blockquote class=\"cdx-block cdx-pull-quote ng-star-inserted\">\r\n<div class=\"cdx-input cdx-pull-quote__text\">Kh&ocirc;ng chỉ c&oacute; kh&ocirc;ng gian, thời gian cũng bị &ldquo;bẻ cong&rdquo; như vậy.</div>\r\n<div class=\"cdx-input cdx-pull-quote__caption\">&nbsp;</div>\r\n</blockquote>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Ch&uacute;ng ta c&oacute; quan điểm kh&aacute; cứng nhắc về thời gian, rằng thời gian l&agrave; một c&aacute;i g&igrave; đ&oacute; bất biến. 15 ph&uacute;t l&agrave; 15 ph&uacute;t, 15&rsquo; l&agrave;m việc tương ứng với 15&rsquo; ngồi lướt Tiktok.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Nhưng theo thuyết tương đối của Einstein, thời gian c&oacute; thể bị k&eacute;o d&agrave;i hoặc r&uacute;t ngắn lại.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<blockquote class=\"cdx-block cdx-pull-quote ng-star-inserted\">\r\n<div class=\"cdx-input cdx-pull-quote__text\">Nhưng tại sao lại như vậy?</div>\r\n<div class=\"cdx-input cdx-pull-quote__caption\">&nbsp;</div>\r\n</blockquote>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Trước ti&ecirc;n, h&atilde;y c&ugrave;ng giữ vững quan điểm của Newton, Einstein v&agrave; một nh&agrave; khoa học nữa l&agrave; James Clerk Maxwell. James Clerk Maxwell cho rằng tốc độ của &aacute;nh s&aacute;ng l&agrave; hằng số v&agrave; cho d&ugrave; bạn c&oacute; đứng ở đ&acirc;u, quan s&aacute;t bằng c&aacute;ch n&agrave;o th&igrave; &aacute;nh s&aacute;ng vẫn kh&ocirc;ng thay đổi vận tốc.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Giờ bạn h&atilde;y tưởng tượng t&igrave;nh huống sau, bạn đang đứng trước một đường t&agrave;u, trước mặt bạn c&oacute; con t&agrave;u đi qua v&agrave; c&oacute; 2 tia s&eacute;t đ&aacute;nh c&ugrave;ng 1 l&uacute;c. Th&uacute; vị thay bạn đứng ở ch&iacute;nh giữa 2 tia s&eacute;t.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Ở thời điểm s&eacute;t đ&aacute;nh xuống, bạn sẽ thấy 2 tia s&eacute;t đ&aacute;nh c&ugrave;ng một l&uacute;c, đ&uacute;ng kh&ocirc;ng n&agrave;o? Nhưng nếu bạn đứng tr&ecirc;n t&agrave;u v&agrave; đi qua 2 tia s&eacute;t đ&oacute;, chuyện g&igrave; sẽ xảy ra?</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Mặc d&ugrave; l&agrave; 2 tia s&eacute;t đ&aacute;nh c&ugrave;ng 1 l&uacute;c nhưng v&igrave; bạn đang di chuyển tới tia s&eacute;t gần hơn, vậy n&ecirc;n bạn sẽ thấy tia s&eacute;t đ&oacute; trước. Sau đ&oacute; bạn mới thấy tia s&eacute;t thứ 2.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Nhưng &aacute;nh s&aacute;ng di chuyển với tốc độ l&agrave; hằng số C. Vậy th&igrave; tại sao c&oacute; tia s&eacute;t đ&aacute;nh trước, tia s&eacute;t đ&aacute;nh sau? V&agrave; so s&aacute;nh 2 trải nghiệm từ 2 g&oacute;c nh&igrave;n. Ở ngo&agrave;i, bạn thấy 2 tia s&eacute;t đ&aacute;nh c&ugrave;ng l&uacute;c. Ở tr&ecirc;n t&agrave;u, bạn thấy 2 tia s&eacute;t đ&aacute;nh lệch nhau. Tại sao c&ugrave;ng một sự kiện lại c&oacute; 2 kết quả mặc d&ugrave; cả 2 c&ugrave;ng đ&uacute;ng?</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Tốc độ l&agrave; hằng số, qu&atilde;ng đường giữ nguy&ecirc;n, vậy th&igrave; chỉ c&ograve;n c&oacute; 1 biến số c&oacute; thể thay đổi được v&agrave; đ&oacute; l&agrave; thời gian. Vậy l&agrave; thời gian c&oacute; thể bị co gi&atilde;n, thay đổi t&ugrave;y v&agrave;o tốc độ di chuyển của c&aacute;c vật trong kh&ocirc;ng gian.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Nhưng cũng với tư duy đ&oacute;, Einstein ph&aacute;t hiện ra rằng tốc độ sẽ kh&ocirc;ng l&agrave; g&igrave; nếu kh&ocirc;ng c&oacute; thời gian. V&agrave; ch&uacute;ng ta vẫn chưa bao giờ c&oacute; định nghĩa cụ thể về thời gian. Chả nhẽ ở mọi nơi trong vũ trụ, thời gian đều như nhau sau? 1h ở Tr&aacute;i Đất bằng 1h ở h&agrave;nh tinh n&agrave;o đ&oacute; nằm ngo&agrave;i vũ trụ n&agrave;y? V&agrave; thế l&agrave; Einstein đ&atilde; kết luận rằng, thời gian ở mỗi điểm trong vũ trụ đều gắn liền với vị tr&iacute; của n&oacute;. N&oacute;i c&aacute;ch kh&aacute;c, thời gian v&agrave; kh&ocirc;ng gian l&agrave; 1. V&agrave; ch&uacute;ng ta gọi n&oacute; l&agrave; Thời Kh&ocirc;ng, Spacetime.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Mọi thứ đều di chuyển trong thời kh&ocirc;ng. Kh&ocirc;ng gian v&agrave; thời gian kh&ocirc;ng hoạt động t&aacute;ch biệt m&agrave; ch&uacute;ng thực chất l&agrave; 1.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Thời kh&ocirc;ng bị bẻ cong khi bị vật c&oacute; trọng lượng lớn t&aacute;c động v&agrave;o như Tr&aacute;i Đất khối lượng nhỏ sẽ ng&agrave;y c&agrave;ng tiến về Mặt Trời c&oacute; khối lượng lớn hơn do sự gi&atilde;n nở của kh&ocirc;ng - thời gian.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Vậy n&ecirc;n mọi vật khi di chuyển gần vật c&oacute; trọng lượng lớn đều bị n&oacute; hấp dẫn, kh&ocirc;ng phải v&igrave; n&oacute; muốn lao v&agrave;o vật ấy m&agrave; bởi v&igrave; v&eacute;c tơ chuyển động thẳng của n&oacute; đ&atilde; bị bẻ cong v&igrave; khối lượng khổng lồ kia. V&agrave; v&iacute; dụ r&otilde; nhất l&agrave; th&iacute; nghiệm để quả cầu l&ecirc;n tấm thảm căng m&agrave; ch&uacute;ng ta đ&atilde; nhắc đến.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Trong vũ trụ kh&ocirc;ng cần một lực n&agrave;o t&aacute;c động trực tiếp c&aacute;c h&agrave;nh tinh vẫn c&oacute; thể di chuyển m&atilde;i m&atilde;i, nhưng ch&iacute;nh sự uốn cong của kh&ocirc;ng - thời gian đ&atilde; tạo ra quỹ đạo của c&aacute;c ng&ocirc;i sao m&agrave; ta quan s&aacute;t được.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">To&agrave;n bộ kiến thức về Thời Kh&ocirc;ng thực sự rất khổng lồ v&agrave; b&agrave;i viết ngắn như thế n&agrave;y kh&ocirc;ng thể n&oacute;i hết một c&aacute;ch cặn kẽ v&agrave; chi tiết về Thời Kh&ocirc;ng, về Trọng Lực được. Vậy n&ecirc;n c&aacute;c bạn h&atilde;y coi như đ&acirc;y l&agrave; điểm khởi đầu để ch&uacute;ng ta c&oacute; th&ecirc;m c&aacute;c cuộc b&agrave;n luận về thời kh&ocirc;ng, về thuyết tương đối của Einstein v&agrave; sự chuyển dịch của vũ trụ.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Nhưng cũng từ đ&acirc;y ch&uacute;ng ta c&oacute; thể bắt đầu đặt c&acirc;u hỏi, nếu thời gian v&agrave; kh&ocirc;ng gian l&agrave; 1 v&agrave; ch&uacute;ng ta c&oacute; thể tiến v&agrave; l&ugrave;i trong kh&ocirc;ng gian được&hellip; vậy c&oacute; lẽ n&agrave;o ch&uacute;ng ta cũng c&oacute; thể tiến v&agrave; l&ugrave;i trong thời gian? Đ&oacute; sẽ l&agrave; c&acirc;u hỏi m&agrave; số tiếp theo của C&acirc;u chuyện ngo&agrave;i vũ trụ ch&uacute;ng ta c&ugrave;ng kh&aacute;m ph&aacute;.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--justify ng-star-inserted\">Cảm ơn mọi người đ&atilde; lắng nghe, v&agrave; hẹn gặp lại trong tập tiếp theo của h&agrave;nh tr&igrave;nh kh&aacute;m ph&aacute; vũ trụ.</div>\r\n</div>\r\n</div>\r\n<div class=\"ce-block ng-star-inserted\">\r\n<div class=\"ce-block__content\">\r\n<div class=\"ce-paragraph cdx-block ce-paragraph--left ng-star-inserted\">Peace!</div>\r\n</div>\r\n</div>', 2, 0, 53, '2023-06-09 09:48:19', NULL, 'Nếu không gian nở rộng nhanh hơn tốc độ ánh sáng, vậy chúng ta cần phải tìm cách thao túng không gian thì mới có cơ hội vượt biên vũ trụ phải không?\r\n\r\n', 'https://images.spiderum.com/sp-images/8b1361d0068e11eeb2ba3bf3c992df4f.png');

-- --------------------------------------------------------

--
-- Table structure for table `post_seq`
--

CREATE TABLE `post_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_seq`
--

INSERT INTO `post_seq` (`next_val`) VALUES
(851);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `report_reason` varchar(10000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `report_reason`, `user_id`, `post_id`, `created_at`) VALUES
(202, 'bài viết vớ vẩn\r\n                    ', 1, 503, '2023-04-26 18:50:17'),
(302, 'bull shit\r\n                    ', 152, 503, '2023-05-13 23:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `report_seq`
--

CREATE TABLE `report_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_seq`
--

INSERT INTO `report_seq` (`next_val`) VALUES
(451);

-- --------------------------------------------------------

--
-- Table structure for table `report_user`
--

CREATE TABLE `report_user` (
  `id` int(11) NOT NULL,
  `user_report` int(11) DEFAULT NULL,
  `user_be_report` int(11) DEFAULT NULL,
  `reason` varchar(10000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_user`
--

INSERT INTO `report_user` (`id`, `user_report`, `user_be_report`, `reason`, `created_at`) VALUES
(252, 1, 53, 'thằng này giả mạo em\r\n                    ', '2023-04-28 14:29:52'),
(302, 53, 152, 'dmm\r\n                    ', '2023-05-13 23:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `report_user_seq`
--

CREATE TABLE `report_user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_user_seq`
--

INSERT INTO `report_user_seq` (`next_val`) VALUES
(401);

-- --------------------------------------------------------

--
-- Table structure for table `savepost`
--

CREATE TABLE `savepost` (
  `created_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `save_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `savepost`
--

INSERT INTO `savepost` (`created_at`, `save_id`, `post_id`, `user_id`) VALUES
('2023-04-28 23:20:40', 1, 552, 1),
('2023-04-30 23:40:58', 52, 2, 1),
('2023-06-07 10:26:04', 152, 652, 1),
('2023-06-14 22:44:18', 202, 1, 53),
('2023-06-14 23:04:15', 203, 503, 1);

-- --------------------------------------------------------

--
-- Table structure for table `savepost_seq`
--

CREATE TABLE `savepost_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `savepost_seq`
--

INSERT INTO `savepost_seq` (`next_val`) VALUES
(301);

-- --------------------------------------------------------

--
-- Table structure for table `spring_session`
--

CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `spring_session`
--

INSERT INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
('8deff20f-76af-454e-a561-002336332b4b', '18e6f4e6-e0da-4a07-af75-646deed89d0a', 1687272224683, 1687277596082, 1800, 1687279396082, 'kingofthedeath098@gmail.com'),
('e2aaa777-f149-42e8-b284-c28cfb3c528d', '359472ce-0d8d-466a-96e7-ac2ec4bb2908', 1687271999804, 1687276107804, 1800, 1687277907804, 'ducnmhe163139@fpt.edu.vn');

-- --------------------------------------------------------

--
-- Table structure for table `spring_session_attributes`
--

CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `spring_session_attributes`
--

INSERT INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
('8deff20f-76af-454e-a561-002336332b4b', 'email', 0xaced000574001b6b696e676f66746865646561746830393840676d61696c2e636f6d),
('8deff20f-76af-454e-a561-002336332b4b', 'SPRING_SECURITY_CONTEXT', 0xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c00000000000002580200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000002580200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000002580200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000541444d494e7871007e000d70740003313233737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000002580200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657374000f4c6a6176612f7574696c2f5365743b4c000870617373776f726471007e000f4c0008757365726e616d6571007e000f787001010101737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e000a737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000258020000787077040000000171007e00107874003c243261243130247439376a69737639423253312f744d2e794e534a6775636f427476515634556c3033506c7a4d74374b354a736830736c524b36626974001b6b696e676f66746865646561746830393840676d61696c2e636f6d),
('8deff20f-76af-454e-a561-002336332b4b', 'userAuthor', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000005),
('8deff20f-76af-454e-a561-002336332b4b', 'userID', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000001),
('8deff20f-76af-454e-a561-002336332b4b', 'userImg', 0xaced0005740049687474703a2f2f7265732e636c6f7564696e6172792e636f6d2f6467736c71756c74772f696d6167652f75706c6f61642f76313638343732363033352f6d792d696d6167652e6a7067),
('8deff20f-76af-454e-a561-002336332b4b', 'userName', 0xaced000574000561646d696e),
('8deff20f-76af-454e-a561-002336332b4b', 'userPass', 0xaced000574003c243261243130247439376a69737639423253312f744d2e794e534a6775636f427476515634556c3033506c7a4d74374b354a736830736c524b366269),
('e2aaa777-f149-42e8-b284-c28cfb3c528d', 'email', 0xaced00057400186475636e6d6865313633313339406670742e6564752e766e),
('e2aaa777-f149-42e8-b284-c28cfb3c528d', 'SPRING_SECURITY_CONTEXT', 0xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c00000000000002580200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000002580200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000002580200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b7870740004555345527871007e000d70740003313233737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000002580200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657374000f4c6a6176612f7574696c2f5365743b4c000870617373776f726471007e000f4c0008757365726e616d6571007e000f787001010101737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e000a737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000258020000787077040000000171007e00107874003c24326124313024664d4b73516d5a5433527a324133634835732e344e2e4774336c6b52784d462f57784774536d6c737641506d79354b4733623371477400186475636e6d6865313633313339406670742e6564752e766e),
('e2aaa777-f149-42e8-b284-c28cfb3c528d', 'SPRING_SECURITY_SAVED_REQUEST', 0xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e7361766564726571756573742e44656661756c74536176656452657175657374000000000000025802000f49000a736572766572506f72744c000b636f6e74657874506174687400124c6a6176612f6c616e672f537472696e673b4c0007636f6f6b6965737400154c6a6176612f7574696c2f41727261794c6973743b4c00076865616465727374000f4c6a6176612f7574696c2f4d61703b4c00076c6f63616c657371007e00024c001c6d61746368696e6752657175657374506172616d657465724e616d6571007e00014c00066d6574686f6471007e00014c000a706172616d657465727371007e00034c000870617468496e666f71007e00014c000b7175657279537472696e6771007e00014c000a7265717565737455524971007e00014c000a7265717565737455524c71007e00014c0006736368656d6571007e00014c000a7365727665724e616d6571007e00014c000b736572766c65745061746871007e0001787000001f40740000737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000002770400000002737200396f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e7361766564726571756573742e5361766564436f6f6b696500000000000002580200084900066d61784167655a000673656375726549000776657273696f6e4c0007636f6d6d656e7471007e00014c0006646f6d61696e71007e00014c00046e616d6571007e00014c00047061746871007e00014c000576616c756571007e00017870ffffffff0000000000707074000d496465612d34646363653462397074002436356236663831392d323139372d343631362d613038642d6131623230383336316632617371007e0008ffffffff0000000000707074000753455353494f4e707400304e6a59325a544a6c4f5441744d6d566d4d4330304e4467304c574a6d5a544d74596d59784d546c6c595459774d6a677878737200116a6176612e7574696c2e547265654d61700cc1f63e2d256ae60300014c000a636f6d70617261746f727400164c6a6176612f7574696c2f436f6d70617261746f723b78707372002a6a6176612e6c616e672e537472696e672443617365496e73656e736974697665436f6d70617261746f7277035c7d5c50e5ce02000078707704000000117400066163636570747371007e000600000001770400000001740087746578742f68746d6c2c6170706c69636174696f6e2f7868746d6c2b786d6c2c6170706c69636174696f6e2f786d6c3b713d302e392c696d6167652f617669662c696d6167652f776562702c696d6167652f61706e672c2a2f2a3b713d302e382c6170706c69636174696f6e2f7369676e65642d65786368616e67653b763d62333b713d302e377874000f6163636570742d656e636f64696e677371007e000600000001770400000001740011677a69702c206465666c6174652c2062727874000f6163636570742d6c616e67756167657371007e00060000000177040000000174003876692d564e2c76693b713d302e392c66722d46523b713d302e382c66723b713d302e372c656e2d55533b713d302e362c656e3b713d302e357874000d63616368652d636f6e74726f6c7371007e0006000000017704000000017400096d61782d6167653d307874000a636f6e6e656374696f6e7371007e00060000000177040000000174000a6b6565702d616c69766578740006636f6f6b69657371007e00060000000177040000000174006c496465612d34646363653462393d36356236663831392d323139372d343631362d613038642d6131623230383336316632613b2053455353494f4e3d4e6a59325a544a6c4f5441744d6d566d4d4330304e4467304c574a6d5a544d74596d59784d546c6c595459774d6a677878740004686f73747371007e00060000000177040000000174000e6c6f63616c686f73743a3830303078740007726566657265727371007e00060000000177040000000174002b68747470733a2f2f6c6f63616c686f73743a383030302f736561726368557365724279557365724e616d65787400097365632d63682d75617371007e000600000001770400000001740040224e6f742e412f4272616e64223b763d2238222c20224368726f6d69756d223b763d22313134222c2022476f6f676c65204368726f6d65223b763d2231313422787400107365632d63682d75612d6d6f62696c657371007e0006000000017704000000017400023f30787400127365632d63682d75612d706c6174666f726d7371007e0006000000017704000000017400092257696e646f7773227874000e7365632d66657463682d646573747371007e000600000001770400000001740008646f63756d656e747874000e7365632d66657463682d6d6f64657371007e0006000000017704000000017400086e617669676174657874000e7365632d66657463682d736974657371007e00060000000177040000000174000b73616d652d6f726967696e7874000e7365632d66657463682d757365727371007e0006000000017704000000017400023f3178740019757067726164652d696e7365637572652d72657175657374737371007e000600000001770400000001740001317874000a757365722d6167656e747371007e00060000000177040000000174006f4d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f3131342e302e302e30205361666172692f3533372e333678787371007e000600000006770400000006737200106a6176612e7574696c2e4c6f63616c657ef811609c30f9ec03000649000868617368636f64654c0007636f756e74727971007e00014c000a657874656e73696f6e7371007e00014c00086c616e677561676571007e00014c000673637269707471007e00014c000776617269616e7471007e00017870ffffffff740002564e71007e0005740002766971007e000571007e0005787371007e0048ffffffff71007e000571007e000571007e004b71007e000571007e0005787371007e0048ffffffff740002465271007e0005740002667271007e000571007e0005787371007e0048ffffffff71007e000571007e000571007e004f71007e000571007e0005787371007e0048ffffffff740002555371007e0005740002656e71007e000571007e0005787371007e0048ffffffff71007e000571007e000571007e005371007e000571007e00057878740008636f6e74696e75657400034745547371007e000f70770400000001740006757365724964757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b470200007870000000017400013178707400087573657249643d3174000f2f73656c656374557365724368617474002568747470733a2f2f6c6f63616c686f73743a383030302f73656c656374557365724368617474000568747470737400096c6f63616c686f737474000f2f73656c6563745573657243686174),
('e2aaa777-f149-42e8-b284-c28cfb3c528d', 'userAuthor', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000001),
('e2aaa777-f149-42e8-b284-c28cfb3c528d', 'userID', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000035),
('e2aaa777-f149-42e8-b284-c28cfb3c528d', 'userImg', 0xaced0005740049687474703a2f2f7265732e636c6f7564696e6172792e636f6d2f6467736c71756c74772f696d6167652f75706c6f61642f76313638363330363731382f6d792d696d6167652e6a7067),
('e2aaa777-f149-42e8-b284-c28cfb3c528d', 'userName', 0xaced000574000b4d696e6820c490e1bba963),
('e2aaa777-f149-42e8-b284-c28cfb3c528d', 'userPass', 0xaced000574003c24326124313024664d4b73516d5a5433527a324133634835732e344e2e4774336c6b52784d462f57784774536d6c737641506d79354b473362337147);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_banned` int(11) DEFAULT 0,
  `user_author` int(11) DEFAULT NULL,
  `user_description` varchar(10000) DEFAULT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `user_date_of_birth` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_Notification` int(11) NOT NULL DEFAULT 0,
  `number_follower` int(11) NOT NULL DEFAULT 0,
  `admin_Notification` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_banned`, `user_author`, `user_description`, `user_img`, `user_date_of_birth`, `email`, `user_Notification`, `number_follower`, `admin_Notification`) VALUES
(1, 'admin', 'kingofthedeath098@gmail.com', '$2a$10$t97jisv9B2S1/tM.yNSJgucoBtvQV4Ul03PlzMt7K5Jsh0slRK6bi', 0, 5, 'i am the admin of this page and who created it', 'http://res.cloudinary.com/dgslqultw/image/upload/v1684726035/my-image.jpg', '2002-11-28 15:03:00', 'admin@gmail.com', 0, 0, 0),
(53, 'Minh Đức', 'ducnmhe163139@fpt.edu.vn', '$2a$10$fMKsQmZT3Rz2A3cH5s.4N.Gt3lkRxMF/WxGtSmlsvAPmy5KG3b3qG', 0, 1, 'tôi tên là đức 1 tài khoản khác của admin website này ', 'http://res.cloudinary.com/dgslqultw/image/upload/v1686306718/my-image.jpg', '2001-02-03 16:56:00', NULL, 0, 1, 0),
(152, 'tak', 'NguyenDuc098660@gmail.com', '123', 0, 1, 'just some guy on the internet', 'http://res.cloudinary.com/dgslqultw/image/upload/v1683561067/my-image.jpg', '2023-03-09 17:48:00', NULL, 0, 0, 0),
(202, 'abcd1234', 'anndha160101@fpt.edu.vn', 'FZtOMV9MYK', 0, 1, NULL, '/img/alexia.jpg', NULL, NULL, 0, 0, 0),
(402, 'thedead', 'duc@gmail.com', '$2a$10$OGggJ1u.k.K0GCdC/GSB/eIARfux5Lh2LanB4I0rDt7Mr.aY3K6rW', 0, 1, '', 'http://res.cloudinary.com/dgslqultw/image/upload/v1684342487/my-image.jpg', '2023-05-02 23:26:00', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_seq`
--

CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_seq`
--

INSERT INTO `user_seq` (`next_val`) VALUES
(501);

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `upvote` varchar(255) DEFAULT NULL,
  `vote_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vote`
--

INSERT INTO `vote` (`user_id`, `post_id`, `upvote`, `vote_id`) VALUES
(53, 503, 'up', 703),
(53, 552, 'up', 802),
(53, 2, 'up', 852),
(53, 52, 'up', 853),
(1, 52, 'up', 854),
(1, 503, 'up', 1102),
(152, 503, 'up', 1152),
(152, 552, 'up', 1202),
(1, 552, 'up', 1252),
(53, 652, 'up', 1302),
(202, 1, 'down', 1304),
(1, 1, 'up', 1452),
(1, 2, 'up', 1502),
(53, 752, 'up', 1552),
(1, 752, 'up', 1602),
(53, 1, 'up', 1652);

-- --------------------------------------------------------

--
-- Table structure for table `vote_seq`
--

CREATE TABLE `vote_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vote_seq`
--

INSERT INTO `vote_seq` (`next_val`) VALUES
(1751);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `cate_post`
--
ALTER TABLE `cate_post`
  ADD PRIMARY KEY (`post_id`,`category_id`) USING BTREE,
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `chatroom`
--
ALTER TABLE `chatroom`
  ADD PRIMARY KEY (`chat_room_id`),
  ADD KEY `sender` (`sender_id`),
  ADD KEY `receiver` (`receiver_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `postid` (`post_id`),
  ADD KEY `userid` (`user_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`follow_id`) USING BTREE;

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `chat_room` (`chat_room_id`),
  ADD KEY `sender-mess` (`sender_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `FKmar2ob79rtof49ypqhkdue71v` (`notification_receiver_id`),
  ADD KEY `đấ` (`user_relate`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `report_user`
--
ALTER TABLE `report_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userReport` (`user_report`),
  ADD KEY `userBeReport` (`user_be_report`);

--
-- Indexes for table `savepost`
--
ALTER TABLE `savepost`
  ADD PRIMARY KEY (`save_id`) USING BTREE,
  ADD KEY `FK92ss2xmge0r34ml5bbwp14k0w` (`post_id`),
  ADD KEY `FKlicmfv8ijehaw9x3y0hlane27` (`user_id`);

--
-- Indexes for table `spring_session`
--
ALTER TABLE `spring_session`
  ADD PRIMARY KEY (`PRIMARY_ID`),
  ADD UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  ADD KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  ADD KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`);

--
-- Indexes for table `spring_session_attributes`
--
ALTER TABLE `spring_session_attributes`
  ADD PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`vote_id`) USING BTREE,
  ADD KEY `post` (`post_id`),
  ADD KEY `user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `chatroom`
--
ALTER TABLE `chatroom`
  MODIFY `chat_room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=953;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1058;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1254;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=753;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=354;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `vote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1653;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cate_post`
--
ALTER TABLE `cate_post`
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE;

--
-- Constraints for table `chatroom`
--
ALTER TABLE `chatroom`
  ADD CONSTRAINT `receiver` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sender` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `postid` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `chat_room` FOREIGN KEY (`chat_room_id`) REFERENCES `chatroom` (`chat_room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sender-mess` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FKmar2ob79rtof49ypqhkdue71v` FOREIGN KEY (`notification_receiver_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `đấ` FOREIGN KEY (`user_relate`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_user`
--
ALTER TABLE `report_user`
  ADD CONSTRAINT `userBeReport` FOREIGN KEY (`user_be_report`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userReport` FOREIGN KEY (`user_report`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `savepost`
--
ALTER TABLE `savepost`
  ADD CONSTRAINT `FK92ss2xmge0r34ml5bbwp14k0w` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  ADD CONSTRAINT `FKlicmfv8ijehaw9x3y0hlane27` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `spring_session_attributes`
--
ALTER TABLE `spring_session_attributes`
  ADD CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE;

--
-- Constraints for table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `post` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
