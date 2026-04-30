-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 30 2026 г., 14:57
-- Версия сервера: 5.6.51
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Game store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Activation_Key`
--

CREATE TABLE `Activation_Key` (
  `ID_Activation_Key` int(11) NOT NULL,
  `Key_Code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` enum('available','sold','reserved','expired') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `Game_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Activation_Key`
--

INSERT INTO `Activation_Key` (`ID_Activation_Key`, `Key_Code`, `Status`, `Game_ID`) VALUES
(1, 'AAAA-BBBB-CCCC-DDD1', 'sold', 1),
(2, 'AAAA-BBBB-CCCC-DDD2', 'sold', 2),
(3, 'AAAA-BBBB-CCCC-DDD3', 'reserved', 3),
(4, 'AAAA-BBBB-CCCC-DDD4', 'sold', 4),
(5, 'AAAA-BBBB-CCCC-DDD5', 'available', 5),
(6, 'AAAA-BBBB-CCCC-DDD6', 'sold', 6),
(7, 'AAAA-BBBB-CCCC-DDD7', 'expired', 7),
(8, 'AAAA-BBBB-CCCC-DDD8', 'sold', 8),
(9, 'AAAA-BBBB-CCCC-DDD9', 'available', 9),
(10, 'AAAA-BBBB-CCCC-DD10', 'available', 10),
(11, 'BBBB-CCCC-DDDD-EEE1', 'sold', 1),
(12, 'BBBB-CCCC-DDDD-EEE2', 'available', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Customer`
--

CREATE TABLE `Customer` (
  `ID_Customer` int(11) NOT NULL,
  `FIO` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Customer`
--

INSERT INTO `Customer` (`ID_Customer`, `FIO`, `Phone`, `Email`) VALUES
(1, 'Иванов Иван Иванович', '+79161234567', 'ivanov@mail.ru'),
(2, 'Петрова Анна Сергеевна', '+79261234567', 'petrova@mail.ru'),
(3, 'Сидоров Алексей Владимирович', '+79361234567', 'sidorov@mail.ru'),
(4, 'Козлова Елена Дмитриевна', '+79461234567', 'kozlov@mail.ru'),
(5, 'Морозов Денис Андреевич', '+79561234567', 'morozov@mail.ru'),
(6, 'Васильева Ольга Игоревна', '+79661234567', 'vasilyeva@mail.ru'),
(7, 'Никитин Павел Романович', '+79761234567', 'nikitin@mail.ru'),
(8, 'Соколова Татьяна Викторовна', '+79861234567', 'sokolova@mail.ru'),
(9, 'Егоров Максим Сергеевич', '+79961234567', 'egorov@mail.ru'),
(10, 'Павлова Юлия Александровна', '+79001234567', 'pavlova@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `Game`
--

CREATE TABLE `Game` (
  `ID_Game` int(11) NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Developer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Game`
--

INSERT INTO `Game` (`ID_Game`, `Title`, `Price`, `Platform`, `Description`, `Developer`) VALUES
(1, 'Cyberpunk 2077', '1999.99', 'PC, PS5, Xbox', 'RPG', 'CD Projekt Red'),
(2, 'The Witcher 3', '899.50', 'PC, PS4, Xbox', 'RPG', 'CD Projekt Red'),
(3, 'Elden Ring', '2499.00', 'PC, PS5, Xbox', 'Soulslike', 'FromSoftware'),
(4, 'Minecraft', '1299.00', 'PC, Mobile, Switch', 'Sandbox', 'Mojang'),
(5, 'GTA V', '1499.99', 'PC, PS4, Xbox', 'Open world', 'Rockstar'),
(6, 'Red Dead Redemption 2', '1999.00', 'PC, PS4, Xbox', 'Vestern', 'Rockstar'),
(7, 'Valheim', '599.99', 'PC', 'Survive', 'Iron Gate'),
(8, 'Hades', '699.00', 'PC, Switch, PS', 'Roguelike', 'Supergiant'),
(9, 'Stardew Valley', '399.99', 'PC, Mobile, Switch', 'Farm', 'ConcernedApe'),
(10, 'Doom Eternal', '1499.00', 'PC, PS4, Xbox', 'Shooter', 'id Software');

-- --------------------------------------------------------

--
-- Структура таблицы `Order`
--

CREATE TABLE `Order` (
  `ID_Order` int(11) NOT NULL,
  `Order_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Total_Amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Order_Status` enum('pending','processing','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `Payment_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Order`
--

INSERT INTO `Order` (`ID_Order`, `Order_Date`, `Total_Amount`, `Order_Status`, `Payment_ID`, `Customer_ID`) VALUES
(1, '2024-01-10 11:23:00', '1999.99', 'completed', 1, 1),
(2, '2024-01-15 06:45:00', '899.50', 'completed', 2, 2),
(3, '2024-02-01 15:30:00', '2499.00', 'processing', 3, 3),
(4, '2024-02-10 08:20:00', '1299.00', 'completed', 4, 4),
(5, '2024-02-20 17:15:00', '1499.99', 'pending', 5, 5),
(6, '2024-03-05 13:40:00', '1999.00', 'completed', 6, 6),
(7, '2024-03-12 09:10:00', '599.99', 'cancelled', 7, 7),
(8, '2024-03-18 19:05:00', '699.00', 'completed', 8, 8),
(9, '2024-04-01 05:30:00', '399.99', 'processing', 9, 9),
(10, '2024-04-07 16:55:00', '1499.00', 'pending', 10, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `Order_Item`
--

CREATE TABLE `Order_Item` (
  `Order_ID` int(11) NOT NULL,
  `Activation_Key_ID` int(11) NOT NULL,
  `Price_At_Purchase` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Order_Item`
--

INSERT INTO `Order_Item` (`Order_ID`, `Activation_Key_ID`, `Price_At_Purchase`) VALUES
(1, 1, '1999.99'),
(1, 11, '1999.99'),
(2, 2, '899.50'),
(3, 3, '2499.00'),
(4, 4, '1299.00'),
(5, 5, '1499.99'),
(6, 6, '1999.00'),
(7, 7, '599.99'),
(8, 8, '699.00'),
(9, 9, '399.99'),
(10, 10, '1499.00');

-- --------------------------------------------------------

--
-- Структура таблицы `Payment`
--

CREATE TABLE `Payment` (
  `ID_Payment` int(11) NOT NULL,
  `Payment_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Amount` decimal(10,2) NOT NULL,
  `Payment_Method` enum('card','paypal','webmoney','qiwi','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Payment_Status` enum('pending','completed','failed','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Payment`
--

INSERT INTO `Payment` (`ID_Payment`, `Payment_Date`, `Amount`, `Payment_Method`, `Payment_Status`) VALUES
(1, '2024-01-10 11:25:00', '1999.99', 'card', 'completed'),
(2, '2024-01-15 06:47:00', '899.50', 'paypal', 'completed'),
(3, '2024-02-01 15:32:00', '2499.00', 'webmoney', 'pending'),
(4, '2024-02-10 08:22:00', '1299.00', 'card', 'completed'),
(5, '2026-04-30 11:10:47', '1499.99', 'qiwi', 'pending'),
(6, '2024-03-05 13:42:00', '1999.00', 'paypal', 'completed'),
(7, '2024-03-12 09:12:00', '599.99', 'card', 'refunded'),
(8, '2024-03-18 19:07:00', '699.00', 'other', 'completed'),
(9, '2026-04-30 11:10:47', '399.99', 'webmoney', 'pending'),
(10, '2024-04-07 16:57:00', '1499.00', 'card', 'completed');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Activation_Key`
--
ALTER TABLE `Activation_Key`
  ADD PRIMARY KEY (`ID_Activation_Key`),
  ADD KEY `activation_key_ibfk_1` (`Game_ID`);

--
-- Индексы таблицы `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`ID_Customer`);

--
-- Индексы таблицы `Game`
--
ALTER TABLE `Game`
  ADD PRIMARY KEY (`ID_Game`);

--
-- Индексы таблицы `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`ID_Order`),
  ADD KEY `order_ibfk_1` (`Customer_ID`),
  ADD KEY `Payment_ID` (`Payment_ID`);

--
-- Индексы таблицы `Order_Item`
--
ALTER TABLE `Order_Item`
  ADD KEY `order_item_ibfk_1` (`Activation_Key_ID`),
  ADD KEY `order_item_ibfk_2` (`Order_ID`);

--
-- Индексы таблицы `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`ID_Payment`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Activation_Key`
--
ALTER TABLE `Activation_Key`
  ADD CONSTRAINT `activation_key_ibfk_1` FOREIGN KEY (`Game_ID`) REFERENCES `Game` (`ID_Game`);

--
-- Ограничения внешнего ключа таблицы `Order`
--
ALTER TABLE `Order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`ID_Customer`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Payment_ID`) REFERENCES `Payment` (`ID_Payment`);

--
-- Ограничения внешнего ключа таблицы `Order_Item`
--
ALTER TABLE `Order_Item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`Activation_Key_ID`) REFERENCES `Activation_Key` (`ID_Activation_Key`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `Order` (`ID_Order`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
