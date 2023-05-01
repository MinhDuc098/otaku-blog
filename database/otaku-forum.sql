-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2023 at 05:08 AM
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
(552, 14);

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
(802, 'test nofitication sort', NULL, 1, 503, '2023-04-30 07:41:02', NULL);

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
(901);

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
(1, 53, 502),
(1, 102, 552),
(152, 1, 652),
(152, 53, 702),
(53, 1, 752),
(53, 152, 802);

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
(901);

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
(551);

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
(1, 'Test1', 'The blog_posts table has columns to store the title, author, publication date, and category of each blog post. The id column is an auto-incrementing primary key that uniquely identifies each blog post. The category_id column is a foreign key that references the id column of the categories table (assuming you have a separate table to store the categories that each blog post belongs to). The blog_content table has columns to store the actual content of each blog post, including any images. The id column is an auto-incrementing primary key that uniquely identifies each row in the table. The post_id column is a foreign key that references the id column of the blog_posts table, indicating which blog post the content belongs to. The content column stores the actual content of the blog post, including any HTML code for images or other media.', 2, 0, 1, '2023-04-10 09:56:21', '2023-04-10 09:56:21', 'something to test', '/img/tohsaka.jpg'),
(2, 'Test version 2', '<div>B&agrave;i tiểu luận bắt đầu bằng một tr&iacute;ch dẫn của Feynman rằng &ocirc;ng ấy vẫn cảm thấy bất an về sự thiếu trực quan rằng tại sao cơ chế lượng tử lại nhất qu&aacute;n - nhưng cũng mường tượng rằng sau 2 thế hệ, con người sẽ cảm thấy thoải m&aacute;i hơn về cơ chế lượng tử, nhận ra rằng sự nhất qu&aacute;n đ&oacute; l&agrave; hiển nhi&ecirc;n. Chắc chắn l&agrave; t&ocirc;i đ&atilde; hiểu được điều đ&oacute;.</div>\r\n<div>Giờ th&igrave;, như những g&igrave; t&ocirc;i đ&atilde; từng l&agrave;m rất nhiều lần trước đ&acirc;y, Nielsen kh&ocirc;ng đồng &yacute; với việc khẳng định rằng \"sự chồng chấp lượng tử của 2 trạng th&aacute;i c&oacute; nghĩa l&agrave; vật thể đồng thời tồn tại ở 2 trạng th&aacute;i đ&oacute;\". Trong v&iacute; dụ nổi tiếng nhất, con m&egrave;o của Schr&ouml;dinger thường được hiểu rằng n&oacute; \"vừa sống vừa (v&agrave;) chết\". Đ&oacute; l&agrave; thứ m&agrave; Nielsen gọi l&agrave; \"c&aacute;ch hiểu kiểu salad từ về cơ chế lượng tử\", một cụm từ m&agrave; g&acirc;y ra thiệt hại c&ograve;n lớn hơn c&aacute;i gi&aacute; phải trả để bạn c&oacute; thể đọc được b&agrave;i viết của &ocirc;ng ấy.</div>\r\n<div>Trong thực tế, con m&egrave;o của Schr&ouml;dinger vẫn chỉ \"sống HOẶC chết\", từ \"HOẶC\" (OR) vẫn ch&iacute;nh x&aacute;c hơn nhiều so với từ \"V&Agrave;\", trong khi đ&oacute; cơ chế lượng tử gi&uacute;p ch&uacute;ng ta dự đo&aacute;n được x&aacute;c suất của \"sống\" v&agrave; \"chết\" cũng như c&aacute;c gi&aacute; trị kh&aacute;c c&oacute; thể quan s&aacute;t được m&agrave; kh&ocirc;ng li&ecirc;n quan tới lượng tử nhị nguy&ecirc;n sống/chết. \"HOẶC\" ch&iacute;nh x&aacute;c hơn \"V&Agrave;\" - nhưng bạn phải loại bỏ c&aacute;i suy nghĩ rằng việc sử dụng từ \"HOẶC\" đồng nghĩa với sự tồn tại của một thực tế kh&aacute;ch quan (v&agrave; c&acirc;u trả lời kh&aacute;ch quan cho c&acirc;u hỏi về sống/chết) trong mọi khoảnh khắc.</div>\r\n<div>Thay v&agrave;o đ&oacute;, \"HOẶC\" l&agrave; một dạng ph&eacute;p cộng logic n&agrave;o đ&oacute;, một ph&eacute;p t&iacute;nh c&oacute; khuynh hướng cộng th&ecirc;m gi&aacute; trị sự thật (0/1) hoặc x&aacute;c suất (x&aacute;c suất chỉ l&agrave; gi&aacute; trị kỳ vọng của gi&aacute; trị sự thật). Khi c&oacute; một số gi&aacute; trị c&oacute; x&aacute;c suất kh&aacute;c 0, điều đ&oacute; c&oacute; nghĩa l&agrave; người quan s&aacute;t kh&ocirc;ng biết c&acirc;u trả lời ch&iacute;nh x&aacute;c.</div>\r\n<div>Cụ thể l&agrave;, Nielsen đ&atilde; nhận định ch&iacute;nh x&aacute;c rằng c&aacute;ch hiểu th&ocirc;ng dụng kia thường được diễn giải cho người mới nhập m&ocirc;n nhưng ngay cả những nh&agrave; vật l&yacute; học chuy&ecirc;n nghiệp cũng hiểu diều đ&oacute; theo \"đ&uacute;ng nghĩa đen\", mặc d&ugrave; c&aacute;ch hiểu đ&oacute; kh&ocirc;ng ch&iacute;nh x&aacute;c cũng như kh&ocirc;ng đ&uacute;ng về mặt đạo đức. C&aacute;ch hiểu kh&ocirc;ng ch&iacute;nh x&aacute;c ở đ&acirc;y c&oacute; nghĩa l&agrave; sự kh&ocirc;ng ch&iacute;nh x&aacute;c của những kết luận cụ thể được đưa ra th&ocirc;ng qua c&aacute;ch nghĩ đ&oacute;.</div>', 2, 0, 1, '2023-04-10 09:56:22', '2023-04-10 09:56:22', NULL, '/img/tohsaka.jpg'),
(52, 'Test version 3', '<div>với tổng tr&ecirc;n <em>x&nbsp;</em>đi qua tất cả c&aacute;c nh&aacute;nh đường của \"người b&aacute;n h&agrave;ng\" cho ph&eacute;p cơ chế lượng tử giải \"b&agrave;i to&aacute;n người b&aacute;n h&agrave;ng\" (b&agrave;i to&aacute;n chọn đường đi ngắn nhất đi qua tất cả c&aacute;c th&agrave;nh phố: tham khảo <a href=\"https://spiderum.com/\" target=\"_blank\" rel=\"noopener noreferrer\">kaggle.com</a> để t&igrave;m hiểu về một cuộc thi đang diễn ra c&oacute; dạng như vậy) một c&aacute;ch nhanh ch&oacute;ng.</div>\r\n<div>Theo c&aacute;ch n&agrave;y, những người hiểu theo kiểu salad từ tưởng rằng, trạng th&aacute;i lượng tử chứa \"nhiều th&ocirc;ng tin cổ điển hơn\" trạng th&aacute;i cổ điển của ch&iacute;nh vật đ&oacute;. V&agrave; một người c&oacute; thể sử dụng &iacute;t ph&eacute;p t&iacute;nh hơn - v&iacute; dụ, nếu <em>f(x)</em> được chọn theo độ d&agrave;i của nh&aacute;nh đường, ch&uacute;ng ta c&oacute; thể nhấn mạnh những th&agrave;nh phần của h&agrave;m số s&oacute;ng tương đương với con đường ngắn nhất - v&agrave; do đ&oacute; giải b&agrave;i to&aacute;n người b&aacute;n h&agrave;ng với tốc độ nhanh lũy thừa cứ như thể m&aacute;y t&iacute;nh lượng tử giống như m&aacute;y t&iacute;nh song song.</div>\r\n<div>Nhưng Nielsen rất hiểu về t&iacute;nh to&aacute;n lượng tử - đ&oacute; l&agrave; v&igrave; sao &ocirc;ng ấy kh&ocirc;ng chỉ c&oacute; thể n&oacute;i bạn rằng điều đ&oacute; l&agrave; bất khả thi m&agrave; c&ograve;n cho bạn một <a href=\"https://arxiv.org/abs/quant-ph/9701001\" target=\"_blank\" rel=\"nofollow noopener noindex noreferrer\">b&agrave;i nghi&ecirc;n cứu cực k&igrave; chi tiết</a> diễn giải sự bất khả thi của việc \"sử dụng m&aacute;y t&iacute;nh lượng tử như một hệ thống m&aacute;y t&iacute;nh song song\".</div>\r\n<div>Những b&agrave;i nghi&ecirc;n cứu nặng chuy&ecirc;n m&ocirc;n như vậy c&oacute; thể sẽ rất th&uacute; vị nhưng t&ocirc;i tin rằng sai lầm của những người hiểu theo kiểu salad từ c&oacute; t&iacute;nh chất cơ bản hơn rất nhiều. Họ đơn giản l&agrave; tưởng rằng h&agrave;m số s&oacute;ng l&agrave; s&oacute;ng cổ điển - v&igrave; vậy tất cả bi&ecirc;n độ x&aacute;c suất phức (hệ số của c&aacute;c số hạng kh&aacute;c nhau trong h&agrave;m số s&oacute;ng) l&agrave; một dạng \"dữ liệu cổ điển kh&aacute;ch quan\" n&agrave;o đ&oacute;. C&oacute; một số lượng lũy thừa c&aacute;c số hạng như thế - với <em>N</em> qubits, bạn c&oacute; <em>2^N</em> bi&ecirc;n độ phức - v&agrave; ch&uacute;ng c&oacute; thể được biến đổi như thể một số lượng lũy thừa c&aacute;c dữ liệu cổ điển. V&agrave; đ&oacute; l&agrave; v&igrave; sao bạn c&oacute; thể thử tất cả c&aacute;c nh&aacute;nh đường c&ugrave;ng một l&uacute;c v&agrave; giải quyết b&agrave;i to&aacute;n một c&aacute;ch hiệu quả.</div>\r\n<div>Ngoại trừ việc l&agrave; bạn kh&ocirc;ng thể l&agrave;m điều đ&oacute;. Đơn giản l&agrave; việc cho rằng bi&ecirc;n độ x&aacute;c suất phức l&agrave; \"dữ liệu cổ điển kh&aacute;ch quan\" hoặc, tương đương rằng, h&agrave;m số s&oacute;ng l&agrave; một s&oacute;ng cổ điển, l&agrave; sai lầm. Cụ thể l&agrave;, theo định nghĩa của ch&uacute;ng, những bi&ecirc;n độ x&aacute;c suất đ&oacute; gần gũi với những x&aacute;c suất b&igrave;nh thường trong ph&acirc;n phối x&aacute;c suất m&agrave; đ&atilde; tồn tại trong vật l&yacute; cổ điển hơn rất nhiều, khi m&agrave; c&oacute; sự bất định tồn tại.</div>\r\n<div>V&agrave; việc x&aacute;c suất m&atilde; h&oacute;a sự thiếu th&ocirc;ng tin của ch&uacute;ng ta về trạng th&aacute;i của một vật hoặc một hệ thống vật l&yacute; rất kh&aacute;c so với \"dữ liệu cổ điển m&agrave; ch&uacute;ng ta nắm r&otilde;\". Cụ thể l&agrave;, sự khai triển của dữ liệu cổ điển dường như ho&agrave;n to&agrave;n l&agrave; chủ quan. Nếu như bạn m&ocirc; tả một h&agrave;nh tinh theo h&agrave;m số tọa độ của ch&uacute;ng <em>x_j(t)</em>, th&igrave; c&oacute; thể hiểu được rằng vũ trụ đ&atilde; khai triển h&agrave;m số theo thời gian đ&oacute; theo phương tr&igrave;nh vi ph&acirc;n, gần như kh&ocirc;ng phải tuyến t&iacute;nh, tổng qu&aacute;t nhất - sự khai triển đ&oacute; c&ograve;n thậm ch&iacute; c&oacute; thể tổng qu&aacute;t hơn cả thứ được gọi l&agrave; phương tr&igrave;nh vi ph&acirc;n.</div>', 2, 0, 1, '2023-04-10 08:27:40', '2023-04-10 08:27:40', NULL, '/img/tohsaka.jpg'),
(252, 'Phải chăng bạn đang hiểu sai về vật lý lượng tử?', '<div>B&agrave;i tiểu luận bắt đầu bằng một tr&iacute;ch dẫn của Feynman rằng &ocirc;ng ấy vẫn cảm thấy bất an về sự thiếu trực quan rằng tại sao cơ chế lượng tử lại nhất qu&aacute;n - nhưng cũng mường tượng rằng sau 2 thế hệ, con người sẽ cảm thấy thoải m&aacute;i hơn về cơ chế lượng tử, nhận ra rằng sự nhất qu&aacute;n đ&oacute; l&agrave; hiển nhi&ecirc;n. Chắc chắn l&agrave; t&ocirc;i đ&atilde; hiểu được điều đ&oacute;.</div>\r\n<div>Giờ th&igrave;, như những g&igrave; t&ocirc;i đ&atilde; từng l&agrave;m rất nhiều lần trước đ&acirc;y, Nielsen kh&ocirc;ng đồng &yacute; với việc khẳng định rằng \"sự chồng chấp lượng tử của 2 trạng th&aacute;i c&oacute; nghĩa l&agrave; vật thể đồng thời tồn tại ở 2 trạng th&aacute;i đ&oacute;\". Trong v&iacute; dụ nổi tiếng nhất, con m&egrave;o của Schr&ouml;dinger thường được hiểu rằng n&oacute; \"vừa sống vừa (v&agrave;) chết\". Đ&oacute; l&agrave; thứ m&agrave; Nielsen gọi l&agrave; \"c&aacute;ch hiểu kiểu salad từ về cơ chế lượng tử\", một cụm từ m&agrave; g&acirc;y ra thiệt hại c&ograve;n lớn hơn c&aacute;i gi&aacute; phải trả để bạn c&oacute; thể đọc được b&agrave;i viết của &ocirc;ng ấy.</div>\r\n<div>Trong thực tế, con m&egrave;o của Schr&ouml;dinger vẫn chỉ \"sống HOẶC chết\", từ \"HOẶC\" (OR) vẫn ch&iacute;nh x&aacute;c hơn nhiều so với từ \"V&Agrave;\", trong khi đ&oacute; cơ chế lượng tử gi&uacute;p ch&uacute;ng ta dự đo&aacute;n được x&aacute;c suất của \"sống\" v&agrave; \"chết\" cũng như c&aacute;c gi&aacute; trị kh&aacute;c c&oacute; thể quan s&aacute;t được m&agrave; kh&ocirc;ng li&ecirc;n quan tới lượng tử nhị nguy&ecirc;n sống/chết. \"HOẶC\" ch&iacute;nh x&aacute;c hơn \"V&Agrave;\" - nhưng bạn phải loại bỏ c&aacute;i suy nghĩ rằng việc sử dụng từ \"HOẶC\" đồng nghĩa với sự tồn tại của một thực tế kh&aacute;ch quan (v&agrave; c&acirc;u trả lời kh&aacute;ch quan cho c&acirc;u hỏi về sống/chết) trong mọi khoảnh khắc.</div>\r\n<div>Thay v&agrave;o đ&oacute;, \"HOẶC\" l&agrave; một dạng ph&eacute;p cộng logic n&agrave;o đ&oacute;, một ph&eacute;p t&iacute;nh c&oacute; khuynh hướng cộng th&ecirc;m gi&aacute; trị sự thật (0/1) hoặc x&aacute;c suất (x&aacute;c suất chỉ l&agrave; gi&aacute; trị kỳ vọng của gi&aacute; trị sự thật). Khi c&oacute; một số gi&aacute; trị c&oacute; x&aacute;c suất kh&aacute;c 0, điều đ&oacute; c&oacute; nghĩa l&agrave; người quan s&aacute;t kh&ocirc;ng biết c&acirc;u trả lời ch&iacute;nh x&aacute;c.</div>\r\n<div>Cụ thể l&agrave;, Nielsen đ&atilde; nhận định ch&iacute;nh x&aacute;c rằng c&aacute;ch hiểu th&ocirc;ng dụng kia thường được diễn giải cho người mới nhập m&ocirc;n nhưng ngay cả những nh&agrave; vật l&yacute; học chuy&ecirc;n nghiệp cũng hiểu diều đ&oacute; theo \"đ&uacute;ng nghĩa đen\", mặc d&ugrave; c&aacute;ch hiểu đ&oacute; kh&ocirc;ng ch&iacute;nh x&aacute;c cũng như kh&ocirc;ng đ&uacute;ng về mặt đạo đức. C&aacute;ch hiểu kh&ocirc;ng ch&iacute;nh x&aacute;c ở đ&acirc;y c&oacute; nghĩa l&agrave; sự kh&ocirc;ng ch&iacute;nh x&aacute;c của những kết luận cụ thể được đưa ra th&ocirc;ng qua c&aacute;ch nghĩ đ&oacute;.</div>\r\n<hr>\r\n<div><em>--- Phần nặng l&yacute; thuyết, bạn đọc c&oacute; thể bỏ qua (ND) ---</em></div>\r\n<div>Cụ thể, nhiều người tưởng rằng trạng th&aacute;i của định dạng</div>\r\n<div>\r\n<figure class=\"aligncenter\"><img class=\"fr-fic fr-dib\" src=\"https://images.spiderum.com/sp-images/ec2c8f107aa011e9a8a54dcdf1030b63.gif\" alt=\"img_1\">\r\n<figcaption class=\"image-description\" contenteditable=\"false\"></figcaption>\r\n</figure>\r\n</div>\r\n<div>với tổng tr&ecirc;n <em>x&nbsp;</em>đi qua tất cả c&aacute;c nh&aacute;nh đường của \"người b&aacute;n h&agrave;ng\" cho ph&eacute;p cơ chế lượng tử giải \"b&agrave;i to&aacute;n người b&aacute;n h&agrave;ng\" (b&agrave;i to&aacute;n chọn đường đi ngắn nhất đi qua tất cả c&aacute;c th&agrave;nh phố: tham khảo <a href=\"https://spiderum.com/\" target=\"_blank\" rel=\"noopener noreferrer\">kaggle.com</a> để t&igrave;m hiểu về một cuộc thi đang diễn ra c&oacute; dạng như vậy) một c&aacute;ch nhanh ch&oacute;ng.</div>\r\n<div>Theo c&aacute;ch n&agrave;y, những người hiểu theo kiểu salad từ tưởng rằng, trạng th&aacute;i lượng tử chứa \"nhiều th&ocirc;ng tin cổ điển hơn\" trạng th&aacute;i cổ điển của ch&iacute;nh vật đ&oacute;. V&agrave; một người c&oacute; thể sử dụng &iacute;t ph&eacute;p t&iacute;nh hơn - v&iacute; dụ, nếu <em>f(x)</em> được chọn theo độ d&agrave;i của nh&aacute;nh đường, ch&uacute;ng ta c&oacute; thể nhấn mạnh những th&agrave;nh phần của h&agrave;m số s&oacute;ng tương đương với con đường ngắn nhất - v&agrave; do đ&oacute; giải b&agrave;i to&aacute;n người b&aacute;n h&agrave;ng với tốc độ nhanh lũy thừa cứ như thể m&aacute;y t&iacute;nh lượng tử giống như m&aacute;y t&iacute;nh song song.</div>\r\n<div>Nhưng Nielsen rất hiểu về t&iacute;nh to&aacute;n lượng tử - đ&oacute; l&agrave; v&igrave; sao &ocirc;ng ấy kh&ocirc;ng chỉ c&oacute; thể n&oacute;i bạn rằng điều đ&oacute; l&agrave; bất khả thi m&agrave; c&ograve;n cho bạn một <a href=\"https://arxiv.org/abs/quant-ph/9701001\" target=\"_blank\" rel=\"nofollow noopener noindex noreferrer\">b&agrave;i nghi&ecirc;n cứu cực k&igrave; chi tiết</a> diễn giải sự bất khả thi của việc \"sử dụng m&aacute;y t&iacute;nh lượng tử như một hệ thống m&aacute;y t&iacute;nh song song\".</div>\r\n<div>Những b&agrave;i nghi&ecirc;n cứu nặng chuy&ecirc;n m&ocirc;n như vậy c&oacute; thể sẽ rất th&uacute; vị nhưng t&ocirc;i tin rằng sai lầm của những người hiểu theo kiểu salad từ c&oacute; t&iacute;nh chất cơ bản hơn rất nhiều. Họ đơn giản l&agrave; tưởng rằng h&agrave;m số s&oacute;ng l&agrave; s&oacute;ng cổ điển - v&igrave; vậy tất cả bi&ecirc;n độ x&aacute;c suất phức (hệ số của c&aacute;c số hạng kh&aacute;c nhau trong h&agrave;m số s&oacute;ng) l&agrave; một dạng \"dữ liệu cổ điển kh&aacute;ch quan\" n&agrave;o đ&oacute;. C&oacute; một số lượng lũy thừa c&aacute;c số hạng như thế - với <em>N</em> qubits, bạn c&oacute; <em>2^N</em> bi&ecirc;n độ phức - v&agrave; ch&uacute;ng c&oacute; thể được biến đổi như thể một số lượng lũy thừa c&aacute;c dữ liệu cổ điển. V&agrave; đ&oacute; l&agrave; v&igrave; sao bạn c&oacute; thể thử tất cả c&aacute;c nh&aacute;nh đường c&ugrave;ng một l&uacute;c v&agrave; giải quyết b&agrave;i to&aacute;n một c&aacute;ch hiệu quả.</div>\r\n<div>Ngoại trừ việc l&agrave; bạn kh&ocirc;ng thể l&agrave;m điều đ&oacute;. Đơn giản l&agrave; việc cho rằng bi&ecirc;n độ x&aacute;c suất phức l&agrave; \"dữ liệu cổ điển kh&aacute;ch quan\" hoặc, tương đương rằng, h&agrave;m số s&oacute;ng l&agrave; một s&oacute;ng cổ điển, l&agrave; sai lầm. Cụ thể l&agrave;, theo định nghĩa của ch&uacute;ng, những bi&ecirc;n độ x&aacute;c suất đ&oacute; gần gũi với những x&aacute;c suất b&igrave;nh thường trong ph&acirc;n phối x&aacute;c suất m&agrave; đ&atilde; tồn tại trong vật l&yacute; cổ điển hơn rất nhiều, khi m&agrave; c&oacute; sự bất định tồn tại.</div>', 0, 0, 1, '2023-04-10 08:27:44', '2023-04-10 08:27:44', '1 chút về vật lý lượng tử', '/img/tohsaka.jpg'),
(503, 'test đăng ảnh', '<p>i gonna paste an img here</p>\r\n<p><img src=\"https://gamek.mediacdn.vn/133514250583805952/2020/7/4/1-15938427791521331665841.jpg\" alt=\"\" width=\"333\" height=\"444\"></p>', 3, 0, 53, '2023-04-10 16:07:45', NULL, 'songoku', 'https://gamek.mediacdn.vn/133514250583805952/2020/7/4/1-15938427791521331665841.jpg'),
(552, 'red hair girl', '<p style=\"padding-left: 80px;\"><img src=\"https://cdnb.artstation.com/p/assets/images/images/059/044/559/large/alexey-dmitriev-schicksal-makima-anime-style-red-hair-girl-makima-anime-anime-g-55391e7b-c997-4973-bebc-933401d12e10.jpg?1675511061\" alt=\"\" width=\"419\" height=\"419\"></p>', 3, 0, 53, '2023-04-20 11:35:38', NULL, 'red girl', 'https://cdnb.artstation.com/p/assets/images/images/059/044/559/large/alexey-dmitriev-schicksal-makima-anime-style-red-hair-girl-makima-anime-anime-g-55391e7b-c997-4973-bebc-933401d12e10.jpg?1675511061');

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
(701);

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
(252, 'test thong bao\r\n                    ', 1, 552, '2023-04-29 00:25:11');

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
(351);

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
(202, 1, 102, 'i do not like him\r\n                    ', '2023-04-26 22:57:44'),
(203, 53, 1, 'thử report admin xem như nào\r\n                    ', '2023-04-26 23:37:32'),
(252, 1, 53, 'thằng này giả mạo em\r\n                    ', '2023-04-28 14:29:52');

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
(351);

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
('2023-04-30 23:40:58', 52, 2, 1);

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
(151);

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
('4ff668ea-1efc-4af1-bcd2-a54f80870bf7', '95aa49ec-e489-4ab8-9bef-c1b133b8d550', 1682872896450, 1682872896882, 1800, 1682874696882, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spring_session_attributes`
--

CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

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
  `user_Notification` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_banned`, `user_author`, `user_description`, `user_img`, `user_date_of_birth`, `email`, `user_Notification`) VALUES
(1, 'admin', 'duc@gmail.com', '123', 0, 5, 'i am the admin of this page and who created it', 'http://res.cloudinary.com/dgslqultw/image/upload/v1682839254/my-image.jpg', '2002-11-28 15:03:00', 'admin@gmail.com', 0),
(53, 'duc', 'kingofthedeath098@gmail.com', 'hello', 0, 1, 'tôi tên là đức 1 tài khoản khác của admin website này ', 'http://res.cloudinary.com/dgslqultw/image/upload/v1682839777/my-image.jpg', '2001-02-03 16:56:00', NULL, 0),
(102, 'thedead', 'ducnmhe163139@fpt.edu.vn', '111', 0, 1, '', 'http://res.cloudinary.com/dgslqultw/image/upload/v1682354555/my-image.jpg', '2002-11-28 23:42:00', NULL, 0),
(152, 'tak', 'NguyenDuc098660@gmail.com', '123', 0, 1, '', 'http://res.cloudinary.com/dgslqultw/image/upload/v1682839866/my-image.jpg', '2023-03-09 17:48:00', NULL, 0);

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
(251);

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
(53, 1, 'up', 524),
(1, 1, 'up', 557),
(53, 503, 'up', 703),
(53, 552, 'up', 802),
(53, 2, 'up', 852),
(53, 52, 'up', 853),
(1, 52, 'up', 854),
(1, 2, 'up', 902),
(1, 503, 'up', 1102),
(152, 503, 'up', 1152),
(152, 552, 'up', 1202),
(1, 552, 'up', 1252);

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
(1351);

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
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=803;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=803;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=456;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=603;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `vote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1253;

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
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `postid` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
