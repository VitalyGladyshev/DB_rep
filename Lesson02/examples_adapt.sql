-- Создаём БД аналога социальной сети ВКонтакте 
CREATE DATABASE IF NOT EXISTS vk;

USE vk;

-- Создаём таблицу пользователей - основную таблицу
CREATE TABLE IF NOT EXISTS users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT NOW(),
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW(),
  INDEX users_firstname_lastname_idx (firstname, lastname),
  INDEX users_email_idx (email)
);

-- Таблица профилей
-- DROP TABLE profiles;
CREATE TABLE IF NOT EXISTS profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY,
  sex CHAR(1) NOT NULL,
  birthday DATE,
  hometown VARCHAR(100) DEFAULT 'Москва',
  photo_id INT UNSIGNED NOT NULL DEFAULT 1,
  CONSTRAINT profiles_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id)
  -- CONSTRAINT profiles_photo_id_fk FOREIGN KEY (photo_id) REFERENCES media(id) 
);

-- Таблица сообщений
CREATE TABLE IF NOT EXISTS messages (
  from_user_id INT UNSIGNED NOT NULL,
  to_user_id INT UNSIGNED NOT NULL,
  body TEXT NOT NULL,
  important BOOLEAN,
  delivered BOOLEAN,
  created_at DATETIME DEFAULT NOW(),
  PRIMARY KEY (from_user_id, created_at),
  INDEX messages_from_user_id_idx(from_user_id),
  INDEX messages_to_user_id_idx(to_user_id),
  CONSTRAINT messages_from_user_id_fk FOREIGN KEY (from_user_id) REFERENCES users(id),
  CONSTRAINT messages_to_user_id_fk FOREIGN KEY (to_user_id) REFERENCES users(id)
);

-- Таблица дружбы
CREATE TABLE IF NOT EXISTS friendship (
  user_id INT UNSIGNED NOT NULL,
  friend_id INT UNSIGNED NOT NULL,
  status VARCHAR(20) NOT NULL,
  requested_at DATETIME DEFAULT NOW(),
  confirmed_at DATETIME,
  PRIMARY KEY (user_id, friend_id),
  INDEX frienship_user_id_idx(user_id),
  CONSTRAINT friendship_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id),
  CONSTRAINT friendship_friend_id_fk FOREIGN KEY (friend_id) REFERENCES users(id)
);
 
-- Таблица групп
CREATE TABLE IF NOT EXISTS communities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE,
  INDEX communities_name_idx(name)
);

-- Таблица связи пользователей и групп
CREATE TABLE IF NOT EXISTS communities_users (
  community_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (community_id, user_id),
  CONSTRAINT communities_community_id_fk FOREIGN KEY (community_id) REFERENCES communities(id),
  CONSTRAINT communities_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Таблица медиафайлов
CREATE TABLE IF NOT EXISTS media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  media_type_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  filename VARCHAR(255) NOT NULL UNIQUE,
  size INT NOT NULL,
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX media_user_id_idx(user_id),
  INDEX media_media_type_id_idx(media_type_id),
  CONSTRAINT media_type_id_fk FOREIGN KEY (media_type_id) REFERENCES media_types(id),
  CONSTRAINT media_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Таблица типов медиафайлов
CREATE TABLE IF NOT EXISTS media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Таблица фотоальбомов
CREATE TABLE IF NOT EXISTS photo_albums (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL
);

-- Таблица связи фотоальбомов и фотографий
CREATE TABLE IF NOT EXISTS albums_photos (
  photo_album_id INT UNSIGNED NOT NULL,
  media_id INT UNSIGNED NOT NULL,
  CONSTRAINT albums_photos_photo_album_id_fk FOREIGN KEY (photo_album_id) REFERENCES photo_albums(id),
  CONSTRAINT albums_photos_media_id_fk FOREIGN KEY (media_id) REFERENCES media(id)
);

-- Таблица лайков
-- DROP TABLE likes;
CREATE TABLE IF NOT EXISTS likes (
  from_user_id INT UNSIGNED NOT NULL,
  to_subject_id INT UNSIGNED NOT NULL,
  subject_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT NOW(),
  PRIMARY KEY (from_user_id, to_subject_id, subject_type_id, created_at),
  CONSTRAINT likes_from_user_id_fk FOREIGN KEY (from_user_id) REFERENCES users(id),
  CONSTRAINT likes_subject_type_id_fk FOREIGN KEY (subject_type_id) REFERENCES subject_types(id)
);

-- Таблица типов сущностей, для которых можно поставить лайк
-- DROP TABLE subject_types;
CREATE TABLE IF NOT EXISTS subject_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Заполняем таблицы с учётом отношений 
-- на http://filldb.info

