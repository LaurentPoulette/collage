-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	8.0.28


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema vote
--

CREATE DATABASE IF NOT EXISTS vote;
USE vote;

--
-- Definition of table `panneau`
--

DROP TABLE IF EXISTS `panneau`;
CREATE TABLE `panneau` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `zone` varchar(100) DEFAULT NULL,
  `adresse` varchar(150) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `nb` varchar(5) DEFAULT NULL,
  `last` varchar(45) DEFAULT NULL,
  `decolle` varchar(5) CHARACTER SET utf8 NOT NULL,
  `iti` varchar(100) DEFAULT NULL,
  `pos` varchar(5) DEFAULT NULL,
  `coord` varchar(100) DEFAULT NULL,
  `officiel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=935 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `panneau`
--

/*!40000 ALTER TABLE `panneau` DISABLE KEYS */;
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (707,'L\'isle D\'espagnac','Esplanade Jean Ferrand','Esplanade Jean Ferrand','','44655,9530208333','TRUE','Officiel L\'isle D\'espagnac','','45.660550, 0.201310','TRUE'),
 (708,'L\'isle D\'espagnac','Rue de la libération','Rue de la libération','1','44717,8273611111','FALSE','Officiel L\'isle D\'espagnac','1','45.666133, 0.202772','TRUE'),
 (709,'L\'isle D\'espagnac','Avenue Jean Mermoz','foyer culture loisirs','1','44711,9772106481','FALSE','Officiel L\'isle D\'espagnac','1','45.672439, 0.209565','TRUE'),
 (710,'L\'isle D\'espagnac','Avenue de Montbron','Bois Boutin','','44713,9719675926','FALSE','Officiel L\'isle D\'espagnac','','45.662133, 0.218808','TRUE'),
 (711,'L\'isle D\'espagnac','Avenue Jean Jaurès','rue Georges Clémenceau','','44713,9265277778','FALSE','Officiel L\'isle D\'espagnac','','45.652663, 0.190478','TRUE'),
 (712,'L\'isle D\'espagnac','Rue des Plantiers','Rue des Plantiers','1','44713,9808101852','FALSE','Officiel L\'isle D\'espagnac','1','45.666151, 0.195949','TRUE'),
 (713,'L\'isle D\'espagnac','Rue Denis Papin','','1','44713,9766898148','FALSE','Officiel L\'isle D\'espagnac','1','45.658958, 0.190642','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (714,'L\'isle D\'espagnac','Rue Aristide Briand','Ancien garage','','44713,9771643519','FALSE','Officiel L\'isle D\'espagnac','','45.659478, 0.202945','TRUE'),
 (715,'L\'isle D\'espagnac','Rue Victore Hugo','Rue Victore Hugo','1','44713,9840277778','FALSE','Officiel L\'isle D\'espagnac','1','45.668552, 0.187267','TRUE'),
 (716,'L\'isle D\'espagnac','Boulevard des Ecasseaux','Boulevard des Ecasseaux','','44713,9840856481','FALSE','Officiel L\'isle D\'espagnac','','45.66559819079456, 0.1903490781182613','TRUE'),
 (717,'L\'isle D\'espagnac','Avenue de la République','','1','44717,8275578704','FALSE','Officiel L\'isle D\'espagnac','1','45.660834, 0.182274','TRUE'),
 (718,'MAGNAC SUR TOUVRE','Rue R. Guillardie','Rue R. Guillardie','','44717,8563773148','FALSE','Franck','','45.676294420912704, 0.22281911794601245','TRUE'),
 (719,'MAGNAC SUR TOUVRE','Rue Pasteur','Rue Pasteur','','44717,8831828704','FALSE','Franck','','45.675868, 0.224621','TRUE'),
 (720,'MAGNAC SUR TOUVRE','Place du marché','Place du marché','','44717,8478240741','FALSE','Franck','','45.665921, 0.237220','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (721,'MAGNAC SUR TOUVRE','Rue A. Briand','Rue A. Briand','','44717,8498842593','FALSE','Franck','','45.659902, 0.244279','TRUE'),
 (722,'MAGNAC SUR TOUVRE','Rue J. Jaurès','Rue J. Jaurès','','44717,8557523148','FALSE','Franck','','45.658279, 0.234692','TRUE'),
 (723,'MAGNAC SUR TOUVRE','Rue P. Cézanne','Rue P. Cézanne','','44717,8518634259','FALSE','Franck','','45.644991, 0.247302','TRUE'),
 (724,'MORNAC','Rue des écoles','Rue des écoles','','44717,9451041667','FALSE','Franck','','45.679527, 0.273052','TRUE'),
 (725,'MORNAC','Le Quéroy - Route de Mirambeau','Le Quéroy - Route de Mirambeau','1','44712,4838078704','FALSE','Franck','1','45.665041, 0.305755','TRUE'),
 (726,'MORNAC','Résidence Chabasse','Résidence Chabasse','1','44717,9478009259','FALSE','Franck','1','45.683471, 0.284934','TRUE'),
 (727,'MORNAC','Puy de Nanteuil\" - Route des grands champs','Puy de Nanteuil - Route des grands champs','','44712,5099189815','FALSE','Franck','','45.700205, 0.270279','TRUE'),
 (728,'RUELLE','école Doisneau','école Doisneau','1','44717,7300347222','FALSE','Officiel RUELLE','1','45.679380, 0.229815','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (729,'RUELLE','Place du Champ de Mars','Place du Champ de Mars','','44717,727337963','TRUE','Officiel RUELLE','','45.678745003855084, 0.22824992948057954','TRUE'),
 (730,'RUELLE','Ecole des Riffauds','Ecole des Riffauds','1','44717,7333912037','FALSE','Officiel RUELLE','1','45.688926, 0.257358','TRUE'),
 (731,'RUELLE','les seguins','les seguins','1','44712,3883564815','FALSE','Officiel RUELLE','1','45.679468, 0.212644','TRUE'),
 (732,'RUELLE','Ecole de Villement','Ecole de Villement','1','44717,7522685185','FALSE','Officiel RUELLE','1','45.678332, 0.196263','TRUE'),
 (733,'RUELLE','La Combe aux Loups','La Combe aux Loups','','44717,7466898148','FALSE','Officiel RUELLE','','45.687737, 0.221676','TRUE'),
 (734,'RUELLE','HLM Puyguillen','HLM Puyguillen','1','44717,7422106481','FALSE','Officiel RUELLE','1','45.677288, 0.239821','TRUE'),
 (735,'RUELLE','Dépôt services communaux','','1','44717,7300578704','FALSE','Officiel RUELLE','1','45.681614, 0.233736','TRUE'),
 (736,'Angoulême','Espace Franquin','Espace Franquin','','44711,9043981481','FALSE','Officiel Angoulême','','45.64939700471602, 0.1598302353428778','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (737,'Angoulême','LEP de Sillac','LEP de Sillac','','44717,7809259259','FALSE','Officiel Angoulême','','45.64644381812403, 0.14002635264936159','TRUE'),
 (738,'Angoulême','Place de la Marne','Place de la Marne','','44717,8128009259','FALSE','Officiel Angoulême','','45.643903, 0.128860','TRUE'),
 (739,'Angoulême','Hôtel de ville','Hôtel de ville','','44711,2650925926','FALSE','Officiel Angoulême','','45.648715, 0.156168','TRUE'),
 (740,'Angoulême','École Comtesse de Ségur/Collège Jules Verne','3 place Henri Dunant','','44711,9080787037','FALSE','Officiel Angoulême','','45.648560, 0.153648','TRUE'),
 (741,'Angoulême','Maison de quartier Saint-Martin/Saint-Ausone','square R. Guichard','','44714,0316087963','FALSE','Officiel Angoulême','','45.648983, 0.144806','TRUE'),
 (742,'Angoulême','École primaire A. Fournie','École primaire A. Fournie','','44717,7911805556','FALSE','Officiel Angoulême','','45.652150, 0.127007','TRUE'),
 (743,'Angoulême','École Uderzo, rue Antoine de Conflans','École Uderzo, rue Antoine de Conflans','','44717,8043287037','FALSE','Officiel Angoulême','','45.6495630132644, 0.11614458785887308','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (744,'Angoulême','Salle conviviale Grande Garenne, rue Pierre Aumaître','Salle conviviale Grande Garenne, rue Pierre Aumaître','','44717,7995138889','FALSE','Officiel Angoulême','','45.648230661866236, 0.12760699708792045','TRUE'),
 (745,'Angoulême','École Victor Hugo, rue F. Laporte','École Victor Hugo, rue F. Laporte','','44711,8951157407','FALSE','Officiel Angoulême','','45.648526, 0.175059','TRUE'),
 (746,'Angoulême','Bâtiment Prévert, grillage de clôture de la rue Théodore Botrel à l’entrée principale','Bâtiment Prévert, grillage de clôture de la rue Théodore Botrel à l’entrée principale','','44712,9831134259','FALSE','Officiel Angoulême','','45.653753, 0.169482','TRUE'),
 (747,'Angoulême','Carrefour de la Madeleine','Carrefour de la Madeleine','','44717,7598958333','FALSE','Officiel Angoulême','','45.65843089240663, 0.1730521672355194','TRUE'),
 (748,'Angoulême','École maternelle A. Daudet','École maternelle A. Daudet','','44717,8180439815','FALSE','Officiel Angoulême','','45.6555026411427, 0.16026983280545987','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (749,'Angoulême','École Victor Duruy','École Victor Duruy','','44717,7729861111','FALSE','Officiel Angoulême','','45.65730339764431, 0.14698582319602277','TRUE'),
 (750,'Angoulême','archives départementales','archives départementales','','44712,9832523148','TRUE','Officiel Angoulême','','45.65208588136844, 0.1633060144200151','TRUE'),
 (751,'Angoulême','383 rue de Périgueux','383 rue de Périgueux','','44711,8916319444','FALSE','Officiel Angoulême','','45.64493587413583, 0.17962620758933365','TRUE'),
 (752,'Angoulême','Rue de Bordeaux, entrée du Nil','Rue de Bordeaux, entrée du Nil','','44717,7769791667','FALSE','Officiel Angoulême','','45.65350715086419, 0.1483270120409856','TRUE'),
 (753,'Angoulême','42 boulevard de Bretagne','42 boulevard de Bretagne','','44717,7697453703','FALSE','Officiel Angoulême','','45.661680520129536, 0.14479680641398876','TRUE'),
 (754,'Angoulême','Collège Marguerite de Valois, en face du 7 rue Marguerite d’Angoulême','7 rue Marguerite d’Angoulême','','44711,9678819444','FALSE','Officiel Angoulême','','45.653660, 0.176478','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (755,'Angoulême','École Ferdinand Buisson, 114 rue de Périgueux','École Ferdinand Buisson, 114 rue de Périgueux','','44711,9000810185','FALSE','Officiel Angoulême','','45.64787486199999, 0.16762273470819916','TRUE'),
 (756,'Angoulême','École maternelle Jean de La Fontaine','École maternelle Jean de La Fontaine','','44711,8983333333','FALSE','Officiel Angoulême','','45.648945, 0.167455','TRUE'),
 (757,'Angoulême','Ma Campagne, allée de la Pléiade','Ma Campagne, allée de la Pléiade','','44711,9202314815','FALSE','Officiel Angoulême','','45.630646, 0.154917','TRUE'),
 (758,'Angoulême','place de l’Arche','place de l’Arche','','44711,9292361111','FALSE','Officiel Angoulême','','45.63203961603045, 0.14081251813629167','TRUE'),
 (759,'Angoulême','Rue R. Poincaré, face à la poste centrale du Champ de Mars','Rue R. Poincaré, face à la poste centrale du Champ de Mars','','44711,3668402778','FALSE','Officiel Angoulême','','45.649881776558914, 0.16275260596603794','TRUE'),
 (760,'Angoulême','école maternelle Condorcet','école maternelle Condorcet','','44711,371875','FALSE','Officiel Angoulême','','45.647766, 0.161840','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (761,'Angoulême','Place Vittoria','Place Vittoria','','44711,9260532407','FALSE','Officiel Angoulême','','45.63008075713309, 0.1491737116367106','TRUE'),
 (762,'Angoulême','Rue de la Belle Allée du Petit Fresque','Rue de la Belle Allée du Petit Fresque','1','44711,9151736111','FALSE','Officiel Angoulême','1','45.638105, 0.171827','TRUE'),
 (763,'Angoulême','Ma Campagne, parking d’Intermarché de Ma Campagne','Ma Campagne, parking d’Intermarché de Ma Campagne','','44711,9232175926','FALSE','Officiel Angoulême','','45.63280830333968, 0.15215447913309238','TRUE'),
 (764,'Angoulême','Collège Jules Michelet, parking rue des Frères Lumière','Collège Jules Michelet, parking rue des Frères Lumière','','44674,6799305556','TRUE','Officiel Angoulême','','45.648741, 0.165676','TRUE'),
 (765,'Ruelle','A','DCNS','1','44717,7272800926','FALSE','Officiel ruelle','1','45.678749, 0.225340','TRUE'),
 (766,'L\'isle D\'espagnac','Ici','Isle d\'Espagnac','1','44669,7623148148','TRUE','Officiel L\'isle D\'espagnac','1','45.658861, 0.190995','FALSE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (767,'BALZAC','Place Jean-Louis Guez de Balzac','','','44711,5298958333','FALSE','Officiel BALZAC','','45.71123505126908, 0.1376286992288311','TRUE'),
 (768,'BALZAC','Place de la Liberté','','','44711,5299421296','FALSE','Officiel BALZAC','','45.711869924694284, 0.14580236342161954','TRUE'),
 (769,'BOUEX','place de la Mairie','','','44713,9669791667','FALSE','Officiel Bouex','','45.616045, 0.317553','TRUE'),
 (770,'CHAMPNIERS','Rue des Autours (Le Bourg)','','','44712,3354513889','FALSE','Officiel Champniers','','45.714855, 0.203589','TRUE'),
 (771,'CHAMPNIERS','Rue des Colverts (Le Bourg)','','','44712,3356597222','FALSE','Officiel Champniers','','45.717174, 0.204578','TRUE'),
 (772,'CHAMPNIERS','Rue de la Sauge','','','44712,3359027778','FALSE','Officiel Champniers','','45.700778, 0.237697','TRUE'),
 (773,'CHAMPNIERS','Rue de l’Aneth','','','44712,3358564815','FALSE','Officiel Champniers','','45.704536, 0.235022','TRUE'),
 (774,'CHAMPNIERS','Rue Jean-Baptiste de la Péruse','','','44712,3355324074','FALSE','Officiel Champniers','','45.747338, 0.191804','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (775,'CHAMPNIERS','Rue des Plantier','','','44712,3352083333','FALSE','Officiel Champniers','','45.69236821940109, 0.17772596448972328','TRUE'),
 (776,'CHAMPNIERS','Rue des Platanes','','','44712,3350347222','FALSE','Officiel Champniers','','45.703257, 0.182068','TRUE'),
 (777,'CHAMPNIERS','Rue des Porches','','','44712,3352777778','FALSE','Officiel Champniers','','45.691738, 0.210664','TRUE'),
 (778,'CHAMPNIERS','Rue des Capucines Les Guérins','','','44712,3350810185','FALSE','Officiel Champniers','','45.703341, 0.169547','TRUE'),
 (779,'CHAMPNIERS','Rue des Vielles Pierres (Chez Nauve)','','','44712,3349305556','FALSE','Officiel Champniers','','45.701228, 0.208994','TRUE'),
 (780,'CHAMPNIERS','Chemin de l’Œil de Bœuf (La Vallade)','','','44712,3723148148','FALSE','Officiel Champniers','','45.678479, 0.184331','TRUE'),
 (781,'CHAMPNIERS','Rue Lucien Deschamps/rue Marguerite de Valois (Les Limbaudières)','','','44712,3354861111','FALSE','Officiel Champniers','','45.736109, 0.209972','TRUE'),
 (782,'CHAMPNIERS','Chemin des Plaqueminiers (Les Rossignols)','','','44712,3349884259','FALSE','Officiel Champniers','','45.703899, 0.194366','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (783,'Dirac','mairie','','','44717,9449074074','FALSE','Franck','','45.605417, 0.248379','TRUE'),
 (784,'Fléac','École','','','44711,530625','FALSE','Officiel Fléac','','45.66774337862188, 0.09682043962804135','TRUE'),
 (785,'Fléac','Thouérat (Placette)','','','44711,530787037','FALSE','Officiel Fléac','','45.66904199261491, 0.11283684922356385','TRUE'),
 (786,'Fléac','Rue de La Lurate','','','44711,5307407407','FALSE','Officiel Fléac','','45.68069265194252, 0.09800828035165411','TRUE'),
 (787,'Fléac','Place Bioujou (La Vallade)','','','44711,5306828704','FALSE','Officiel Fléac','','45.677572858413875, 0.08730044194502833','TRUE'),
 (788,'Fléac','Place de Brénat','','','44711,5307060185','FALSE','Officiel Fléac','','45.68653648475113, 0.07452382324279412','TRUE'),
 (789,'Fléac','Rue de Badoris','','','44711,5305208333','FALSE','Officiel Fléac','','45.653018744541946, 0.09517136398849983','TRUE'),
 (790,'Fléac','Avenue des Sports','','','44711,5305787037','FALSE','Officiel Fléac','','45.66197330713641, 0.0897632971530561','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (791,'Fléac','Place Markbreit (centre commercial','','','44711,5306481481','FALSE','Officiel Fléac','','45.66460508180832, 0.0928749539422883','TRUE'),
 (792,'GARAT','Rue du Stade, clôture du Stade Jean Niollet','','','44717,8840046296','FALSE','Franck','','45.621714, 0.262950','TRUE'),
 (793,'GOND-PONTOUVRE','Route de Vars (mur du cimetière)','','','44712,9323148148','FALSE','Officiel GOND-PONTOUVRE','','45.663938, 0.162226','TRUE'),
 (794,'GOND-PONTOUVRE','Route de Vars (face au Crédit Agricole)','','','44712,9322800926','FALSE','Officiel GOND-PONTOUVRE','','45.669112, 0.160852','TRUE'),
 (795,'GOND-PONTOUVRE','Chalonne','','','44711,5302430556','FALSE','Officiel GOND-PONTOUVRE','','45.689478, 0.155924','TRUE'),
 (796,'GOND-PONTOUVRE','Rue Pasteur','','','44712,9325810185','FALSE','Officiel GOND-PONTOUVRE','','45.676565, 0.175162','TRUE'),
 (797,'GOND-PONTOUVRE','Rue du Général Leclerc (coté voie de chemin de fer)','','','44712,9323958333','FALSE','Officiel GOND-PONTOUVRE','','45.661135, 0.171567','TRUE'),
 (798,'GOND-PONTOUVRE','Route de Paris (Pont de Pisany)','','','44712,9323842593','FALSE','Officiel GOND-PONTOUVRE','','45.666153, 0.171555','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (799,'GOND-PONTOUVRE','Route de Paris (Pont de la Touvre)','','','44712,9324652778','FALSE','Officiel GOND-PONTOUVRE','','45.67611299938535, 0.1751153225237239','TRUE'),
 (800,'GOND-PONTOUVRE','Rue de l\'Égalité (ancienne mairie)','','','44712,932337963','FALSE','Officiel GOND-PONTOUVRE','','45.667181, 0.165811','TRUE'),
 (801,'GOND-PONTOUVRE','École du Pontouvre','','','44712,9324421296','FALSE','Officiel GOND-PONTOUVRE','','45.671688, 0.173511','TRUE'),
 (802,'GOND-PONTOUVRE','École de Roffit','','','44712,7977893519','FALSE','Officiel GOND-PONTOUVRE','','45.675873, 0.158100','TRUE'),
 (803,'GOND-PONTOUVRE','Rue du Treuil (grille du CES)','','','44712,7980555556','FALSE','Officiel GOND-PONTOUVRE','','45.680128, 0.163816','TRUE'),
 (804,'La Couronne','Place de la Mairie','','','44711,3383333333','FALSE','Officiel La Couronne','','45.608613, 0.101834','TRUE'),
 (805,'La Couronne','Place du 14 Juillet','','','44711,3277893519','FALSE','Officiel La Couronne','','45.609526, 0.097303','TRUE'),
 (806,'La Couronne','La Montée, avenue de la Gare (giratoire Super U)','','','44711,3239583333','FALSE','Officiel La Couronne','','45.607005, 0.088215','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (807,'La Couronne','Lafont, route du Moulin de Colas','','','44711,3152893518','FALSE','Officiel La Couronne','','45.613188, 0.070357','TRUE'),
 (808,'La Couronne','Le Mas, route de Saint-Michel','','','44711,2986574074','FALSE','Officiel La Couronne','','45.625434, 0.096216','TRUE'),
 (809,'La Couronne','Le Grand Maine, route du Grand Maine','','','44711,3039930556','FALSE','Officiel La Couronne','','45.623183, 0.077189','TRUE'),
 (810,'La Couronne','Breuty, place de Breuty','','','44711,3519212963','FALSE','Officiel La Couronne','','45.618968, 0.116725','TRUE'),
 (811,'La Couronne','Le Pont des Gallands, giratoire de la route de Mouthiers','','','44711,3382638889','FALSE','Officiel La Couronne','','45.599838, 0.098255','TRUE'),
 (812,'La Couronne','Les Barrets, place de la route de la Charbonnière','','','44711,3205787037','FALSE','Officiel La Couronne','','45.612049, 0.086195','TRUE'),
 (813,'La Couronne','Le Pont Neuf, entrée du lot de la route de Vœuil','','','44711,344849537','FALSE','Officiel La Couronne','','45.60201908577267, 0.13897836111157483','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (814,'La Couronne','Les Séverins, route de Vœuil aux Séverins','','','44711,341412037','FALSE','Officiel La Couronne','','45.605272, 0.119459','TRUE'),
 (815,'NERSAC','Salle communale','','','44711,9751273148','FALSE','Officiel Nersac','','45.623645, 0.050572','TRUE'),
 (816,'NERSAC','Place de l’Union','','','44711,975150463','FALSE','Officiel Nersac','','45.625847, 0.050950','TRUE'),
 (817,'NERSAC','HLM','','','44711,9752083333','FALSE','Officiel Nersac','','45.626009, 0.049680','TRUE'),
 (818,'NERSAC','École Alfred de Vigny groupe B','','','44711,9799074074','FALSE','Officiel Nersac','','45.627446, 0.050924','TRUE'),
 (819,'NERSAC','Les Fleuranceaux','','','44711,9815740741','FALSE','Officiel Nersac','','45.630206, 0.052676','TRUE'),
 (820,'NERSAC','La Meure','','','44711,98','FALSE','Officiel Nersac','','45.633174, 0.047320','TRUE'),
 (821,'NERSAC','Place du Peu','','','44711,9636111111','FALSE','Officiel Nersac','','45.625586, 0.059406','TRUE'),
 (822,'NERSAC','Le Vieux Peu','','','44711,9636689815','FALSE','Officiel Nersac','','45.624915, 0.058345','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (823,'NERSAC','Le Pont Thuillier','','','44711,9853935185','FALSE','Officiel Nersac','','45.622077, 0.052672','TRUE'),
 (824,'NERSAC','Place de Pombreton','','','44712,0019212963','FALSE','Officiel Nersac','','45.617804, 0.061088','TRUE'),
 (825,'PUYMOYEN','Impasse de l’Ouche du Roy','','','44711,6843518519','FALSE','Officiel PUYMOYEN','','45.611277, 0.187396','TRUE'),
 (826,'PUYMOYEN','Impasse de l’Ouche du Roy','','','44711,6844560185','FALSE','Officiel PUYMOYEN','','45.611330, 0.187573','TRUE'),
 (827,'PUYMOYEN','Route de la Vallée des Eaux Claires','','','44711,6917939815','FALSE','Officiel PUYMOYEN','','45.616422, 0.154760','TRUE'),
 (828,'PUYMOYEN','Rue du Cormier','','','44711,6663657407','FALSE','Officiel PUYMOYEN','','45.616307, 0.173847','TRUE'),
 (829,'PUYMOYEN','Rue des Bois de Rochefort','','','44711,661712963','FALSE','Officiel PUYMOYEN','','45.618386, 0.166834','TRUE'),
 (830,'PUYMOYEN','Rue de Vouillac','','','44711,6559027778','FALSE','Officiel PUYMOYEN','','45.620842, 0.162050','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (831,'PUYMOYEN','Rue de Peusec (devant la salle des fêtes)','','','44711,6789930556','FALSE','Officiel PUYMOYEN','','45.618136, 0.181021','TRUE'),
 (832,'PUYMOYEN','Rue de la Prairie','','','44711,6511921296','FALSE','Officiel PUYMOYEN','','45.627571, 0.158058','TRUE'),
 (833,'PUYMOYEN','Rue des Reclos (devant le parking)','','','44711,6684259259','FALSE','Officiel PUYMOYEN','','45.621000, 0.179966','TRUE'),
 (834,'PUYMOYEN','Le Champ de la Croix','','','44711,674375','FALSE','Officiel PUYMOYEN','','45.614875, 0.185640','TRUE'),
 (835,'Roullet-Saint-Estèphe','Parking de la Maison pour tous, rue Froide (Roullet bourg)','','','44712,0018402778','FALSE','Officiel Roullet-Saint-Estèphe','','45.583875430994645, 0.04752872324913014','TRUE'),
 (836,'Roullet-Saint-Estèphe','Salle des fêtes, place du Champ-de-Foire (Roullet)','','','44712,0018055556','FALSE','Officiel Roullet-Saint-Estèphe','','45.581083926367576, 0.047861228449164524','TRUE'),
 (837,'Roullet-Saint-Estèphe','Le bourg, Cantine, (Saint-Estèphe','','','44712,0017708333','FALSE','Officiel Roullet-Saint-Estèphe','','45.579677, 0.013132','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (838,'SAINT-MICHEL','Centre commercial : Avenue de la République','','','44711,2768865741','FALSE','Officiel SAINT-MICHEL','','45.637096, 0.112146','TRUE'),
 (839,'SAINT-MICHEL','Stade : Boulevard de Bretagne','','','44711,2749884259','FALSE','Officiel SAINT-MICHEL','','45.635077, 0.114333','TRUE'),
 (840,'SAINT-MICHEL','Logis de Chantoiseau : Place du 19 mars 1962 (Impasse Chantoiseau)','','','44711,2901157407','FALSE','Officiel SAINT-MICHEL','','45.644778, 0.103201','TRUE'),
 (841,'SAINT-MICHEL','Salle Polyvalente : Rue des Douhauds','','','44711,2790393519','FALSE','Officiel SAINT-MICHEL','','45.640461, 0.109513','TRUE'),
 (842,'SAINT-MICHEL','Mairie : Rue Joseph Chaumette','','','44711,2808217593','FALSE','Officiel SAINT-MICHEL','','45.641356, 0.106724','TRUE'),
 (843,'SAINT-MICHEL','HLM : Rue des Poètes','','','44711,2857523148','FALSE','Officiel SAINT-MICHEL','','45.647963, 0.108517','TRUE'),
 (844,'SAINT-MICHEL','Les Hauts de Chantoiseau','','','44711,2943287037','FALSE','Officiel SAINT-MICHEL','','45.643507, 0.097782','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (845,'SAINT-MICHEL','Place des Sicauds','','','44711,290162037','FALSE','Officiel SAINT-MICHEL','','45.640950, 0.101171','TRUE'),
 (846,'Saint-Yrieix-sur-Charente','6 avenue de l’Union (sur le côté de la Mairie)','','','44711,5308796296','FALSE','Officiel Saint-Yrieix-sur-Charente','','45.675037288837615, 0.1275016632993788','TRUE'),
 (847,'Saint-Yrieix-sur-Charente','6 rue de l’Ancienne Mairie (Ecole Nicolas Vanier)','','','44711,5301041667','FALSE','Officiel Saint-Yrieix-sur-Charente','','45.692164353962596, 0.11505262046742253','TRUE'),
 (848,'Saint-Yrieix-sur-Charente','Carrefour de la rue des Augerauds et des Mesniers','','','44711,5300462963','FALSE','Officiel Saint-Yrieix-sur-Charente','','45.692304177987026, 0.13297221952861205','TRUE'),
 (849,'Saint-Yrieix-sur-Charente','Rue Jacques Chardonne (à côté du transformateur)','','','44711,5309259259','FALSE','Officiel Saint-Yrieix-sur-Charente','','45.66722088625535, 0.14396573737557045','TRUE'),
 (850,'Saint-Yrieix-sur-Charente','22 rue des Ecoles (Préau de l’école C Roy B)','','','44711,5308449074','FALSE','Officiel Saint-Yrieix-sur-Charente','','45.66739889948253, 0.12764659337702816','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (851,'Saint-Yrieix-sur-Charente','152 rue J et C Priolaud (en face de l’entrée de la salle des fêtes)','','','44711,5302083333','FALSE','Officiel Saint-Yrieix-sur-Charente','','45.67827947627939, 0.14263736359565826','TRUE'),
 (852,'Saint-Yrieix-sur-Charente','Angle de l’avenue de l’Union et de l’allée Léo Lagrange (Gymnase des Berneries)','','','44711,5311574074','FALSE','Officiel Saint-Yrieix-sur-Charente','','45.6761110486578, 0.1290371247221045','TRUE'),
 (853,'Saint-Yrieix-sur-Charente','Rue des Mesniers (Arrêt de bus « Nautilis »)','','','44711,5301736111','FALSE','Officiel Saint-Yrieix-sur-Charente','','45.685032784895476, 0.1429131134372039','TRUE'),
 (854,'Soyaux','Espace Henri Matisse (côté droit de l’allée d’accès)','','','44713,9084953704','FALSE','Officiel Soyaux','','45.64226837913719, 0.196667977231184','TRUE'),
 (855,'Soyaux','Rue De la cigogne','','','44711,7389467593','FALSE','Officiel Soyaux','','45.638150995301714, 0.18557363337548688','TRUE'),
 (856,'Soyaux','Place Lucien Petit, du côté de la rue des Lilas','','','44713,9113888889','FALSE','Officiel Soyaux','','45.64223778606942, 0.19011957928317885','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (857,'Soyaux','Le Pétureau, place Charlemagne','','','44711,7357523148','FALSE','Officiel Soyaux','','45.63734400363526, 0.1969955500950365','TRUE'),
 (858,'Soyaux','Avenue Christophe Colomb, le long du parking du square du 8 mai 1945','','','44713,9112847222','FALSE','Officiel Soyaux','','45.64053398405123, 0.18619300611607814','TRUE'),
 (859,'Soyaux','Antornac, à l’entrée du bourg','','','44713,9054861111','FALSE','Officiel Soyaux','','45.644156455125675, 0.20535157641880353','TRUE'),
 (860,'Soyaux','Chemin d’Entreroches, entre la rue de la Combe et l’impasse des Glycines','','','44713,9240625','FALSE','Officiel Soyaux','','45.65045795975826, 0.1942134853219135','TRUE'),
 (861,'Soyaux','Boulevard Léon Blum, entre Gulliver et Mille et une facettes','','','44713,9211226852','FALSE','Officiel Soyaux','','45.64832988156387, 0.18422635524418574','TRUE'),
 (862,'Soyaux','Rue Maurice Ravel, à l’angle de la rue Maurice Ravel et rue Maréchal Fayolle','','','44711,8895138889','FALSE','Officiel Soyaux','','45.645254, 0.181197','TRUE'),
 (863,'Soyaux','Square des Marronniers, au croisement de l’allée des Marronniers et de la rue du Bourg','','','44713,908287037','FALSE','Officiel Soyaux','','45.641920254707614, 0.20063034370347688','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (864,'Soyaux','La croix blanche, carrefour route du Peux et chemin de Bressour','','','44713,8983912037','FALSE','Officiel Soyaux','','45.636406988192995, 0.20621164934244118','TRUE'),
 (865,'Voeuil-Et-Giget','Bourg de Vœuil','','','44711,7048148148','FALSE','Officiel Voeuil-Et-Giget','','45.585438, 0.154409','TRUE'),
 (866,'Voeuil-Et-Giget','Bourg de Giget','','','44711,6947685185','FALSE','Officiel Voeuil-Et-Giget','','45.604176, 0.153361','TRUE'),
 (867,'Voeuil-Et-Giget','Allée des Sports','','','44711,7008564815','FALSE','Officiel Voeuil-Et-Giget','','45.592520, 0.149328','TRUE'),
 (868,'Vouzan','Salles des fêtes','','','44713,9386689815','FALSE','Officiel Vouzan','','45.602521, 0.356358','TRUE'),
 (869,'Sers','','Sers','1','44711,8471296296','TRUE','','','45.598656, 0.322019','TRUE'),
 (870,'Dignac','','Dignac','1','44711,8472106481','TRUE','','','45.557450, 0.281469','TRUE'),
 (871,'Cloulas','','Cloulas','','44711,8471875','TRUE','','','45.549447, 0.312325','TRUE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (872,'Mairie isle d\'Espagnac','','','1','44713,967337963','FALSE','','','45.663575, 0.197613','TRUE'),
 (873,'La Couronne','','Champ de Foire / Av Libération','','44711,3382986111','FALSE','','','45.606464, 0.100333','TRUE'),
 (874,'Angoulême','Bd Chanzy, 16006 Angoulême','Chanzy','','44707,8650231482','FALSE','C','3','45.6446686,0.1776752','FALSE'),
 (875,'Angoulême','31 Bd Besson Bey, 16000 Angoulême','Bd Besson Bey','4','44717,8209259259','FALSE','D','3','45.6579215,0.1607381','FALSE'),
 (876,'Angoulême','20 Rue de Clerac À Sillac, 16000 Angoulême','Clerac à Sillac','1','44673,9825115741','FALSE','C','7','45.640261, 0.156918','FALSE'),
 (877,'Angoulême','10 Pl. Delivertoux, 16000 Angoulême','Delivertoux','4','44710,683912037','FALSE','B','9','45.648291, 0.175102','FALSE'),
 (878,'Angoulême','1 Rue de la Tourgarnier, 16000 Angoulême','Colonne Bussate','8','44710,6928703704','FALSE','B','8','45.647687, 0.166739','FALSE'),
 (879,'Soyaux','597 Rue Georges Courteline, 16800 Soyaux','Courteline','3','44707,7863194444','FALSE','B','10','45.650216, 0.184342','FALSE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (880,'Angoulême','15 Rpe d\'Aguesseau, 16000 Angoulême','Espace Franquin','8','44707,8789814815','FALSE','D','9','45.649534, 0.159657','FALSE'),
 (881,'Angoulême','1 Rue Raymond Poincaré, 16000 Angoulême','Hôtel de Police','8','44707,8696990741','FALSE','B','7','45.649761, 0.162807','FALSE'),
 (882,'Angoulême','20 Pl. Mulac, 16000 Angoulême','Place Mulac','8','44717,7729398148','FALSE','D','6','45.6573651,0.1487417','FALSE'),
 (883,'Angoulême','43 Rue Jean Maintenon, 16000 Angoulême','Maintenon','8','44717,7845717593','FALSE','D','7','45.651394, 0.138920','FALSE'),
 (884,'Angoulême','3 Rue Saint-Vincent de Paul, 16000 Angoulême','St Vincent de Paul','8','44717,8031712963','FALSE','E','3','45.6482841,0.1202347','FALSE'),
 (885,'L\'isle D\'espagnac','32 Rue Denis Papin, 16340 L\'Isle-d\'Espagnac','Papin','2','44714,9034606482','FALSE','B','2','45.658723, 0.190853','FALSE'),
 (886,'Angoulême','159 Rue Jules Durandeau, 16000 Angoulême','Jules Durandeau','8','44717,7653819444','FALSE','D','4','45.663715,0.151748','FALSE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (887,'Angoulême','72 Rue de Beaulieu, 16000 Angoulême','Beaulieu','4','44707,8122916667','FALSE','D','8','45.650599, 0.148989','FALSE'),
 (888,'Angoulême','17 Rue Gontran Labregere, 16000 Angoulême','Labregere','4','44717,7697222222','FALSE','D','5','45.6618164,0.1449709','FALSE'),
 (889,'Angoulême','2 Rue Pierre Brossolette, 16000 Angoulême','Rue de Limoges','6','44717,7588541667','FALSE','B','3','45.659184, 0.175206','FALSE'),
 (890,'RUELLE','22 Pl. du Champ de Mars, 16600 Ruelle-sur-Touvre','Pl. du Champ de Mars','8','44717,7274305556','FALSE','B','1','45.6781634,0.2286951','FALSE'),
 (891,'Angoulême','19 Rue de la Cigogne, 16000 Angoulême','La Cigogne','2','44707,8568981482','FALSE','D','1','45.636789, 0.180832','FALSE'),
 (892,'Angoulême','65 Rue de la Loire, 16000 Angoulême','Saint-Gelais','4','44710,6993518519','FALSE','C','5','45.645174, 0.162315','FALSE'),
 (893,'Angoulême','12 Rue de la Belle Allée du Petit Fresquet, 16000 Angoulême','Petit Fresquet','8','44707,8557407407','FALSE','C','4','45.639137, 0.171845','FALSE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (894,'Soyaux','18B Rue du Dr Fernand Lamaze, 16800 Soyaux','Fernand Lamaze','3','44707,8649305556','FALSE','C','2','45.642588, 0.182261','FALSE'),
 (895,'Soyaux','12 Av. du Petureau, 16800 Soyaux','Av. du Petureau','6','44707,8569328704','FALSE','C','1','45.638872,0.193528','FALSE'),
 (896,'Angoulême','143 Rue de Montmoreau, 16000 Angoulême','Montmoreau','4','44673,9813310185','FALSE','C','6','45.641484, 0.157106','FALSE'),
 (897,'Angoulême','Rue Pierre Aumaitre, 16000 Angoulême','Pierre Aumaitre','1','44717,7985648148','FALSE','E','1','45.649403, 0.129630','FALSE'),
 (898,'Angoulême','Rue Emile Peyronnet, 16000 Angoulême','Emile Peyronnet','1','44717,8119907407','TRUE','E','2','45.6493499,0.1133838','FALSE'),
 (899,'Angoulême','Rue Théodore Botrel, 16006 Angoulême','Théodore Botrel','','44712,9830092593','FALSE','B','6','45.653627, 0.168985','FALSE'),
 (900,'Angoulême','Rue Paul Mairat, 16006 Angoulême','Paul Mairat','','44663,9504861111','FALSE','B','4','45.656128, 0.173252','FALSE'),
 (901,'Angoulême','Rue Marguerite d\'Angoulême, 16006 Angoulême','Marguerite d\'Angoulême','','44710,6689351852','FALSE','B','5','45.654789, 0.175617','FALSE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (902,'Angoulême','Bd de la République, 16006 Angoulême','Boulevard de la République','1','44610','TRUE','D','2','45.6511717,0.1702666','FALSE'),
 (903,'Angoulême','Rue Claude Bonnier, 16000 Angoulême','Claude Bonnier','','44710,7206828704','FALSE','C','12','45.630673, 0.141080','FALSE'),
 (904,'Angoulême','Rue du Canada, 16000 Angoulême','Canada','','44673,9792361111','FALSE','C','8','45.639391,0.1532643','FALSE'),
 (905,'Angoulême','Bd Jacques Monod, 16000 Angoulême','Boulevard Jacques Monod','','44710,7159375','FALSE','C','11','45.631771, 0.155872','FALSE'),
 (906,'Angoulême','Av. de Navarre, Angoulême','Avenue de Navarre','','44610','TRUE','C','9','45.6279867,0.1535572','FALSE'),
 (907,'Vindelle','Rue du Champ de Foire, 16430 Vindelle','Champ de Foire','6','44610','FALSE','Undefined','','45.7212551,0.1214022','FALSE'),
 (908,'La Couronne','Rue du 19 Mars 1962, 16400 La Couronne','Rue du 19 mars 1962','1','44709,3699768518','FALSE','A','3','45.610699, 0.099944','FALSE'),
 (909,'La Couronne','Pl. du 14 Juillet, 16400 La Couronne','Place du 14 Juillet','1','44709,37','FALSE','A','4','45.609268, 0.097255','FALSE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (910,'La Couronne','16400 La Couronne, France','Chez Dion','1','44677,7846296296','FALSE','A','9','45.613118, 0.071743','FALSE'),
 (911,'La Couronne','16400 La Couronne, France','Les Barrets','1','44684,8862615741','FALSE','A','10','45.611885, 0.086179','FALSE'),
 (912,'La Couronne','Le Grand Maine, 16400 La Couronne','Le Grand Maine','1','44631,8640740741','FALSE','E','7','45.623605, 0.076695','FALSE'),
 (913,'La Couronne','Le Chalumeau, 16400 La Couronne','Le Chalumeau','1','44610','FALSE','E','6','45.63863,0.098044','FALSE'),
 (914,'La Couronne','16400 La Couronne, France','Le Mas','','44631,8677893519','FALSE','E','8','45.625329, 0.096012','FALSE'),
 (915,'La Couronne','Breuty, 16400 La Couronne','Breuty','1','44709,401400463','FALSE','E','9','45.618849, 0.116854','FALSE'),
 (916,'La Couronne','16400 La Couronne, France','Les Séverins','1','44709,3878935185','FALSE','A','1','45.605532,0.119567','FALSE'),
 (917,'La Couronne','La Contrie, 16400 La Couronne','La Contrie','1','44709,3771759259','FALSE','A','6','45.601212, 0.102029','FALSE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (918,'La Couronne','16400 La Couronne, France','La Montée','1','44631,8530439815','TRUE','A','8','45.605919,0.084159','FALSE'),
 (919,'La Couronne','All. des Sports, 16400 La Couronne','Allée des Sports','1','44709,3734375','FALSE','A','7','45.601337, 0.095358','FALSE'),
 (920,'La Couronne','Rte de Libourne, 16400 La Couronne','Route de Libourne','6','44709,3927199074','FALSE','C','13','45.609314, 0.151313','FALSE'),
 (921,'SAINT-MICHEL','Rue des Poètes, 16470 Saint-Michel','Rue des Poètes','4','44673,9366550926','FALSE','E','4','45.649538, 0.108597','FALSE'),
 (922,'SAINT-MICHEL','Rue des Peupliers, 16470 Saint-Michel','Rue des Peupliers','1','44673,9276157407','FALSE','E','5','45.639829, 0.100839','FALSE'),
 (923,'SAINT-MICHEL','11 Bd de Bretagne, 16470 Saint-Michel','Club Sportif Saint Michel','1','44673,9196527778','FALSE','E','11','45.634911, 0.114101','FALSE'),
 (924,'Angoulême','Rue Paul Mairat, 16006 Angoulême, France','Bus Mairat','2','44710,6646875','FALSE','','1','45.656045, 0.173206','FALSE'),
 (925,'La Couronne','Place de la Mairie','','','44709,3699305556','FALSE','Officiel La Couronne','','45.608763, 0.101210','FALSE');
INSERT INTO `panneau` (`id`,`zone`,`adresse`,`nom`,`nb`,`last`,`decolle`,`iti`,`pos`,`coord`,`officiel`) VALUES 
 (926,'Cloulas','','Cloulas libre','3','44672,8044907407','FALSE','','','45.549150, 0.312090','FALSE'),
 (927,'Saint-Michel','','Les Sicauds','','','FALSE','','','45.640750, 0.101436','FALSE'),
 (928,'Nersac','','La Meure','','44677,7858796296','FALSE','','','45.633124, 0.047295','FALSE'),
 (929,'La Couronne','','Pont Neuf','','44709,3879398148','FALSE','','','45.600240, 0.139000','FALSE'),
 (930,'Les Poètes 1','','','2','','FALSE','','','45.648026, 0.108503','FALSE'),
 (931,'Nersac','','Rue Angoulême / Fontenelles','','44677,8119328704','FALSE','','','45.625267, 0.058265','FALSE'),
 (932,'La Couronne','','Hippodrome','4','44709,3963310185','FALSE','','','45.617981, 0.137653','FALSE'),
 (933,'Mlornac','','','1','44714,9274768519','FALSE','','','45.699617, 0.270970','FALSE'),
 (934,'Angoulême','','Rue de la Loire','4','44710,7047569444','FALSE','','','45.641578, 0.157275','FALSE');
/*!40000 ALTER TABLE `panneau` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
