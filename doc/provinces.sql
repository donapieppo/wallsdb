DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `region_id` varchar(255) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `sig`  varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `provinces` (`id`, `name`, `sig`, `region_id`) VALUES 
  (1, 'Agrigento', 'AG', 19), 
  (2, 'Alessandria', 'AL', 1), 
  (3, 'Ancona', 'AN', '11'), 
  (4, 'Arezzo', 'AR', '9'),
	(5, 'Ascoli Piceno', 'AP', '11'),
	(6, 'Asti', 'AT', '1'),
	(7, 'Avellino', 'AV', '15'),
	(8, 'Bari', 'BA', '16'),
	(9, 'Barletta-Andria-Trani', 'BT', '16'),
	(10, 'Belluno', 'BL', '5'),
	(11, 'Benevento', 'BN', '15'),
	(12, 'Bergamo', 'BG', '3'),
	(13, 'Biella', 'BI', '1'),
	(14, 'Bologna', 'BO', '8'),
	(15, 'Bolzano', 'BZ', '4'),
	(16, 'Brescia', 'BS', '3'),
	(17, 'Brindisi', 'BR', '16'),
	(18, 'Cagliari', 'CA', '20'),
	(19, 'Caltanissetta', 'CL', '19'),
	(20, 'Campobasso', 'CB', '14'),
	(21, 'Carbonia-Iglesias', 'CI', '20'),
	(22, 'Caserta', 'CE', '15'),
	(23, 'Catania', 'CT', '19'),
	(24, 'Catanzaro', 'CZ', '18'),
	(25, 'Chieti', 'CH', '13'),
	(26, 'Como', 'CO', '3'),
	(27, 'Cosenza', 'CS', '18'),
	(28, 'Cremona', 'CR', '3'),
	(29, 'Crotone', 'KR', '18'),
	(30, 'Cuneo', 'CN', '1'),
	(31, 'Enna', 'EN', '19'),
	(32, 'Fermo', 'FM', '11'),
	(33, 'Ferrara', 'FE', '8'),
	(34, 'Firenze', 'FI', '9'),
	(35, 'Foggia', 'FG', '16'),
	(36, 'Forlì-Cesena', 'FC', '8'),
	(37, 'Frosinone', 'FR', '12'),
	(38, 'Genova', 'GE', '7'),
	(39, 'Gorizia', 'GO', '6'),
	(40, 'Grosseto', 'GR', '9'),
	(41, 'Imperia', 'IM', '7'),
	(42, 'Isernia', 'IS', '14'),
	(43, 'L\'Aquila', 'AQ', '13'),
	(44, 'La Spezia', 'SP', '7'),
	(45, 'Latina', 'LT', '12'),
	(46, 'Lecce', 'LE', '16'),
	(47, 'Lecco', 'LC', '3'),
	(48, 'Livorno', 'LI', '9'),
	(49, 'Lodi', 'LO', '3'),
	(50, 'Lucca', 'LU', '9'),
	(51, 'Macerata', 'MC', '11'),
	(52, 'Mantova', 'MN', '3'),
	(53, 'Massa e Carrara', 'MS', '9'),
	(54, 'Matera', 'MT', '17'),
	(55, 'Medio Campidano', 'VS', '20'),
	(56, 'Messina', 'ME', '19'),
	(57, 'Milano', 'MI', '3'),
	(58, 'Modena', 'MO', '8'),
	(59, 'Monza e Brianza', 'MB', '3'),
	(60, 'Napoli', 'NA', '15'),
	(61, 'Novara', 'NO', '1'),
	(62, 'Nuoro', 'NU', '20'),
	(63, 'Ogliastra', 'OG', '20'),
	(64, 'Olbia-Tempio', 'OT', '20'),
	(65, 'Oristano', 'OR', '20'),
	(66, 'Padova', 'PD', '5'),
	(67, 'Palermo', 'PA', '19'),
	(68, 'Parma', 'PR', '8'),
	(69, 'Pavia', 'PV', '3'),
	(70, 'Perugia', 'PG', '10'),
	(71, 'Pesaro e Urbino', 'PU', '11'),
	(72, 'Pescara', 'PE', '13'),
	(73, 'Piacenza', 'PC', '8'),
	(74, 'Pisa', 'PI', '9'),
	(75, 'Pistoia', 'PT', '9'),
	(76, 'Pordenone', 'PN', '6'),
	(77, 'Potenza', 'PZ', '17'),
	(78, 'Prato', 'PO', '9'),
	(79, 'Ragusa', 'RG', '19'),
	(80, 'Ravenna', 'RA', '8'),
	(81, 'Reggio Calabria', 'RC', '18'),
	(82, 'Reggio Emilia', 'RE', '8'),
	(83, 'Rieti', 'RI', '12'),
	(84, 'Rimini', 'RN', '8'),
	(85, 'Roma', 'RM', '12'),
	(86, 'Rovigo', 'RO', '5'),
	(87, 'Salerno', 'SA', '15'),
	(88, 'Sassari', 'SS', '20'),
	(89, 'Savona', 'SV', '7'),
	(90, 'Siena', 'SI', '9'),
	(91, 'Siracusa', 'SR', '19'),
	(92, 'Sondrio', 'SO', '3'),
	(93, 'Taranto', 'TA', '16'),
	(94, 'Teramo', 'TE', '13'),
	(95, 'Terni', 'TR', '10'),
	(96, 'Torino', 'TO', '1'),
	(97, 'Trapani', 'TP', '19'),
	(98, 'Trento', 'TN', '4'),
	(99, 'Treviso', 'TV', '5'),
	(100, 'Trieste', 'TS', '6'),
	(101, 'Udine', 'UD', '6'),
	(102, 'Aosta', 'AO', 2),
	(103, 'Varese', 'VA', '3'),
	(104, 'Venezia', 'VE', '5'),
	(105, 'Verbano-Cusio-Ossola', 'VB', '1'),
	(106, 'Vercelli', 'VC', '1'),
	(107, 'Verona', 'VR', '5'),
	(108, 'Vibo Valentia', 'VV', '18'),
	(109, 'Vicenza', 'VI', '5'),
	(110, 'Viterbo', 'VT', '12');
