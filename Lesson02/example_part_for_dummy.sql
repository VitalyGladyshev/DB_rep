CREATE TABLE `users` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `firstname` VARCHAR(50) NOT NULL,
  `lastname` VARCHAR(50) NOT NULL,
  `email` VARCHAR(120) NOT NULL UNIQUE,
  `created_at` DATETIME DEFAULT NOW(),
  `updated_at` DATETIME DEFAULT NOW() ON UPDATE NOW(),
);

CREATE TABLE `communities` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE `communities_users` (
  `community_id` INT(11) UNSIGNED NOT NULL,
  `user_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`community_id`, `user_id`),
  CONSTRAINT `communities_community_id_fk` FOREIGN KEY (`community_id`) REFERENCES `communities(`id`)`,
  CONSTRAINT `communities_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users(`id`)`
);
