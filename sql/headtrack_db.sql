/*
 Navicat Premium Dump SQL

 Source Server         : connexionmysql
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : headtrack_db

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 06/02/2025 00:04:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for avis
-- ----------------------------
DROP TABLE IF EXISTS `avis`;
CREATE TABLE `avis`  (
  `id_avis` int NOT NULL AUTO_INCREMENT,
  `id_casque` int NOT NULL,
  `utilisateur` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` decimal(3, 2) NULL DEFAULT NULL,
  `commentaire` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `date_avis` datetime NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_avis`) USING BTREE,
  INDEX `id_casque`(`id_casque` ASC) USING BTREE,
  CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`id_casque`) REFERENCES `casques` (`id_casque`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of avis
-- ----------------------------
INSERT INTO `avis` VALUES (1, 1, 'XxDarkAngel92xX', 5.00, 'Incroyable qualité sonore et ANC très performant.', '2023-08-12 22:30:00');
INSERT INTO `avis` VALUES (2, 1, 'Thomas G.', 4.50, 'Super casque, mais un peu cher.', '2023-09-05 18:15:00');
INSERT INTO `avis` VALUES (3, 2, 'PixelNinjaX', 4.80, 'Parfait pour les voyages et le bureau.', '2023-07-22 14:40:00');
INSERT INTO `avis` VALUES (4, 3, 'NeonVortex', 4.30, 'Super son, mais trop lourd pour une longue écoute.', '2023-10-01 10:10:00');
INSERT INTO `avis` VALUES (5, 4, 'ShadowWolf99', 4.70, 'Idéal pour le gaming avec son spatial.', '2023-06-18 23:50:00');
INSERT INTO `avis` VALUES (6, 5, 'Annie', 5.00, 'Autonomie incroyable et son premium.', '2023-11-11 09:25:00');
INSERT INTO `avis` VALUES (7, 6, 'DarkHorizon54', 3.90, 'Bien mais l’ANC pourrait être meilleur.', '2023-09-30 16:40:00');
INSERT INTO `avis` VALUES (8, 7, 'LoneGamer2023', 5.00, 'Batterie interminable, idéal pour gaming.', '2023-07-07 12:20:00');
INSERT INTO `avis` VALUES (9, 8, 'Damien', 4.20, 'Beaucoup de basses, bon pour la musique urbaine.', '2023-12-21 20:10:00');
INSERT INTO `avis` VALUES (10, 9, 'OmegaTechX', 4.90, 'Élégant, confortable et super son.', '2023-11-15 11:45:00');
INSERT INTO `avis` VALUES (11, 10, 'Remy A.', 4.50, 'Super micro pour le gaming.', '2023-10-29 17:30:00');

-- ----------------------------
-- Table structure for casques
-- ----------------------------
DROP TABLE IF EXISTS `casques`;
CREATE TABLE `casques`  (
  `id_casque` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `marque` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `autonomie` int NULL DEFAULT NULL,
  `ANC` tinyint(1) NULL DEFAULT 0,
  `note_globale` decimal(3, 2) NULL DEFAULT 0.00,
  `connectique` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_casque`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of casques
-- ----------------------------
INSERT INTO `casques` VALUES (1, 'Sony WH-1000XM5', 'Sony', 'Over-ear', 30, 1, 4.80, 'Bluetooth, Jack 3.5mm, USB-C');
INSERT INTO `casques` VALUES (2, 'Bose QuietComfort 45', 'Bose', 'Over-ear', 24, 1, 4.70, 'Bluetooth, Jack 3.5mm, USB-C');
INSERT INTO `casques` VALUES (3, 'AirPods Max', 'Apple', 'Over-ear', 20, 1, 4.50, 'Bluetooth, Lightning');
INSERT INTO `casques` VALUES (4, 'SteelSeries Arctis Nova Pro Wireless', 'SteelSeries', 'Gaming', 22, 1, 4.60, 'Bluetooth, USB-C, Jack 3.5mm');
INSERT INTO `casques` VALUES (5, 'Sennheiser Momentum 4', 'Sennheiser', 'Over-ear', 60, 1, 4.70, 'Bluetooth, Jack 3.5mm, USB-C');
INSERT INTO `casques` VALUES (6, 'Jabra Elite 85h', 'Jabra', 'Over-ear', 36, 1, 4.30, 'Bluetooth, Jack 3.5mm, USB-C');
INSERT INTO `casques` VALUES (7, 'HyperX Cloud Alpha Wireless', 'HyperX', 'Gaming', 300, 0, 4.80, 'Bluetooth, USB');
INSERT INTO `casques` VALUES (8, 'Beats Studio Pro', 'Beats', 'Over-ear', 40, 1, 4.20, 'Bluetooth, USB-C');
INSERT INTO `casques` VALUES (9, 'Bang & Olufsen Beoplay HX', 'Bang & Olufsen', 'Over-ear', 35, 1, 4.60, 'Bluetooth, Jack 3.5mm, USB-C');
INSERT INTO `casques` VALUES (10, 'Razer BlackShark V2 Pro', 'Razer', 'Gaming', 70, 0, 4.50, 'Bluetooth, Jack 3.5mm, USB-C');

-- ----------------------------
-- Table structure for prix
-- ----------------------------
DROP TABLE IF EXISTS `prix`;
CREATE TABLE `prix`  (
  `id_prix` int NOT NULL AUTO_INCREMENT,
  `id_casque` int NOT NULL,
  `id_vendeur` int NOT NULL,
  `prix` decimal(7, 2) NULL DEFAULT NULL,
  `date_releve` datetime NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_prix`) USING BTREE,
  INDEX `id_casque`(`id_casque` ASC) USING BTREE,
  INDEX `id_vendeur`(`id_vendeur` ASC) USING BTREE,
  CONSTRAINT `prix_ibfk_1` FOREIGN KEY (`id_casque`) REFERENCES `casques` (`id_casque`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `prix_ibfk_2` FOREIGN KEY (`id_vendeur`) REFERENCES `vendeurs` (`id_vendeur`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prix
-- ----------------------------
INSERT INTO `prix` VALUES (1, 1, 1, 349.99, '2024-02-01 10:00:00');
INSERT INTO `prix` VALUES (2, 1, 2, 359.00, '2024-02-01 11:00:00');
INSERT INTO `prix` VALUES (3, 1, 3, 345.00, '2024-02-01 12:00:00');
INSERT INTO `prix` VALUES (4, 2, 1, 329.99, '2024-02-01 10:30:00');
INSERT INTO `prix` VALUES (5, 2, 4, 319.99, '2024-02-01 11:15:00');
INSERT INTO `prix` VALUES (6, 3, 6, 579.00, '2023-08-25 15:27:00');
INSERT INTO `prix` VALUES (7, 3, 2, 599.00, '2023-11-18 18:10:00');
INSERT INTO `prix` VALUES (8, 4, 7, 379.99, '2023-07-29 17:55:00');
INSERT INTO `prix` VALUES (9, 4, 3, 369.00, '2023-09-14 20:05:00');
INSERT INTO `prix` VALUES (10, 5, 1, 399.00, '2023-06-10 14:00:00');
INSERT INTO `prix` VALUES (11, 5, 4, 389.99, '2023-10-02 21:45:00');

-- ----------------------------
-- Table structure for vendeurs
-- ----------------------------
DROP TABLE IF EXISTS `vendeurs`;
CREATE TABLE `vendeurs`  (
  `id_vendeur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `site_web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_vendeur`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vendeurs
-- ----------------------------
INSERT INTO `vendeurs` VALUES (1, 'Amazon', 'https://www.amazon.fr');
INSERT INTO `vendeurs` VALUES (2, 'Fnac', 'https://www.fnac.com');
INSERT INTO `vendeurs` VALUES (3, 'Darty', 'https://www.darty.com');
INSERT INTO `vendeurs` VALUES (4, 'LDLC', 'https://www.ldlc.com');
INSERT INTO `vendeurs` VALUES (5, 'Boulanger', 'https://www.boulanger.com');
INSERT INTO `vendeurs` VALUES (6, 'Apple Store', 'https://www.apple.com/fr');
INSERT INTO `vendeurs` VALUES (7, 'SteelSeries Store', 'https://fr.steelseries.com');
INSERT INTO `vendeurs` VALUES (8, 'Bose Store', 'https://www.bose.fr');

SET FOREIGN_KEY_CHECKS = 1;
