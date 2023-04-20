-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 22 Lis 2020, 13:52
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sklep`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID` int(11) NOT NULL,
  `ImięNazwisko` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Login` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Hasło` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Ulica` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Miasto` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `ID` int(11) NOT NULL,
  `Nazwa` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Opis` mediumtext COLLATE utf8mb4_polish_ci NOT NULL,
  `Ilość` int(11) DEFAULT NULL,
  `Cena` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `produkty`
--

INSERT INTO `produkty` (`ID`, `Nazwa`, `Opis`, `Ilość`, `Cena`) VALUES
(1, 'Veal - Bones', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis euismod justo. Nullam vel justo eget nibh aliquam imperdiet. Nulla facilisi. Ut vitae dolor accumsan ipsum malesuada ultrices sit amet a nisi. Sed sed tortor massa. Duis elit nibh, accumsan eu ultrices sed, scelerisque at ex. Cras ullamcorper elit neque. Vivamus et convallis mauris.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis euismod justo. Nullam vel justo eget nibh aliquam imperdiet. Nulla facilisi. Ut vitae dolor accumsan ipsum malesuada ultrices sit amet a nisi. Sed sed tortor massa. Duis elit nibh, accumsan eu ultrices sed, scelerisque at ex. Cras ullamcorper elit neque. Vivamus et convallis mauris.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis euismod justo. Nullam vel justo eget nibh aliquam imperdiet. Nulla facilisi. Ut vitae dolor accumsan ipsum malesuada ultrices sit amet a nisi. Sed sed tortor massa. Duis elit nibh, accumsan eu ultrices sed, scelerisque at ex. Cras ullamcorper elit neque. Vivamus et convallis mauris.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis euismod justo. Nullam vel justo eget nibh aliquam imperdiet. Nulla facilisi. Ut vitae dolor accumsan ipsum malesuada ultrices sit amet a nisi. Sed sed tortor massa. Duis elit nibh, accumsan eu ultrices sed, scelerisque at ex. Cras ullamcorper elit neque. Vivamus et convallis mauris.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis euismod justo. Nullam vel justo eget nibh aliquam imperdiet. Nulla facilisi. Ut vitae dolor accumsan ipsum malesuada ultrices sit amet a nisi. Sed sed tortor massa. Duis elit nibh, accumsan eu ultrices sed, scelerisque at ex. Cras ullamcorper elit neque. Vivamus et convallis mauris.', 58, 128.84),
(2, 'Calypso - Black Cherry Lemonade', 'Aliquam, finibus ,orci ut magna tempus commodo. Vivamus vitae ante viverra, tempor nulla ac, egestas felis. Nunc aliquam mattis elit, vitae suscipit lacus imperdiet et. Quisque aliquam neque non metus iaculis euismod. Donec lobortis, sem eget mollis rutrum, mauris odio pellentesque lorem, sed vulputate enim ante eu mauris. Pellentesque lectus nisi, viverra eget ipsum quis, ultricies varius massa. Sed sed pellentesque sem, eu rutrum libero. Morbi nec imperdiet ligula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean placerat elementum arcu vitae placerat. Cras eu sapien eu nulla porta fringilla.', 72, 33.09),
(3, 'Squash - Guords', '1234567891 1234567892 1234567893 1234567894 1234567895 1234567896 1234567897 1234567898 1234567899', 20, 141.95),
(4, 'Bread - Sticks, Thin, Plain', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', NULL, 110.69),
(5, 'Whmis - Spray Bottle Trigger', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 10, 166.66),
(6, 'Seabream Whole Farmed', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 31, 72.87),
(7, 'Longos - Grilled Chicken With', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 87, 194.47),
(8, 'Sparkling Wine - Rose, Freixenet', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 22, 160.43),
(9, 'Lettuce - Frisee', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 15, 17.45),
(10, 'Goldschalger', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 62, 50.58),
(11, 'Beans - Black Bean, Canned', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 72, 146.76),
(12, 'Beer - Original Organic Lager', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 20, 9.54),
(13, 'Ecolab - Orange Frc, Cleaner', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 46, 81.7),
(14, 'Bread Base - Goodhearth', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 5, 8.94),
(15, 'Pizza Pizza Dough', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 55, 30.75),
(16, 'Oil - Sesame', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 55, 136.12),
(17, 'Nantuket Peach Orange', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', NULL, 26.4),
(18, 'Bread - Crusty Italian Poly', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 53, 121.49),
(19, 'Shark - Loin', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 41, 145.84),
(20, 'Apple - Fuji', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 71, 145.58),
(21, 'Cilantro / Coriander - Fresh', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 62, 27.13),
(22, 'Appetizer - Mushroom Tart', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', NULL, 29.16),
(23, 'Pork - Kidney', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 33, 81.25),
(24, 'Cookie Choc', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 31, 139.95),
(25, 'Syrup - Monin, Irish Cream', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 71, 190.46),
(26, 'Pork Loin Bine - In Frenched', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 42, 130.02),
(27, 'Steam Pan - Half Size Deep', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 93, 92.6),
(28, 'Flour - Strong', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 12, 183.51),
(29, 'Appetizer - Spring Roll, Veg', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 27, 138.03),
(30, 'Pumpkin - Seed', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 10, 86.78),
(31, 'Cheese - Brie, Cups 125g', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 64, 29.92),
(32, 'Juice - Apple, 500 Ml', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', NULL, 173.56),
(33, 'Red Pepper Paste', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 1, 82.62),
(34, 'Squash - Acorn', 'ewhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhggggggggggggggggfdddddddddddddddddd', 55, 20.31),
(35, 'Campari', '', 98, 12.31),
(36, 'Versatainer Nc - 9388', '', 65, 128.06),
(37, 'Sprouts - Peppercress', '', 59, 43.99),
(38, 'Tarragon - Primerba, Paste', '', 21, 64.5),
(39, 'Mustard - Seed', '', 91, 127.21),
(40, 'V8 - Vegetable Cocktail', '', 10, 37.63),
(41, 'Pork - Sausage Casing', '', 24, 72.05),
(42, 'Sauce - Thousand Island', '', 21, 134.12),
(43, 'Pernod', '', 49, 92.73),
(44, 'Juice - Orange, Concentrate', '', 68, 49.84),
(45, 'Parasol Pick Stir Stick', '', 11, 132.51),
(46, 'Wine - Valpolicella Masi', '', 19, 11.01),
(47, 'Pickerel - Fillets', '', 61, 22.31),
(48, 'Ecolab Digiclean Mild Fm', '', 75, 84.55),
(49, 'Kaffir Lime Leaves', '', 96, 188.95),
(50, 'Butter - Salted', '', 50, 44.84),
(51, 'Lamb Tenderloin Nz Fr', '', 48, 32.16),
(52, 'Cheese - Blue', '', NULL, 164.92),
(53, 'Pastry - Trippleberry Muffin - Mini', '', 13, 196.06),
(54, 'Container Clear 8 Oz', '', NULL, 101.8),
(55, 'Sauce - Alfredo', '', 3, 185.81),
(56, 'Hog / Sausage Casing - Pork', '', 95, 37.57),
(57, 'Lemonade - Kiwi, 591 Ml', '', 51, 2.92),
(58, 'Chestnuts - Whole,canned', '', 47, 98.81),
(59, 'Tea - Grapefruit Green Tea', '', 16, 71.51),
(60, 'Hersey Shakes', '', 56, 164.64),
(61, 'Flour - Buckwheat, Dark', '', 74, 80.97),
(62, 'Aspic - Amber', '', 5, 159.87),
(63, 'Dragon Fruit', '', 44, 183.59),
(64, 'Wine - Wyndham Estate Bin 777', '', 20, 66.58),
(65, 'Pork - Loin, Bone - In', '', 38, 55.27),
(66, 'Samosa - Veg', '', 43, 59.41),
(67, 'Plastic Arrow Stir Stick', '', 28, 159.63),
(68, 'Star Fruit', '', 28, 86.61),
(69, 'Pasta - Penne, Rigate, Dry', '', 68, 38.93),
(70, 'Crab Meat Claw Pasteurise', '', 69, 100.51),
(71, 'Herb Du Provence - Primerba', '', 49, 26.81),
(72, 'Ecolab Silver Fusion', '', 92, 167.5),
(73, 'Pears - Bosc', '', 74, 84.19),
(74, 'Almonds Ground Blanched', '', 92, 34.91),
(75, 'Mustard - Seed', '', 80, 6.09),
(76, 'Glass Clear 8 Oz', '', 41, 199.22),
(77, 'Soup - Campbells Chili Veg', '', 83, 129.57),
(78, 'Pie Filling - Pumpkin', '', 63, 119.92),
(79, 'Sprouts - Brussel', '', 10, 109.97),
(80, 'Wine - Coteaux Du Tricastin Ac', '', 95, 9.62),
(81, 'Cognac - Courvaisier', '', 100, 22.05),
(82, 'Pie Shells 10', '', 59, 96.43),
(83, 'Lettuce - Frisee', '', 45, 49),
(84, 'Whmis Spray Bottle Graduated', '', NULL, 137.23),
(85, 'Beer - Corona', '', 46, 5.34),
(86, 'Plaintain', '', 93, 28.94),
(87, 'Puree - Mango', '', 96, 89.07),
(88, 'Bread Base - Gold Formel', '', 24, 41.27),
(89, 'Pate - Cognac', '', 60, 58.17),
(90, 'Soup Campbells - Italian Wedding', '', 66, 104.24),
(91, 'Olive - Spread Tapenade', '', 17, 39.32),
(92, 'Sausage - Meat', '', 85, 69.55),
(93, 'Sachet', '', 95, 90.69),
(94, 'Potatoes - Parissienne', '', 48, 99.38),
(95, 'Wine - Chenin Blanc K.w.v.', '', 83, 66.6),
(96, 'Green Tea Refresher', '', 71, 70.44),
(97, 'Shichimi Togarashi Peppeers', '', 64, 11.72),
(98, 'Tray - Foam, Square 4 - S', '', 92, 157.64),
(99, 'Chocolate Bar - Reese Pieces', '', 42, 16.54),
(100, 'Papadam', '', 4, 9.87);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamówienia`
--

CREATE TABLE `zamówienia` (
  `ID` int(11) NOT NULL,
  `ImięNazwisko` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Przedmioty` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`Przedmioty`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ImięNazwisko` (`ImięNazwisko`(768));

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `zamówienia`
--
ALTER TABLE `zamówienia`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT dla tabeli `produkty`
--
ALTER TABLE `produkty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT dla tabeli `zamówienia`
--
ALTER TABLE `zamówienia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
