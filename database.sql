/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.20-MariaDB : Database - db_minimarket2010039
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_minimarket2010039` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_minimarket2010039`;

/*Table structure for table `tbl_barang` */

DROP TABLE IF EXISTS `tbl_barang`;

CREATE TABLE `tbl_barang` (
  `idbarang` char(7) NOT NULL,
  `namabarang` varchar(100) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `hargabeli` double DEFAULT NULL,
  `hargajual` double DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  PRIMARY KEY (`idbarang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_barang` */

insert  into `tbl_barang`(`idbarang`,`namabarang`,`satuan`,`hargabeli`,`hargajual`,`stok`) values 
('BRG0001','Biore Man','Botol',10000,12000,10),
('BRG0002','Relaxa','Pcs',3000,5000,20),
('BRG0003','Lasegar','Botol',4000,5000,30),
('BRG0004','Teh Celup','Pcs',1000,2000,20),
('BRG0005','Gula pasir','Bungkus',2000,4000,30);

/*Table structure for table `tbl_detailjual` */

DROP TABLE IF EXISTS `tbl_detailjual`;

CREATE TABLE `tbl_detailjual` (
  `iddetail` int(11) NOT NULL AUTO_INCREMENT,
  `idjual` char(10) DEFAULT NULL,
  `idbarang` char(7) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  PRIMARY KEY (`iddetail`),
  KEY `idjual` (`idjual`),
  KEY `idbarang` (`idbarang`),
  CONSTRAINT `tbl_detailjual_ibfk_1` FOREIGN KEY (`idjual`) REFERENCES `tbl_jual` (`idjual`) ON UPDATE CASCADE,
  CONSTRAINT `tbl_detailjual_ibfk_2` FOREIGN KEY (`idbarang`) REFERENCES `tbl_barang` (`idbarang`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_detailjual` */

insert  into `tbl_detailjual`(`iddetail`,`idjual`,`idbarang`,`qty`,`harga`) values 
(1,'F0001','BRG0001',1,12000),
(2,'F0001','BRG0002',2,5000),
(3,'F0002','BRG0003',2,8000);

/*Table structure for table `tbl_jual` */

DROP TABLE IF EXISTS `tbl_jual`;

CREATE TABLE `tbl_jual` (
  `idjual` char(10) NOT NULL,
  `tgl` date DEFAULT NULL,
  `username` char(5) DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`idjual`),
  KEY `username` (`username`),
  CONSTRAINT `tbl_jual_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_jual` */

insert  into `tbl_jual`(`idjual`,`tgl`,`username`,`total`) values 
('F0001','2021-09-13','A001',22000),
('F0002','2021-09-13','A002',8000);

/*Table structure for table `temp2010039` */

DROP TABLE IF EXISTS `temp2010039`;

CREATE TABLE `temp2010039` (
  `idbarang` char(7) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `temp2010039` */

insert  into `temp2010039`(`idbarang`,`qty`,`harga`) values 
('brg0003',1,5000),
('brg0005',4,4000),
('BRG0001',1,12000),
('BRG0001',3,12000),
('BRG0001',3,12000),
('BRG0001',1,12000),
('BRG0001',1,12000),
('brg0001',2,12000),
('BRG0001',1,12000);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` char(5) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`username`,`nama`,`password`,`email`,`lastlogin`) values 
('A001','Rafi','12345','chandra@gmail.com','2021-09-13 18:08:05'),
('A002','Azhuar','12345','azhuar@gmial.com','2021-09-13 18:08:38');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
