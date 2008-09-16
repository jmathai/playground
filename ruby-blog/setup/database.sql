CREATE DATABASE `blog`;

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL auto_increment,
  `author` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
)
