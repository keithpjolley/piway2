CREATE TABLE `dnspolicy` (
  `id` int(10) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`,`name`)
);
CREATE TABLE `translate` (
  `lang` varchar(8) NOT NULL,
  `raw` varchar(24) NOT NULL,
  `cooked` text NOT NULL,
  PRIMARY KEY (`lang`,`raw`)
);
CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(48) NOT NULL,
  `password` char(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`id`),
  UNIQUE (`username`)
);
CREATE TABLE devices (
  `id` integer primary key,
  `hostname` varchar(511) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `dnspolicyid` int(10) DEFAULT NULL,
  `thingtype` varchar(128) DEFAULT NULL,
  `macaddress` varchar(17) NOT NULL,
  `ipv4` varchar(24) DEFAULT NULL,
  `schedulepolicy` varchar(15) NOT NULL,
  `vendor` varchar(256) DEFAULT NULL,
  `notes` varchar(2048) DEFAULT NULL,
  `include` tinyint(4) NOT NULL DEFAULT '1',
  `userid` int(10) NOT NULL,
  UNIQUE (`hostname`,`macaddress`,`ipv4`)
  CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`dnspolicyid`) REFERENCES `dnspolicy` (`id`),
  CONSTRAINT `devices_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
);
CREATE TABLE `cnames` (
  `id` int(10) NOT NULL,
  `cname` text NOT NULL,
  CONSTRAINT `cnames_ibfk_1` FOREIGN KEY (`id`) REFERENCES `devices` (`id`),
  UNIQUE (`cname`)
);
