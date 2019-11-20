-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2019 at 01:29 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `price_comparison`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` text NOT NULL,
  `category_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_image`) VALUES
(1, 'whole milk', 'cooming soon'),
(2, 'semi skimmed milk', 'cooming soon'),
(3, 'cathedral city cheese', 'coming soon'),
(5, 'philadelphia soft cheese', 'coming soon'),
(6, 'white bread', 'soon'),
(7, 'wholemeal bread', 'soon'),
(8, 'tropicana orange juice', 'soon'),
(9, 'tropicana apple juice', 'soon'),
(10, 'ocean spray cranberry juice', 'soon'),
(11, 'innocent orange juice', 'soon'),
(12, 'innocent tropical juice', 'soon'),
(13, 'innocent apple & mango juice', 'soon'),
(14, 'laughing cow cheese', 'soon'),
(15, 'activia yougurt', 'soon'),
(16, 'actimel yogurt drink', 'soon'),
(17, 'light & free greek style yougurt', 'soon'),
(18, 'oykos greek style ', 'soon'),
(19, 'anchor butter', 'soon'),
(20, 'lurpak butter', 'soon');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `product_keywords` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_volume` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_keywords`, `category_id`, `product_volume`) VALUES
(1, 'whole milk 1 pint', 'whole,milk,1 pint', 1, '1 pint'),
(2, 'whole milk 2 pint', 'whole,milk,2 pint', 1, '2 pint'),
(3, 'whole milk 4 pint', 'whole,milk,4 pint', 1, '4 pint'),
(4, 'whole milk 6 pint', 'whole,milk,6 pint', 1, '6 pint'),
(5, 'semi skimmed milk 1 pint', 'semi skimmed,milk,1 pint', 2, '1 pint'),
(6, 'semi skimmed milk 2 pint', 'semi skimmed,milk,2 pint', 2, '2 pint'),
(7, 'semi skimmed milk 4 pint', 'semi skimmed,milk,4 pint', 2, '4 pint'),
(8, 'semi skimmed milk 6 pint', 'semi skimmed,milk,6 pint', 2, '6 pint'),
(9, 'cathedral cheese mature 350 g', 'cathedral city mature,350', 3, '350g'),
(10, 'cathedral cheese lighter 350 g', 'cathedral city lighter,350', 3, '350g'),
(11, 'cathedral cheese extra mature 350 g', 'cathedral city extra mature,350', 3, '350g'),
(20, 'philadelphia soft cheese 170 g', 'philadelphia,soft cheese,170', 5, '170g'),
(21, 'philadelphia soft cheese 180 g', 'philadelphia,soft cheese,180', 5, '180g'),
(22, 'philadelphia soft cheese 340 g', 'philadelphia,soft cheese,340', 5, '340g'),
(23, 'white bread', 'white,bread,800', 6, '800g'),
(24, 'wholemeal bread', 'wholemeal,bread,800', 7, '800g'),
(25, 'white bread', 'white,bread,400', 6, '400g'),
(26, 'wholemeal bread', 'wholemeal,bread,400', 7, '400g'),
(27, 'tropicana orange juice', 'tropicana,orange,950', 8, '950ml'),
(28, 'tropicana orange juice', 'tropicana,orange,300', 8, '300ml'),
(29, 'tropicana apple juice', 'tropicana,apple,950', 9, '950ml'),
(30, 'ocean spray cranberry juice', 'ocean spray,cranberry,1', 10, '1L'),
(31, 'innocent orange juice', 'innocent,orange,1.35', 11, '1.35'),
(32, 'innocent tropical juice', 'innocent,tropical,1.35', 12, '1.35'),
(33, 'innocent apple & mango juice', 'innocent,apple & mango,1.35', 13, '1.35'),
(34, 'laughing cow cheese', 'laughing cow,cheese,280', 14, '280g'),
(35, 'laughing cow cheese', 'laughing cow,cheese,140', 14, '140g'),
(36, 'activia yougurt', 'activia,yougurt,8,120', 15, '8x120g'),
(37, 'activia yougurt', 'activia,yougurt,4,120', 15, '4x120g'),
(38, 'activia yougurt', 'activia,yougurt,4,110', 15, '4x110g'),
(39, 'actimel yogurt drink', 'actimel,yogurt drink,12,100', 16, '12x100g'),
(40, 'actimel yogurt drink', 'actimel,yogurt drink,8,100', 16, '8x100g'),
(41, 'light & free greek style yougurt', 'light & free,yougurt,4,115', 17, '4x115g'),
(42, 'oykos greek style ', 'oykos,greek style,4,110 ', 18, '4x110g'),
(43, 'anchor salted butter', 'anchor,250', 19, '250g'),
(44, 'anchor unsalted  butter', 'anchor unsalted,250', 19, '250g'),
(45, 'anchor spreadable', 'anchor spreadable,500', 19, '500g'),
(46, 'anchor spreadable', 'anchor spreadable,250', 19, '250g'),
(47, 'lurpak salted butter', 'lurpack,butter,salted,250', 20, '250g'),
(48, 'lurpak unsalted butter', 'lurpack,butter,unsalted,250', 20, '250g'),
(49, 'lurpak spreadable', 'lurpak,spreadable,250', 20, '250g'),
(50, 'lurpak spreadable', 'lurpak,spreadable,500', 20, '500g');

-- --------------------------------------------------------

--
-- Table structure for table `product_price`
--

CREATE TABLE `product_price` (
  `price_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `supermarket_id` int(11) NOT NULL,
  `price_source` text NOT NULL,
  `product_price` double NOT NULL,
  `product_description` text NOT NULL,
  `product_volume` varchar(45) DEFAULT NULL,
  `product_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_price`
--

INSERT INTO `product_price` (`price_id`, `product_id`, `supermarket_id`, `price_source`, `product_price`, `product_description`, `product_volume`, `product_image`) VALUES
(1, 1, 4, 'https://groceries.asda.com/product/37517', 0.49, 'ASDA Whole Milk 1pt', '1 pint', 'https://ui.assets-asda.com/dm/asdagroceries/20335489?$ProdList$'),
(2, 1, 4, 'https://groceries.asda.com/product/31972698', 0.58, 'ASDA Organic Whole Milk 1pt', '1 pint', 'https://ui.assets-asda.com/dm/asdagroceries/5050854581649?$ProdList$'),
(3, 2, 4, 'https://groceries.asda.com/product/23421', 0.79, 'ASDA Whole Milk 2pt', '2 pint', 'https://ui.assets-asda.com/dm/asdagroceries/20411992?$ProdList$'),
(4, 2, 4, 'https://groceries.asda.com/product/14319673', 0.89, 'ASDA Organic Whole Milk 2pt', '2 pint', 'https://ui.assets-asda.com/dm/asdagroceries/5050854275135?$ProdList$'),
(5, 3, 4, 'https://groceries.asda.com/product/20502', 1.09, 'ASDA Whole Milk 4pt', '4 pint', 'https://ui.assets-asda.com/dm/asdagroceries/20332167?$ProdList$'),
(6, 3, 4, 'https://groceries.asda.com/product/14319676', 1.5, 'ASDA Organic Whole Milk 4pt', '4 pint', 'https://ui.assets-asda.com/dm/asdagroceries/5050854275166?$ProdList$'),
(7, 3, 4, 'https://groceries.asda.com/product/910002516013', 1.34, 'Asda Arla Farmers Whole Milk 4pt', '4 pint', 'https://ui.assets-asda.com/dm/asdagroceries/5000181038552?$ProdList$'),
(8, 4, 4, 'https://groceries.asda.com/product/27657', 1.48, 'ASDA Whole Milk 6pt', '6 pint', 'https://ui.assets-asda.com/dm/asdagroceries/20349684?$ProdList$'),
(9, 5, 4, 'https://groceries.asda.com/product/37518', 0.49, 'ASDA Semi Skimmed Milk 1pt', '1 pint', 'https://ui.assets-asda.com/dm/asdagroceries/20394561?$ProdList$'),
(10, 5, 4, 'https://groceries.asda.com/product/31972699', 0.58, 'ASDA Organic Semi Skimmed Milk 1pt', '1 pint', 'https://ui.assets-asda.com/dm/asdagroceries/5050854581656?$ProdList$'),
(11, 6, 4, 'https://groceries.asda.com/product/23423', 0.79, 'ASDA Semi Skimmed Milk 2pt', '2 pint', 'https://ui.assets-asda.com/dm/asdagroceries/20411985?$ProdList$'),
(12, 6, 4, 'https://groceries.asda.com/product/14319672', 0.89, 'ASDA Organic Semi Skimmed Milk 2pt', '2 pint', 'https://ui.assets-asda.com/dm/asdagroceries/5050854275128?$ProdList$'),
(13, 7, 4, 'https://groceries.asda.com/product/20504', 1.09, 'ASDA Semi Skimmed Milk 4pt', '4 pint', 'https://ui.assets-asda.com/dm/asdagroceries/20337087?$ProdList$'),
(14, 7, 4, 'https://groceries.asda.com/product/910002516119', 1.34, 'Asda Arla Farmers Semi Skimmed Milk 4pt', '4 pint', 'https://ui.assets-asda.com/dm/asdagroceries/5000181038538?$ProdList$'),
(15, 7, 4, 'https://groceries.asda.com/product/14319675', 1.5, 'ASDA Organic Semi Skimmed Milk 4pt', '4 pint', 'https://ui.assets-asda.com/dm/asdagroceries/5050854275159?$ProdList$'),
(16, 8, 4, 'https://groceries.asda.com/product/20506', 1.48, 'ASDA Semi Skimmed Milk 6pt', '6 pint', 'https://ui.assets-asda.com/dm/asdagroceries/20353629?$ProdList$'),
(17, 9, 4, 'https://groceries.asda.com/product/910000455372', 3.5, 'Cathedral City Mature Cheddar Cheese 350g', '350g', 'https://ui.assets-asda.com/dm/asdagroceries/5000295142893?$ProdList$'),
(18, 9, 4, 'https://groceries.asda.com/product/910000328893', 3.5, 'Cathedral City Mature Lighter Cheese 350g', '350g', 'https://ui.assets-asda.com/dm/asdagroceries/5000295141612?$ProdList$'),
(19, 9, 4, 'https://groceries.asda.com/product/17558457', 4, 'Cathedral City Mature Cheddar Cheese Twin Pack 2x350g', '350g', 'https://ui.assets-asda.com/dm/asdagroceries/5000295129733?$ProdList$'),
(20, 11, 4, 'https://groceries.asda.com/product/910000329132', 3.5, 'Cathedral City Extra Mature Cheddar Cheese 350g', '350g', 'https://ui.assets-asda.com/dm/asdagroceries/5000295141599?$ProdList$'),
(21, 11, 4, 'https://groceries.asda.com/product/910002726989', 4, 'Cathedral City Extra Mature Cheddar Cheese Twin Pack 2x350g', '350g', 'https://ui.assets-asda.com/dm/asdagroceries/5000295150409?$ProdList$'),
(22, 20, 4, 'https://groceries.asda.com/product/910001440494', 1, 'Philadelphia Garlic & Herb Soft Cheese 170g', '170g', 'https://ui.assets-asda.com/dm/asdagroceries/7622210307309?$ProdList$'),
(23, 20, 4, 'https://groceries.asda.com/product/910001439539', 1, 'Philadelphia Sweet Chilli Soft Cheese 170g', '170g', 'https://ui.assets-asda.com/dm/asdagroceries/7622210307385?$ProdList$'),
(24, 20, 4, 'https://groceries.asda.com/product/910001440280', 1, 'Philadelphia Chives Soft Cheese 170g', '170g', 'https://ui.assets-asda.com/dm/asdagroceries/7622210307323?$ProdList$'),
(25, 20, 4, 'https://groceries.asda.com/product/1000031590114', 1, 'Philadelphia Caramelised Onion Soft Cheese 170g', '170g', 'https://ui.assets-asda.com/dm/asdagroceries/7622210854025?$ProdList$'),
(26, 21, 4, 'https://groceries.asda.com/product/910001440347', 1, 'Philadelphia Original Soft Cheese 180g', '180g', 'https://ui.assets-asda.com/dm/asdagroceries/7622210307460?$ProdList$'),
(27, 21, 4, 'https://groceries.asda.com/product/910001440490', 1, 'Philadelphia Lightest Soft Cheese 180g', '180g', 'https://ui.assets-asda.com/dm/asdagroceries/7622210307590?$ProdList$'),
(28, 21, 4, 'https://groceries.asda.com/product/910001439675', 1, 'Philadelphia Light Soft Cheese 180g', '180g', 'https://ui.assets-asda.com/dm/asdagroceries/7622210307514?$ProdList$'),
(29, 22, 4, 'https://groceries.asda.com/product/1000113394464', 3, 'Philadelphia Original Soft Cheese Family Pack 340g', '340g', 'https://ui.assets-asda.com/dm/asdagroceries/7622210585974?$ProdList$'),
(30, 22, 4, 'https://groceries.asda.com/product/1000113394432', 3, 'Philadelphia Light Soft Cheese Family Pack 340g', '340g', 'https://ui.assets-asda.com/dm/asdagroceries/7622210585943?$ProdList$'),
(31, 22, 4, 'https://groceries.asda.com/product/1000113394508', 3, 'Philadelphia Garlic & Herbs Soft Cheese Family Pack 340g', '340g', 'https://ui.assets-asda.com/dm/asdagroceries/7622210585950?$ProdList$'),
(32, 22, 4, 'https://groceries.asda.com/product/1000113394503', 3, 'Philadelphia Chives Soft Cheese Family Pack 340g', '340g', 'https://ui.assets-asda.com/dm/asdagroceries/7622210585967?$ProdList$'),
(33, 23, 4, 'https://groceries.asda.com/product/34537', 1.1, 'Warburtons Toastie Thick Sliced White Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5010044000121?$ProdList$'),
(34, 23, 4, 'https://groceries.asda.com/product/42747415', 0.89, 'Kingsmill Medium Soft White Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5010092093045?$ProdList$'),
(35, 23, 4, 'https://groceries.asda.com/product/34536', 1.1, 'Warburtons Medium White Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5010044000039?$ProdList$'),
(36, 23, 4, 'https://groceries.asda.com/product/34545', 1.35, 'Warburtons Farmhouse Soft White Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5010044002378?$ProdList$'),
(37, 23, 4, 'https://groceries.asda.com/product/910002989320', 0.55, 'ASDA Square Cut Medium White Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5054781496700?$ProdList$'),
(38, 23, 4, 'https://groceries.asda.com/product/42747401', 0.89, 'Kingsmill Thick Soft White Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5010092093144?$ProdList$'),
(39, 23, 4, 'https://groceries.asda.com/product/34543', 1.1, 'Warburtons Thickest White Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5010044002347?$ProdList$'),
(40, 23, 4, 'https://groceries.asda.com/product/910003041519', 0.84, 'ASDA Extra Special Farmhouse White Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5054781498087?$ProdList$'),
(41, 23, 4, 'https://groceries.asda.com/product/394921', 1.1, 'ASDA Baker\'s Selection White Tin Bread 800g', '800g', NULL),
(42, 23, 4, 'https://groceries.asda.com/product/44257364', 1.1, 'ASDA Baker\'s Selection White Farmhouse Bread 800g', '800g', NULL),
(43, 23, 4, 'https://groceries.asda.com/product/21028', 1.1, 'ASDA Baker\'s Selection White Bloomer Bread 800g', '800g', NULL),
(44, 24, 4, 'https://groceries.asda.com/product/42747403', 0.89, 'Kingsmill Tasty Medium Wholemeal Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5010092093243?$ProdList$'),
(45, 24, 4, 'https://groceries.asda.com/product/42747405', 0.89, 'Kingsmill Tasty Thick Wholemeal Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5010092093342?$ProdList$'),
(46, 24, 4, 'https://groceries.asda.com/product/34538', 1.1, 'Warburtons Medium Sliced Wholemeal Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5010044000251?$ProdList$'),
(47, 24, 4, 'https://groceries.asda.com/product/910002989489', 0.55, 'ASDA Medium Wholemeal Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5054781496717?$ProdList$'),
(48, 24, 4, 'https://groceries.asda.com/product/1670454', 1.4, 'Hovis Granary Wholemeal Bread 800g', '800g', 'https://ui.assets-asda.com/dm/asdagroceries/5010003000292?$ProdList$'),
(49, 24, 4, 'https://groceries.asda.com/product/910003092874', 1.1, 'ASDA Baker\'s Selection Wholemeal Tin Bread 800g', '800g', NULL),
(50, 25, 4, 'https://groceries.asda.com/product/31248810', 1.4, 'Kingsmill No Crusts Soft White Bread 400g', '400g', 'https://ui.assets-asda.com/dm/asdagroceries/5010092079346?$ProdList$'),
(51, 25, 4, 'https://groceries.asda.com/product/34541', 0.9, 'Warburtons Medium Sliced White Bread 400g', '400g', 'https://ui.assets-asda.com/dm/asdagroceries/5010044001234?$ProdList$'),
(52, 25, 4, 'https://groceries.asda.com/product/2046278', 1.2, 'Warburtons Farmhouse Soft White Bread 400g', '400g', NULL),
(53, 25, 4, 'https://groceries.asda.com/product/32725', 0.79, 'ASDA Baker\'s Selection White Bread 400g', '400g', NULL),
(54, 25, 4, 'https://groceries.asda.com/product/910002788096', 2, 'Warburtons Country White Bread 400g', '400g', NULL),
(55, 25, 4, 'https://groceries.asda.com/product/34542', 0.9, 'Warburtons Toastie White Thick Sliced Bread 400g', '400g', NULL),
(56, 25, 4, 'https://groceries.asda.com/product/34539', 0.9, 'Warburtons White Danish Bread 400g', '400g', NULL),
(57, 25, 4, 'https://groceries.asda.com/product/36473', 0.9, 'Warburtons White Milk Roll Bread 400g', '400g', NULL),
(58, 25, 4, 'https://groceries.asda.com/product/35245', 0.79, 'ASDA Baker\'s Selection White Bloomer Bread 400g', '400g', NULL),
(59, 25, 4, 'https://groceries.asda.com/product/44257365', 0.79, 'ASDA Baker\'s Selection White Farmhouse Bread 400g', '400g', NULL),
(60, 26, 4, 'https://groceries.asda.com/product/910002327657', 1.4, 'Kingsmill No Crusts Wholemeal Bread 400g', '400g', 'https://ui.assets-asda.com/dm/asdagroceries/5010092724215?$ProdList$'),
(61, 26, 4, 'https://groceries.asda.com/product/39577669', 1.14, 'Weight Watchers Thick Wholemeal Bread 400g', '400g', 'https://ui.assets-asda.com/dm/asdagroceries/5010044003351?$ProdList$'),
(62, 26, 4, 'https://groceries.asda.com/product/82185114', 0.85, 'Hovis Nimble Wholemeal Bread 400g', '400g', 'https://ui.assets-asda.com/dm/asdagroceries/5010003060289?$ProdList$'),
(63, 26, 4, 'https://groceries.asda.com/product/34540', 0.9, 'Warburtons Medium Sliced Wholemeal Bread 400g', '400g', 'https://ui.assets-asda.com/dm/asdagroceries/5010044000404?$ProdList$'),
(64, 26, 4, 'https://groceries.asda.com/product/66006934', 0.85, 'Hovis Tasty Wholemeal Bread 400g', '400g', 'https://ui.assets-asda.com/dm/asdagroceries/5010003000247?$ProdList$'),
(65, 26, 4, 'https://groceries.asda.com/product/910003092810', 0.79, 'ASDA Baker\'s Selection Wholemeal Bread 400g', '400g', 'https://ui.assets-asda.com/dm/asdagroceries/0201600000005?$ProdList$'),
(66, 27, 4, 'https://groceries.asda.com/product/910002999222', 1.35, 'Tropicana Smooth Orange Juice 950ml', '950ml', 'https://ui.assets-asda.com/dm/asdagroceries/5022313731773?$ProdList$'),
(67, 27, 4, 'https://groceries.asda.com/product/910003001146', 1.35, 'Tropicana Orange Juice with Bits 950ml', '950ml', 'https://ui.assets-asda.com/dm/asdagroceries/5022313731506?$ProdList$'),
(68, 27, 4, 'https://groceries.asda.com/product/910002999348', 1.35, 'Tropicana Orange Juice with Extra Juicy Bits 950ml', '950ml', 'https://ui.assets-asda.com/dm/asdagroceries/5022313732138?$ProdList$'),
(69, 28, 4, 'https://groceries.asda.com/product/910001784944', 1.41, 'Tropicana Smooth Orange Juice 300ml', '300ml', 'https://ui.assets-asda.com/dm/asdagroceries/5022313331607?$ProdList$'),
(70, 28, 4, 'https://groceries.asda.com/product/910001784947', 1.41, 'Tropicana Orange Juice with Extra Juicy Bits 300ml', '300ml', 'https://ui.assets-asda.com/dm/asdagroceries/5022313332154?$ProdList$'),
(71, 29, 4, 'https://groceries.asda.com/product/910002999872', 1.35, 'Tropicana Apple Juice 950ml', '950ml', 'https://ui.assets-asda.com/dm/asdagroceries/5022313730639?$ProdList$'),
(72, 30, 4, 'https://groceries.asda.com/product/19014', 1.5, 'Ocean Spray Cranberry Classic Juice Drink 1lt', '1L', 'https://ui.assets-asda.com/dm/asdagroceries/0031200452009?$ProdList$'),
(73, 30, 4, 'https://groceries.asda.com/product/37074', 1.5, 'Ocean Spray Light Cranberry Classic Juice Drink 1lt', '1L', 'https://ui.assets-asda.com/dm/asdagroceries/0031200452603?$ProdList$'),
(74, 30, 4, 'https://groceries.asda.com/product/20788', 1.5, 'Ocean Spray Cranberry Raspberry 1lt', '1L', 'https://ui.assets-asda.com/dm/asdagroceries/0031200452016?$ProdList$'),
(75, 30, 4, 'https://groceries.asda.com/product/1000102967130', 2, 'Ocean Spray Cranberry Original 1l', '1L', 'https://ui.assets-asda.com/dm/asdagroceries/0031200452856?$ProdList$'),
(76, 31, 4, 'https://groceries.asda.com/product/1000165446587', 2.5, 'Innocent Smooth Orange Juice 1.35l', '1.35', 'https://ui.assets-asda.com/dm/asdagroceries/5038862102704?$ProdList$'),
(77, 31, 4, 'https://groceries.asda.com/product/1000165446606', 2.5, 'Innocent Orange Juice with Bits 1.35l', '1.35', 'https://ui.assets-asda.com/dm/asdagroceries/5038862100700?$ProdList$'),
(78, 32, 4, 'https://groceries.asda.com/product/910001050006', 2.5, 'Innocent Tropical Juice 1.35l', '1.35', 'https://ui.assets-asda.com/dm/asdagroceries/5038862106702?$ProdList$'),
(79, 34, 4, 'https://groceries.asda.com/product/35790', 2, 'Laughing Cow Light Cheese Spread Triangles X16 280g', '280g', 'https://ui.assets-asda.com/dm/asdagroceries/3073780836111?$ProdList$'),
(80, 34, 4, 'https://groceries.asda.com/product/910000208900', 2, 'Laughing Cow Cheese Spread Triangles x16 280g', '280g', 'https://ui.assets-asda.com/dm/asdagroceries/3073780574242?$ProdList$'),
(81, 35, 4, 'https://groceries.asda.com/product/6431129', 1.35, 'Laughing Cow Extra Light Cheese Spread Triangles x8 140g', '140g', 'https://ui.assets-asda.com/dm/asdagroceries/3073780914338?$ProdList$'),
(82, 35, 4, 'https://groceries.asda.com/product/20448', 1.35, 'Laughing Cow Light Cheese Spread Triangles x8 140g', '140g', 'https://ui.assets-asda.com/dm/asdagroceries/3073780689014?$ProdList$'),
(83, 39, 4, 'https://groceries.asda.com/product/71431377', 2, 'Actimel Strawberry Yogurt Drinks 12x100', '12x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5060058330868?$ProdList$'),
(84, 39, 4, 'https://groceries.asda.com/product/81421582', 2, 'Actimel Multifruit Yogurt Drinks 12x100', '12x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5060058331735?$ProdList$'),
(85, 39, 4, 'https://groceries.asda.com/product/910001285141', 2, 'Actimel Strawberry & Blueberry Yogurt Drinks 12x100', '12x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5060360500362?$ProdList$'),
(86, 39, 4, 'https://groceries.asda.com/product/71431378', 2, 'Actimel Fat Free Original Yogurt Drinks 12x100', '12x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5060058333166?$ProdList$'),
(87, 39, 4, 'https://groceries.asda.com/product/1000028236266', 2, 'Actimel Fat Free Strawberry Yogurt Drinks 12x100', '12x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5060360502151?$ProdList$'),
(88, 39, 4, 'https://groceries.asda.com/product/1000023135162', 2, 'Actimel Strawberry & Banana Yogurt Drinks 12x100', '12x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5060058337324?$ProdList$'),
(89, 40, 4, 'https://groceries.asda.com/product/976012', 2.75, 'Actimel Strawberry Yogurt Drinks 8x100g', '8x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5410146407024?$ProdList$'),
(90, 40, 4, 'https://groceries.asda.com/product/1429710', 2.75, 'Actimel Multifruit Yogurt Drinks 8x100g', '8x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5016769993724?$ProdList$'),
(91, 40, 4, 'https://groceries.asda.com/product/6979691', 2.75, 'Actimel Fat Free Strawberry Yogurt Drinks 8x100g', '8x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5060058332152?$ProdList$'),
(92, 40, 4, 'https://groceries.asda.com/product/31184812', 2.75, 'Actimel Blueberry Yogurt Drinks 8x100g', '8x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5060058334057?$ProdList$'),
(93, 40, 4, 'https://groceries.asda.com/product/30480749', 2.75, 'Actimel Coconut Yogurt Drinks 8x100g', '8x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5060058334002?$ProdList$'),
(94, 40, 4, 'https://groceries.asda.com/product/910001458752', 2.75, 'Actimel Fat Free Raspberry Yogurt Drinks 8x100g', '8x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5060058333128?$ProdList$'),
(95, 40, 4, 'https://groceries.asda.com/product/1000026958553', 2.75, 'Actimel Fat Free Multifruit Yogurt Drinks 8x100g', '8x100g', 'https://ui.assets-asda.com/dm/asdagroceries/5060360502656?$ProdList$'),
(96, 43, 4, 'https://groceries.asda.com/product/20532', 1.8, 'Anchor Salted Butter 250g', '250g', 'https://ui.assets-asda.com/dm/asdagroceries/5010137012505?$ProdList$'),
(97, 44, 4, 'https://groceries.asda.com/product/910000878134', 1.8, 'Anchor Unsalted Butter 250g', '250g', 'https://ui.assets-asda.com/dm/asdagroceries/5707361100275?$ProdList$'),
(98, 45, 4, 'https://groceries.asda.com/product/691647', 2.5, 'Anchor Spreadable 500g', '500g', 'https://ui.assets-asda.com/dm/asdagroceries/5707361100053?$ProdList$'),
(99, 46, 4, 'https://groceries.asda.com/product/692163', 1.95, 'Anchor Spreadable 250g', '250g', 'https://ui.assets-asda.com/dm/asdagroceries/5707361100039?$ProdList$'),
(100, 49, 4, 'https://groceries.asda.com/product/21197', 2.2, 'Lurpak Slightly Salted Spreadable 250g', '250g', 'https://ui.assets-asda.com/dm/asdagroceries/5740900805309?$ProdList$'),
(101, 49, 4, 'https://groceries.asda.com/product/38646', 2.2, 'Lurpak Lighter Slightly Salted Spreadable 250g', '250g', 'https://ui.assets-asda.com/dm/asdagroceries/5740900815308?$ProdList$'),
(102, 50, 4, 'https://groceries.asda.com/product/399016', 2.75, 'Lurpak Slightly Salted Spreadable 500g', '500g', 'https://ui.assets-asda.com/dm/asdagroceries/5740900805408?$ProdList$'),
(103, 50, 4, 'https://groceries.asda.com/product/38647', 2.75, 'Lurpak Lighter Slightly Salted Spreadable 500g', '500g', 'https://ui.assets-asda.com/dm/asdagroceries/5740900815407?$ProdList$'),
(104, 50, 4, 'https://groceries.asda.com/product/49166493', 2.75, 'Lurpak Unsalted Spreadable 500g', '500g', 'https://ui.assets-asda.com/dm/asdagroceries/5740900400986?$ProdList$'),
(105, 50, 4, 'https://groceries.asda.com/product/1000045143526', 2.75, 'Lurpak Softest Slightly Salted Spreadable 500g', '500g', 'https://ui.assets-asda.com/dm/asdagroceries/5740900402959?$ProdList$'),
(106, 50, 4, 'https://groceries.asda.com/product/910000459354', 2.75, 'Lurpak Light Olive Spreadable 500g', '500g', 'https://ui.assets-asda.com/dm/asdagroceries/5740900401396?$ProdList$'),
(109, 1, 3, 'https://www.aldi.co.uk/whole-milk---1-pint/p/063833142221600', 0.49, 'Whole Milk - 1 Pint', '1 pint', 'https://cdn.aldi-digital.co.uk//Whole-Milk---1-Pint-A.jpg?o=vTltSa7rWyA83iczSiJfi5hz46Ej&V=2mQR&w=111&h=139&p=2&q=89'),
(110, 2, 3, 'https://www.aldi.co.uk/whole-milk---2-pints/p/056359142221400', 0.79, 'Whole Milk - 2 Pints', '2 pint', 'https://cdn.aldi-digital.co.uk//Whole-Milk---2-Pints.jpg?o=%40onV1MuecWqyaA84CWnkFhRxxEcj&V=tx1r&w=111&h=139&p=2&q=89'),
(111, 3, 3, 'https://www.aldi.co.uk/whole-milk---4-pints/p/045612058741100', 1.09, 'Whole Milk - 4 Pints', '4 pint', 'https://cdn.aldi-digital.co.uk//Whole-Milk---4-Pints.jpg?o=pqSs70UtwrQbybW93cougenhfTkj&V=509W&w=111&h=139&p=2&q=89'),
(112, 5, 3, 'https://www.aldi.co.uk/semi-skimmed-milk---1-pint/p/063834142221800', 0.49, 'Semi Skimmed Milk - 1 Pint', '1 pint', 'https://cdn.aldi-digital.co.uk//Semi-Skimmed-Milk---1-Pint-A.jpg?o=mHUMLxsmZEBLzHYVP4gxSxpcN%24Ij&V=Bks4&w=111&h=139&p=2&q=89'),
(113, 6, 3, 'https://www.aldi.co.uk/semi-skimmed-milk---2-pints/p/045611003560400', 0.79, 'Semi Skimmed Milk - 2 Pints', '2 pint', 'https://cdn.aldi-digital.co.uk//Semi-Skimmed-Milk---2-Pints.jpg?o=XENxcxYeqi1%25403BdAli2UngB0%2524ucj&V=8t7x&w=111&h=139&p=2&q=89'),
(114, 2, 2, 'https://www.amazon.co.uk/Morrisons-Whole-British-Milk-pints/dp/B01EYKV604/ref=sr_1_1?fpw=fresh&keywords=whole+milk+2+pint&qid=1574251817&s=amazonfresh&sr=1-1', 0.8, 'Morrisons Whole British Milk, 2 pints', '2 pint', 'https://m.media-amazon.com/images/I/51je1+CaP7L._AC_UL320_ML3_.jpg'),
(115, 3, 2, 'https://www.amazon.co.uk/Morrisons-Whole-British-pints-2-27L/dp/B00GKG2LHI/ref=sr_1_1?fpw=fresh&keywords=whole+milk+4+pint&qid=1574251825&s=amazonfresh&sr=1-1', 1.1, 'Morrisons Whole British Milk, 4 pints 2.27L', '4 pint', 'https://m.media-amazon.com/images/I/51MD4pcQj2L._AC_UL320_ML3_.jpg'),
(116, 3, 2, 'https://www.amazon.co.uk/Morrisons-Organic-British-Whole-2-272L/dp/B01EYKV7KI/ref=sr_1_3?fpw=fresh&keywords=whole+milk+4+pint&qid=1574251825&s=amazonfresh&sr=1-3', 1.8, 'Morrisons Organic British Whole Milk, 4 Pints, 2.272L', '4 pint', 'https://m.media-amazon.com/images/I/51ya-71tmUL._AC_UL320_ML3_.jpg'),
(117, 4, 2, 'https://www.amazon.co.uk/Morrisons-Whole-British-Milk-pints/dp/B01EYKV5U0/ref=sr_1_1?fpw=fresh&keywords=whole+milk+6+pint&qid=1574251832&s=amazonfresh&sr=1-1', 1.5, 'Morrisons Whole British Milk, 6 pints', '6 pint', 'https://m.media-amazon.com/images/I/511fJqn4MtL._AC_UL320_ML3_.jpg'),
(118, 6, 2, 'https://www.amazon.co.uk/Morrisons-Organic-Semi-Skimmed-pints/dp/B01EYKV7OO/ref=sr_1_1?fpw=fresh&keywords=semi+skimmed+milk+2+pint&qid=1574251847&s=amazonfresh&sr=1-1', 1.16, 'Morrisons Organic Semi Skimmed Milk, 2 pints', '2 pint', 'https://m.media-amazon.com/images/I/51DTDGXoPKL._AC_UL320_ML3_.jpg'),
(119, 6, 2, 'https://www.amazon.co.uk/Morrisons-Semi-Skimmed-British-pints/dp/B01G8RV8KE/ref=sr_1_2?fpw=fresh&keywords=semi+skimmed+milk+2+pint&qid=1574251847&s=amazonfresh&sr=1-2', 0.8, 'Morrisons Semi Skimmed Milk British, 2 pints', '2 pint', 'https://m.media-amazon.com/images/I/415pEHxoXSL._AC_UL320_ML3_.jpg'),
(120, 7, 2, 'https://www.amazon.co.uk/Morrisons-Semi-Skimmed-British-pints/dp/B01GRWA4F0/ref=sr_1_1?fpw=fresh&keywords=semi+skimmed+milk+4+pint&qid=1574251855&s=amazonfresh&sr=1-1', 1.1, 'Morrisons Semi Skimmed British Milk, 4 pints', '4 pint', 'https://m.media-amazon.com/images/I/511wUdaRF6L._AC_UL320_ML3_.jpg'),
(121, 9, 2, 'https://www.amazon.co.uk/Cathedral-City-Mature-Lighter-Cheese/dp/B00ISCR992/ref=sr_1_1?fpw=fresh&keywords=cathedral+cheese+mature+350g&qid=1574251870&s=amazonfresh&sr=1-1', 3.5, 'Cathedral City Mature Lighter Cheese, 350g', '350g', 'https://m.media-amazon.com/images/I/71cCcUh7XqL._AC_UL320_ML3_.jpg'),
(122, 9, 2, 'https://www.amazon.co.uk/Cathedral-City-Mature-Cheddar-Cheese/dp/B00LR7Q07M/ref=sr_1_2?fpw=fresh&keywords=cathedral+cheese+mature+350g&qid=1574251870&s=amazonfresh&sr=1-2', 5, 'Cathedral City Mature Cheddar Cheese, Twin Pack 2x350g', '350g', 'https://m.media-amazon.com/images/I/71RgX+q788L._AC_UL320_ML3_.jpg'),
(123, 9, 2, 'https://www.amazon.co.uk/Cathedral-City-Mature-Cheddar-Cheese/dp/B0062JATOU/ref=sr_1_4?fpw=fresh&keywords=cathedral+cheese+mature+350g&qid=1574251870&s=amazonfresh&sr=1-4', 3.5, 'Cathedral City Mature Cheddar Cheese, 350g', '350g', 'https://m.media-amazon.com/images/I/71YmuQy5stL._AC_UL320_ML3_.jpg'),
(124, 11, 2, 'https://www.amazon.co.uk/Cathedral-City-Extra-Mature-Cheddar/dp/B006ZYQ3FQ/ref=sr_1_2?fpw=fresh&keywords=cathedral+cheese+extra+mature+350g&qid=1574251885&s=amazonfresh&sr=1-2', 3.5, 'Cathedral City Extra Mature Cheddar, 350g', '350g', 'https://m.media-amazon.com/images/I/71gwvkbSzrL._AC_UL320_ML3_.jpg'),
(125, 20, 2, 'https://www.amazon.co.uk/Philadelphia-109824222-Salmon-170-g/dp/B07B7B18YL/ref=sr_1_1?fpw=fresh&keywords=philadelphia+soft+cheese+170g&qid=1574251893&s=amazonfresh&sr=1-1', 2, 'Philadelphia Salmon Soft Cheese, 170 g', '170g', 'https://m.media-amazon.com/images/I/61axykQva3L._AC_UL320_ML3_.jpg'),
(126, 20, 2, 'https://www.amazon.co.uk/Philadelphia-Light-Sweet-Chilli-Cheese/dp/B015Z9Q0V8/ref=sr_1_2?fpw=fresh&keywords=philadelphia+soft+cheese+170g&qid=1574251893&s=amazonfresh&sr=1-2', 1, 'Philadelphia Sweet Chilli Soft Cheese, 170g', '170g', 'https://m.media-amazon.com/images/I/81XtoVl8aVL._AC_UL320_ML3_.jpg'),
(127, 20, 2, 'https://www.amazon.co.uk/Philadelphia-Caramelized-Onion-170-g/dp/B07B79XG58/ref=sr_1_3?fpw=fresh&keywords=philadelphia+soft+cheese+170g&qid=1574251893&s=amazonfresh&sr=1-3', 1, 'Philadelphia Caramelized Onion Soft Cheese, 170 g', '170g', 'https://m.media-amazon.com/images/I/61-Ozp39bBL._AC_UL320_ML3_.jpg'),
(128, 21, 2, 'https://www.amazon.co.uk/Philadelphia-Lightest-Soft-Cheese-180g/dp/B0142HKORU/ref=sr_1_1?fpw=fresh&keywords=philadelphia+soft+cheese+180g&qid=1574251901&s=amazonfresh&sr=1-1', 1, 'Philadelphia Lightest Soft Cheese, 180g', '180g', 'https://m.media-amazon.com/images/I/81RjmCtk7sL._AC_UL320_ML3_.jpg'),
(129, 22, 2, 'https://www.amazon.co.uk/Philadelphia-Chives-Soft-Cheese-340/dp/B07PP23QMH/ref=sr_1_2?fpw=fresh&keywords=philadelphia+soft+cheese+340g&qid=1574251908&s=amazonfresh&sr=1-2', 3, 'Philadelphia Chives Soft Cheese, 340 g', '340g', 'https://m.media-amazon.com/images/I/61d0HtYCldL._AC_UL320_ML3_.jpg'),
(130, 22, 2, 'https://www.amazon.co.uk/Philadelphia-Original-Soft-Cheese-340/dp/B07PTKY156/ref=sr_1_3?fpw=fresh&keywords=philadelphia+soft+cheese+340g&qid=1574251908&s=amazonfresh&sr=1-3', 2, 'Philadelphia Original Soft Cheese, 340 g', '340g', 'https://m.media-amazon.com/images/I/61DXD6AWucL._AC_UL320_ML3_.jpg'),
(131, 22, 2, 'https://www.amazon.co.uk/Philadelphia-Garlic-Herbs-Soft-Cheese/dp/B07PSH8MBY/ref=sr_1_4?fpw=fresh&keywords=philadelphia+soft+cheese+340g&qid=1574251908&s=amazonfresh&sr=1-4', 3, 'Philadelphia Garlic & Herbs Soft Cheese, 340 g', '340g', 'https://m.media-amazon.com/images/I/610gQv0jk+L._AC_UL320_ML3_.jpg'),
(132, 23, 2, 'https://www.amazon.co.uk/Hovis-Medium-Soft-White-Bread/dp/B0042QQNJ0/ref=sr_1_1?fpw=fresh&keywords=white+bread&qid=1574251916&s=amazonfresh&sr=1-1', 1.1, 'Hovis Medium Soft White Bread, 800g', '800g', 'https://m.media-amazon.com/images/I/81hdLZSeb6L._AC_UL320_ML3_.jpg'),
(133, 23, 2, 'https://www.amazon.co.uk/Warburtons-White-Farmhouse-Bread-800/dp/B00140T47A/ref=sr_1_3?fpw=fresh&keywords=white+bread&qid=1574251916&s=amazonfresh&sr=1-3', 1.35, 'Warburtons White Farmhouse Bread, 800 g', '800g', 'https://m.media-amazon.com/images/I/81SkcFBnLwL._AC_UL320_ML3_.jpg'),
(134, 23, 2, 'https://www.amazon.co.uk/Hovis-Soft-White-Thick-Bread/dp/B000N1XPEY/ref=sr_1_10?fpw=fresh&keywords=white+bread&qid=1574251916&s=amazonfresh&sr=1-10', 1.1, 'Hovis Soft White Thick Bread 800g', '800g', 'https://m.media-amazon.com/images/I/81Q1tXlbrrL._AC_UL320_ML3_.jpg'),
(135, 23, 2, 'https://www.amazon.co.uk/Warburtons-Medium-White-Bread-800g/dp/B00180B13Q/ref=sr_1_11?fpw=fresh&keywords=white+bread&qid=1574251916&s=amazonfresh&sr=1-11', 1.05, 'Warburtons Medium White Bread, 800g', '800g', 'https://m.media-amazon.com/images/I/41knkcHrF-L._AC_UL320_ML3_.jpg'),
(136, 23, 2, 'https://www.amazon.co.uk/Warburtons-Toastie-White-Bread-800/dp/B01G8T5VCS/ref=sr_1_24?fpw=fresh&keywords=white+bread&qid=1574251916&s=amazonfresh&sr=1-24', 1.05, 'Warburtons Toastie White Bread, 800 g', '800g', 'https://m.media-amazon.com/images/I/71PJGhO7f0L._AC_UL320_ML3_.jpg'),
(137, 24, 2, 'https://www.amazon.co.uk/Hovis-Wholemeal-Granary-Bread-800g/dp/B00Z6SJQJW/ref=sr_1_3?fpw=fresh&keywords=wholemeal+bread&qid=1574251924&s=amazonfresh&sr=1-3', 1.45, 'Hovis Wholemeal Granary Bread 800g', '800g', 'https://m.media-amazon.com/images/I/81h24tJkjAL._AC_UL320_ML3_.jpg'),
(138, 24, 2, 'https://www.amazon.co.uk/Hovis-Wholemeal-Thick-Bread-800g/dp/B00DP7E5RO/ref=sr_1_4?fpw=fresh&keywords=wholemeal+bread&qid=1574251924&s=amazonfresh&sr=1-4', 1.1, 'Hovis Wholemeal Thick Bread 800g', '800g', 'https://m.media-amazon.com/images/I/816va73EB6L._AC_UL320_ML3_.jpg'),
(139, 24, 2, 'https://www.amazon.co.uk/Warburtons-Wholemeal-Medium-Bread-800/dp/B01G8T5G6O/ref=sr_1_8?fpw=fresh&keywords=wholemeal+bread&qid=1574251924&s=amazonfresh&sr=1-8', 1.05, 'Warburtons Wholemeal Medium Bread, 800 g', '800g', 'https://m.media-amazon.com/images/I/71tHI4+NjVL._AC_UL320_ML3_.jpg'),
(140, 24, 2, 'https://www.amazon.co.uk/Hovis-Sensations-Seeds-Wholemeal-Bread/dp/B00BQL7IGG/ref=sr_1_17?fpw=fresh&keywords=wholemeal+bread&qid=1574251924&s=amazonfresh&sr=1-17', 1.5, 'Hovis Seed Sensations 7 Seeds Wholemeal Bread 800g', '800g', 'https://m.media-amazon.com/images/I/818ShX49JpL._AC_UL320_ML3_.jpg'),
(141, 24, 2, 'https://www.amazon.co.uk/Hovis-Wholemeal-Medium-Bread-800g/dp/B0066OA6ZS/ref=sr_1_18?fpw=fresh&keywords=wholemeal+bread&qid=1574251924&s=amazonfresh&sr=1-18', 1.1, 'Hovis Wholemeal Medium Bread 800g', '800g', 'https://m.media-amazon.com/images/I/81PhtDp08hL._AC_UL320_ML3_.jpg'),
(142, 25, 2, 'https://www.amazon.co.uk/Warburtons-English-White-Bread-400g/dp/B01E3SWLGK/ref=sr_1_2?fpw=fresh&keywords=white+bread&qid=1574251933&s=amazonfresh&sr=1-2', 1.5, 'Warburtons Old English White Bread, 400g', '400g', 'https://m.media-amazon.com/images/I/61Iqky4zkML._AC_UL320_ML3_.jpg'),
(143, 25, 2, 'https://www.amazon.co.uk/Warburtons-Toastie-White-Bread-400/dp/B01G8T5AOC/ref=sr_1_7?fpw=fresh&keywords=white+bread&qid=1574251933&s=amazonfresh&sr=1-7', 0.9, 'Warburtons Toastie White Bread, 400 g', '400g', 'https://m.media-amazon.com/images/I/61T-FPUc3FL._AC_UL320_ML3_.jpg'),
(144, 25, 2, 'https://www.amazon.co.uk/Warburtons-White-Farmhouse-Bread-400/dp/B005M7B9RY/ref=sr_1_21?fpw=fresh&keywords=white+bread&qid=1574251933&s=amazonfresh&sr=1-21', 1, 'Warburtons White Farmhouse Bread, 400 g', '400g', 'https://m.media-amazon.com/images/I/71s-Ygbw9XL._AC_UL320_ML3_.jpg'),
(145, 25, 2, 'https://www.amazon.co.uk/Warburtons-Medium-White-Bread-400/dp/B002E2N5PO/ref=sr_1_22?fpw=fresh&keywords=white+bread&qid=1574251933&s=amazonfresh&sr=1-22', 0.9, 'Warburtons Medium White Bread, 400 g', '400g', 'https://m.media-amazon.com/images/I/61YPXLvG4ZL._AC_UL320_ML3_.jpg'),
(146, 26, 2, 'https://www.amazon.co.uk/Warburtons-Wholemeal-Medium-Bread-400g/dp/B002E2N5MW/ref=sr_1_1?fpw=fresh&keywords=wholemeal+bread&qid=1574251941&s=amazonfresh&sr=1-1', 0.9, 'Warburtons Wholemeal Medium Bread, 400g', '400g', 'https://m.media-amazon.com/images/I/81JeHcyCiqL._AC_UL320_ML3_.jpg'),
(147, 26, 2, 'https://www.amazon.co.uk/HOVIS-Lower-Carb-Wholemeal-Bread/dp/B07219SW11/ref=sr_1_2?fpw=fresh&keywords=wholemeal+bread&qid=1574251941&s=amazonfresh&sr=1-2', 1.2, 'HOVIS Lower Carb Wholemeal Bread, 400g', '400g', 'https://m.media-amazon.com/images/I/71Fs0JOCvML._AC_UL320_ML3_.jpg'),
(148, 27, 2, 'https://www.amazon.co.uk/Tropicana-Orange-Juice-Original-950/dp/B06XNPCXY4/ref=sr_1_23?fpw=fresh&keywords=tropicana+orange+juice&qid=1574251951&s=amazonfresh&sr=1-23', 2.48, 'Tropicana Orange Juice Original, 950 ml', '950ml', 'https://m.media-amazon.com/images/I/719spJKJvLL._AC_UL320_ML3_.jpg'),
(149, 29, 2, 'https://www.amazon.co.uk/Tropicana-Apple-Juice-950-ml/dp/B06XL17V7Q/ref=sr_1_14?fpw=fresh&keywords=tropicana+apple+juice&qid=1574251967&s=amazonfresh&sr=1-14', 2.48, 'Tropicana Apple Juice, 950 ml', '950ml', 'https://m.media-amazon.com/images/I/71ZX8SHKoyL._AC_UL320_ML3_.jpg'),
(150, 30, 2, 'https://www.amazon.co.uk/Ocean-Spray-Cranberry-Classic-Juice/dp/B01CU0N1VM/ref=sr_1_1?fpw=fresh&keywords=ocean+spray+cranberry+juice&qid=1574251975&s=amazonfresh&sr=1-1', 4.85, 'Ocean Spray Cranberry Classic Juice Drink, 4 x 1L', '1L', 'https://m.media-amazon.com/images/I/71PfPQaiwkL._AC_UL320_ML3_.jpg'),
(151, 30, 2, 'https://www.amazon.co.uk/Ocean-Spray-Cranberry-Classic-Juice/dp/B016IP66H6/ref=sr_1_2?fpw=fresh&keywords=ocean+spray+cranberry+juice&qid=1574251975&s=amazonfresh&sr=1-2', 1, 'Ocean Spray Cranberry Classic Juice Drink, 1l', '1L', 'https://m.media-amazon.com/images/I/81pmiBT4HxL._AC_UL320_ML3_.jpg'),
(152, 30, 2, 'https://www.amazon.co.uk/Ocean-Spray-Cranberry-Classic-Light/dp/B01CE56EIU/ref=sr_1_3?fpw=fresh&keywords=ocean+spray+cranberry+juice&qid=1574251975&s=amazonfresh&sr=1-3', 1.5, 'Ocean Spray Cranberry Classic Light Juice Drink, 1l', '1L', 'https://m.media-amazon.com/images/I/614a84e6iNL._AC_UL320_ML3_.jpg'),
(153, 30, 2, 'https://www.amazon.co.uk/Ocean-Spray-Cranberry-Raspberry-Juice/dp/B016IPBRA2/ref=sr_1_5?fpw=fresh&keywords=ocean+spray+cranberry+juice&qid=1574251975&s=amazonfresh&sr=1-5', 1.5, 'Ocean Spray Cranberry and Raspberry Juice, 1l', '1L', 'https://m.media-amazon.com/images/I/41Ga6L02WIL._AC_UL320_ML3_.jpg'),
(154, 30, 2, 'https://www.amazon.co.uk/Ocean-Spray-Cranberry-Blueberry-Juice/dp/B016IPBUOU/ref=sr_1_7?fpw=fresh&keywords=ocean+spray+cranberry+juice&qid=1574251975&s=amazonfresh&sr=1-7', 1.4, 'Ocean Spray Cranberry and Blueberry Juice, 1L', '1L', 'https://m.media-amazon.com/images/I/712CxHbUTIL._AC_UL320_ML3_.jpg'),
(155, 31, 2, 'https://www.amazon.co.uk/innocent-smooth-orange-juice-1-35L/dp/B0132FLLY8/ref=sr_1_1?fpw=fresh&keywords=innocent+orange+juice&qid=1574251982&s=amazonfresh&sr=1-1', 3, 'innocent smooth orange juice 1.35L', '1.35', 'https://m.media-amazon.com/images/I/71gxpKjE9wL._AC_UL320_ML3_.jpg'),
(156, 31, 2, 'https://www.amazon.co.uk/innocent-orange-juice-bits-1-35L/dp/B0132FLBEI/ref=sr_1_2?fpw=fresh&keywords=innocent+orange+juice&qid=1574251982&s=amazonfresh&sr=1-2', 3.2, 'innocent orange juice with bits 1.35L', '1.35', 'https://m.media-amazon.com/images/I/71q7V-dmQsL._AC_UL320_ML3_.jpg'),
(157, 32, 2, 'https://www.amazon.co.uk/Innocent-106317508-innocent-tropical-juice/dp/B0132FOH6M/ref=sr_1_1?fpw=fresh&keywords=innocent+tropical+juice&qid=1574251990&s=amazonfresh&sr=1-1', 2.5, 'innocent tropical juice 1.35L', '1.35', 'https://m.media-amazon.com/images/I/71lqicH8uDL._AC_UL320_ML3_.jpg'),
(158, 33, 2, 'https://www.amazon.co.uk/innocent-apple-mango-juice-1-35L/dp/B0132FJIO8/ref=sr_1_2?fpw=fresh&keywords=innocent+apple&qid=1574251998&s=amazonfresh&sr=1-2', 3.2, 'innocent apple & mango juice 1.35L', '1.35', 'https://m.media-amazon.com/images/I/71yT-IzTKpL._AC_UL320_ML3_.jpg'),
(159, 34, 2, 'https://www.amazon.co.uk/Laughing-Cow-Plain-cheese-Triangles/dp/B003X88MEC/ref=sr_1_1?fpw=fresh&keywords=laughing+cow+cheese&qid=1574252005&s=amazonfresh&sr=1-1', 2, 'The Laughing Cow Plain cheese Triangles, 280g', '280g', 'https://m.media-amazon.com/images/I/515fMZxdVCL._AC_UL320_ML3_.jpg'),
(160, 34, 2, 'https://www.amazon.co.uk/Laughing-Cow-Light-cheese-triangles/dp/B003TESMQ8/ref=sr_1_3?fpw=fresh&keywords=laughing+cow+cheese&qid=1574252005&s=amazonfresh&sr=1-3', 2, 'The Laughing Cow Light cheese triangles, 280g', '280g', 'https://m.media-amazon.com/images/I/811ZYgWhSWL._AC_UL320_ML3_.jpg'),
(161, 35, 2, 'https://www.amazon.co.uk/Laughing-Cow-Extra-Cheese-Triangles/dp/B003CMCN3U/ref=sr_1_5?fpw=fresh&keywords=laughing+cow+cheese&qid=1574252012&s=amazonfresh&sr=1-5', 1.4, 'The Laughing Cow Extra Light Cheese Triangles, 140g', '140g', 'https://m.media-amazon.com/images/I/91p0atYSf-L._AC_UL320_ML3_.jpg'),
(162, 35, 2, 'https://www.amazon.co.uk/Laughing-Cow-Plain-cheese-Triangles/dp/B0046SIRLQ/ref=sr_1_6?fpw=fresh&keywords=laughing+cow+cheese&qid=1574252012&s=amazonfresh&sr=1-6', 1.4, 'The Laughing Cow Plain cheese Triangles, 140g', '140g', 'https://m.media-amazon.com/images/I/51+py7MM8jL._AC_UL320_ML3_.jpg'),
(163, 43, 2, 'https://www.amazon.co.uk/Anchor-Original-Block-Butter-250g/dp/B002V6N7W4/ref=sr_1_2?fpw=fresh&keywords=anchor+salted+butter&qid=1574252070&s=amazonfresh&sr=1-2', 1.8, 'Anchor Original Block Butter, 250g', '250g', 'https://m.media-amazon.com/images/I/71B+qnQVkRL._AC_UL320_ML3_.jpg'),
(164, 43, 2, 'https://www.amazon.co.uk/Anchor-103098637-Spreadable-250-g/dp/B007N1O69A/ref=sr_1_3?fpw=fresh&keywords=anchor+salted+butter&qid=1574252070&s=amazonfresh&sr=1-3', 1.95, 'Anchor Spreadable, 250 g', '250g', 'https://m.media-amazon.com/images/I/71kz8Y15TFL._AC_UL320_ML3_.jpg'),
(165, 43, 2, 'https://www.amazon.co.uk/Anchor-103086353-Unsalted-Butter-250g/dp/B01GCQ69YG/ref=sr_1_fkmr1_1?fpw=fresh&keywords=anchor+salted+butter&qid=1574252070&s=amazonfresh&sr=1-1-fkmr1', 1.64, 'Anchor Unsalted Butter, 250g', '250g', 'https://m.media-amazon.com/images/I/71ktOrm3DTL._AC_UL320_ML3_.jpg'),
(166, 45, 2, 'https://www.amazon.co.uk/Anchor-Spreadable-Light-Butter-500g/dp/B003FTDYYW/ref=sr_1_3?fpw=fresh&keywords=anchor+spreadable&qid=1574252084&s=amazonfresh&sr=1-3', 2.5, 'Anchor Spreadable Light Tub Butter, 500g', '500g', 'https://m.media-amazon.com/images/I/71oUO+k+hdL._AC_UL320_ML3_.jpg'),
(167, 49, 2, 'https://www.amazon.co.uk/Lurpak-Lighter-Spreadable-250-g/dp/B007SAW8YG/ref=sr_1_7?fpw=fresh&keywords=lurpak+spreadable&qid=1574252112&s=amazonfresh&sr=1-7', 2.2, 'Lurpak Lighter Spreadable, 250 g', '250g', 'https://m.media-amazon.com/images/I/71EPrwDpBpL._AC_UL320_ML3_.jpg'),
(168, 50, 2, 'https://www.amazon.co.uk/Lurpak-Unsalted-Spreadable-Butter-500g/dp/B00ISCQDCG/ref=sr_1_1?fpw=fresh&keywords=lurpak+spreadable&qid=1574252119&s=amazonfresh&sr=1-1', 3.75, 'Lurpak Unsalted Spreadable, 500 g', '500g', 'https://m.media-amazon.com/images/I/71J3DaQjQVL._AC_UL320_ML3_.jpg'),
(169, 50, 2, 'https://www.amazon.co.uk/Lurpak-Slightly-Salted-Spreadable-500/dp/B0042QZQA2/ref=sr_1_2?fpw=fresh&keywords=lurpak+spreadable&qid=1574252119&s=amazonfresh&sr=1-2', 3, 'Lurpak Slightly Salted Spreadable, 500 g', '500g', 'https://m.media-amazon.com/images/I/71+jqqe2-EL._AC_UL320_ML3_.jpg'),
(170, 50, 2, 'https://www.amazon.co.uk/Lurpak-Softest-Slightly-Salted-500/dp/B07GJPK4G2/ref=sr_1_3?fpw=fresh&keywords=lurpak+spreadable&qid=1574252119&s=amazonfresh&sr=1-3', 3.75, 'Lurpak Softest Spreadable, 500g', '500g', 'https://m.media-amazon.com/images/I/61qUPHPtMvL._AC_UL320_ML3_.jpg'),
(171, 50, 2, 'https://www.amazon.co.uk/Lurpak-Spreadable-Olive-Lighter-Butter/dp/B014QTYP10/ref=sr_1_4?fpw=fresh&keywords=lurpak+spreadable&qid=1574252119&s=amazonfresh&sr=1-4', 3.75, 'Lurpak Lighter Olive Oil Spreadable, 500 g', '500g', 'https://m.media-amazon.com/images/I/717ojOEXnML._AC_UL320_ML3_.jpg'),
(172, 50, 2, 'https://www.amazon.co.uk/Lurpak-Lightest-Spreadable-Butter-500g/dp/B01GCRG5V2/ref=sr_1_10?fpw=fresh&keywords=lurpak+spreadable&qid=1574252119&s=amazonfresh&sr=1-10', 3.75, 'Lurpak Lightest Spreadable, 500 g', '500g', 'https://m.media-amazon.com/images/I/71lfU3IECjL._AC_UL320_ML3_.jpg'),
(173, 50, 2, 'https://www.amazon.co.uk/Lurpak-Spreadable-Lighter-Unsalted-Butter/dp/B004M201EM/ref=sr_1_12?fpw=fresh&keywords=lurpak+spreadable&qid=1574252119&s=amazonfresh&sr=1-12', 3.75, 'Lurpak Lighter Unsalted Spreadable, 500 g', '500g', 'https://m.media-amazon.com/images/I/71Dneesw15L._AC_UL320_ML3_.jpg'),
(174, 1, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-whole-milk-568ml-%281pint%29', 0.5, 'Sainsbury\'s British Whole Milk 568ml (1 pint)', '1 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/58/0000000181358/0000000181358_L.jpeg'),
(175, 1, 5, 'https://www.tesco.com/groceries/en-GB/products/251314233', 0.5, 'Tesco British Whole Milk 568Ml, 1 Pint', '1 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(176, 1, 5, 'https://www.tesco.com/groceries/en-GB/products/300735426', 0.59, 'Tesco Filtered Whole Milk 568Ml / 1 Pint', '1 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(177, 1, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-fresh-milk--organic-568ml-%281pint%29', 0.65, 'Sainsbury\'s British Whole Milk, SO Organic 568ml (1 pint)', '1 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/90/0000000425490/0000000425490_L.jpeg'),
(178, 2, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-whole-milk-113l-%282pint%29', 0.8, 'Sainsbury\'s British Whole Milk 1.13L (2 pint)', '2 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/13/0000001137613/0000001137613_L.jpeg'),
(179, 2, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-whole-milk--so-organic-113l-%282-pint%29', 1.15, 'Sainsbury\'s British Whole Milk, SO Organic 1.13L (2 pint)', '2 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/87/0000001219487/0000001219487_L.jpeg'),
(180, 2, 5, 'https://www.tesco.com/groceries/en-GB/products/252207566', 0.8, 'Tesco British Whole Milk 1.13L, 2 Pints', '2 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(181, 3, 5, 'https://www.tesco.com/groceries/en-GB/products/254656399', 1.09, 'Tesco British Whole Milk 2.272L, 4 Pints', '4 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(182, 3, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-whole-milk-227l-%284-pint%29', 1.1, 'Sainsbury\'s British Whole Milk 2.27L (4 pint)', '4 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/02/0000000181402/0000000181402_L.jpeg'),
(183, 3, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-fresh-whole-milk--so-organic-227l-%284-pint%29', 1.8, 'Sainsbury\'s British Whole Milk, SO Organic 2.27L (4 Pint)', '4 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/43/0000001208443/0000001208443_L.jpeg'),
(184, 4, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-whole-milk-34l-%286-pint%29', 1.5, 'Sainsbury\'s British Whole Milk 3.4L (6 pint)', '6 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/05/0000000425605/0000000425605_L.jpeg'),
(185, 4, 5, 'https://www.tesco.com/groceries/en-GB/products/254957550', 1.5, 'Tesco British Whole Milk 3.408L, 6 Pints', '6 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(186, 5, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-fresh-milk--semi-skimmed-568ml-%281pint%29', 0.5, 'Sainsbury\'s British Semi Skimmed Milk 1 Pint', '1 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/59/0000000173759/0000000173759_L.jpeg'),
(187, 5, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-fresh-milk--semi-skimmed--organic-568ml-%281pint%29', 0.65, 'Sainsbury\'s British Semi Skimmed Milk, SO Organic 568ml (1 pint)', '1 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/38/0000001544138/0000001544138_L.jpeg'),
(188, 5, 5, 'https://www.tesco.com/groceries/en-GB/products/251314158', 0.5, 'Tesco British Semi Skimmed Milk 568 Ml, 1 Pint', '1 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(189, 5, 5, 'https://www.tesco.com/groceries/en-GB/products/300735386', 0.59, 'Tesco Filtered Semi Skimmed Milk 568Ml / 1 Pint', '1 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(190, 5, 5, 'https://www.tesco.com/groceries/en-GB/products/253689085', 0.6, 'Tesco Organic British Semi Skimmed Milk 568Ml/1 Pint', '1 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(191, 6, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-fresh-milk--semi-skimmed-113l-%282pint%29', 0.8, 'Sainsbury\'s British Semi Skimmed Milk 1.13L (2 pint)', '2 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/37/0000001137637/0000001137637_L.jpeg'),
(192, 6, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-fresh-milk--semi-skimmed--so-organic-113l-%282-pint%29', 1.15, 'Sainsbury\'s British Semi Skimmed Milk, SO Organic 1.13L (2 pint)', '2 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/94/0000001219494/0000001219494_L.jpeg'),
(193, 6, 5, 'https://www.tesco.com/groceries/en-GB/products/252207537', 0.8, 'Tesco British Semi Skimmed Milk 1.13L, 2 Pints', '2 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(194, 6, 5, 'https://www.tesco.com/groceries/en-GB/products/251499710', 0.89, 'Tesco Organic British Semi Skimmed Milk 1.136L, 2 Pint', '2 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(195, 7, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-semi-skimmed-milk-227l-%284-pint%29', 1.1, 'Sainsbury\'s British Semi Skimmed Milk 2.27L (4 pint)', '4 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/37/0000000357937/0000000357937_L.jpeg'),
(196, 7, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-fresh-milk--semi-skimmed--so-organic-227l-%284-pint%29', 1.8, 'Sainsbury\'s British Semi Skimmed Milk, SO Organic 2.27L (4 pint)', '4 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/50/0000001208450/0000001208450_L.jpeg'),
(197, 7, 5, 'https://www.tesco.com/groceries/en-GB/products/254656543', 1.09, 'Tesco British Semi Skimmed Milk 2.272L, 4 Pints', '4 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(198, 7, 5, 'https://www.tesco.com/groceries/en-GB/products/251499998', 1.5, 'Tesco Organic British Semi Skimmed Milk 2.272L/4 Pints', '4 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(199, 8, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-british-fresh-milk--semi-skimmed-34l-%286-pint%29', 1.5, 'Sainsbury\'s British Semi Skimmed Milk 3.4L (6 pint)', '6 pint', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/90/0000000464390/0000000464390_L.jpeg'),
(200, 8, 5, 'https://www.tesco.com/groceries/en-GB/products/255986260', 1.5, 'Tesco British Semi Skimmed Milk 3.408L, 6 Pints', '6 pint', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(201, 9, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/cathedral-city-mature-350g', 2.5, 'Cathedral City Mature Cheddar Cheese 350g', '350g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/93/5000295142893/5000295142893_L.jpeg'),
(202, 10, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/cathedral-city-lighter-350g', 2.5, 'Cathedral City Lighter Cheddar Cheese 350g', '350g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/12/5000295141612/5000295141612_L.jpeg'),
(203, 9, 5, 'https://www.tesco.com/groceries/en-GB/products/268768873', 3.5, 'Cathedral City Mature Cheddar Cheese 350 G', '350g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(204, 11, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/cathedral-city-extra-mature-cheddar-350g', 2.5, 'Cathedral City Extra Mature Cheddar Cheese 350g', '350g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/99/5000295141599/5000295141599_L.jpeg'),
(205, 10, 5, 'https://www.tesco.com/groceries/en-GB/products/267308648', 3.5, 'Cathedral City Lighter Mature Cheese 350 G', '350g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(206, 20, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/philadelphia-light-garlic---herbs-170g', 1, 'Philadelphia Garlic & Herbs Soft Cheese 170g', '170g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/09/7622210307309/7622210307309_L.jpeg'),
(207, 20, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/philadelphia-light-chives-170g', 1, 'Philadelphia Chives Soft Cheese 170g', '170g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/23/7622210307323/7622210307323_L.jpeg'),
(208, 20, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/philadelphia-light-sweet-chilli-170g', 1, 'Philadelphia Sweet Chilli Soft Cheese 170g', '170g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/85/7622210307385/7622210307385_L.jpeg'),
(209, 20, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/philadelphia-caramelised-onion-soft-cheese-170g', 1, 'Philadelphia Caramelised Onion Soft Cheese 170g', '170g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/25/7622210854025/7622210854025_L.jpeg'),
(210, 20, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/philadelphia-jalepeno-170g', 1, 'Philadelphia Jalapeno Soft Cheese 170g', '170g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/36/7622201108236/7622201108236_L.jpeg'),
(211, 11, 5, 'https://www.tesco.com/groceries/en-GB/products/267273555', 3.5, 'Cathedral City Extra Mature Cheddar Cheese 350 G', '350g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(212, 21, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/philadelphia-180g', 1, 'Philadelphia Original Soft Cheese 180g', '180g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/60/7622210307460/7622210307460_L.jpeg'),
(213, 21, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/philadelphia-light-180g', 1, 'Philadelphia Light Soft Cheese 180g', '180g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/14/7622210307514/7622210307514_L.jpeg');
INSERT INTO `product_price` (`price_id`, `product_id`, `supermarket_id`, `price_source`, `product_price`, `product_description`, `product_volume`, `product_image`) VALUES
(214, 21, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/philadelphia-lightest-180g', 1, 'Philadelphia Lightest Soft Cheese 180g', '180g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/90/7622210307590/7622210307590_L.jpeg'),
(215, 20, 5, 'https://www.tesco.com/groceries/en-GB/products/285140864', 1.95, 'Philadelphia Soft Cheese With Chives 170 G', '170g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(216, 20, 5, 'https://www.tesco.com/groceries/en-GB/products/285141419', 1.95, 'Philadelphia Soft Cheese With Sweet Chilli 170 G', '170g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(217, 22, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/philadelphia-original-soft-white-cheese-family-pack-340g', 3, 'Philadelphia Original Soft Cheese 340g', '340g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/74/7622210585974/7622210585974_L.jpeg'),
(218, 22, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/philadelphia-light-340g', 3, 'Philadelphia Light Soft Cheese 340g', '340g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/43/7622210585943/7622210585943_L.jpeg'),
(219, 22, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/philadelphia-soft-white-cheese-with-garlic-herbs-family-pack-340g', 3, 'Philadelphia Garlic & Herb Soft Cheese 340g', '340g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/50/7622210585950/7622210585950_L.jpeg'),
(220, 21, 5, 'https://www.tesco.com/groceries/en-GB/products/285142009', 1.95, 'Philadelphia Original Soft Cheese 180 G', '180g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(221, 21, 5, 'https://www.tesco.com/groceries/en-GB/products/285140743', 1.95, 'Philadelphia Light Soft Cheese 180 G', '180g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(222, 21, 5, 'https://www.tesco.com/groceries/en-GB/products/285141955', 1.95, 'Philadelphia Lightest Soft Cheese 180 G', '180g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(223, 23, 1, 'https://www.sainsburys.co.uk/shop/ProductDisplay?productId=90706&storeId=10151&langId=44&categoryId=', 1, 'Kingsmill Soft Medium Sliced White Bread 800g', '800g', 'https:/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/45/5010092093045/5010092093045_L.jpeg'),
(224, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/hovis-soft-white-bread--medium-sliced-800g', 1.2, 'Hovis Soft Medium Sliced White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/31/5010003000131/5010003000131_L.jpeg'),
(225, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-white-sliced-bread--toastie-800g', 1.1, 'Warburtons Toastie Thick Sliced White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/21/5010044000121/5010044000121_L.jpeg'),
(226, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/hovis-soft-white-bread--thick-sliced-800g', 1.2, 'Hovis Soft Thick Sliced White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/26/5010003054226/5010003054226_L.jpeg'),
(227, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-farmhouse-bread--original-soft-800g', 1.35, 'Warburtons Soft Farmhouse Medium Sliced White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/78/5010044002378/5010044002378_L.jpeg'),
(228, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-white-bread--medium-sliced-800g', 1.1, 'Warburtons Medium Sliced White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/39/5010044000039/5010044000039_L.jpeg'),
(229, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-white-bread--medium-sliced-800g', 0.55, 'Sainsbury\'s Soft Medium Sliced White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/37/0000000014137/0000000014137_L.jpeg'),
(230, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-white-sliced-bread--basics-800g', 0.45, 'Daily\'s Medium Sliced White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/63/0000001048063/0000001048063_L.jpeg'),
(231, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-sandwich-loaf-white-bread-800g-6539298-p', 1.1, 'Sainsbury\'s Sandwich Loaf White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/52/0000001052152/0000001052152_L.jpeg'),
(232, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-farmhouse-loaf-white-bread-800g-6504660-p', 1.1, 'Sainsbury\'s Farmhouse Loaf White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/50/0000001050950/0000001050950_L.jpeg'),
(233, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-toastie-extra-thick-sliced-white-bread-800g', 0.55, 'Sainsbury\'s Toastie Thick Sliced White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/78/0000001691078/0000001691078_L.jpeg'),
(234, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-white-sliced-thickest-bread-800g', 1.1, 'Warburtons Extra Thick Sliced White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/47/5010044002347/5010044002347_L.jpeg'),
(235, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-split-tin-white-bread-800g-6539339-p', 1.1, 'Sainsbury\'s Split Tin White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/83/0000001052183/0000001052183_L.jpeg'),
(236, 23, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-lancashires-thorough-bread-medium-sliced-white-bread-800g', 1.55, 'Warburtons Lancashire\'s Thorough Bread Medium Sliced White Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/63/5010044007663/5010044007663_L.jpeg'),
(237, 24, 1, 'https://www.sainsburys.co.uk/shop/ProductDisplay?productId=90710&storeId=10151&langId=44&categoryId=', 1, 'Kingsmill Medium Sliced Wholemeal Bread 800g', '800g', 'https:/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/43/5010092093243/5010092093243_L.jpeg'),
(238, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/hovis-wholemeal-bread--medium-sliced-800g', 1.2, 'Hovis Medium Sliced Wholemeal Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/39/5010003000339/5010003000339_L.jpeg'),
(239, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-multi-seeded-wholemeal-bread--taste-the-difference-800g', 1.1, 'Sainsbury\'s Soft Multiseed Farmhouse Thick Sliced Wholemeal Bread, Taste the Difference 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/80/0000001318180/0000001318180_L.jpeg'),
(240, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-wholemeal-bread--medium-sliced-800g', 0.55, 'Sainsbury\'s Medium Sliced Wholemeal Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/57/0000000280457/0000000280457_L.jpeg'),
(241, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/hovis-wholemeal-bread--thick-sliced-800g', 1.2, 'Hovis Thick Sliced Wholemeal Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/53/5010003000353/5010003000353_L.jpeg'),
(242, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-wholemeal-bread--sliced-800g', 1.1, 'Warburtons Medium Sliced Wholemeal Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/51/5010044000251/5010044000251_L.jpeg'),
(243, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-medium-wholemeal-bread--basics-800g', 0.45, 'Daily\'s Medium Sliced Wholemeal Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/21/0000001641721/0000001641721_L.jpeg'),
(244, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/hovis-wholemeal-seeded-granary-bread-800g', 1.55, 'Hovis Granary Thick Sliced Wholemeal Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/92/5010003000292/5010003000292_L.jpeg'),
(245, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/kingsmill-tasty-wholemeal-bread--thick-800g', 1, 'Kingsmill Thick Sliced Wholemeal Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/42/5010092093342/5010092093342_L.jpeg'),
(246, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-wholemeal-bread--so-organic-800g', 1.45, 'Sainsbury\'s Thick Sliced Wholemeal Bread, SO Organic 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/13/0000001351613/0000001351613_L.jpeg'),
(247, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-thick-sliced-wholemeal-bread-800g', 0.55, 'Sainsbury\'s Thick Sliced Wholemeal Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/89/0000000315289/0000000315289_L.jpeg'),
(248, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/cranks-wholemeal-organic-bread-800g', 1.5, 'Cranks Organic Unsliced Wholemeal Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/03/5011986009203/5011986009203_L.jpeg'),
(249, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/hovis-medium-sliced-wholemeal-bread-farmhouse-loaf-800g', 1.25, 'Hovis Medium Sliced Wholemeal Bread Farmhouse Loaf 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/65/5010003069565/5010003069565_L.jpeg'),
(250, 24, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/vogel-seeded-wholemeal-bread-800g', 1.55, 'Vogel Seeded Wholemeal Bread 800g', '800g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/24/5014272108024/5014272108024_L.jpeg'),
(251, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/288406949', 0.55, 'Tesco White Medium Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(252, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/256174499', 1.1, 'Hovis Soft White Medium Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(253, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/250168194', 1.35, 'Warburtons Farmhouse White Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(254, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/254550817', 1.1, 'Hovis Soft White Thick Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(255, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/254942348', 1.05, 'Warburtons Toastie Sliced White Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(256, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/285060503', 0.55, 'Tesco White Toastie Thick Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(257, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/250759508', 1.1, 'Tesco Crusty White Farmhouse Sliced Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(258, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/254942325', 1.05, 'Warburtons Medium Sliced White Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(259, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/299045570', 0.36, 'H W Nevill\'s White Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(260, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/255809189', 1.1, 'Tesco White Farmhouse Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(261, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/259804983', 0.89, 'Kingsmill Soft White Thick Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(262, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/255809143', 1.1, 'Tesco Crusty White Split Tin Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(263, 23, 5, 'https://www.tesco.com/groceries/en-GB/products/255809310', 1.1, 'Tesco Crusty White Split Tin Sliced Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(264, 25, 1, 'https://www.sainsburys.co.uk/shop/ProductDisplay?productId=1127504&storeId=10151&langId=44&categoryId=', 1.5, 'Sainsbury\'s Sourdough Medium Sliced White Bread, Taste the Difference 400g', '400g', 'https:/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/51/0000000252751/0000000252751_L.jpeg'),
(265, 25, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-white-toastie-bread--sliced-400g', 0.85, 'Warburtons Toastie Thick Sliced White Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/75/5010044000275/5010044000275_L.jpeg'),
(266, 25, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-danish-white-bread--sliced-400g', 1, 'Warburtons Lighter Medium Sliced Danish White Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/05/5010044000305/5010044000305_L.jpeg'),
(267, 25, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-white-bread--medium-sliced-400g', 0.85, 'Warburtons Medium Sliced White Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/34/5010044001234/5010044001234_L.jpeg'),
(268, 25, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-white-batch-bread--seeded-400g', 0.9, 'Warburtons Seeded Thick Sliced White Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/46/5010044002446/5010044002446_L.jpeg'),
(269, 25, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-farmhouse-white-bread-400g-6539611-p', 0.8, 'Sainsbury\'s Farmhouse White Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/50/0000001052350/0000001052350_L.jpeg'),
(270, 25, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-blackpool-milk-roll-400g', 1, 'Warburtons Milk Roll Soft Medium Sliced White Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/12/5010044000312/5010044000312_L.jpeg'),
(271, 25, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-crusty-white-bread-400g', 1, 'Warburtons Crusty Medium Sliced White Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/74/5010044002774/5010044002774_L.jpeg'),
(272, 25, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/km-crustaway-white-bread-400g', 1.4, 'Kingsmill No Crusts Soft Medium Sliced White Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/46/5010092079346/5010092079346_L.jpeg'),
(273, 25, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-old-english-white-bread-400g', 1.2, 'Warburtons Old English Medium Sliced White Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/29/5010044006529/5010044006529_L.jpeg'),
(274, 25, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-white-bread-so-organic-400g-7559875-p', 0.95, 'Sainsbury\'s White Bread SO Organic 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/26/0000001128826/0000001128826_L.jpeg'),
(275, 25, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-toastie-sliced-white-bread-400g', 0.5, 'Sainsbury\'s Toastie Sliced White Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/98/0000000311298/0000000311298_L.jpeg'),
(276, 24, 5, 'https://www.tesco.com/groceries/en-GB/products/257964778', 1.1, 'Tesco Wholemeal Bread Loaf 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(277, 24, 5, 'https://www.tesco.com/groceries/en-GB/products/252990345', 0.89, 'Kingsmill Tasty Wholemeal Medium Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(278, 24, 5, 'https://www.tesco.com/groceries/en-GB/products/255000362', 1.1, 'Hovis Wholemeal Medium Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(279, 24, 5, 'https://www.tesco.com/groceries/en-GB/products/263518014', 1.1, 'Hovis Wholemeal Thick Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(280, 24, 5, 'https://www.tesco.com/groceries/en-GB/products/254944260', 1.05, 'Warburtons Wholemeal Medium Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(281, 24, 5, 'https://www.tesco.com/groceries/en-GB/products/288407096', 0.55, 'Tesco Wholemeal Medium Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(282, 24, 5, 'https://www.tesco.com/groceries/en-GB/products/293352123', 1.15, 'Hovis Farmhouse Wholemeal Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(283, 24, 5, 'https://www.tesco.com/groceries/en-GB/products/299045558', 0.36, 'H W Nevill\'s Wholemeal Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(284, 24, 5, 'https://www.tesco.com/groceries/en-GB/products/274811254', 1.5, 'Hovis 7 Seeds Wholemeal Bread 800G', '800g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(285, 25, 5, 'https://www.tesco.com/groceries/en-GB/products/258081588', 0.79, 'Tesco Crusty White Farmhouse Sliced Bread 400G', '400g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(286, 25, 5, 'https://www.tesco.com/groceries/en-GB/products/300810579', 1.5, 'Warburtons Old English White Bread 400G', '400g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(287, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-wholemeal-bread--medium-sliced-400g', 0.85, 'Warburtons Medium Sliced Wholemeal Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/04/5010044000404/5010044000404_L.jpeg'),
(288, 25, 5, 'https://www.tesco.com/groceries/en-GB/products/257989991', 0.79, 'Tesco Crusty White Split Tin Sliced Bread 400G', '400g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(289, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/hovis-wholemeal-bread-400g', 1, 'Hovis Tasty Medium Sliced Wholemeal Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/47/5010003000247/5010003000247_L.jpeg'),
(290, 25, 5, 'https://www.tesco.com/groceries/en-GB/products/252488704', 0.79, 'Tesco Crusty White Farmhouse Bread 400G', '400g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(291, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/hovis-original-granary-bread--half-loaf-400g', 1.05, 'Hovis Granary Thick Sliced Wholemeal Bread, Half Loaf 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/54/5010003000254/5010003000254_L.jpeg'),
(292, 25, 5, 'https://www.tesco.com/groceries/en-GB/products/302088635', 0.9, 'Warburtons White Farmhouse Bread 400G', '400g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(293, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-wholemeal-bread-so-organic-400g-7559900-p', 0.95, 'Sainsbury\'s Wholemeal Bread SO Organic 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/33/0000001128833/0000001128833_L.jpeg'),
(294, 25, 5, 'https://www.tesco.com/groceries/en-GB/products/254942354', 0.9, 'Warburtons Toastie Sliced Small White Bread 400G', '400g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(295, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/hovis-nimble-wholemeal-bread-400g', 0.9, 'Hovis Nimble Medium Sliced Wholemeal Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/89/5010003060289/5010003060289_L.jpeg'),
(296, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-multiseeded-wholemeal-bread--so-organic-400g', 1.1, 'Sainsbury\'s Multiseed Thick Sliced Wholemeal Bread, SO Organic 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/82/0000001216882/0000001216882_L.jpeg'),
(297, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/kingsmill-tasty-wholemeal-no-crusts-400g', 1.4, 'Kingsmill No Crusts Medium Sliced Wholemeal Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/15/5010092724215/5010092724215_L.jpeg'),
(298, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-weightwatchers-wholemeal-toastie-bread-400g', 1, 'Warburtons Weight Watchers Thick Sliced Wholemeal Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/51/5010044003351/5010044003351_L.jpeg'),
(299, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-malty-grain-loaf-400g', 1.2, 'Warburtons Malted Grain & Seeds Medium Sliced Wholemeal Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/36/5010044006536/5010044006536_L.jpeg'),
(300, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-wholegrain---oats-loaf-400g', 1.2, 'Warburtons Wholegrain & Oats Medium Sliced Wholemeal Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/43/5010044006543/5010044006543_L.jpeg'),
(301, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/warburtons-multigrain-seeds-medium-sliced-wholemeal-bread-400g', 2, 'Warburtons Multigrain & Seeds Medium Sliced Wholemeal Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/19/5010044006819/5010044006819_L.jpeg'),
(302, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/sainsburys-standard-wholemeal-medium-400g', 0.5, 'Sainsbury\'s Wholemeal Bread Medium 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/81/0000000311281/0000000311281_L.jpeg'),
(303, 26, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/hi-lo-loaf', 1.75, 'Hi-Lo Seeded Medium Sliced Wholemeal Bread 400g', '400g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/97/5024285012997/5024285012997_L.jpeg'),
(304, 27, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/tropicana-smooth-orange-juice-950ml-2537443-p', 2.45, 'Tropicana Smooth Orange Juice 950ml', '950ml', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/73/5022313731773/5022313731773_L.jpeg'),
(305, 26, 5, 'https://www.tesco.com/groceries/en-GB/products/254944283', 0.9, 'Warburtons Small Wholemeal Medium Bread 400G', '400g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(306, 27, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/tropicana-original-orange-juice-with-bits-1l', 2.45, 'Tropicana Orange Juice Original 950ml', '950ml', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/06/5022313731506/5022313731506_L.jpeg'),
(307, 26, 5, 'https://www.tesco.com/groceries/en-GB/products/250829858', 0.85, 'Hovis Small Wholemeal Medium Bread 400G', '400g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(308, 27, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/tropicana-orange-juice-with-extra-juicy-bits-1l', 2.45, 'Tropicana Orange Juice with Extra Juicy Bits 950ml', '950ml', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/38/5022313732138/5022313732138_L.jpeg'),
(309, 28, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/tropicana-smooth-orange-300ml', 1.5, 'Tropicana Orange Juice Smooth 300ml', '300ml', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/07/5022313331607/5022313331607_L.jpeg'),
(310, 28, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/tropicana-original-300ml', 1.5, 'Tropicana Orange Juice with Bits 300ml', '300ml', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/54/5022313332154/5022313332154_L.jpeg'),
(311, 28, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/tropicana-orange-mango-juice-300ml', 1.5, 'Tropicana Orange & Mango Juice 300ml', '300ml', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/06/5022313332406/5022313332406_L.jpeg'),
(312, 27, 5, 'https://www.tesco.com/groceries/en-GB/products/296050487', 2.48, 'Tropicana Orange Juice Smooth 950 Ml', '950ml', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(313, 27, 5, 'https://www.tesco.com/groceries/en-GB/products/296050504', 2.48, 'Tropicana Orange Juice Original 950 Ml', '950ml', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(314, 27, 5, 'https://www.tesco.com/groceries/en-GB/products/296050562', 2.48, 'Tropicana Orange Extra Juicy Bits Juice 950 Ml', '950ml', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(315, 28, 5, 'https://www.tesco.com/groceries/en-GB/products/287438170', 1.4, 'Tropicana Orange Juice Smooth 300 Ml', '300ml', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(316, 28, 5, 'https://www.tesco.com/groceries/en-GB/products/287438135', 1.4, 'Tropicana Orange Juice Original 300 Ml', '300ml', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(317, 28, 5, 'https://www.tesco.com/groceries/en-GB/products/287439094', 1.4, 'Tropicana Orange & Mango Juice 300 Ml', '300ml', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(318, 29, 5, 'https://www.tesco.com/groceries/en-GB/products/296050585', 2.48, 'Tropicana Apple Juice 950 Ml', '950ml', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(319, 30, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/ocean-spray-cranberry-1l', 2.3, 'Ocean Spray Cranberry Juice 1L', '1L', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/56/0031200452856/0031200452856_L.jpeg'),
(320, 30, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/long-life-juice-/ocean-spray-cranberry-classic-juice-drink-4x1l', 4.85, 'Ocean Spray Cranberry Classic Juice Drink 4x1L', '1L', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/93/0031200452993/0031200452993_L.jpeg'),
(321, 30, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/ocean-spray-juice-drink--cranberry---blackcurrant-1l', 1.4, 'Ocean Spray Juice Drink, Cranberry & Blackcurrant 1L', '1L', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/23/0031200452023/0031200452023_L.jpeg'),
(322, 30, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/ocean-spray-juice-drink--cranberry---blueberry-1l', 1.4, 'Ocean Spray Juice Drink, Cranberry & Blueberry 1L', '1L', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/38/5010663804438/5010663804438_L.jpeg'),
(323, 30, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/oceanspray-juice-drink--cranberry---pomegranate-1l', 1.4, 'Ocean Spray Juice Drink, Cranberry & Pomegranate 1L', '1L', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/52/5010663804452/5010663804452_L.jpeg'),
(324, 30, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/long-life-juice-/ocean-spray-cranberry---raspberry-juice-drink-4x1l', 4.85, 'Ocean Spray Cranberry Classic Juice Drink Light 4x1L', '1L', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/04/5010663800904/5010663800904_L.jpeg'),
(325, 30, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/ocean-spray-cranberry-classic-1l', 1.4, 'Ocean Spray Cranberry Classic 1L', '1L', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/09/0031200452009/0031200452009_L.jpeg'),
(326, 30, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/ocean-spray-cranberry-classic-light-1l', 1.4, 'Ocean Spray Cranberry Classic Light 1L', '1L', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/03/0031200452603/0031200452603_L.jpeg'),
(327, 30, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/ocean-spray-cranberry---raspberry-1l', 1.4, 'Ocean Spray Cranberry & Raspberry 1L', '1L', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/16/0031200452016/0031200452016_L.jpeg'),
(328, 30, 5, 'https://www.tesco.com/groceries/en-GB/products/254859384', 1.5, 'Ocean Spray Cranberry Classic Juice Drink 1 Litre', '1L', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(329, 30, 5, 'https://www.tesco.com/groceries/en-GB/products/252648579', 1.5, 'Ocean Spray Cranberry Classic Light Juice Drink 1 Litre', '1L', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(330, 30, 5, 'https://www.tesco.com/groceries/en-GB/products/304380055', 2.19, 'Ocean Spray Cranberry Juice 1 Litre', '1L', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(331, 30, 5, 'https://www.tesco.com/groceries/en-GB/products/257630874', 1.5, 'Ocean Spray Cranberry & Raspberry Juice Drink 1 Litre', '1L', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(332, 30, 5, 'https://www.tesco.com/groceries/en-GB/products/254668811', 4.85, 'Ocean Spray Cranberry Classic Juice Drink 4 X 1 Litre', '1L', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(333, 31, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/innocent-smooth-orange-juice-135l', 3, 'Innocent Smooth Orange Juice 1.35L', '1.35', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/04/5038862102704/5038862102704_L.jpeg'),
(334, 30, 5, 'https://www.tesco.com/groceries/en-GB/products/253983583', 4.85, 'Ocean Spray Cranberry Classic Light Juice Drink 4 X 1 Litre', '1L', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(335, 31, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/innocent-orange-juice-with-bits-135l', 3, 'Innocent Orange Juice with Bits 1.35L', '1.35', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/00/5038862100700/5038862100700_L.jpeg'),
(336, 30, 5, 'https://www.tesco.com/groceries/en-GB/products/304384270', 1.35, 'Ocean Spray Cranberry & Apple Juice Drink 1L', '1L', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(337, 31, 5, 'https://www.tesco.com/groceries/en-GB/products/271400233', 3.2, 'Innocent Orange Juice Smooth 1.35 Litre', '1.35', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(338, 31, 5, 'https://www.tesco.com/groceries/en-GB/products/271400354', 3.2, 'Innocent Orange Juice With Bits 1.35 Litre', '1.35', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(339, 32, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/innocent-tropical-juice-135l', 3, 'Innocent Tropical Juice Blend 1.35L', '1.35', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/02/5038862106702/5038862106702_L.jpeg'),
(340, 32, 5, 'https://www.tesco.com/groceries/en-GB/products/276685837', 3.2, 'Innocent Tropical Juice 1.35 Litre', '1.35', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(341, 33, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/innocent-apple-mango-juice-135l', 3, 'Innocent Apple & Mango Juice 1.35L', '1.35', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/09/5038862107709/5038862107709_L.jpeg'),
(342, 33, 5, 'https://www.tesco.com/groceries/en-GB/products/276683488', 3.2, 'Innocent Apple & Mango Juice 1.35 Litre', '1.35', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(343, 34, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/the-laughing-cow-cheese-triangles--light-x16-280g', 2.3, 'Laughing Cow Cheese Triangles, Light x16 280g', '280g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/11/3073780836111/3073780836111_L.jpeg'),
(344, 34, 5, 'https://www.tesco.com/groceries/en-GB/products/252415665', 2, 'The Laughing Cow Light Cheese Triangles 280 G', '280g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(345, 34, 5, 'https://www.tesco.com/groceries/en-GB/products/250354970', 2, 'The Laughing Cow Original Cheese Triangles 280 G', '280g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(346, 35, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/the-laughing-cow-cheese-triangles--extra-light-x8-140g', 1.5, 'Laughing Cow Cheese Triangles, Extra Light x8 140g', '140g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/38/3073780914338/3073780914338_L.jpeg'),
(347, 35, 5, 'https://www.tesco.com/groceries/en-GB/products/282111218', 1.45, 'The Laughing Cow Cheese Dip & Crunch Spead 140 G', '140g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(348, 35, 5, 'https://www.tesco.com/groceries/en-GB/products/255998770', 1.4, 'The Laughing Cow Extra Light Cheese Triangles 140 G', '140g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(349, 35, 5, 'https://www.tesco.com/groceries/en-GB/products/257528950', 1.4, 'The Laughing Cow Light Cheese Triangles 140 G', '140g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(350, 35, 5, 'https://www.tesco.com/groceries/en-GB/products/255200428', 1.4, 'The Laughing Cow Original Cheese Triangles 140 G', '140g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(351, 39, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-strawberry-yogurt-12x100g', 3, 'Actimel Yogurt Drink Strawberry 12x100g', '12x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/68/5060058330868/5060058330868_L.jpeg'),
(352, 39, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-multi-fruit-12x100g', 3, 'Actimel Yogurt Drink Multifruit 12x100g', '12x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/35/5060058331735/5060058331735_L.jpeg'),
(353, 39, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-original-01%25-fat-yogurt-12x100g', 3, 'Actimel Yogurt Drink 0.1% Fat Original 12x100g', '12x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/66/5060058333166/5060058333166_L.jpeg'),
(354, 39, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-yogurt-drink-strawberry---blueberry-12x100g', 3, 'Actimel Yogurt Drink Strawberry & Blueberry 12x100g', '12x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/62/5060360500362/5060360500362_L.jpeg'),
(355, 39, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-0%25-fat-strawberry-yogurt-drink-12x100g', 3, 'Actimel 0% Fat Strawberry Yogurt Drink 12x100g', '12x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/51/5060360502151/5060360502151_L.jpeg'),
(356, 40, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-strawberry-01%25-fat-yogurt-8x100g', 2.25, 'Actimel Yogurt Drink 0.1% Fat Strawberry 8x100g', '8x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/52/5060058332152/5060058332152_L.jpeg'),
(357, 40, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-yogurt-drink-strawberry-8x100g', 2.25, 'Actimel Yogurt Drink Strawberry 8x100g', '8x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/24/5410146407024/5410146407024_L.jpeg'),
(358, 40, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-yogurt-drink--multi-fruits-8x100g', 2.25, 'Actimel Yogurt Drink Multifruit 8x100g', '8x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/24/5016769993724/5016769993724_L.jpeg'),
(359, 40, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-yogurt-drink-01%25-fat-8x100g', 2.25, 'Actimel Yogurt Drink 0.1% Fat Original 8x100g', '8x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/46/5099417010646/5099417010646_L.jpeg'),
(360, 40, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-blueberry-yogurt-8x100g', 2.25, 'Actimel Yogurt Drink Blueberry 8x100g', '8x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/57/5060058334057/5060058334057_L.jpeg'),
(361, 40, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-coconut-yogurt-8x100g', 2.25, 'Actimel Yogurt Drink Coconut 8x100g', '8x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/02/5060058334002/5060058334002_L.jpeg'),
(362, 40, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/danone-yogurt/actimel-yogurt-drink-berry-burst-8x100g', 2.25, 'Actimel Yogurt Drink 0% Fat Lemon 8x100g', '8x100g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/21/5060360503721/5060360503721_L.jpeg'),
(363, 39, 5, 'https://www.tesco.com/groceries/en-GB/products/257720163', 3.75, 'Actimel Strawberry Yogurt Drink 12 X100g', '12x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(364, 39, 5, 'https://www.tesco.com/groceries/en-GB/products/258207983', 3.75, 'Actimel Multifruit Yogurt Drink 12 X100g', '12x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(365, 39, 5, 'https://www.tesco.com/groceries/en-GB/products/283315114', 3.75, 'Actimel Strawberry Blueberry Yogurt Drink 12 X100g', '12x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(366, 39, 5, 'https://www.tesco.com/groceries/en-GB/products/259050439', 3.75, 'Actimel Fat Free Original Yogurt Drink 12 X100g', '12x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(367, 40, 5, 'https://www.tesco.com/groceries/en-GB/products/255084895', 2.75, 'Actimel Strawberry Yogurt Drink 8 X100g', '8x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(368, 40, 5, 'https://www.tesco.com/groceries/en-GB/products/256145937', 2.75, 'Actimel Multifruit Yogurt Drink 8 X100g', '8x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(369, 40, 5, 'https://www.tesco.com/groceries/en-GB/products/255024950', 2.75, 'Actimel Fat Free Strawberry Yogurt Drink 8 X100g', '8x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(370, 40, 5, 'https://www.tesco.com/groceries/en-GB/products/260928737', 2.75, 'Actimel Blueberry Yogurt Drink 8 X100g', '8x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(371, 40, 5, 'https://www.tesco.com/groceries/en-GB/products/258837908', 2.75, 'Actimel Fat Free Raspberry Yogurt Drink 8 X100g', '8x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(372, 40, 5, 'https://www.tesco.com/groceries/en-GB/products/263761531', 2.75, 'Actimel Vanilla Yogurt Drink 8 X100g', '8x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(373, 40, 5, 'https://www.tesco.com/groceries/en-GB/products/250468081', 2.75, 'Actimel Fat Free Original Yogurt Drink 8 X100g', '8x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(374, 40, 5, 'https://www.tesco.com/groceries/en-GB/products/303917679', 2.75, 'Actimel 0% Lemon Yogurt Drink 8 X 100G', '8x100g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(375, 43, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/anchor-butter--original-250g', 1.85, 'Anchor Butter 250g', '250g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/05/5010137012505/5010137012505_L.jpeg'),
(376, 43, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/anchor-spreadable-250g', 2, 'Anchor Spreadable 250g', '250g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/39/5707361100039/5707361100039_L.jpeg'),
(377, 44, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/anchor-block-unsalted-250g', 1.85, 'Anchor Unsalted Butter 250g', '250g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/75/5707361100275/5707361100275_L.jpeg'),
(378, 45, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/anchor-spreadable-500g', 2.5, 'Anchor Spreadable 500g', '500g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/53/5707361100053/5707361100053_L.jpeg'),
(379, 43, 5, 'https://www.tesco.com/groceries/en-GB/products/254263374', 1.8, 'Anchor Salted Block Butter 250G', '250g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(380, 44, 5, 'https://www.tesco.com/groceries/en-GB/products/259395941', 1.8, 'Anchor Unsalted Block Butter 250G', '250g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(381, 49, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/lurpak-spreadable--slightly-salted-250g', 2.25, 'Lurpak Slightly Salted Spreadable 250g', '250g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/09/5740900805309/5740900805309_L.jpeg'),
(382, 49, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/lurpak-spreadable--lighter-250g', 2.3, 'Lurpak Lighter Spreadable 250g', '250g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/08/5740900815308/5740900815308_L.jpeg'),
(383, 50, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/lurpak-spread-500g', 2.75, 'Lurpak Spreadable 500g', '500g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/08/5740900805408/5740900805408_L.jpeg'),
(384, 50, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/lurpak-spreadable--lighter-500g', 2.75, 'Lurpak Lighter Spreadable 500g', '500g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/07/5740900815407/5740900815407_L.jpeg'),
(385, 50, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/lurpak-spreadable-unsalted-500g', 2.75, 'Lurpak Unsalted Spreadable 500g', '500g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/86/5740900400986/5740900400986_L.jpeg'),
(386, 50, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/lurpak-spreadable-lightest-500g', 2.75, 'Lurpak Lightest Spreadable 500g', '500g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/32/5740900401532/5740900401532_L.jpeg'),
(387, 50, 1, 'https://www.sainsburys.co.uk/shop/gb/groceries/lurpak-lighter-spreadable-with-olive-oil-500g', 2.75, 'Lurpak Spreadable with Olive Oil 500g', '500g', 'https://www.sainsburys.co.uk/wcsstore7.43.4/ExtendedSitesCatalogAssetStore/images/catalog/productImages/96/5740900401396/5740900401396_L.jpeg'),
(388, 49, 5, 'https://www.tesco.com/groceries/en-GB/products/252581962', 2.2, 'Lurpak Slightly Salted Spreadable 250G', '250g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(389, 49, 5, 'https://www.tesco.com/groceries/en-GB/products/252246398', 2.2, 'Lurpak Lighter Salted Spreadable 250G', '250g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(390, 50, 5, 'https://www.tesco.com/groceries/en-GB/products/253886894', 3.75, 'Lurpak Slightly Salted Spreadable 500G', '500g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(391, 50, 5, 'https://www.tesco.com/groceries/en-GB/products/261631216', 3.75, 'Lurpak Unsalted Spreadable 500G', '500g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(392, 50, 5, 'https://www.tesco.com/groceries/en-GB/products/252246415', 3.75, 'Lurpak Lighter Salted Spreadable 500G', '500g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=='),
(393, 50, 5, 'https://www.tesco.com/groceries/en-GB/products/300842685', 3.75, 'Lurpak Softest Spreadable 500G', '500g', 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==');

-- --------------------------------------------------------

--
-- Table structure for table `supermarket`
--

CREATE TABLE `supermarket` (
  `supermarket_id` int(11) NOT NULL,
  `supermarket_name` text NOT NULL,
  `supermarket_image` text NOT NULL,
  `supermarket_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supermarket`
--

INSERT INTO `supermarket` (`supermarket_id`, `supermarket_name`, `supermarket_image`, `supermarket_url`) VALUES
(1, 'Sainsbury\'s', 'https://www.sainsburys.co.uk/assets/images/logos_logoImage_sainsburys-logo.svg', 'https://www.sainsburys.co.uk/shop/gb/groceries/'),
(2, 'Amazon Fresh', 'https://images-eu.ssl-images-amazon.com/images/G/02/pantry/pantry-shelf-logo._CB519689796_.png', 'https://www.amazon.co.uk/Amazon-Fresh-UK-Grocery-Shopping/b?ie=UTF8&node=6723205031'),
(3, 'ALdi', 'https://cdn.aldi-digital.co.uk/32FDVWu4Lhbxgj9Z3v03ji0pGJIp?&w=70&h=84', 'https://www.aldi.co.uk'),
(4, 'Asda', 'https://www.asda.com/', 'https://groceries.asda.com'),
(5, 'Tesco', 'https://www.tesco.com/groceries/en-GB/', 'https://www.tesco.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_fk0` (`category_id`);

--
-- Indexes for table `product_price`
--
ALTER TABLE `product_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `product_price_fk1` (`supermarket_id`),
  ADD KEY `product_price_fk0` (`product_id`);

--
-- Indexes for table `supermarket`
--
ALTER TABLE `supermarket`
  ADD PRIMARY KEY (`supermarket_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_price`
--
ALTER TABLE `product_price`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=394;

--
-- AUTO_INCREMENT for table `supermarket`
--
ALTER TABLE `supermarket`
  MODIFY `supermarket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_fk0` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `product_price`
--
ALTER TABLE `product_price`
  ADD CONSTRAINT `fk_product_price_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_price_fk1` FOREIGN KEY (`supermarket_id`) REFERENCES `supermarket` (`supermarket_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
